//===- Writer.cpp ---------------------------------------------------------===//
//
//                             The LLVM Linker
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Config.h"
#include "Writer.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/Endian.h"
#include "llvm/Support/FileOutputBuffer.h"
#include "llvm/Support/raw_ostream.h"
#include <algorithm>
#include <cstdio>
#include <functional>
#include <map>
#include <unordered_set>
#include <utility>

using namespace llvm;
using namespace llvm::COFF;
using namespace llvm::object;
using namespace llvm::support;
using namespace llvm::support::endian;

static const int PageSize = 4096;
static const int FileAlignment = 512;
static const int SectionAlignment = 4096;
static const int DOSStubSize = 64;
static const int NumberfOfDataDirectory = 16;

namespace lld {
namespace coff {

// The main function of the writer.
std::error_code Writer::write(StringRef OutputPath) {
  markLive();
  dedupCOMDATs();
  createSections();
  createMiscChunks();
  createImportTables();
  createExportTable();
  if (Config->Relocatable)
    createSection(".reloc");
  assignAddresses();
  removeEmptySections();
  createSymbolAndStringTable();
  if (auto EC = openFile(OutputPath))
    return EC;
  if (Config->is64()) {
    writeHeader<pe32plus_header>();
  } else {
    writeHeader<pe32_header>();
  }
  writeSections();
  sortExceptionTable();
  return Buffer->commit();
}

void OutputSection::setRVA(uint64_t RVA) {
  Header.VirtualAddress = RVA;
  for (Chunk *C : Chunks)
    C->setRVA(C->getRVA() + RVA);
}

void OutputSection::setFileOffset(uint64_t Off) {
  // If a section has no actual data (i.e. BSS section), we want to
  // set 0 to its PointerToRawData. Otherwise the output is rejected
  // by the loader.
  if (Header.SizeOfRawData == 0)
    return;
  Header.PointerToRawData = Off;
  for (Chunk *C : Chunks)
    C->setFileOff(C->getFileOff() + Off);
}

void OutputSection::addChunk(Chunk *C) {
  Chunks.push_back(C);
  C->setOutputSection(this);
  uint64_t Off = Header.VirtualSize;
  Off = RoundUpToAlignment(Off, C->getAlign());
  C->setRVA(Off);
  C->setFileOff(Off);
  Off += C->getSize();
  Header.VirtualSize = Off;
  if (C->hasData())
    Header.SizeOfRawData = RoundUpToAlignment(Off, FileAlignment);
}

void OutputSection::addPermissions(uint32_t C) {
  Header.Characteristics |= C & PermMask;
}

// Write the section header to a given buffer.
void OutputSection::writeHeaderTo(uint8_t *Buf) {
  auto *Hdr = reinterpret_cast<coff_section *>(Buf);
  *Hdr = Header;
  if (StringTableOff) {
    // If name is too long, write offset into the string table as a name.
    sprintf(Hdr->Name, "/%d", StringTableOff);
  } else {
    assert(!Config->Debug || Name.size() <= COFF::NameSize);
    strncpy(Hdr->Name, Name.data(),
            std::min(Name.size(), (size_t)COFF::NameSize));
  }
}

// Set live bit on for each reachable chunk. Unmarked (unreachable)
// COMDAT chunks will be ignored in the next step, so that they don't
// come to the final output file.
void Writer::markLive() {
  if (!Config->DoGC)
    return;

  // We build up a worklist of sections which have been marked as live. We only
  // push into the worklist when we discover an unmarked section, and we mark
  // as we push, so sections never appear twice in the list.
  SmallVector<SectionChunk *, 256> Worklist;

  for (Undefined *U : Config->GCRoot) {
    auto *D = dyn_cast<DefinedRegular>(U->repl());
    if (!D || D->isLive())
      continue;
    D->markLive();
    Worklist.push_back(D->getChunk());
  }
  for (Chunk *C : Symtab->getChunks()) {
    auto *SC = dyn_cast<SectionChunk>(C);
    if (!SC || !SC->isRoot() || SC->isLive())
      continue;
    SC->markLive();
    Worklist.push_back(SC);
  }
  while (!Worklist.empty()) {
    SectionChunk *SC = Worklist.pop_back_val();
    assert(SC->isLive() && "We mark as live when pushing onto the worklist!");

    // Mark all symbols listed in the relocation table for this section.
    for (SymbolBody *S : SC->symbols())
      if (auto *D = dyn_cast<DefinedRegular>(S->repl()))
        if (!D->isLive()) {
          D->markLive();
          Worklist.push_back(D->getChunk());
        }

    // Mark associative sections if any.
    for (SectionChunk *ChildSC : SC->children())
      if (!ChildSC->isLive()) {
        ChildSC->markLive();
        Worklist.push_back(ChildSC);
      }
  }
}

// Merge identical COMDAT sections.
void Writer::dedupCOMDATs() {
  if (Config->ICF)
    doICF(Symtab->getChunks());
}

static StringRef getOutputSection(StringRef Name) {
  StringRef S = Name.split('$').first;
  if (Config->Debug)
    return S;
  auto It = Config->Merge.find(S);
  if (It == Config->Merge.end())
    return S;
  return It->second;
}

// Create output section objects and add them to OutputSections.
void Writer::createSections() {
  // First, bin chunks by name.
  std::map<StringRef, std::vector<Chunk *>> Map;
  for (Chunk *C : Symtab->getChunks()) {
    if (Config->DoGC) {
      auto *SC = dyn_cast<SectionChunk>(C);
      if (SC && !SC->isLive()) {
        if (Config->Verbose)
          SC->printDiscardedMessage();
        continue;
      }
    }
    Map[C->getSectionName()].push_back(C);
  }

  // Then create an OutputSection for each section.
  // '$' and all following characters in input section names are
  // discarded when determining output section. So, .text$foo
  // contributes to .text, for example. See PE/COFF spec 3.2.
  std::map<StringRef, OutputSection *> Sections;
  for (auto Pair : Map) {
    StringRef Name = getOutputSection(Pair.first);
    OutputSection *&Sec = Sections[Name];
    if (!Sec) {
      Sec = new (CAlloc.Allocate()) OutputSection(Name);
      OutputSections.push_back(Sec);
    }
    std::vector<Chunk *> &Chunks = Pair.second;
    for (Chunk *C : Chunks) {
      Sec->addChunk(C);
      Sec->addPermissions(C->getPermissions());
    }
  }
}

void Writer::createMiscChunks() {
  if (Symtab->LocalImportChunks.empty())
    return;
  OutputSection *Sec = createSection(".rdata");
  for (Chunk *C : Symtab->LocalImportChunks)
    Sec->addChunk(C);
}

// Create .idata section for the DLL-imported symbol table.
// The format of this section is inherently Windows-specific.
// IdataContents class abstracted away the details for us,
// so we just let it create chunks and add them to the section.
void Writer::createImportTables() {
  if (Symtab->ImportFiles.empty())
    return;
  OutputSection *Text = createSection(".text");
  for (ImportFile *File : Symtab->ImportFiles) {
    for (SymbolBody *B : File->getSymbols()) {
      auto *Import = dyn_cast<DefinedImportData>(B);
      if (!Import) {
        // Linker-created function thunks for DLL symbols are added to
        // .text section.
        Text->addChunk(cast<DefinedImportThunk>(B)->getChunk());
        continue;
      }
      if (Config->DelayLoads.count(Import->getDLLName().lower())) {
        DelayIdata.add(Import);
      } else {
        Idata.add(Import);
      }
    }
  }
  if (!Idata.empty()) {
    OutputSection *Sec = createSection(".idata");
    for (Chunk *C : Idata.getChunks())
      Sec->addChunk(C);
  }
  if (!DelayIdata.empty()) {
    Defined *Helper = cast<Defined>(Config->DelayLoadHelper->repl());
    DelayIdata.create(Helper);
    OutputSection *Sec = createSection(".didat");
    for (Chunk *C : DelayIdata.getChunks())
      Sec->addChunk(C);
    Sec = createSection(".data");
    for (Chunk *C : DelayIdata.getDataChunks())
      Sec->addChunk(C);
    Sec = createSection(".text");
    for (std::unique_ptr<Chunk> &C : DelayIdata.getCodeChunks())
      Sec->addChunk(C.get());
  }
}

void Writer::createExportTable() {
  if (Config->Exports.empty())
    return;
  OutputSection *Sec = createSection(".edata");
  for (std::unique_ptr<Chunk> &C : Edata.Chunks)
    Sec->addChunk(C.get());
}

// The Windows loader doesn't seem to like empty sections,
// so we remove them if any.
void Writer::removeEmptySections() {
  auto IsEmpty = [](OutputSection *S) { return S->getVirtualSize() == 0; };
  OutputSections.erase(
      std::remove_if(OutputSections.begin(), OutputSections.end(), IsEmpty),
      OutputSections.end());
  uint32_t Idx = 1;
  for (OutputSection *Sec : OutputSections)
    Sec->SectionIndex = Idx++;
}

size_t Writer::addEntryToStringTable(StringRef Str) {
  assert(Str.size() > COFF::NameSize);
  size_t OffsetOfEntry = Strtab.size() + 4; // +4 for the size field
  Strtab.insert(Strtab.end(), Str.begin(), Str.end());
  Strtab.push_back('\0');
  return OffsetOfEntry;
}

coff_symbol16 Writer::createSymbol(DefinedRegular *D) {
  uint64_t RVA = D->getRVA();
  OutputSection *Sec = nullptr;
  for (OutputSection *S : OutputSections) {
    if (S->getRVA() > RVA)
      break;
    Sec = S;
  }

  coff_symbol16 Sym;
  StringRef Name = D->getName();
  if (Name.size() > COFF::NameSize) {
    Sym.Name.Offset.Zeroes = 0;
    Sym.Name.Offset.Offset = addEntryToStringTable(Name);
  } else {
    memset(Sym.Name.ShortName, 0, COFF::NameSize);
    memcpy(Sym.Name.ShortName, Name.data(), Name.size());
  }
  COFFSymbolRef DSymRef = D->getCOFFSymbol();
  Sym.Value = RVA - Sec->getRVA();
  Sym.SectionNumber = Sec->SectionIndex;
  Sym.Type = DSymRef.getType();
  Sym.StorageClass = DSymRef.getStorageClass();
  Sym.NumberOfAuxSymbols = 0;
  return Sym;
}

void Writer::createSymbolAndStringTable() {
  if (!Config->Debug)
    return;
  // Name field in the section table is 8 byte long. Longer names need
  // to be written to the string table. First, construct string table.
  for (OutputSection *Sec : OutputSections) {
    StringRef Name = Sec->getName();
    if (Name.size() <= COFF::NameSize)
      continue;
    Sec->setStringTableOff(addEntryToStringTable(Name));
  }

  for (ObjectFile *File : Symtab->ObjectFiles)
    for (SymbolBody *B : File->getSymbols())
      if (auto *D = dyn_cast<DefinedRegular>(B))
        if (D->isLive())
          OutputSymtab.push_back(createSymbol(D));

  OutputSection *LastSection = OutputSections.back();
  // We position the symbol table to be adjacent to the end of the last section.
  uint64_t FileOff =
      LastSection->getFileOff() +
      RoundUpToAlignment(LastSection->getRawSize(), FileAlignment);
  if (!OutputSymtab.empty()) {
    PointerToSymbolTable = FileOff;
    FileOff += OutputSymtab.size() * sizeof(coff_symbol16);
  }
  if (!Strtab.empty())
    FileOff += Strtab.size() + 4;
  FileSize = SizeOfHeaders +
             RoundUpToAlignment(FileOff - SizeOfHeaders, FileAlignment);
}

// Visits all sections to assign incremental, non-overlapping RVAs and
// file offsets.
void Writer::assignAddresses() {
  SizeOfHeaders = DOSStubSize + sizeof(PEMagic) + sizeof(coff_file_header) +
                  sizeof(data_directory) * NumberfOfDataDirectory +
                  sizeof(coff_section) * OutputSections.size();
  SizeOfHeaders +=
      Config->is64() ? sizeof(pe32plus_header) : sizeof(pe32_header);
  SizeOfHeaders = RoundUpToAlignment(SizeOfHeaders, PageSize);
  uint64_t RVA = 0x1000; // The first page is kept unmapped.
  uint64_t FileOff = SizeOfHeaders;
  for (OutputSection *Sec : OutputSections) {
    if (Sec->getName() == ".reloc")
      addBaserels(Sec);
    Sec->setRVA(RVA);
    Sec->setFileOffset(FileOff);
    RVA += RoundUpToAlignment(Sec->getVirtualSize(), PageSize);
    FileOff += RoundUpToAlignment(Sec->getRawSize(), FileAlignment);
  }
  SizeOfImage = SizeOfHeaders + RoundUpToAlignment(RVA - 0x1000, PageSize);
  FileSize = SizeOfHeaders +
             RoundUpToAlignment(FileOff - SizeOfHeaders, FileAlignment);
}

template <typename PEHeaderTy> void Writer::writeHeader() {
  // Write DOS stub
  uint8_t *Buf = Buffer->getBufferStart();
  auto *DOS = reinterpret_cast<dos_header *>(Buf);
  Buf += DOSStubSize;
  DOS->Magic[0] = 'M';
  DOS->Magic[1] = 'Z';
  DOS->AddressOfRelocationTable = sizeof(dos_header);
  DOS->AddressOfNewExeHeader = DOSStubSize;

  // Write PE magic
  memcpy(Buf, PEMagic, sizeof(PEMagic));
  Buf += sizeof(PEMagic);

  // Write COFF header
  auto *COFF = reinterpret_cast<coff_file_header *>(Buf);
  Buf += sizeof(*COFF);
  COFF->Machine = Config->MachineType;
  COFF->NumberOfSections = OutputSections.size();
  COFF->Characteristics = IMAGE_FILE_EXECUTABLE_IMAGE;
  if (Config->is64()) {
    COFF->Characteristics |= IMAGE_FILE_LARGE_ADDRESS_AWARE;
  } else {
    COFF->Characteristics |= IMAGE_FILE_32BIT_MACHINE;
  }
  if (Config->DLL)
    COFF->Characteristics |= IMAGE_FILE_DLL;
  if (!Config->Relocatable)
    COFF->Characteristics |= IMAGE_FILE_RELOCS_STRIPPED;
  COFF->SizeOfOptionalHeader =
      sizeof(PEHeaderTy) + sizeof(data_directory) * NumberfOfDataDirectory;

  // Write PE header
  auto *PE = reinterpret_cast<PEHeaderTy *>(Buf);
  Buf += sizeof(*PE);
  PE->Magic = Config->is64() ? PE32Header::PE32_PLUS : PE32Header::PE32;
  PE->ImageBase = Config->ImageBase;
  PE->SectionAlignment = SectionAlignment;
  PE->FileAlignment = FileAlignment;
  PE->MajorImageVersion = Config->MajorImageVersion;
  PE->MinorImageVersion = Config->MinorImageVersion;
  PE->MajorOperatingSystemVersion = Config->MajorOSVersion;
  PE->MinorOperatingSystemVersion = Config->MinorOSVersion;
  PE->MajorSubsystemVersion = Config->MajorOSVersion;
  PE->MinorSubsystemVersion = Config->MinorOSVersion;
  PE->Subsystem = Config->Subsystem;
  PE->SizeOfImage = SizeOfImage;
  PE->SizeOfHeaders = SizeOfHeaders;
  if (!Config->NoEntry) {
    Defined *Entry = cast<Defined>(Config->Entry->repl());
    PE->AddressOfEntryPoint = Entry->getRVA();
  }
  PE->SizeOfStackReserve = Config->StackReserve;
  PE->SizeOfStackCommit = Config->StackCommit;
  PE->SizeOfHeapReserve = Config->HeapReserve;
  PE->SizeOfHeapCommit = Config->HeapCommit;
  if (Config->DynamicBase)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE;
  if (Config->HighEntropyVA)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_HIGH_ENTROPY_VA;
  if (!Config->AllowBind)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_NO_BIND;
  if (Config->NxCompat)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_NX_COMPAT;
  if (!Config->AllowIsolation)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_NO_ISOLATION;
  if (Config->TerminalServerAware)
    PE->DLLCharacteristics |= IMAGE_DLL_CHARACTERISTICS_TERMINAL_SERVER_AWARE;
  PE->NumberOfRvaAndSize = NumberfOfDataDirectory;
  if (OutputSection *Text = findSection(".text")) {
    PE->BaseOfCode = Text->getRVA();
    PE->SizeOfCode = Text->getRawSize();
  }
  PE->SizeOfInitializedData = getSizeOfInitializedData();

  // Write data directory
  auto *Dir = reinterpret_cast<data_directory *>(Buf);
  Buf += sizeof(*Dir) * NumberfOfDataDirectory;
  if (OutputSection *Sec = findSection(".edata")) {
    Dir[EXPORT_TABLE].RelativeVirtualAddress = Sec->getRVA();
    Dir[EXPORT_TABLE].Size = Sec->getVirtualSize();
  }
  if (!Idata.empty()) {
    Dir[IMPORT_TABLE].RelativeVirtualAddress = Idata.getDirRVA();
    Dir[IMPORT_TABLE].Size = Idata.getDirSize();
    Dir[IAT].RelativeVirtualAddress = Idata.getIATRVA();
    Dir[IAT].Size = Idata.getIATSize();
  }
  if (!DelayIdata.empty()) {
    Dir[DELAY_IMPORT_DESCRIPTOR].RelativeVirtualAddress =
        DelayIdata.getDirRVA();
    Dir[DELAY_IMPORT_DESCRIPTOR].Size = DelayIdata.getDirSize();
  }
  if (OutputSection *Sec = findSection(".rsrc")) {
    Dir[RESOURCE_TABLE].RelativeVirtualAddress = Sec->getRVA();
    Dir[RESOURCE_TABLE].Size = Sec->getVirtualSize();
  }
  if (OutputSection *Sec = findSection(".reloc")) {
    Dir[BASE_RELOCATION_TABLE].RelativeVirtualAddress = Sec->getRVA();
    Dir[BASE_RELOCATION_TABLE].Size = Sec->getVirtualSize();
  }
  if (OutputSection *Sec = findSection(".pdata")) {
    Dir[EXCEPTION_TABLE].RelativeVirtualAddress = Sec->getRVA();
    Dir[EXCEPTION_TABLE].Size = Sec->getVirtualSize();
  }
  if (Symbol *Sym = Symtab->find("_tls_used")) {
    if (Defined *B = dyn_cast<Defined>(Sym->Body)) {
      Dir[TLS_TABLE].RelativeVirtualAddress = B->getRVA();
      Dir[TLS_TABLE].Size = 40;
    }
  }

  // Write section table
  for (OutputSection *Sec : OutputSections) {
    Sec->writeHeaderTo(Buf);
    Buf += sizeof(coff_section);
  }

  if (OutputSymtab.empty())
    return;

  COFF->PointerToSymbolTable = PointerToSymbolTable;
  uint32_t NumberOfSymbols = OutputSymtab.size();
  COFF->NumberOfSymbols = NumberOfSymbols;
  auto *SymbolTable = reinterpret_cast<coff_symbol16 *>(
      Buffer->getBufferStart() + COFF->PointerToSymbolTable);
  for (size_t I = 0; I != NumberOfSymbols; ++I)
    SymbolTable[I] = OutputSymtab[I];
  // Create the string table, it follows immediately after the symbol table.
  // The first 4 bytes is length including itself.
  Buf = reinterpret_cast<uint8_t *>(&SymbolTable[NumberOfSymbols]);
  write32le(Buf, Strtab.size() + 4);
  memcpy(Buf + 4, Strtab.data(), Strtab.size());
}

std::error_code Writer::openFile(StringRef Path) {
  if (auto EC = FileOutputBuffer::create(Path, FileSize, Buffer,
                                         FileOutputBuffer::F_executable)) {
    llvm::errs() << "failed to open " << Path << ": " << EC.message() << "\n";
    return EC;
  }
  return std::error_code();
}

// Write section contents to a mmap'ed file.
void Writer::writeSections() {
  uint8_t *Buf = Buffer->getBufferStart();
  for (OutputSection *Sec : OutputSections) {
    // Fill gaps between functions in .text with INT3 instructions
    // instead of leaving as NUL bytes (which can be interpreted as
    // ADD instructions).
    if (Sec->getPermissions() & IMAGE_SCN_CNT_CODE)
      memset(Buf + Sec->getFileOff(), 0xCC, Sec->getRawSize());
    for (Chunk *C : Sec->getChunks())
      C->writeTo(Buf);
  }
}

// Sort .pdata section contents according to PE/COFF spec 5.5.
void Writer::sortExceptionTable() {
  if (auto *Sec = findSection(".pdata")) {
    // We assume .pdata contains function table entries only.
    struct Entry { ulittle32_t Begin, End, Unwind; };
    uint8_t *Buf = Buffer->getBufferStart() + Sec->getFileOff();
    std::sort(reinterpret_cast<Entry *>(Buf),
              reinterpret_cast<Entry *>(Buf + Sec->getVirtualSize()),
              [](const Entry &A, const Entry &B) { return A.Begin < B.Begin; });
  }
}

OutputSection *Writer::findSection(StringRef Name) {
  for (OutputSection *Sec : OutputSections)
    if (Sec->getName() == Name)
      return Sec;
  return nullptr;
}

uint32_t Writer::getSizeOfInitializedData() {
  uint32_t Res = 0;
  for (OutputSection *S : OutputSections)
    if (S->getPermissions() & IMAGE_SCN_CNT_INITIALIZED_DATA)
      Res += S->getRawSize();
  return Res;
}

// Returns an existing section or create a new one if not found.
OutputSection *Writer::createSection(StringRef Name) {
  if (auto *Sec = findSection(Name))
    return Sec;
  const auto DATA = IMAGE_SCN_CNT_INITIALIZED_DATA;
  const auto BSS = IMAGE_SCN_CNT_UNINITIALIZED_DATA;
  const auto CODE = IMAGE_SCN_CNT_CODE;
  const auto DISCARDABLE = IMAGE_SCN_MEM_DISCARDABLE;
  const auto R = IMAGE_SCN_MEM_READ;
  const auto W = IMAGE_SCN_MEM_WRITE;
  const auto X = IMAGE_SCN_MEM_EXECUTE;
  uint32_t Perms = StringSwitch<uint32_t>(Name)
                       .Case(".bss", BSS | R | W)
                       .Case(".data", DATA | R | W)
                       .Case(".didat", DATA | R)
                       .Case(".edata", DATA | R)
                       .Case(".idata", DATA | R)
                       .Case(".rdata", DATA | R)
                       .Case(".reloc", DATA | DISCARDABLE | R)
                       .Case(".text", CODE | R | X)
                       .Default(0);
  if (!Perms)
    llvm_unreachable("unknown section name");
  auto Sec = new (CAlloc.Allocate()) OutputSection(Name);
  Sec->addPermissions(Perms);
  OutputSections.push_back(Sec);
  return Sec;
}

// Dest is .reloc section. Add contents to that section.
void Writer::addBaserels(OutputSection *Dest) {
  std::vector<uint32_t> V;
  StringRef Name = Config->is64() ? "__ImageBase" : "___ImageBase";
  Defined *ImageBase = cast<Defined>(Symtab->find(Name)->Body);
  for (OutputSection *Sec : OutputSections) {
    if (Sec == Dest)
      continue;
    // Collect all locations for base relocations.
    for (Chunk *C : Sec->getChunks())
      C->getBaserels(&V, ImageBase);
    // Add the addresses to .reloc section.
    if (!V.empty())
      addBaserelBlocks(Dest, V);
    V.clear();
  }
}

// Add addresses to .reloc section. Note that addresses are grouped by page.
void Writer::addBaserelBlocks(OutputSection *Dest, std::vector<uint32_t> &V) {
  const uint32_t Mask = ~uint32_t(PageSize - 1);
  uint32_t Page = V[0] & Mask;
  size_t I = 0, J = 1;
  for (size_t E = V.size(); J < E; ++J) {
    uint32_t P = V[J] & Mask;
    if (P == Page)
      continue;
    BaserelChunk *Buf = BAlloc.Allocate();
    Dest->addChunk(new (Buf) BaserelChunk(Page, &V[I], &V[0] + J));
    I = J;
    Page = P;
  }
  if (I == J)
    return;
  BaserelChunk *Buf = BAlloc.Allocate();
  Dest->addChunk(new (Buf) BaserelChunk(Page, &V[I], &V[0] + J));
}

} // namespace coff
} // namespace lld

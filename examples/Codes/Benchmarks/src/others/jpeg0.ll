; ModuleID = 'jpeg.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@ncols = global i32 240, align 4
@nrows = global i32 160, align 4
@huffbits = global [601 x i32] [i32 -747211146, i32 -1391758464, i32 134744098, i32 573943150, i32 1465576700, i32 -1118153113, i32 67391764, i32 272910005, i32 -1379275995, i32 -1550866094, i32 1526727176, i32 944833606, i32 -1248998678, i32 1689225127, i32 1514864649, i32 489181901, i32 -139949939, i32 1666946004, i32 741907061, i32 -580648267, i32 416868159, i32 1916866843, i32 611045236, i32 -1425658212, i32 631506661, i32 1183653018, i32 -690945791, i32 821712267, i32 256779995, i32 1082860135, i32 -1464841808, i32 -1323267798, i32 1651796766, i32 378739048, i32 1416510901, i32 2078443085, i32 579613259, i32 1531304093, i32 416038150, i32 -982756806, i32 1925484429, i32 1842948803, i32 736148204, i32 1585475093, i32 -192227165, i32 725217452, i32 -1934541846, i32 -949868307, i32 -1372653416, i32 935865866, i32 362357522, i32 1152842064, i32 109954526, i32 1457610101, i32 2072645262, i32 -1416614821, i32 1820336675, i32 1912013574, i32 -336896943, i32 -97663901, i32 -957863646, i32 -2000242247, i32 459375982, i32 1255609818, i32 -221837739, i32 1152738761, i32 581051217, i32 -648355449, i32 1784330086, i32 -711873181, i32 1793546583, i32 -1304361951, i32 -1182029288, i32 -1238979661, i32 -1498884560, i32 1279910939, i32 629650609, i32 159753240, i32 -741398806, i32 -2110638533, i32 79578838, i32 1504914084, i32 2025456015, i32 1034786609, i32 298654494, i32 1835864456, i32 965915923, i32 1061958245, i32 -625666048, i32 -424460666, i32 -1554347292, i32 1360215898, i32 1164696746, i32 956634648, i32 1903567459, i32 1230713606, i32 -410380883, i32 266191997, i32 -849678022, i32 -790013985, i32 -343409739, i32 1718840479, i32 1255128422, i32 -1276159497, i32 -1395233995, i32 -1697814870, i32 -1424665531, i32 289836314, i32 896944531, i32 -1816123628, i32 -1565435192, i32 -37459971, i32 -1343664015, i32 855468410, i32 1442314965, i32 -95055361, i32 1180592949, i32 -1697814861, i32 1436208469, i32 1431655761, i32 -1555657446, i32 -1140893570, i32 -1500196109, i32 1523253154, i32 704605311, i32 592551902, i32 -1479108699, i32 1602086115, i32 -1252450316, i32 1911925974, i32 1798675114, i32 -848906486, i32 -216581944, i32 -1395305118, i32 -1320922717, i32 1183652540, i32 -10749798, i32 110213549, i32 1550238975, i32 -1104594799, i32 2125768586, i32 -1090649258, i32 670506893, i32 1722460981, i32 1389110023, i32 -1180078556, i32 1015254945, i32 -1556349064, i32 -25906383, i32 1030372274, i32 -1913449915, i32 1159907457, i32 -1796123254, i32 -1403972504, i32 -777828689, i32 2144796198, i32 -1474636722, i32 1818225193, i32 2129848278, i32 -1818186785, i32 -1162517889, i32 1960794794, i32 -1431598179, i32 -2069694994, i32 1772480258, i32 -1645057227, i32 432120441, i32 -1417968884, i32 -2138064262, i32 -1971316269, i32 1952674037, i32 -1356706691, i32 -539575159, i32 1069055802, i32 -232390937, i32 -346069097, i32 -73421541, i32 2038413419, i32 -319614067, i32 -2072273260, i32 745684950, i32 1627371846, i32 -788294601, i32 169595651, i32 1070505673, i32 1363751699, i32 -334233681, i32 1474300366, i32 239500586, i32 -1426351303, i32 672159869, i32 1765731678, i32 2141937581, i32 1486852542, i32 -1252697689, i32 1839750096, i32 1405750035, i32 -589868212, i32 722742044, i32 1957351982, i32 430078834, i32 1188153364, i32 1619769983, i32 -473432981, i32 -913572231, i32 -1849348, i32 1808437246, i32 2039469756, i32 -1241586945, i32 -550129401, i32 -265814542, i32 721959712, i32 -66752687, i32 -62882251, i32 -428195861, i32 1288456158, i32 670149615, i32 -171995894, i32 -1412535003, i32 -8995542, i32 871533244, i32 -433982037, i32 512751018, i32 -1431592053, i32 1996116459, i32 1369851257, i32 1503727163, i32 1350732864, i32 177549768, i32 -1425593998, i32 810076359, i32 344748930, i32 1945478698, i32 -1557917750, i32 -1703394841, i32 -111683027, i32 -37752934, i32 331512447, i32 711694420, i32 -229644961, i32 1804016073, i32 -56086427, i32 205132186, i32 1855291390, i32 -1141658965, i32 -1611073897, i32 -36479623, i32 -1462777001, i32 1556347093, i32 -1845756027, i32 1723028819, i32 788044103, i32 1900365949, i32 -1481742239, i32 381476285, i32 1423068301, i32 1167329897, i32 1674457938, i32 -1865780902, i32 1954123961, i32 -402189121, i32 2018886082, i32 -1446569559, i32 1105173633, i32 1560869262, i32 1038759389, i32 -924299428, i32 1405527136, i32 -246478564, i32 -2087026562, i32 -499318924, i32 1400155459, i32 -42473643, i32 1408462624, i32 -10168470, i32 -1929600338, i32 2144640941, i32 1495243263, i32 178965844, i32 -866832196, i32 333351595, i32 -938875461, i32 -1704397042, i32 683989476, i32 -1822532065, i32 -760997629, i32 109187145, i32 66364994, i32 -876085094, i32 -1290255865, i32 1848145173, i32 1891356672, i32 1909273088, i32 -664647628, i32 -787685280, i32 1673407026, i32 1104806255, i32 1364080644, i32 -56099410, i32 709760800, i32 486148736, i32 -435929430, i32 699093272, i32 -1809863339, i32 1271672830, i32 -369207848, i32 -733486059, i32 1912513749, i32 -1711678487, i32 1504499028, i32 -1950781399, i32 -1809638826, i32 -1436155463, i32 885356737, i32 -1606899441, i32 -1520771031, i32 -180563734, i32 700522580, i32 -776212457, i32 -1970348480, i32 -411968323, i32 -2126682069, i32 -1441617865, i32 2053553319, i32 1879878217, i32 -187741576, i32 -1539560328, i32 -62569462, i32 -998208496, i32 831141289, i32 2142180692, i32 -54082563, i32 -1824087745, i32 548114421, i32 760645623, i32 -1376474454, i32 -1433116273, i32 884325122, i32 -1687589732, i32 1371961541, i32 115511578, i32 1500950486, i32 -1129243734, i32 -1880174357, i32 1571523242, i32 -1439405229, i32 -10736983, i32 -1091962281, i32 -1388285160, i32 -1442851657, i32 -760397866, i32 -1616554390, i32 -1458259067, i32 491367400, i32 436799545, i32 552877748, i32 237707505, i32 1582885376, i32 -1382098694, i32 1463932589, i32 294578435, i32 854822414, i32 709868559, i32 2085948074, i32 -1432196906, i32 -1442924181, i32 899298426, i32 -1699266629, i32 355465894, i32 -95047686, i32 -272454998, i32 879303714, i32 210982646, i32 1645460878, i32 -423145654, i32 -1165472635, i32 468776617, i32 -512221428, i32 955017242, i32 256701578, i32 1684246023, i32 -1386500576, i32 1614486160, i32 -1865926463, i32 356690611, i32 1387354313, i32 1368648017, i32 1214533061, i32 1993421901, i32 1788865367, i32 -240464557, i32 2112091563, i32 1677439314, i32 2141941669, i32 1535094303, i32 1252691510, i32 -1853710135, i32 896336577, i32 503786622, i32 -235558287, i32 -339171038, i32 1494706944, i32 1163717103, i32 422387499, i32 -398816735, i32 -2029604373, i32 1353636039, i32 -1087043079, i32 410768512, i32 -451959450, i32 -2115849383, i32 -1395575398, i32 646204611, i32 563606445, i32 1493875815, i32 712220295, i32 -380265955, i32 1778318205, i32 1792605932, i32 1409264495, i32 -1520721953, i32 761703917, i32 -562826512, i32 -1549191932, i32 151183687, i32 1036642923, i32 902885710, i32 -598277018, i32 -1999810710, i32 -1836260595, i32 -366428074, i32 1840386208, i32 1999970925, i32 -1054903052, i32 -1471277634, i32 -1259599185, i32 1868781984, i32 2024593130, i32 -105050139, i32 1483730615, i32 -446800729, i32 -27672579, i32 -228013377, i32 -568353466, i32 54832128, i32 962508203, i32 1972105726, i32 -1789653685, i32 -21627226, i32 -1383076155, i32 937193381, i32 1107212650, i32 -825439353, i32 -1820005315, i32 1744871424, i32 805654991, i32 -1389246637, i32 1491578166, i32 1437739910, i32 420757933, i32 1381049809, i32 1345864079, i32 -961763619, i32 1813088221, i32 -523105169, i32 44395969, i32 238145347, i32 1156665530, i32 117830016, i32 999084186, i32 314584177, i32 -1616497671, i32 452138111, i32 1954365464, i32 -1482864448, i32 -1754663656, i32 -1460775568, i32 607897214, i32 -154377237, i32 1294318320, i32 -985758634, i32 1962015792, i32 267913391, i32 1054652116, i32 1979056214, i32 -1339006209, i32 -2122364211, i32 1723028351, i32 -1367345267, i32 1534970431, i32 1962748745, i32 -1322076002, i32 1078079453, i32 515124000, i32 1966455165, i32 1164189318, i32 -1694059981, i32 -694184414, i32 -2089993817, i32 996355134, i32 -1787126940, i32 -817188500, i32 1221323315, i32 1238671201, i32 1375843354, i32 1855314570, i32 -1776285046, i32 1605543689, i32 -1667334806, i32 466134297, i32 119495287, i32 1112902811, i32 1911061246, i32 342761757, i32 1484653197, i32 -601622373, i32 -223793619, i32 -1653548088, i32 -1385585858, i32 1217240193, i32 -1141932523, i32 -1697819425, i32 -337642013, i32 1459365185, i32 530391118, i32 -570518254, i32 -2076136912, i32 122316743, i32 61674386, i32 1942815281, i32 -2091308424, i32 874854593, i32 -1572410226, i32 -188269357, i32 1983177952, i32 64140544, i32 907164291, i32 1449655588, i32 1942033821, i32 -1557682310, i32 -1801617266, i32 -1717316933, i32 1375881671, i32 1852469237, i32 2139662385, i32 -1812798487, i32 1183271476, i32 1800667030, i32 2140140704, i32 1798675103, i32 -42205252, i32 1793060565, i32 -1671753714, i32 -409776899, i32 -2056866983, i32 -1394429113, i32 -1975734715, i32 26550963, i32 -1853663288, i32 1119321301, i32 -1312439791, i32 1275135006, i32 -2036764408, i32 199968391, i32 1250946842, i32 -1818966182, i32 1428483335, i32 -420773414, i32 -1757722898, i32 -1108626150, i32 900333515, i32 1070070354, i32 -1032081156, i32 675454630, i32 -2100936825, i32 -207417927, i32 959497807, i32 -1454290799, i32 704209729, i32 -196001216, i32 152954934, i32 2041368629, i32 1432176168, i32 2007103487, i32 176133699, i32 -395646601, i32 1148948800, i32 -326099232, i32 -427701758, i32 734810277, i32 2043570377, i32 -314424434, i32 -1809503629, i32 -1963785048, i32 1986049957, i32 1082095820, i32 -1584006602, i32 2026189092, i32 -453664662, i32 -1985131604, i32 2140140704], align 4
@bitsleft = internal global i32 0, align 4
@nextlong = internal global i32* getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 0, i32 0), align 4
@lastlong = internal global i32 0, align 4
@val_dc_lum = global [12 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B", align 1
@val_ac_lum = global [162 x i8] c"\01\02\03\00\04\11\05\12!1A\06\13Qa\07\22q\142\81\91\A1\08#B\B1\C1\15R\D1\F0$3br\82\09\0A\16\17\18\19\1A%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\83\84\85\86\87\88\89\8A\92\93\94\95\96\97\98\99\9A\A2\A3\A4\A5\A6\A7\A8\A9\AA\B2\B3\B4\B5\B6\B7\B8\B9\BA\C2\C3\C4\C5\C6\C7\C8\C9\CA\D2\D3\D4\D5\D6\D7\D8\D9\DA\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA", align 1
@zz_tbl = global [32 x i8] c"\00\01\08\10\09\02\03\0A\11\18 \19\12\0B\04\05\0C\13\1A!(0)\22\1B\14\0D\06\07\0E\15\1C", align 1
@mincode_dc = global [10 x i32] [i32 0, i32 0, i32 0, i32 2, i32 14, i32 30, i32 62, i32 126, i32 254, i32 510], align 4
@maxcode_dc = global [10 x i32] [i32 0, i32 -1, i32 0, i32 6, i32 14, i32 30, i32 62, i32 126, i32 254, i32 511], align 4
@valptr_dc = global [10 x i8] c"\00\00\00\01\06\07\08\09\0A\0B", align 1
@mincode_ac = global [17 x i32] [i32 0, i32 0, i32 0, i32 4, i32 10, i32 26, i32 58, i32 120, i32 248, i32 502, i32 1014, i32 2038, i32 4084, i32 0, i32 0, i32 32704, i32 65410], align 4
@maxcode_ac = global [17 x i32] [i32 0, i32 -1, i32 1, i32 4, i32 12, i32 28, i32 59, i32 123, i32 250, i32 506, i32 1018, i32 2041, i32 4087, i32 -1, i32 -1, i32 32704, i32 65535], align 4
@valptr_ac = global [17 x i8] c"\00\00\00\02\03\06\09\0B\0F\12\17\1C \00\00$%", align 1
@qtbl_lum = global [64 x i8] c"\10\0B\0A\10\18(3=\0C\0C\0E\13\1A:<7\0E\0D\10\18(9E8\0E\11\16\1D3WP>\12\16%8DmgM\18#7@Qhq\5C1@NWgyxeH\5C_bpdgc", align 1
@dct_data = internal global [38400 x i16] zeroinitializer, align 2
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1

; Function Attrs: nounwind
define i32 @getbit() #0 {
entry:
  %bit = alloca i32, align 4
  %0 = load i32, i32* @bitsleft, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @bitsleft, align 4
  %cmp = icmp slt i32 %dec, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** @nextlong, align 4
  %cmp1 = icmp uge i32* %1, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i64 1, i32 0)
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store i32 0, i32* @lastlong, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %2 = load i32*, i32** @nextlong, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** @nextlong, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* @lastlong, align 4
  store i32 31, i32* @bitsleft, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @lastlong, align 4
  %and = and i32 %4, -2147483648
  %cmp4 = icmp ne i32 %and, 0
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %bit, align 4
  %5 = load i32, i32* @lastlong, align 4
  %shl = shl i32 %5, 1
  store i32 %shl, i32* @lastlong, align 4
  %6 = load i32, i32* %bit, align 4
  ret i32 %6
}

; Function Attrs: nounwind
define void @huff_dc_dec(i32* %retval) #0 {
entry:
  %retval.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  %l = alloca i32, align 4
  %p = alloca i32, align 4
  %code = alloca i32, align 4
  store i32* %retval, i32** %retval.addr, align 4
  store i32 1, i32* %l, align 4
  %call = call i32 @getbit()
  store i32 %call, i32* %code, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %code, align 4
  %1 = load i32, i32* %l, align 4
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @maxcode_dc, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %cmp = icmp sgt i32 %0, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %l, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %l, align 4
  %4 = load i32, i32* %code, align 4
  %shl = shl i32 %4, 1
  %call1 = call i32 @getbit()
  %add = add nsw i32 %shl, %call1
  store i32 %add, i32* %code, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %l, align 4
  %arrayidx2 = getelementptr inbounds [10 x i8], [10 x i8]* @valptr_dc, i32 0, i32 %5
  %6 = load i8, i8* %arrayidx2, align 1
  %conv = zext i8 %6 to i32
  store i32 %conv, i32* %p, align 4
  %7 = load i32, i32* %p, align 4
  %8 = load i32, i32* %code, align 4
  %add3 = add nsw i32 %7, %8
  %9 = load i32, i32* %l, align 4
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @mincode_dc, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx4, align 4
  %sub = sub nsw i32 %add3, %10
  store i32 %sub, i32* %p, align 4
  %11 = load i32, i32* %p, align 4
  %arrayidx5 = getelementptr inbounds [12 x i8], [12 x i8]* @val_dc_lum, i32 0, i32 %11
  %12 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %12 to i32
  store i32 %conv6, i32* %s, align 4
  %13 = load i32*, i32** %retval.addr, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %s, align 4
  %cmp7 = icmp slt i32 %14, %15
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %retval.addr, align 4
  %17 = load i32, i32* %16, align 4
  %shl9 = shl i32 %17, 1
  %call10 = call i32 @getbit()
  %add11 = add nsw i32 %shl9, %call10
  %18 = load i32*, i32** %retval.addr, align 4
  store i32 %add11, i32* %18, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4
  %inc12 = add nsw i32 %19, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i32, i32* %s, align 4
  %sub13 = sub nsw i32 %20, 1
  %shl14 = shl i32 1, %sub13
  store i32 %shl14, i32* %i, align 4
  br label %while.cond15

while.cond15:                                     ; preds = %while.body18, %for.end
  %21 = load i32*, i32** %retval.addr, align 4
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %i, align 4
  %cmp16 = icmp slt i32 %22, %23
  br i1 %cmp16, label %while.body18, label %while.end22

while.body18:                                     ; preds = %while.cond15
  %24 = load i32, i32* %s, align 4
  %shl19 = shl i32 -1, %24
  %add20 = add nsw i32 %shl19, 1
  store i32 %add20, i32* %i, align 4
  %25 = load i32*, i32** %retval.addr, align 4
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %i, align 4
  %add21 = add nsw i32 %26, %27
  %28 = load i32*, i32** %retval.addr, align 4
  store i32 %add21, i32* %28, align 4
  br label %while.cond15

while.end22:                                      ; preds = %while.cond15
  ret void
}

; Function Attrs: nounwind
define void @huff_ac_dec(i16* %data) #0 {
entry:
  %data.addr = alloca i16*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %icnt = alloca i32, align 4
  %ns = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %l = alloca i32, align 4
  %p = alloca i32, align 4
  %code = alloca i32, align 4
  %dindex = alloca i32, align 4
  %temp = alloca i32, align 4
  %data_zz = alloca [64 x i32], align 4
  store i16* %data, i16** %data.addr, align 4
  store i32 0, i32* %dindex, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end62, %entry
  %0 = load i32, i32* %dindex, align 4
  %cmp = icmp slt i32 %0, 63
  br i1 %cmp, label %while.body, label %while.end63

while.body:                                       ; preds = %while.cond
  store i32 1, i32* %l, align 4
  %call = call i32 @getbit()
  store i32 %call, i32* %code, align 4
  br label %while.cond1

while.cond1:                                      ; preds = %while.body3, %while.body
  %1 = load i32, i32* %code, align 4
  %2 = load i32, i32* %l, align 4
  %arrayidx = getelementptr inbounds [17 x i32], [17 x i32]* @maxcode_ac, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %cmp2 = icmp sgt i32 %1, %3
  br i1 %cmp2, label %while.body3, label %while.end

while.body3:                                      ; preds = %while.cond1
  %4 = load i32, i32* %l, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, i32* %l, align 4
  %5 = load i32, i32* %code, align 4
  %shl = shl i32 %5, 1
  %call4 = call i32 @getbit()
  %add5 = add nsw i32 %shl, %call4
  store i32 %add5, i32* %code, align 4
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  %6 = load i32, i32* %l, align 4
  %arrayidx6 = getelementptr inbounds [17 x i8], [17 x i8]* @valptr_ac, i32 0, i32 %6
  %7 = load i8, i8* %arrayidx6, align 1
  %conv = zext i8 %7 to i32
  store i32 %conv, i32* %p, align 4
  %8 = load i32, i32* %p, align 4
  %9 = load i32, i32* %code, align 4
  %add7 = add nsw i32 %8, %9
  %10 = load i32, i32* %l, align 4
  %arrayidx8 = getelementptr inbounds [17 x i32], [17 x i32]* @mincode_ac, i32 0, i32 %10
  %11 = load i32, i32* %arrayidx8, align 4
  %sub = sub nsw i32 %add7, %11
  store i32 %sub, i32* %p, align 4
  %12 = load i32, i32* %p, align 4
  %arrayidx9 = getelementptr inbounds [162 x i8], [162 x i8]* @val_ac_lum, i32 0, i32 %12
  %13 = load i8, i8* %arrayidx9, align 1
  %conv10 = zext i8 %13 to i32
  store i32 %conv10, i32* %ns, align 4
  %14 = load i32, i32* %ns, align 4
  %and = and i32 %14, 15
  store i32 %and, i32* %s, align 4
  %15 = load i32, i32* %ns, align 4
  %shr = ashr i32 %15, 4
  store i32 %shr, i32* %n, align 4
  %16 = load i32, i32* %ns, align 4
  %cmp11 = icmp ne i32 %16, 0
  br i1 %cmp11, label %if.then, label %if.else51

if.then:                                          ; preds = %while.end
  %17 = load i32, i32* %ns, align 4
  %cmp13 = icmp ne i32 %17, 240
  br i1 %cmp13, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then15
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %n, align 4
  %cmp16 = icmp slt i32 %18, %19
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %dindex, align 4
  %arrayidx18 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %20
  store i32 0, i32* %arrayidx18, align 4
  %21 = load i32, i32* %dindex, align 4
  %add19 = add nsw i32 %21, 1
  store i32 %add19, i32* %dindex, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc27, %for.end
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* %s, align 4
  %cmp21 = icmp slt i32 %23, %24
  br i1 %cmp21, label %for.body23, label %for.end29

for.body23:                                       ; preds = %for.cond20
  %25 = load i32, i32* %temp, align 4
  %shl24 = shl i32 %25, 1
  %call25 = call i32 @getbit()
  %add26 = add nsw i32 %shl24, %call25
  store i32 %add26, i32* %temp, align 4
  br label %for.inc27

for.inc27:                                        ; preds = %for.body23
  %26 = load i32, i32* %i, align 4
  %inc28 = add nsw i32 %26, 1
  store i32 %inc28, i32* %i, align 4
  br label %for.cond20

for.end29:                                        ; preds = %for.cond20
  %27 = load i32, i32* %s, align 4
  %sub30 = sub nsw i32 %27, 1
  %shl31 = shl i32 1, %sub30
  store i32 %shl31, i32* %i, align 4
  br label %while.cond32

while.cond32:                                     ; preds = %while.body35, %for.end29
  %28 = load i32, i32* %temp, align 4
  %29 = load i32, i32* %i, align 4
  %cmp33 = icmp slt i32 %28, %29
  br i1 %cmp33, label %while.body35, label %while.end39

while.body35:                                     ; preds = %while.cond32
  %30 = load i32, i32* %s, align 4
  %shl36 = shl i32 -1, %30
  %add37 = add nsw i32 %shl36, 1
  store i32 %add37, i32* %i, align 4
  %31 = load i32, i32* %temp, align 4
  %32 = load i32, i32* %i, align 4
  %add38 = add nsw i32 %31, %32
  store i32 %add38, i32* %temp, align 4
  br label %while.cond32

while.end39:                                      ; preds = %while.cond32
  %33 = load i32, i32* %temp, align 4
  %34 = load i32, i32* %dindex, align 4
  %arrayidx40 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %34
  store i32 %33, i32* %arrayidx40, align 4
  %35 = load i32, i32* %dindex, align 4
  %add41 = add nsw i32 %35, 1
  store i32 %add41, i32* %dindex, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc48, %if.else
  %36 = load i32, i32* %i, align 4
  %cmp43 = icmp slt i32 %36, 16
  br i1 %cmp43, label %for.body45, label %for.end50

for.body45:                                       ; preds = %for.cond42
  %37 = load i32, i32* %dindex, align 4
  %arrayidx46 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %37
  store i32 0, i32* %arrayidx46, align 4
  %38 = load i32, i32* %dindex, align 4
  %add47 = add nsw i32 %38, 1
  store i32 %add47, i32* %dindex, align 4
  br label %for.inc48

for.inc48:                                        ; preds = %for.body45
  %39 = load i32, i32* %i, align 4
  %inc49 = add nsw i32 %39, 1
  store i32 %inc49, i32* %i, align 4
  br label %for.cond42

for.end50:                                        ; preds = %for.cond42
  br label %if.end

if.end:                                           ; preds = %for.end50, %while.end39
  br label %if.end62

if.else51:                                        ; preds = %while.end
  %40 = load i32, i32* %dindex, align 4
  %sub52 = sub nsw i32 63, %40
  store i32 %sub52, i32* %icnt, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc59, %if.else51
  %41 = load i32, i32* %i, align 4
  %42 = load i32, i32* %icnt, align 4
  %cmp54 = icmp slt i32 %41, %42
  br i1 %cmp54, label %for.body56, label %for.end61

for.body56:                                       ; preds = %for.cond53
  %43 = load i32, i32* %dindex, align 4
  %arrayidx57 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %43
  store i32 0, i32* %arrayidx57, align 4
  %44 = load i32, i32* %dindex, align 4
  %add58 = add nsw i32 %44, 1
  store i32 %add58, i32* %dindex, align 4
  br label %for.inc59

for.inc59:                                        ; preds = %for.body56
  %45 = load i32, i32* %i, align 4
  %inc60 = add nsw i32 %45, 1
  store i32 %inc60, i32* %i, align 4
  br label %for.cond53

for.end61:                                        ; preds = %for.cond53
  br label %if.end62

if.end62:                                         ; preds = %for.end61, %if.end
  br label %while.cond

while.end63:                                      ; preds = %while.cond
  store i32 0, i32* %i, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc73, %while.end63
  %46 = load i32, i32* %i, align 4
  %cmp65 = icmp slt i32 %46, 31
  br i1 %cmp65, label %for.body67, label %for.end75

for.body67:                                       ; preds = %for.cond64
  %47 = load i32, i32* %i, align 4
  %arrayidx68 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %47
  %48 = load i32, i32* %arrayidx68, align 4
  %conv69 = trunc i32 %48 to i16
  %49 = load i16*, i16** %data.addr, align 4
  %50 = load i32, i32* %i, align 4
  %add70 = add nsw i32 %50, 1
  %arrayidx71 = getelementptr inbounds [32 x i8], [32 x i8]* @zz_tbl, i32 0, i32 %add70
  %51 = load i8, i8* %arrayidx71, align 1
  %conv72 = zext i8 %51 to i32
  %add.ptr = getelementptr inbounds i16, i16* %49, i32 %conv72
  store i16 %conv69, i16* %add.ptr, align 2
  br label %for.inc73

for.inc73:                                        ; preds = %for.body67
  %52 = load i32, i32* %i, align 4
  %inc74 = add nsw i32 %52, 1
  store i32 %inc74, i32* %i, align 4
  br label %for.cond64

for.end75:                                        ; preds = %for.cond64
  store i32 31, i32* %j, align 4
  store i32 31, i32* %i, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc86, %for.end75
  %53 = load i32, i32* %i, align 4
  %cmp77 = icmp sgt i32 %53, 0
  br i1 %cmp77, label %for.body79, label %for.end88

for.body79:                                       ; preds = %for.cond76
  %54 = load i32, i32* %j, align 4
  %arrayidx80 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %54
  %55 = load i32, i32* %arrayidx80, align 4
  %conv81 = trunc i32 %55 to i16
  %56 = load i16*, i16** %data.addr, align 4
  %add.ptr82 = getelementptr inbounds i16, i16* %56, i32 63
  %57 = load i32, i32* %i, align 4
  %arrayidx83 = getelementptr inbounds [32 x i8], [32 x i8]* @zz_tbl, i32 0, i32 %57
  %58 = load i8, i8* %arrayidx83, align 1
  %conv84 = zext i8 %58 to i32
  %idx.neg = sub i32 0, %conv84
  %add.ptr85 = getelementptr inbounds i16, i16* %add.ptr82, i32 %idx.neg
  store i16 %conv81, i16* %add.ptr85, align 2
  br label %for.inc86

for.inc86:                                        ; preds = %for.body79
  %59 = load i32, i32* %i, align 4
  %dec = add nsw i32 %59, -1
  store i32 %dec, i32* %i, align 4
  %60 = load i32, i32* %j, align 4
  %inc87 = add nsw i32 %60, 1
  store i32 %inc87, i32* %j, align 4
  br label %for.cond76

for.end88:                                        ; preds = %for.cond76
  %arrayidx89 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 62
  %61 = load i32, i32* %arrayidx89, align 4
  %conv90 = trunc i32 %61 to i16
  %62 = load i16*, i16** %data.addr, align 4
  %add.ptr91 = getelementptr inbounds i16, i16* %62, i32 63
  store i16 %conv90, i16* %add.ptr91, align 2
  ret void
}

; Function Attrs: nounwind
define void @fast_idct_8(i16* %in, i32 %stride) #0 {
entry:
  %in.addr = alloca i16*, align 4
  %stride.addr = alloca i32, align 4
  %tmp10 = alloca i32, align 4
  %tmp11 = alloca i32, align 4
  %tmp12 = alloca i32, align 4
  %tmp13 = alloca i32, align 4
  %tmp20 = alloca i32, align 4
  %tmp21 = alloca i32, align 4
  %tmp22 = alloca i32, align 4
  %tmp23 = alloca i32, align 4
  %tmp30 = alloca i32, align 4
  %tmp31 = alloca i32, align 4
  %tmp40 = alloca i32, align 4
  %tmp41 = alloca i32, align 4
  %tmp42 = alloca i32, align 4
  %tmp43 = alloca i32, align 4
  %tmp50 = alloca i32, align 4
  %tmp51 = alloca i32, align 4
  %tmp52 = alloca i32, align 4
  %tmp53 = alloca i32, align 4
  %in0 = alloca i32, align 4
  %in1 = alloca i32, align 4
  %in2 = alloca i32, align 4
  %in3 = alloca i32, align 4
  %in4 = alloca i32, align 4
  %in5 = alloca i32, align 4
  %in6 = alloca i32, align 4
  %in7 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i16* %in, i16** %in.addr, align 4
  store i32 %stride, i32* %stride.addr, align 4
  %0 = load i16*, i16** %in.addr, align 4
  %arrayidx = getelementptr inbounds i16, i16* %0, i32 0
  %1 = load i16, i16* %arrayidx, align 2
  %conv = sext i16 %1 to i32
  store i32 %conv, i32* %in0, align 4
  %2 = load i32, i32* %stride.addr, align 4
  %3 = load i16*, i16** %in.addr, align 4
  %arrayidx1 = getelementptr inbounds i16, i16* %3, i32 %2
  %4 = load i16, i16* %arrayidx1, align 2
  %conv2 = sext i16 %4 to i32
  store i32 %conv2, i32* %in1, align 4
  %5 = load i32, i32* %stride.addr, align 4
  %mul = mul nsw i32 %5, 2
  %6 = load i16*, i16** %in.addr, align 4
  %arrayidx3 = getelementptr inbounds i16, i16* %6, i32 %mul
  %7 = load i16, i16* %arrayidx3, align 2
  %conv4 = sext i16 %7 to i32
  store i32 %conv4, i32* %in2, align 4
  %8 = load i32, i32* %stride.addr, align 4
  %mul5 = mul nsw i32 %8, 3
  %9 = load i16*, i16** %in.addr, align 4
  %arrayidx6 = getelementptr inbounds i16, i16* %9, i32 %mul5
  %10 = load i16, i16* %arrayidx6, align 2
  %conv7 = sext i16 %10 to i32
  store i32 %conv7, i32* %in3, align 4
  %11 = load i32, i32* %stride.addr, align 4
  %mul8 = mul nsw i32 %11, 4
  %12 = load i16*, i16** %in.addr, align 4
  %arrayidx9 = getelementptr inbounds i16, i16* %12, i32 %mul8
  %13 = load i16, i16* %arrayidx9, align 2
  %conv10 = sext i16 %13 to i32
  store i32 %conv10, i32* %in4, align 4
  %14 = load i32, i32* %stride.addr, align 4
  %mul11 = mul nsw i32 %14, 5
  %15 = load i16*, i16** %in.addr, align 4
  %arrayidx12 = getelementptr inbounds i16, i16* %15, i32 %mul11
  %16 = load i16, i16* %arrayidx12, align 2
  %conv13 = sext i16 %16 to i32
  store i32 %conv13, i32* %in5, align 4
  %17 = load i32, i32* %stride.addr, align 4
  %mul14 = mul nsw i32 %17, 6
  %18 = load i16*, i16** %in.addr, align 4
  %arrayidx15 = getelementptr inbounds i16, i16* %18, i32 %mul14
  %19 = load i16, i16* %arrayidx15, align 2
  %conv16 = sext i16 %19 to i32
  store i32 %conv16, i32* %in6, align 4
  %20 = load i32, i32* %stride.addr, align 4
  %mul17 = mul nsw i32 %20, 7
  %21 = load i16*, i16** %in.addr, align 4
  %arrayidx18 = getelementptr inbounds i16, i16* %21, i32 %mul17
  %22 = load i16, i16* %arrayidx18, align 2
  %conv19 = sext i16 %22 to i32
  store i32 %conv19, i32* %in7, align 4
  %23 = load i32, i32* %in0, align 4
  %24 = load i32, i32* %in4, align 4
  %add = add nsw i32 %23, %24
  %mul20 = mul nsw i32 %add, 46341
  store i32 %mul20, i32* %tmp10, align 4
  %25 = load i32, i32* %in0, align 4
  %26 = load i32, i32* %in4, align 4
  %sub = sub nsw i32 %25, %26
  %mul21 = mul nsw i32 %sub, 46341
  store i32 %mul21, i32* %tmp11, align 4
  %27 = load i32, i32* %in2, align 4
  %mul22 = mul nsw i32 %27, 25080
  %28 = load i32, i32* %in6, align 4
  %mul23 = mul nsw i32 %28, 60547
  %sub24 = sub nsw i32 %mul22, %mul23
  store i32 %sub24, i32* %tmp12, align 4
  %29 = load i32, i32* %in6, align 4
  %mul25 = mul nsw i32 %29, 25080
  %30 = load i32, i32* %in2, align 4
  %mul26 = mul nsw i32 %30, 60547
  %add27 = add nsw i32 %mul25, %mul26
  store i32 %add27, i32* %tmp13, align 4
  %31 = load i32, i32* %tmp10, align 4
  %32 = load i32, i32* %tmp13, align 4
  %add28 = add nsw i32 %31, %32
  store i32 %add28, i32* %tmp20, align 4
  %33 = load i32, i32* %tmp11, align 4
  %34 = load i32, i32* %tmp12, align 4
  %add29 = add nsw i32 %33, %34
  store i32 %add29, i32* %tmp21, align 4
  %35 = load i32, i32* %tmp11, align 4
  %36 = load i32, i32* %tmp12, align 4
  %sub30 = sub nsw i32 %35, %36
  store i32 %sub30, i32* %tmp22, align 4
  %37 = load i32, i32* %tmp10, align 4
  %38 = load i32, i32* %tmp13, align 4
  %sub31 = sub nsw i32 %37, %38
  store i32 %sub31, i32* %tmp23, align 4
  %39 = load i32, i32* %in3, align 4
  %40 = load i32, i32* %in5, align 4
  %add32 = add nsw i32 %39, %40
  %mul33 = mul nsw i32 %add32, 46341
  %add34 = add nsw i32 %mul33, 8192
  %shr = ashr i32 %add34, 14
  store i32 %shr, i32* %tmp30, align 4
  %41 = load i32, i32* %in3, align 4
  %42 = load i32, i32* %in5, align 4
  %sub35 = sub nsw i32 %41, %42
  %mul36 = mul nsw i32 %sub35, 46341
  %add37 = add nsw i32 %mul36, 8192
  %shr38 = ashr i32 %add37, 14
  store i32 %shr38, i32* %tmp31, align 4
  %43 = load i32, i32* %in1, align 4
  %shl = shl i32 %43, 2
  %44 = load i32, i32* %tmp30, align 4
  %add39 = add nsw i32 %shl, %44
  store i32 %add39, i32* %tmp40, align 4
  %45 = load i32, i32* %in7, align 4
  %shl40 = shl i32 %45, 2
  %46 = load i32, i32* %tmp31, align 4
  %add41 = add nsw i32 %shl40, %46
  store i32 %add41, i32* %tmp41, align 4
  %47 = load i32, i32* %in1, align 4
  %shl42 = shl i32 %47, 2
  %48 = load i32, i32* %tmp30, align 4
  %sub43 = sub nsw i32 %shl42, %48
  store i32 %sub43, i32* %tmp42, align 4
  %49 = load i32, i32* %in7, align 4
  %shl44 = shl i32 %49, 2
  %50 = load i32, i32* %tmp31, align 4
  %sub45 = sub nsw i32 %shl44, %50
  store i32 %sub45, i32* %tmp43, align 4
  %51 = load i32, i32* %tmp40, align 4
  %mul46 = mul nsw i32 %51, 16069
  %52 = load i32, i32* %tmp41, align 4
  %mul47 = mul nsw i32 %52, 3196
  %add48 = add nsw i32 %mul46, %mul47
  store i32 %add48, i32* %tmp50, align 4
  %53 = load i32, i32* %tmp40, align 4
  %mul49 = mul nsw i32 %53, 3196
  %54 = load i32, i32* %tmp41, align 4
  %mul50 = mul nsw i32 %54, 16069
  %sub51 = sub nsw i32 %mul49, %mul50
  store i32 %sub51, i32* %tmp51, align 4
  %55 = load i32, i32* %tmp42, align 4
  %mul52 = mul nsw i32 %55, 9102
  %56 = load i32, i32* %tmp43, align 4
  %mul53 = mul nsw i32 %56, 13623
  %add54 = add nsw i32 %mul52, %mul53
  store i32 %add54, i32* %tmp52, align 4
  %57 = load i32, i32* %tmp42, align 4
  %mul55 = mul nsw i32 %57, 13623
  %58 = load i32, i32* %tmp43, align 4
  %mul56 = mul nsw i32 %58, 9102
  %sub57 = sub nsw i32 %mul55, %mul56
  store i32 %sub57, i32* %tmp53, align 4
  %59 = load i32, i32* %tmp20, align 4
  %60 = load i32, i32* %tmp50, align 4
  %add58 = add nsw i32 %59, %60
  %add59 = add nsw i32 %add58, 65536
  %shr60 = ashr i32 %add59, 17
  %conv61 = trunc i32 %shr60 to i16
  %61 = load i16*, i16** %in.addr, align 4
  %arrayidx62 = getelementptr inbounds i16, i16* %61, i32 0
  store i16 %conv61, i16* %arrayidx62, align 2
  %62 = load i32, i32* %tmp21, align 4
  %63 = load i32, i32* %tmp53, align 4
  %add63 = add nsw i32 %62, %63
  %add64 = add nsw i32 %add63, 65536
  %shr65 = ashr i32 %add64, 17
  %conv66 = trunc i32 %shr65 to i16
  %64 = load i32, i32* %stride.addr, align 4
  %65 = load i16*, i16** %in.addr, align 4
  %arrayidx67 = getelementptr inbounds i16, i16* %65, i32 %64
  store i16 %conv66, i16* %arrayidx67, align 2
  %66 = load i32, i32* %tmp22, align 4
  %67 = load i32, i32* %tmp52, align 4
  %add68 = add nsw i32 %66, %67
  %add69 = add nsw i32 %add68, 65536
  %shr70 = ashr i32 %add69, 17
  %conv71 = trunc i32 %shr70 to i16
  %68 = load i32, i32* %stride.addr, align 4
  %mul72 = mul nsw i32 %68, 2
  %69 = load i16*, i16** %in.addr, align 4
  %arrayidx73 = getelementptr inbounds i16, i16* %69, i32 %mul72
  store i16 %conv71, i16* %arrayidx73, align 2
  %70 = load i32, i32* %tmp23, align 4
  %71 = load i32, i32* %tmp51, align 4
  %add74 = add nsw i32 %70, %71
  %add75 = add nsw i32 %add74, 65536
  %shr76 = ashr i32 %add75, 17
  %conv77 = trunc i32 %shr76 to i16
  %72 = load i32, i32* %stride.addr, align 4
  %mul78 = mul nsw i32 %72, 3
  %73 = load i16*, i16** %in.addr, align 4
  %arrayidx79 = getelementptr inbounds i16, i16* %73, i32 %mul78
  store i16 %conv77, i16* %arrayidx79, align 2
  %74 = load i32, i32* %tmp23, align 4
  %75 = load i32, i32* %tmp51, align 4
  %sub80 = sub nsw i32 %74, %75
  %add81 = add nsw i32 %sub80, 65536
  %shr82 = ashr i32 %add81, 17
  %conv83 = trunc i32 %shr82 to i16
  %76 = load i32, i32* %stride.addr, align 4
  %mul84 = mul nsw i32 %76, 4
  %77 = load i16*, i16** %in.addr, align 4
  %arrayidx85 = getelementptr inbounds i16, i16* %77, i32 %mul84
  store i16 %conv83, i16* %arrayidx85, align 2
  %78 = load i32, i32* %tmp22, align 4
  %79 = load i32, i32* %tmp52, align 4
  %sub86 = sub nsw i32 %78, %79
  %add87 = add nsw i32 %sub86, 65536
  %shr88 = ashr i32 %add87, 17
  %conv89 = trunc i32 %shr88 to i16
  %80 = load i32, i32* %stride.addr, align 4
  %mul90 = mul nsw i32 %80, 5
  %81 = load i16*, i16** %in.addr, align 4
  %arrayidx91 = getelementptr inbounds i16, i16* %81, i32 %mul90
  store i16 %conv89, i16* %arrayidx91, align 2
  %82 = load i32, i32* %tmp21, align 4
  %83 = load i32, i32* %tmp53, align 4
  %sub92 = sub nsw i32 %82, %83
  %add93 = add nsw i32 %sub92, 65536
  %shr94 = ashr i32 %add93, 17
  %conv95 = trunc i32 %shr94 to i16
  %84 = load i32, i32* %stride.addr, align 4
  %mul96 = mul nsw i32 %84, 6
  %85 = load i16*, i16** %in.addr, align 4
  %arrayidx97 = getelementptr inbounds i16, i16* %85, i32 %mul96
  store i16 %conv95, i16* %arrayidx97, align 2
  %86 = load i32, i32* %tmp20, align 4
  %87 = load i32, i32* %tmp50, align 4
  %sub98 = sub nsw i32 %86, %87
  %add99 = add nsw i32 %sub98, 65536
  %shr100 = ashr i32 %add99, 17
  %conv101 = trunc i32 %shr100 to i16
  %88 = load i32, i32* %stride.addr, align 4
  %mul102 = mul nsw i32 %88, 7
  %89 = load i16*, i16** %in.addr, align 4
  %arrayidx103 = getelementptr inbounds i16, i16* %89, i32 %mul102
  store i16 %conv101, i16* %arrayidx103, align 2
  ret void
}

; Function Attrs: nounwind
define void @j_rev_dct(i16* %data) #0 {
entry:
  %data.addr = alloca i16*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %id = alloca i32, align 4
  store i16* %data, i16** %data.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i16*, i16** %data.addr, align 4
  %2 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %2, 8
  %add.ptr = getelementptr inbounds i16, i16* %1, i32 %mul
  call void @fast_idct_8(i16* %add.ptr, i32 1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc5, %for.end
  %4 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %4, 8
  br i1 %cmp2, label %for.body3, label %for.end7

for.body3:                                        ; preds = %for.cond1
  %5 = load i16*, i16** %data.addr, align 4
  %6 = load i32, i32* %i, align 4
  %add.ptr4 = getelementptr inbounds i16, i16* %5, i32 %6
  call void @fast_idct_8(i16* %add.ptr4, i32 8)
  br label %for.inc5

for.inc5:                                         ; preds = %for.body3
  %7 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond1

for.end7:                                         ; preds = %for.cond1
  ret void
}

; Function Attrs: nounwind
define void @dquantz_lum(i16* %data) #0 {
entry:
  %data.addr = alloca i16*, align 4
  %i = alloca i32, align 4
  store i16* %data, i16** %data.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i16*, i16** %data.addr, align 4
  %2 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i16, i16* %1, i32 %2
  %3 = load i16, i16* %add.ptr, align 2
  %conv = sext i16 %3 to i32
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv1 = zext i8 %5 to i32
  %mul = mul nsw i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i16
  %6 = load i16*, i16** %data.addr, align 4
  %7 = load i32, i32* %i, align 4
  %add.ptr3 = getelementptr inbounds i16, i16* %6, i32 %7
  store i16 %conv2, i16* %add.ptr3, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %pdct = alloca i16*, align 4
  %prev = alloca i32, align 4
  %value = alloca i32, align 4
  %npixels = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* @lastlong, align 4
  store i32 0, i32* @bitsleft, align 4
  store i32* getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 0, i32 0), i32** @nextlong, align 4
  store i32 0, i32* %prev, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 600
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @huff_dc_dec(i32* %value)
  %1 = load i32, i32* %value, align 4
  %2 = load i32, i32* %prev, align 4
  %add = add nsw i32 %1, %2
  %conv = trunc i32 %add to i16
  %3 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %3, 8
  %mul1 = mul nsw i32 %mul, 8
  %arrayidx = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul1
  store i16 %conv, i16* %arrayidx, align 2
  %4 = load i32, i32* %i, align 4
  %mul2 = mul nsw i32 %4, 8
  %mul3 = mul nsw i32 %mul2, 8
  %arrayidx4 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul3
  %5 = load i16, i16* %arrayidx4, align 2
  %conv5 = sext i16 %5 to i32
  store i32 %conv5, i32* %prev, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc12, %for.end
  %7 = load i32, i32* %i, align 4
  %cmp7 = icmp slt i32 %7, 600
  br i1 %cmp7, label %for.body9, label %for.end14

for.body9:                                        ; preds = %for.cond6
  %8 = load i32, i32* %i, align 4
  %mul10 = mul nsw i32 %8, 64
  %arrayidx11 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul10
  call void @huff_ac_dec(i16* %arrayidx11)
  br label %for.inc12

for.inc12:                                        ; preds = %for.body9
  %9 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %9, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond6

for.end14:                                        ; preds = %for.cond6
  store i16* getelementptr inbounds ([38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 0), i16** %pdct, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc20, %for.end14
  %10 = load i32, i32* %i, align 4
  %cmp16 = icmp slt i32 %10, 600
  br i1 %cmp16, label %for.body18, label %for.end22

for.body18:                                       ; preds = %for.cond15
  %11 = load i16*, i16** %pdct, align 4
  %12 = load i32, i32* %i, align 4
  %mul19 = mul nsw i32 %12, 64
  %add.ptr = getelementptr inbounds i16, i16* %11, i32 %mul19
  call void @dquantz_lum(i16* %add.ptr)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body18
  %13 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %13, 1
  store i32 %inc21, i32* %i, align 4
  br label %for.cond15

for.end22:                                        ; preds = %for.cond15
  store i16* getelementptr inbounds ([38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 0), i16** %pdct, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc29, %for.end22
  %14 = load i32, i32* %i, align 4
  %cmp24 = icmp slt i32 %14, 600
  br i1 %cmp24, label %for.body26, label %for.end31

for.body26:                                       ; preds = %for.cond23
  %15 = load i16*, i16** %pdct, align 4
  %16 = load i32, i32* %i, align 4
  %mul27 = mul nsw i32 %16, 64
  %add.ptr28 = getelementptr inbounds i16, i16* %15, i32 %mul27
  call void @j_rev_dct(i16* %add.ptr28)
  br label %for.inc29

for.inc29:                                        ; preds = %for.body26
  %17 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %17, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond23

for.end31:                                        ; preds = %for.cond23
  store i32 38400, i32* %npixels, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %m, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc65, %for.end31
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* %npixels, align 4
  %cmp33 = icmp slt i32 %18, %19
  br i1 %cmp33, label %for.body35, label %for.end68

for.body35:                                       ; preds = %for.cond32
  store i32 0, i32* %j, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc62, %for.body35
  %20 = load i32, i32* %j, align 4
  %cmp37 = icmp slt i32 %20, 64
  br i1 %cmp37, label %for.body39, label %for.end64

for.body39:                                       ; preds = %for.cond36
  store i32 0, i32* %k, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc59, %for.body39
  %21 = load i32, i32* %k, align 4
  %22 = load i32, i32* @ncols, align 4
  %mul41 = mul nsw i32 8, %22
  %cmp42 = icmp slt i32 %21, %mul41
  br i1 %cmp42, label %for.body44, label %for.end61

for.body44:                                       ; preds = %for.cond40
  store i32 0, i32* %l, align 4
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc56, %for.body44
  %23 = load i32, i32* %l, align 4
  %cmp46 = icmp slt i32 %23, 8
  br i1 %cmp46, label %for.body48, label %for.end58

for.body48:                                       ; preds = %for.cond45
  %24 = load i32, i32* %l, align 4
  %25 = load i32, i32* %k, align 4
  %add49 = add nsw i32 %24, %25
  %26 = load i32, i32* %j, align 4
  %add50 = add nsw i32 %add49, %26
  %27 = load i32, i32* %i, align 4
  %add51 = add nsw i32 %add50, %27
  %arrayidx52 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51
  %28 = load i16, i16* %arrayidx52, align 2
  %conv53 = sext i16 %28 to i32
  %add54 = add nsw i32 %conv53, 64
  %29 = load i32, i32* %sum, align 4
  %add55 = add nsw i32 %29, %add54
  store i32 %add55, i32* %sum, align 4
  br label %for.inc56

for.inc56:                                        ; preds = %for.body48
  %30 = load i32, i32* %l, align 4
  %inc57 = add nsw i32 %30, 1
  store i32 %inc57, i32* %l, align 4
  br label %for.cond45

for.end58:                                        ; preds = %for.cond45
  br label %for.inc59

for.inc59:                                        ; preds = %for.end58
  %31 = load i32, i32* %k, align 4
  %add60 = add nsw i32 %31, 64
  store i32 %add60, i32* %k, align 4
  br label %for.cond40

for.end61:                                        ; preds = %for.cond40
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %32 = load i32, i32* %j, align 4
  %add63 = add nsw i32 %32, 8
  store i32 %add63, i32* %j, align 4
  br label %for.cond36

for.end64:                                        ; preds = %for.cond36
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* @ncols, align 4
  %mul66 = mul nsw i32 8, %34
  %add67 = add nsw i32 %33, %mul66
  store i32 %add67, i32* %i, align 4
  br label %for.cond32

for.end68:                                        ; preds = %for.cond32
  %35 = load i32, i32* %sum, align 4
  %cmp69 = icmp ne i32 %35, 2598822
  br i1 %cmp69, label %if.then, label %if.else

if.then:                                          ; preds = %for.end68
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i32 15, i32* %retval
  br label %return

if.else:                                          ; preds = %for.end68
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0))
  store i32 66, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %36 = load i32, i32* %retval
  ret i32 %36
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}

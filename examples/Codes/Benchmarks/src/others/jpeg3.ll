; ModuleID = 'jpeg.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@ncols = global i32 240, align 4
@nrows = global i32 160, align 4
@huffbits = global [601 x i32] [i32 -747211146, i32 -1391758464, i32 134744098, i32 573943150, i32 1465576700, i32 -1118153113, i32 67391764, i32 272910005, i32 -1379275995, i32 -1550866094, i32 1526727176, i32 944833606, i32 -1248998678, i32 1689225127, i32 1514864649, i32 489181901, i32 -139949939, i32 1666946004, i32 741907061, i32 -580648267, i32 416868159, i32 1916866843, i32 611045236, i32 -1425658212, i32 631506661, i32 1183653018, i32 -690945791, i32 821712267, i32 256779995, i32 1082860135, i32 -1464841808, i32 -1323267798, i32 1651796766, i32 378739048, i32 1416510901, i32 2078443085, i32 579613259, i32 1531304093, i32 416038150, i32 -982756806, i32 1925484429, i32 1842948803, i32 736148204, i32 1585475093, i32 -192227165, i32 725217452, i32 -1934541846, i32 -949868307, i32 -1372653416, i32 935865866, i32 362357522, i32 1152842064, i32 109954526, i32 1457610101, i32 2072645262, i32 -1416614821, i32 1820336675, i32 1912013574, i32 -336896943, i32 -97663901, i32 -957863646, i32 -2000242247, i32 459375982, i32 1255609818, i32 -221837739, i32 1152738761, i32 581051217, i32 -648355449, i32 1784330086, i32 -711873181, i32 1793546583, i32 -1304361951, i32 -1182029288, i32 -1238979661, i32 -1498884560, i32 1279910939, i32 629650609, i32 159753240, i32 -741398806, i32 -2110638533, i32 79578838, i32 1504914084, i32 2025456015, i32 1034786609, i32 298654494, i32 1835864456, i32 965915923, i32 1061958245, i32 -625666048, i32 -424460666, i32 -1554347292, i32 1360215898, i32 1164696746, i32 956634648, i32 1903567459, i32 1230713606, i32 -410380883, i32 266191997, i32 -849678022, i32 -790013985, i32 -343409739, i32 1718840479, i32 1255128422, i32 -1276159497, i32 -1395233995, i32 -1697814870, i32 -1424665531, i32 289836314, i32 896944531, i32 -1816123628, i32 -1565435192, i32 -37459971, i32 -1343664015, i32 855468410, i32 1442314965, i32 -95055361, i32 1180592949, i32 -1697814861, i32 1436208469, i32 1431655761, i32 -1555657446, i32 -1140893570, i32 -1500196109, i32 1523253154, i32 704605311, i32 592551902, i32 -1479108699, i32 1602086115, i32 -1252450316, i32 1911925974, i32 1798675114, i32 -848906486, i32 -216581944, i32 -1395305118, i32 -1320922717, i32 1183652540, i32 -10749798, i32 110213549, i32 1550238975, i32 -1104594799, i32 2125768586, i32 -1090649258, i32 670506893, i32 1722460981, i32 1389110023, i32 -1180078556, i32 1015254945, i32 -1556349064, i32 -25906383, i32 1030372274, i32 -1913449915, i32 1159907457, i32 -1796123254, i32 -1403972504, i32 -777828689, i32 2144796198, i32 -1474636722, i32 1818225193, i32 2129848278, i32 -1818186785, i32 -1162517889, i32 1960794794, i32 -1431598179, i32 -2069694994, i32 1772480258, i32 -1645057227, i32 432120441, i32 -1417968884, i32 -2138064262, i32 -1971316269, i32 1952674037, i32 -1356706691, i32 -539575159, i32 1069055802, i32 -232390937, i32 -346069097, i32 -73421541, i32 2038413419, i32 -319614067, i32 -2072273260, i32 745684950, i32 1627371846, i32 -788294601, i32 169595651, i32 1070505673, i32 1363751699, i32 -334233681, i32 1474300366, i32 239500586, i32 -1426351303, i32 672159869, i32 1765731678, i32 2141937581, i32 1486852542, i32 -1252697689, i32 1839750096, i32 1405750035, i32 -589868212, i32 722742044, i32 1957351982, i32 430078834, i32 1188153364, i32 1619769983, i32 -473432981, i32 -913572231, i32 -1849348, i32 1808437246, i32 2039469756, i32 -1241586945, i32 -550129401, i32 -265814542, i32 721959712, i32 -66752687, i32 -62882251, i32 -428195861, i32 1288456158, i32 670149615, i32 -171995894, i32 -1412535003, i32 -8995542, i32 871533244, i32 -433982037, i32 512751018, i32 -1431592053, i32 1996116459, i32 1369851257, i32 1503727163, i32 1350732864, i32 177549768, i32 -1425593998, i32 810076359, i32 344748930, i32 1945478698, i32 -1557917750, i32 -1703394841, i32 -111683027, i32 -37752934, i32 331512447, i32 711694420, i32 -229644961, i32 1804016073, i32 -56086427, i32 205132186, i32 1855291390, i32 -1141658965, i32 -1611073897, i32 -36479623, i32 -1462777001, i32 1556347093, i32 -1845756027, i32 1723028819, i32 788044103, i32 1900365949, i32 -1481742239, i32 381476285, i32 1423068301, i32 1167329897, i32 1674457938, i32 -1865780902, i32 1954123961, i32 -402189121, i32 2018886082, i32 -1446569559, i32 1105173633, i32 1560869262, i32 1038759389, i32 -924299428, i32 1405527136, i32 -246478564, i32 -2087026562, i32 -499318924, i32 1400155459, i32 -42473643, i32 1408462624, i32 -10168470, i32 -1929600338, i32 2144640941, i32 1495243263, i32 178965844, i32 -866832196, i32 333351595, i32 -938875461, i32 -1704397042, i32 683989476, i32 -1822532065, i32 -760997629, i32 109187145, i32 66364994, i32 -876085094, i32 -1290255865, i32 1848145173, i32 1891356672, i32 1909273088, i32 -664647628, i32 -787685280, i32 1673407026, i32 1104806255, i32 1364080644, i32 -56099410, i32 709760800, i32 486148736, i32 -435929430, i32 699093272, i32 -1809863339, i32 1271672830, i32 -369207848, i32 -733486059, i32 1912513749, i32 -1711678487, i32 1504499028, i32 -1950781399, i32 -1809638826, i32 -1436155463, i32 885356737, i32 -1606899441, i32 -1520771031, i32 -180563734, i32 700522580, i32 -776212457, i32 -1970348480, i32 -411968323, i32 -2126682069, i32 -1441617865, i32 2053553319, i32 1879878217, i32 -187741576, i32 -1539560328, i32 -62569462, i32 -998208496, i32 831141289, i32 2142180692, i32 -54082563, i32 -1824087745, i32 548114421, i32 760645623, i32 -1376474454, i32 -1433116273, i32 884325122, i32 -1687589732, i32 1371961541, i32 115511578, i32 1500950486, i32 -1129243734, i32 -1880174357, i32 1571523242, i32 -1439405229, i32 -10736983, i32 -1091962281, i32 -1388285160, i32 -1442851657, i32 -760397866, i32 -1616554390, i32 -1458259067, i32 491367400, i32 436799545, i32 552877748, i32 237707505, i32 1582885376, i32 -1382098694, i32 1463932589, i32 294578435, i32 854822414, i32 709868559, i32 2085948074, i32 -1432196906, i32 -1442924181, i32 899298426, i32 -1699266629, i32 355465894, i32 -95047686, i32 -272454998, i32 879303714, i32 210982646, i32 1645460878, i32 -423145654, i32 -1165472635, i32 468776617, i32 -512221428, i32 955017242, i32 256701578, i32 1684246023, i32 -1386500576, i32 1614486160, i32 -1865926463, i32 356690611, i32 1387354313, i32 1368648017, i32 1214533061, i32 1993421901, i32 1788865367, i32 -240464557, i32 2112091563, i32 1677439314, i32 2141941669, i32 1535094303, i32 1252691510, i32 -1853710135, i32 896336577, i32 503786622, i32 -235558287, i32 -339171038, i32 1494706944, i32 1163717103, i32 422387499, i32 -398816735, i32 -2029604373, i32 1353636039, i32 -1087043079, i32 410768512, i32 -451959450, i32 -2115849383, i32 -1395575398, i32 646204611, i32 563606445, i32 1493875815, i32 712220295, i32 -380265955, i32 1778318205, i32 1792605932, i32 1409264495, i32 -1520721953, i32 761703917, i32 -562826512, i32 -1549191932, i32 151183687, i32 1036642923, i32 902885710, i32 -598277018, i32 -1999810710, i32 -1836260595, i32 -366428074, i32 1840386208, i32 1999970925, i32 -1054903052, i32 -1471277634, i32 -1259599185, i32 1868781984, i32 2024593130, i32 -105050139, i32 1483730615, i32 -446800729, i32 -27672579, i32 -228013377, i32 -568353466, i32 54832128, i32 962508203, i32 1972105726, i32 -1789653685, i32 -21627226, i32 -1383076155, i32 937193381, i32 1107212650, i32 -825439353, i32 -1820005315, i32 1744871424, i32 805654991, i32 -1389246637, i32 1491578166, i32 1437739910, i32 420757933, i32 1381049809, i32 1345864079, i32 -961763619, i32 1813088221, i32 -523105169, i32 44395969, i32 238145347, i32 1156665530, i32 117830016, i32 999084186, i32 314584177, i32 -1616497671, i32 452138111, i32 1954365464, i32 -1482864448, i32 -1754663656, i32 -1460775568, i32 607897214, i32 -154377237, i32 1294318320, i32 -985758634, i32 1962015792, i32 267913391, i32 1054652116, i32 1979056214, i32 -1339006209, i32 -2122364211, i32 1723028351, i32 -1367345267, i32 1534970431, i32 1962748745, i32 -1322076002, i32 1078079453, i32 515124000, i32 1966455165, i32 1164189318, i32 -1694059981, i32 -694184414, i32 -2089993817, i32 996355134, i32 -1787126940, i32 -817188500, i32 1221323315, i32 1238671201, i32 1375843354, i32 1855314570, i32 -1776285046, i32 1605543689, i32 -1667334806, i32 466134297, i32 119495287, i32 1112902811, i32 1911061246, i32 342761757, i32 1484653197, i32 -601622373, i32 -223793619, i32 -1653548088, i32 -1385585858, i32 1217240193, i32 -1141932523, i32 -1697819425, i32 -337642013, i32 1459365185, i32 530391118, i32 -570518254, i32 -2076136912, i32 122316743, i32 61674386, i32 1942815281, i32 -2091308424, i32 874854593, i32 -1572410226, i32 -188269357, i32 1983177952, i32 64140544, i32 907164291, i32 1449655588, i32 1942033821, i32 -1557682310, i32 -1801617266, i32 -1717316933, i32 1375881671, i32 1852469237, i32 2139662385, i32 -1812798487, i32 1183271476, i32 1800667030, i32 2140140704, i32 1798675103, i32 -42205252, i32 1793060565, i32 -1671753714, i32 -409776899, i32 -2056866983, i32 -1394429113, i32 -1975734715, i32 26550963, i32 -1853663288, i32 1119321301, i32 -1312439791, i32 1275135006, i32 -2036764408, i32 199968391, i32 1250946842, i32 -1818966182, i32 1428483335, i32 -420773414, i32 -1757722898, i32 -1108626150, i32 900333515, i32 1070070354, i32 -1032081156, i32 675454630, i32 -2100936825, i32 -207417927, i32 959497807, i32 -1454290799, i32 704209729, i32 -196001216, i32 152954934, i32 2041368629, i32 1432176168, i32 2007103487, i32 176133699, i32 -395646601, i32 1148948800, i32 -326099232, i32 -427701758, i32 734810277, i32 2043570377, i32 -314424434, i32 -1809503629, i32 -1963785048, i32 1986049957, i32 1082095820, i32 -1584006602, i32 2026189092, i32 -453664662, i32 -1985131604, i32 2140140704], align 4
@bitsleft = internal unnamed_addr global i32 0, align 4
@nextlong = internal unnamed_addr global i32* getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 0, i32 0), align 4
@lastlong = internal unnamed_addr global i32 0, align 4
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
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define i32 @getbit() #0 {
entry:
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !1
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @bitsleft, align 4, !tbaa !1
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %entry.if.end3_crit_edge

entry.if.end3_crit_edge:                          ; preds = %entry
  %.pre = load i32, i32* @lastlong, align 4, !tbaa !1
  br label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1 = icmp ult i32* %1, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1, label %if.else, label %if.then2

if.then2:                                         ; preds = %if.then
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %if.end3

if.else:                                          ; preds = %if.then
  %incdec.ptr = getelementptr inbounds i32, i32* %1, i32 1
  store i32* %incdec.ptr, i32** @nextlong, align 4, !tbaa !5
  %2 = load i32, i32* %1, align 4, !tbaa !1
  store i32 %2, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %if.end3

if.end3:                                          ; preds = %entry.if.end3_crit_edge, %if.then2, %if.else
  %3 = phi i32 [ %.pre, %entry.if.end3_crit_edge ], [ 0, %if.then2 ], [ %2, %if.else ]
  %.lobit = lshr i32 %3, 31
  %shl = shl i32 %3, 1
  store i32 %shl, i32* @lastlong, align 4, !tbaa !1
  ret i32 %.lobit
}

; Function Attrs: nounwind
define void @huff_dc_dec(i32* nocapture %retval) #0 {
entry:
  %0 = load i32, i32* @bitsleft, align 4, !tbaa !1
  %dec.i = add nsw i32 %0, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i = icmp slt i32 %0, 1
  br i1 %cmp.i, label %if.then.i, label %entry.if.end3_crit_edge.i

entry.if.end3_crit_edge.i:                        ; preds = %entry
  %.pre.i = load i32, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit

if.then.i:                                        ; preds = %entry
  %1 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i = icmp ult i32* %1, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i, label %if.else.i, label %if.then2.i

if.then2.i:                                       ; preds = %if.then.i
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i = getelementptr inbounds i32, i32* %1, i32 1
  store i32* %incdec.ptr.i, i32** @nextlong, align 4, !tbaa !5
  %2 = load i32, i32* %1, align 4, !tbaa !1
  store i32 %2, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit

getbit.exit:                                      ; preds = %entry.if.end3_crit_edge.i, %if.then2.i, %if.else.i
  %3 = phi i32 [ %dec.i, %entry.if.end3_crit_edge.i ], [ %dec.i, %if.then2.i ], [ 31, %if.else.i ]
  %4 = phi i32 [ %.pre.i, %entry.if.end3_crit_edge.i ], [ 0, %if.then2.i ], [ %2, %if.else.i ]
  %.lobit.i = lshr i32 %4, 31
  %shl.i = shl i32 %4, 1
  store i32 %shl.i, i32* @lastlong, align 4, !tbaa !1
  %5 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @maxcode_dc, i32 0, i32 1), align 4, !tbaa !1
  %cmp65 = icmp sgt i32 %.lobit.i, %5
  br i1 %cmp65, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %getbit.exit
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %getbit.exit61
  %.pre.i52 = phi i32 [ %shl.i60, %getbit.exit61 ], [ %shl.i, %while.body.preheader ]
  %6 = phi i32 [ %9, %getbit.exit61 ], [ %3, %while.body.preheader ]
  %code.067 = phi i32 [ %add, %getbit.exit61 ], [ %.lobit.i, %while.body.preheader ]
  %l.066 = phi i32 [ %inc, %getbit.exit61 ], [ 1, %while.body.preheader ]
  %inc = add nuw nsw i32 %l.066, 1
  %shl = shl i32 %code.067, 1
  %dec.i50 = add nsw i32 %6, -1
  store i32 %dec.i50, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i51 = icmp slt i32 %6, 1
  br i1 %cmp.i51, label %if.then.i55, label %getbit.exit61

if.then.i55:                                      ; preds = %while.body
  %7 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i54 = icmp ult i32* %7, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i54, label %if.else.i58, label %if.then2.i56

if.then2.i56:                                     ; preds = %if.then.i55
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit61

if.else.i58:                                      ; preds = %if.then.i55
  %incdec.ptr.i57 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr.i57, i32** @nextlong, align 4, !tbaa !5
  %8 = load i32, i32* %7, align 4, !tbaa !1
  store i32 %8, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit61

getbit.exit61:                                    ; preds = %while.body, %if.then2.i56, %if.else.i58
  %9 = phi i32 [ %dec.i50, %if.then2.i56 ], [ 31, %if.else.i58 ], [ %dec.i50, %while.body ]
  %10 = phi i32 [ 0, %if.then2.i56 ], [ %8, %if.else.i58 ], [ %.pre.i52, %while.body ]
  %.lobit.i59 = lshr i32 %10, 31
  %shl.i60 = shl i32 %10, 1
  store i32 %shl.i60, i32* @lastlong, align 4, !tbaa !1
  %add = or i32 %.lobit.i59, %shl
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @maxcode_dc, i32 0, i32 %inc
  %11 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %cmp = icmp sgt i32 %add, %11
  br i1 %cmp, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %getbit.exit61
  %add.lcssa = phi i32 [ %add, %getbit.exit61 ]
  %inc.lcssa = phi i32 [ %inc, %getbit.exit61 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %getbit.exit
  %code.0.lcssa = phi i32 [ %.lobit.i, %getbit.exit ], [ %add.lcssa, %while.end.loopexit ]
  %l.0.lcssa = phi i32 [ 1, %getbit.exit ], [ %inc.lcssa, %while.end.loopexit ]
  %arrayidx2 = getelementptr inbounds [10 x i8], [10 x i8]* @valptr_dc, i32 0, i32 %l.0.lcssa
  %12 = load i8, i8* %arrayidx2, align 1, !tbaa !7
  %conv = zext i8 %12 to i32
  %add3 = add nsw i32 %conv, %code.0.lcssa
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* @mincode_dc, i32 0, i32 %l.0.lcssa
  %13 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %sub = sub i32 %add3, %13
  %arrayidx5 = getelementptr inbounds [12 x i8], [12 x i8]* @val_dc_lum, i32 0, i32 %sub
  %14 = load i8, i8* %arrayidx5, align 1, !tbaa !7
  %conv6 = zext i8 %14 to i32
  store i32 0, i32* %retval, align 4, !tbaa !1
  %cmp763 = icmp eq i8 %14, 0
  br i1 %cmp763, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %while.end
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %getbit.exit49
  %15 = phi i32 [ %add11, %getbit.exit49 ], [ 0, %for.body.preheader ]
  %i.064 = phi i32 [ %inc12, %getbit.exit49 ], [ 0, %for.body.preheader ]
  %shl9 = shl i32 %15, 1
  %16 = load i32, i32* @bitsleft, align 4, !tbaa !1
  %dec.i38 = add nsw i32 %16, -1
  store i32 %dec.i38, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i39 = icmp slt i32 %16, 1
  br i1 %cmp.i39, label %if.then.i43, label %entry.if.end3_crit_edge.i41

entry.if.end3_crit_edge.i41:                      ; preds = %for.body
  %.pre.i40 = load i32, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit49

if.then.i43:                                      ; preds = %for.body
  %17 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i42 = icmp ult i32* %17, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i42, label %if.else.i46, label %if.then2.i44

if.then2.i44:                                     ; preds = %if.then.i43
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit49

if.else.i46:                                      ; preds = %if.then.i43
  %incdec.ptr.i45 = getelementptr inbounds i32, i32* %17, i32 1
  store i32* %incdec.ptr.i45, i32** @nextlong, align 4, !tbaa !5
  %18 = load i32, i32* %17, align 4, !tbaa !1
  store i32 %18, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit49

getbit.exit49:                                    ; preds = %entry.if.end3_crit_edge.i41, %if.then2.i44, %if.else.i46
  %19 = phi i32 [ %.pre.i40, %entry.if.end3_crit_edge.i41 ], [ 0, %if.then2.i44 ], [ %18, %if.else.i46 ]
  %.lobit.i47 = lshr i32 %19, 31
  %shl.i48 = shl i32 %19, 1
  store i32 %shl.i48, i32* @lastlong, align 4, !tbaa !1
  %add11 = or i32 %.lobit.i47, %shl9
  store i32 %add11, i32* %retval, align 4, !tbaa !1
  %inc12 = add nuw nsw i32 %i.064, 1
  %exitcond = icmp eq i32 %inc12, %conv6
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %getbit.exit49
  %add11.lcssa = phi i32 [ %add11, %getbit.exit49 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %while.end
  %20 = phi i32 [ 0, %while.end ], [ %add11.lcssa, %for.end.loopexit ]
  %sub13 = add nsw i32 %conv6, -1
  %shl14 = shl i32 1, %sub13
  %cmp1662 = icmp slt i32 %20, %shl14
  br i1 %cmp1662, label %while.body18.lr.ph, label %while.end22

while.body18.lr.ph:                               ; preds = %for.end
  %shl19 = shl i32 -1, %conv6
  %add20 = add nsw i32 %shl19, 1
  br label %while.body18

while.body18:                                     ; preds = %while.body18.lr.ph, %while.body18
  %21 = phi i32 [ %20, %while.body18.lr.ph ], [ %add21, %while.body18 ]
  %add21 = add nsw i32 %21, %add20
  %cmp16 = icmp slt i32 %21, 0
  br i1 %cmp16, label %while.body18, label %while.cond15.while.end22_crit_edge

while.cond15.while.end22_crit_edge:               ; preds = %while.body18
  %add21.lcssa = phi i32 [ %add21, %while.body18 ]
  store i32 %add21.lcssa, i32* %retval, align 4, !tbaa !1
  br label %while.end22

while.end22:                                      ; preds = %while.cond15.while.end22_crit_edge, %for.end
  ret void
}

; Function Attrs: nounwind
define void @huff_ac_dec(i16* nocapture %data) #0 {
entry:
  %data_zz = alloca [64 x i32], align 4
  %0 = bitcast [64 x i32]* %data_zz to i8*
  call void @llvm.lifetime.start(i64 256, i8* %0) #1
  %.pre = load i32, i32* @bitsleft, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %entry, %while.cond.backedge
  %1 = phi i32 [ %.pre, %entry ], [ %28, %while.cond.backedge ]
  %dindex.0183 = phi i32 [ 0, %entry ], [ %dindex.0.be, %while.cond.backedge ]
  %dec.i = add nsw i32 %1, -1
  store i32 %dec.i, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i = icmp slt i32 %1, 1
  br i1 %cmp.i, label %if.then.i, label %entry.if.end3_crit_edge.i

entry.if.end3_crit_edge.i:                        ; preds = %while.body
  %.pre.i = load i32, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit

if.then.i:                                        ; preds = %while.body
  %2 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i = icmp ult i32* %2, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i, label %if.else.i, label %if.then2.i

if.then2.i:                                       ; preds = %if.then.i
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit

if.else.i:                                        ; preds = %if.then.i
  %incdec.ptr.i = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr.i, i32** @nextlong, align 4, !tbaa !5
  %3 = load i32, i32* %2, align 4, !tbaa !1
  store i32 %3, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit

getbit.exit:                                      ; preds = %entry.if.end3_crit_edge.i, %if.then2.i, %if.else.i
  %4 = phi i32 [ %dec.i, %entry.if.end3_crit_edge.i ], [ %dec.i, %if.then2.i ], [ 31, %if.else.i ]
  %5 = phi i32 [ %.pre.i, %entry.if.end3_crit_edge.i ], [ 0, %if.then2.i ], [ %3, %if.else.i ]
  %.lobit.i = lshr i32 %5, 31
  %shl.i = shl i32 %5, 1
  store i32 %shl.i, i32* @lastlong, align 4, !tbaa !1
  %6 = load i32, i32* getelementptr inbounds ([17 x i32], [17 x i32]* @maxcode_ac, i32 0, i32 1), align 4, !tbaa !1
  %cmp2162 = icmp sgt i32 %.lobit.i, %6
  br i1 %cmp2162, label %while.body3.preheader, label %while.end

while.body3.preheader:                            ; preds = %getbit.exit
  br label %while.body3

while.body3:                                      ; preds = %while.body3.preheader, %getbit.exit157
  %.pre.i148 = phi i32 [ %shl.i156, %getbit.exit157 ], [ %shl.i, %while.body3.preheader ]
  %7 = phi i32 [ %10, %getbit.exit157 ], [ %4, %while.body3.preheader ]
  %code.0164 = phi i32 [ %add5, %getbit.exit157 ], [ %.lobit.i, %while.body3.preheader ]
  %l.0163 = phi i32 [ %add, %getbit.exit157 ], [ 1, %while.body3.preheader ]
  %add = add nuw nsw i32 %l.0163, 1
  %shl = shl i32 %code.0164, 1
  %dec.i146 = add nsw i32 %7, -1
  store i32 %dec.i146, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i147 = icmp slt i32 %7, 1
  br i1 %cmp.i147, label %if.then.i151, label %getbit.exit157

if.then.i151:                                     ; preds = %while.body3
  %8 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i150 = icmp ult i32* %8, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i150, label %if.else.i154, label %if.then2.i152

if.then2.i152:                                    ; preds = %if.then.i151
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit157

if.else.i154:                                     ; preds = %if.then.i151
  %incdec.ptr.i153 = getelementptr inbounds i32, i32* %8, i32 1
  store i32* %incdec.ptr.i153, i32** @nextlong, align 4, !tbaa !5
  %9 = load i32, i32* %8, align 4, !tbaa !1
  store i32 %9, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit157

getbit.exit157:                                   ; preds = %while.body3, %if.then2.i152, %if.else.i154
  %10 = phi i32 [ %dec.i146, %if.then2.i152 ], [ 31, %if.else.i154 ], [ %dec.i146, %while.body3 ]
  %11 = phi i32 [ 0, %if.then2.i152 ], [ %9, %if.else.i154 ], [ %.pre.i148, %while.body3 ]
  %.lobit.i155 = lshr i32 %11, 31
  %shl.i156 = shl i32 %11, 1
  store i32 %shl.i156, i32* @lastlong, align 4, !tbaa !1
  %add5 = or i32 %.lobit.i155, %shl
  %arrayidx = getelementptr inbounds [17 x i32], [17 x i32]* @maxcode_ac, i32 0, i32 %add
  %12 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %cmp2 = icmp sgt i32 %add5, %12
  br i1 %cmp2, label %while.body3, label %while.end.loopexit

while.end.loopexit:                               ; preds = %getbit.exit157
  %add5.lcssa = phi i32 [ %add5, %getbit.exit157 ]
  %shl.i156.lcssa = phi i32 [ %shl.i156, %getbit.exit157 ]
  %.lcssa = phi i32 [ %10, %getbit.exit157 ]
  %add.lcssa = phi i32 [ %add, %getbit.exit157 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %getbit.exit
  %.pre.i136196 = phi i32 [ %shl.i, %getbit.exit ], [ %shl.i156.lcssa, %while.end.loopexit ]
  %13 = phi i32 [ %4, %getbit.exit ], [ %.lcssa, %while.end.loopexit ]
  %code.0.lcssa = phi i32 [ %.lobit.i, %getbit.exit ], [ %add5.lcssa, %while.end.loopexit ]
  %l.0.lcssa = phi i32 [ 1, %getbit.exit ], [ %add.lcssa, %while.end.loopexit ]
  %arrayidx6 = getelementptr inbounds [17 x i8], [17 x i8]* @valptr_ac, i32 0, i32 %l.0.lcssa
  %14 = load i8, i8* %arrayidx6, align 1, !tbaa !7
  %conv = zext i8 %14 to i32
  %add7 = add nsw i32 %conv, %code.0.lcssa
  %arrayidx8 = getelementptr inbounds [17 x i32], [17 x i32]* @mincode_ac, i32 0, i32 %l.0.lcssa
  %15 = load i32, i32* %arrayidx8, align 4, !tbaa !1
  %sub = sub i32 %add7, %15
  %arrayidx9 = getelementptr inbounds [162 x i8], [162 x i8]* @val_ac_lum, i32 0, i32 %sub
  %16 = load i8, i8* %arrayidx9, align 1, !tbaa !7
  %conv10 = zext i8 %16 to i32
  %and = and i32 %conv10, 15
  %shr133 = lshr i32 %conv10, 4
  switch i8 %16, label %for.cond.preheader [
    i8 0, label %if.else51
    i8 -16, label %for.cond42.preheader
  ]

for.cond42.preheader:                             ; preds = %while.end
  %scevgep = getelementptr [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %dindex.0183
  %scevgep186 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i32(i8* %scevgep186, i8 0, i32 64, i32 4, i1 false)
  %17 = add i32 %dindex.0183, 16
  br label %while.cond.backedge

for.cond.preheader:                               ; preds = %while.end
  %cmp16172 = icmp eq i32 %shr133, 0
  br i1 %cmp16172, label %for.cond20.preheader, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %scevgep191 = getelementptr [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %dindex.0183
  %scevgep191192 = bitcast i32* %scevgep191 to i8*
  %18 = shl nuw nsw i32 %shr133, 2
  call void @llvm.memset.p0i8.i32(i8* %scevgep191192, i8 0, i32 %18, i32 4, i1 false)
  %19 = add i32 %dindex.0183, %shr133
  br label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.cond.preheader, %for.body.lr.ph
  %dindex.1.lcssa = phi i32 [ %19, %for.body.lr.ph ], [ %dindex.0183, %for.cond.preheader ]
  %cmp21176 = icmp eq i32 %and, 0
  br i1 %cmp21176, label %for.end29, label %for.body23.lr.ph

for.body23.lr.ph:                                 ; preds = %for.cond20.preheader
  %20 = zext i8 %16 to i32
  %21 = and i32 %20, 15
  br label %for.body23

for.body23:                                       ; preds = %getbit.exit145, %for.body23.lr.ph
  %.pre.i136 = phi i32 [ %.pre.i136196, %for.body23.lr.ph ], [ %shl.i144, %getbit.exit145 ]
  %22 = phi i32 [ %13, %for.body23.lr.ph ], [ %25, %getbit.exit145 ]
  %temp.0178 = phi i32 [ 0, %for.body23.lr.ph ], [ %add26, %getbit.exit145 ]
  %i.1177 = phi i32 [ 0, %for.body23.lr.ph ], [ %inc28, %getbit.exit145 ]
  %shl24 = shl i32 %temp.0178, 1
  %dec.i134 = add nsw i32 %22, -1
  store i32 %dec.i134, i32* @bitsleft, align 4, !tbaa !1
  %cmp.i135 = icmp slt i32 %22, 1
  br i1 %cmp.i135, label %if.then.i139, label %getbit.exit145

if.then.i139:                                     ; preds = %for.body23
  %23 = load i32*, i32** @nextlong, align 4, !tbaa !5
  %cmp1.i138 = icmp ult i32* %23, getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 1, i32 0)
  br i1 %cmp1.i138, label %if.else.i142, label %if.then2.i140

if.then2.i140:                                    ; preds = %if.then.i139
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  br label %getbit.exit145

if.else.i142:                                     ; preds = %if.then.i139
  %incdec.ptr.i141 = getelementptr inbounds i32, i32* %23, i32 1
  store i32* %incdec.ptr.i141, i32** @nextlong, align 4, !tbaa !5
  %24 = load i32, i32* %23, align 4, !tbaa !1
  store i32 %24, i32* @lastlong, align 4, !tbaa !1
  store i32 31, i32* @bitsleft, align 4, !tbaa !1
  br label %getbit.exit145

getbit.exit145:                                   ; preds = %for.body23, %if.then2.i140, %if.else.i142
  %25 = phi i32 [ %dec.i134, %if.then2.i140 ], [ 31, %if.else.i142 ], [ %dec.i134, %for.body23 ]
  %26 = phi i32 [ 0, %if.then2.i140 ], [ %24, %if.else.i142 ], [ %.pre.i136, %for.body23 ]
  %.lobit.i143 = lshr i32 %26, 31
  %shl.i144 = shl i32 %26, 1
  store i32 %shl.i144, i32* @lastlong, align 4, !tbaa !1
  %add26 = or i32 %.lobit.i143, %shl24
  %inc28 = add nuw nsw i32 %i.1177, 1
  %exitcond193 = icmp eq i32 %inc28, %21
  br i1 %exitcond193, label %for.end29.loopexit, label %for.body23

for.end29.loopexit:                               ; preds = %getbit.exit145
  %add26.lcssa = phi i32 [ %add26, %getbit.exit145 ]
  %.lcssa204 = phi i32 [ %25, %getbit.exit145 ]
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit, %for.cond20.preheader
  %27 = phi i32 [ %13, %for.cond20.preheader ], [ %.lcssa204, %for.end29.loopexit ]
  %temp.0.lcssa = phi i32 [ 0, %for.cond20.preheader ], [ %add26.lcssa, %for.end29.loopexit ]
  %sub30 = add nsw i32 %and, -1
  %shl31 = shl i32 1, %sub30
  %cmp33180 = icmp slt i32 %temp.0.lcssa, %shl31
  br i1 %cmp33180, label %while.body35.lr.ph, label %while.end39

while.body35.lr.ph:                               ; preds = %for.end29
  %shl36 = shl i32 -1, %and
  %add37 = add nsw i32 %shl36, 1
  br label %while.body35

while.body35:                                     ; preds = %while.body35.lr.ph, %while.body35
  %temp.1181 = phi i32 [ %temp.0.lcssa, %while.body35.lr.ph ], [ %add38, %while.body35 ]
  %add38 = add nsw i32 %temp.1181, %add37
  %cmp33 = icmp slt i32 %temp.1181, 0
  br i1 %cmp33, label %while.body35, label %while.end39.loopexit

while.end39.loopexit:                             ; preds = %while.body35
  %add38.lcssa = phi i32 [ %add38, %while.body35 ]
  br label %while.end39

while.end39:                                      ; preds = %while.end39.loopexit, %for.end29
  %temp.1.lcssa = phi i32 [ %temp.0.lcssa, %for.end29 ], [ %add38.lcssa, %while.end39.loopexit ]
  %arrayidx40 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %dindex.1.lcssa
  store i32 %temp.1.lcssa, i32* %arrayidx40, align 4, !tbaa !1
  %add41 = add nsw i32 %dindex.1.lcssa, 1
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.else51, %while.end39, %for.cond42.preheader
  %28 = phi i32 [ %27, %while.end39 ], [ %13, %for.cond42.preheader ], [ %13, %if.else51 ]
  %dindex.0.be = phi i32 [ %add41, %while.end39 ], [ %17, %for.cond42.preheader ], [ %dindex.0183, %if.else51 ]
  %cmp = icmp slt i32 %dindex.0.be, 63
  br i1 %cmp, label %while.body, label %for.body67.preheader.loopexit

if.else51:                                        ; preds = %while.end
  %sub52 = sub i32 63, %dindex.0183
  %cmp54168 = icmp sgt i32 %sub52, 0
  br i1 %cmp54168, label %while.cond.backedge.thread, label %while.cond.backedge

while.cond.backedge.thread:                       ; preds = %if.else51
  %dindex.0183.lcssa = phi i32 [ %dindex.0183, %if.else51 ]
  %scevgep188 = getelementptr [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %dindex.0183.lcssa
  %scevgep188189 = bitcast i32* %scevgep188 to i8*
  %29 = shl i32 %dindex.0183.lcssa, 2
  %30 = sub i32 252, %29
  call void @llvm.memset.p0i8.i32(i8* %scevgep188189, i8 0, i32 %30, i32 4, i1 false)
  br label %for.body67.preheader

for.body67.preheader.loopexit:                    ; preds = %while.cond.backedge
  br label %for.body67.preheader

for.body67.preheader:                             ; preds = %for.body67.preheader.loopexit, %while.cond.backedge.thread
  br label %for.body67

for.body67:                                       ; preds = %for.body67.preheader, %for.body67
  %i.5161 = phi i32 [ %add70, %for.body67 ], [ 0, %for.body67.preheader ]
  %arrayidx68 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %i.5161
  %31 = load i32, i32* %arrayidx68, align 4, !tbaa !1
  %conv69 = trunc i32 %31 to i16
  %add70 = add nuw nsw i32 %i.5161, 1
  %arrayidx71 = getelementptr inbounds [32 x i8], [32 x i8]* @zz_tbl, i32 0, i32 %add70
  %32 = load i8, i8* %arrayidx71, align 1, !tbaa !7
  %conv72 = zext i8 %32 to i32
  %add.ptr = getelementptr inbounds i16, i16* %data, i32 %conv72
  store i16 %conv69, i16* %add.ptr, align 2, !tbaa !8
  %exitcond184 = icmp eq i32 %add70, 31
  br i1 %exitcond184, label %for.body79.preheader, label %for.body67

for.body79.preheader:                             ; preds = %for.body67
  br label %for.body79

for.body79:                                       ; preds = %for.body79.preheader, %for.body79
  %i.6160 = phi i32 [ %dec, %for.body79 ], [ 31, %for.body79.preheader ]
  %j.0159 = phi i32 [ %inc87, %for.body79 ], [ 31, %for.body79.preheader ]
  %arrayidx80 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 %j.0159
  %33 = load i32, i32* %arrayidx80, align 4, !tbaa !1
  %conv81 = trunc i32 %33 to i16
  %arrayidx83 = getelementptr inbounds [32 x i8], [32 x i8]* @zz_tbl, i32 0, i32 %i.6160
  %34 = load i8, i8* %arrayidx83, align 1, !tbaa !7
  %conv84 = zext i8 %34 to i32
  %add.ptr82.sum = sub nsw i32 63, %conv84
  %add.ptr85 = getelementptr inbounds i16, i16* %data, i32 %add.ptr82.sum
  store i16 %conv81, i16* %add.ptr85, align 2, !tbaa !8
  %dec = add nsw i32 %i.6160, -1
  %inc87 = add nuw nsw i32 %j.0159, 1
  %exitcond = icmp eq i32 %inc87, 62
  br i1 %exitcond, label %for.end88, label %for.body79

for.end88:                                        ; preds = %for.body79
  %arrayidx89 = getelementptr inbounds [64 x i32], [64 x i32]* %data_zz, i32 0, i32 62
  %35 = load i32, i32* %arrayidx89, align 4, !tbaa !1
  %conv90 = trunc i32 %35 to i16
  %add.ptr91 = getelementptr inbounds i16, i16* %data, i32 63
  store i16 %conv90, i16* %add.ptr91, align 2, !tbaa !8
  call void @llvm.lifetime.end(i64 256, i8* %0) #1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
define void @fast_idct_8(i16* nocapture %in, i32 %stride) #0 {
entry:
  %0 = load i16, i16* %in, align 2, !tbaa !8
  %conv = sext i16 %0 to i32
  %arrayidx1 = getelementptr inbounds i16, i16* %in, i32 %stride
  %1 = load i16, i16* %arrayidx1, align 2, !tbaa !8
  %conv2 = sext i16 %1 to i32
  %mul = shl nsw i32 %stride, 1
  %arrayidx3 = getelementptr inbounds i16, i16* %in, i32 %mul
  %2 = load i16, i16* %arrayidx3, align 2, !tbaa !8
  %conv4 = sext i16 %2 to i32
  %mul5 = mul nsw i32 %stride, 3
  %arrayidx6 = getelementptr inbounds i16, i16* %in, i32 %mul5
  %3 = load i16, i16* %arrayidx6, align 2, !tbaa !8
  %conv7 = sext i16 %3 to i32
  %mul8 = shl nsw i32 %stride, 2
  %arrayidx9 = getelementptr inbounds i16, i16* %in, i32 %mul8
  %4 = load i16, i16* %arrayidx9, align 2, !tbaa !8
  %conv10 = sext i16 %4 to i32
  %mul11 = mul nsw i32 %stride, 5
  %arrayidx12 = getelementptr inbounds i16, i16* %in, i32 %mul11
  %5 = load i16, i16* %arrayidx12, align 2, !tbaa !8
  %conv13 = sext i16 %5 to i32
  %mul14 = mul nsw i32 %stride, 6
  %arrayidx15 = getelementptr inbounds i16, i16* %in, i32 %mul14
  %6 = load i16, i16* %arrayidx15, align 2, !tbaa !8
  %conv16 = sext i16 %6 to i32
  %mul17 = mul nsw i32 %stride, 7
  %arrayidx18 = getelementptr inbounds i16, i16* %in, i32 %mul17
  %7 = load i16, i16* %arrayidx18, align 2, !tbaa !8
  %conv19 = sext i16 %7 to i32
  %add = add nsw i32 %conv10, %conv
  %mul20 = mul nsw i32 %add, 46341
  %sub = sub nsw i32 %conv, %conv10
  %mul21 = mul nsw i32 %sub, 46341
  %mul22 = mul nsw i32 %conv4, 25080
  %8 = mul i32 %conv16, -60547
  %sub24158 = add i32 %mul22, %8
  %mul25 = mul nsw i32 %conv16, 25080
  %mul26 = mul nsw i32 %conv4, 60547
  %add27 = add nsw i32 %mul25, %mul26
  %add28 = add nsw i32 %add27, %mul20
  %add29 = add nsw i32 %sub24158, %mul21
  %sub30 = sub nsw i32 %mul21, %sub24158
  %sub31 = sub nsw i32 %mul20, %add27
  %add32 = add nsw i32 %conv13, %conv7
  %mul33 = mul nsw i32 %add32, 46341
  %add34 = add nsw i32 %mul33, 8192
  %shr = ashr i32 %add34, 14
  %sub35 = sub nsw i32 %conv7, %conv13
  %mul36 = mul nsw i32 %sub35, 46341
  %add37 = add nsw i32 %mul36, 8192
  %shr38 = ashr i32 %add37, 14
  %shl = shl nsw i32 %conv2, 2
  %add39 = add nsw i32 %shr, %shl
  %shl40 = shl nsw i32 %conv19, 2
  %add41 = add nsw i32 %shr38, %shl40
  %sub43 = sub nsw i32 %shl, %shr
  %sub45 = sub nsw i32 %shl40, %shr38
  %mul46 = mul nsw i32 %add39, 16069
  %mul47 = mul nsw i32 %add41, 3196
  %add48 = add nsw i32 %mul46, %mul47
  %mul49 = mul nsw i32 %add39, 3196
  %9 = mul i32 %add41, -16069
  %sub51159 = add i32 %mul49, %9
  %mul52 = mul nsw i32 %sub43, 9102
  %mul53 = mul nsw i32 %sub45, 13623
  %add54 = add nsw i32 %mul52, %mul53
  %mul55 = mul nsw i32 %sub43, 13623
  %10 = mul i32 %sub45, -9102
  %sub57160 = add i32 %mul55, %10
  %add58 = add i32 %add28, 65536
  %add59 = add i32 %add58, %add48
  %shr60 = ashr i32 %add59, 17
  %conv61 = trunc i32 %shr60 to i16
  store i16 %conv61, i16* %in, align 2, !tbaa !8
  %add63 = add i32 %add29, 65536
  %add64 = add i32 %add63, %sub57160
  %shr65 = ashr i32 %add64, 17
  %conv66 = trunc i32 %shr65 to i16
  store i16 %conv66, i16* %arrayidx1, align 2, !tbaa !8
  %add68 = add i32 %sub30, 65536
  %add69 = add i32 %add68, %add54
  %shr70 = ashr i32 %add69, 17
  %conv71 = trunc i32 %shr70 to i16
  store i16 %conv71, i16* %arrayidx3, align 2, !tbaa !8
  %add74 = add i32 %sub31, 65536
  %add75 = add i32 %add74, %sub51159
  %shr76 = ashr i32 %add75, 17
  %conv77 = trunc i32 %shr76 to i16
  store i16 %conv77, i16* %arrayidx6, align 2, !tbaa !8
  %add81 = sub i32 %add74, %sub51159
  %shr82 = ashr i32 %add81, 17
  %conv83 = trunc i32 %shr82 to i16
  store i16 %conv83, i16* %arrayidx9, align 2, !tbaa !8
  %add87 = sub i32 %add68, %add54
  %shr88 = ashr i32 %add87, 17
  %conv89 = trunc i32 %shr88 to i16
  store i16 %conv89, i16* %arrayidx12, align 2, !tbaa !8
  %add93 = sub i32 %add63, %sub57160
  %shr94 = ashr i32 %add93, 17
  %conv95 = trunc i32 %shr94 to i16
  store i16 %conv95, i16* %arrayidx15, align 2, !tbaa !8
  %add99 = sub i32 %add58, %add48
  %shr100 = ashr i32 %add99, 17
  %conv101 = trunc i32 %shr100 to i16
  store i16 %conv101, i16* %arrayidx18, align 2, !tbaa !8
  ret void
}

; Function Attrs: nounwind
define void @j_rev_dct(i16* nocapture %data) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.0114 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %mul = shl nsw i32 %i.0114, 3
  %add.ptr = getelementptr inbounds i16, i16* %data, i32 %mul
  %0 = load i16, i16* %add.ptr, align 2, !tbaa !8
  %conv.i = sext i16 %0 to i32
  %add.ptr.sum100 = or i32 %mul, 1
  %arrayidx1.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum100
  %1 = load i16, i16* %arrayidx1.i, align 2, !tbaa !8
  %conv2.i = sext i16 %1 to i32
  %add.ptr.sum101 = or i32 %mul, 2
  %arrayidx3.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum101
  %2 = load i16, i16* %arrayidx3.i, align 2, !tbaa !8
  %conv4.i = sext i16 %2 to i32
  %add.ptr.sum102 = or i32 %mul, 3
  %arrayidx6.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum102
  %3 = load i16, i16* %arrayidx6.i, align 2, !tbaa !8
  %conv7.i = sext i16 %3 to i32
  %add.ptr.sum103 = or i32 %mul, 4
  %arrayidx9.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum103
  %4 = load i16, i16* %arrayidx9.i, align 2, !tbaa !8
  %conv10.i = sext i16 %4 to i32
  %add.ptr.sum104 = or i32 %mul, 5
  %arrayidx12.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum104
  %5 = load i16, i16* %arrayidx12.i, align 2, !tbaa !8
  %conv13.i = sext i16 %5 to i32
  %add.ptr.sum105 = or i32 %mul, 6
  %arrayidx15.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum105
  %6 = load i16, i16* %arrayidx15.i, align 2, !tbaa !8
  %conv16.i = sext i16 %6 to i32
  %add.ptr.sum106 = or i32 %mul, 7
  %arrayidx18.i = getelementptr inbounds i16, i16* %data, i32 %add.ptr.sum106
  %7 = load i16, i16* %arrayidx18.i, align 2, !tbaa !8
  %conv19.i = sext i16 %7 to i32
  %add.i = add nsw i32 %conv10.i, %conv.i
  %mul20.i = mul nsw i32 %add.i, 46341
  %sub.i = sub nsw i32 %conv.i, %conv10.i
  %mul21.i = mul nsw i32 %sub.i, 46341
  %mul22.i = mul nsw i32 %conv4.i, 25080
  %8 = mul i32 %conv16.i, -60547
  %sub24158.i107 = add i32 %mul22.i, %8
  %mul25.i = mul nsw i32 %conv16.i, 25080
  %mul26.i = mul nsw i32 %conv4.i, 60547
  %add27.i = add nsw i32 %mul25.i, %mul26.i
  %sub30.i = sub nsw i32 %mul21.i, %sub24158.i107
  %sub31.i = sub nsw i32 %mul20.i, %add27.i
  %add32.i = add nsw i32 %conv13.i, %conv7.i
  %mul33.i = mul nsw i32 %add32.i, 46341
  %add34.i = add nsw i32 %mul33.i, 8192
  %shr.i = ashr i32 %add34.i, 14
  %sub35.i = sub nsw i32 %conv7.i, %conv13.i
  %mul36.i = mul nsw i32 %sub35.i, 46341
  %add37.i = add nsw i32 %mul36.i, 8192
  %shr38.i = ashr i32 %add37.i, 14
  %shl.i = shl nsw i32 %conv2.i, 2
  %add39.i = add nsw i32 %shr.i, %shl.i
  %shl40.i = shl nsw i32 %conv19.i, 2
  %add41.i = add nsw i32 %shr38.i, %shl40.i
  %sub43.i = sub nsw i32 %shl.i, %shr.i
  %sub45.i = sub nsw i32 %shl40.i, %shr38.i
  %mul46.i = mul nsw i32 %add39.i, 16069
  %mul47.i = mul nsw i32 %add41.i, 3196
  %add48.i = add nsw i32 %mul46.i, %mul47.i
  %mul49.i = mul nsw i32 %add39.i, 3196
  %9 = mul i32 %add41.i, -16069
  %sub51159.i108 = add i32 %mul49.i, %9
  %mul52.i = mul nsw i32 %sub43.i, 9102
  %mul53.i = mul nsw i32 %sub45.i, 13623
  %add54.i = add nsw i32 %mul52.i, %mul53.i
  %mul55.i = mul nsw i32 %sub43.i, 13623
  %10 = mul i32 %sub45.i, -9102
  %sub57160.i109 = add i32 %mul55.i, %10
  %add28.i = add i32 %mul20.i, 65536
  %add58.i = add i32 %add28.i, %add27.i
  %add59.i = add i32 %add48.i, %add58.i
  %shr60.i = ashr i32 %add59.i, 17
  %conv61.i = trunc i32 %shr60.i to i16
  store i16 %conv61.i, i16* %add.ptr, align 2, !tbaa !8
  %add29.i = add i32 %mul21.i, 65536
  %add63.i = add i32 %add29.i, %sub24158.i107
  %add64.i = add i32 %sub57160.i109, %add63.i
  %shr65.i = ashr i32 %add64.i, 17
  %conv66.i = trunc i32 %shr65.i to i16
  store i16 %conv66.i, i16* %arrayidx1.i, align 2, !tbaa !8
  %add68.i = add i32 %sub30.i, 65536
  %add69.i = add i32 %add54.i, %add68.i
  %shr70.i = ashr i32 %add69.i, 17
  %conv71.i = trunc i32 %shr70.i to i16
  store i16 %conv71.i, i16* %arrayidx3.i, align 2, !tbaa !8
  %add74.i = add i32 %sub31.i, 65536
  %add75.i = add i32 %sub51159.i108, %add74.i
  %shr76.i = ashr i32 %add75.i, 17
  %conv77.i = trunc i32 %shr76.i to i16
  store i16 %conv77.i, i16* %arrayidx6.i, align 2, !tbaa !8
  %add81.i = sub i32 %add74.i, %sub51159.i108
  %shr82.i = ashr i32 %add81.i, 17
  %conv83.i = trunc i32 %shr82.i to i16
  store i16 %conv83.i, i16* %arrayidx9.i, align 2, !tbaa !8
  %add87.i = sub i32 %add68.i, %add54.i
  %shr88.i = ashr i32 %add87.i, 17
  %conv89.i = trunc i32 %shr88.i to i16
  store i16 %conv89.i, i16* %arrayidx12.i, align 2, !tbaa !8
  %add93.i = sub i32 %add63.i, %sub57160.i109
  %shr94.i = ashr i32 %add93.i, 17
  %conv95.i = trunc i32 %shr94.i to i16
  store i16 %conv95.i, i16* %arrayidx15.i, align 2, !tbaa !8
  %add99.i = sub i32 %add58.i, %add48.i
  %shr100.i = ashr i32 %add99.i, 17
  %conv101.i = trunc i32 %shr100.i to i16
  store i16 %conv101.i, i16* %arrayidx18.i, align 2, !tbaa !8
  %inc = add nuw nsw i32 %i.0114, 1
  %exitcond115 = icmp eq i32 %inc, 8
  br i1 %exitcond115, label %for.body3.preheader, label %for.body

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %i.1113 = phi i32 [ %inc6, %for.body3 ], [ 0, %for.body3.preheader ]
  %add.ptr4 = getelementptr inbounds i16, i16* %data, i32 %i.1113
  %11 = load i16, i16* %add.ptr4, align 2, !tbaa !8
  %conv.i14 = sext i16 %11 to i32
  %add.ptr4.sum = add nuw nsw i32 %i.1113, 8
  %arrayidx1.i15 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum
  %12 = load i16, i16* %arrayidx1.i15, align 2, !tbaa !8
  %conv2.i16 = sext i16 %12 to i32
  %add.ptr4.sum94 = add nuw nsw i32 %i.1113, 16
  %arrayidx3.i17 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum94
  %13 = load i16, i16* %arrayidx3.i17, align 2, !tbaa !8
  %conv4.i18 = sext i16 %13 to i32
  %add.ptr4.sum95 = add nuw nsw i32 %i.1113, 24
  %arrayidx6.i19 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum95
  %14 = load i16, i16* %arrayidx6.i19, align 2, !tbaa !8
  %conv7.i20 = sext i16 %14 to i32
  %add.ptr4.sum96 = add nuw nsw i32 %i.1113, 32
  %arrayidx9.i21 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum96
  %15 = load i16, i16* %arrayidx9.i21, align 2, !tbaa !8
  %conv10.i22 = sext i16 %15 to i32
  %add.ptr4.sum97 = add nuw nsw i32 %i.1113, 40
  %arrayidx12.i23 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum97
  %16 = load i16, i16* %arrayidx12.i23, align 2, !tbaa !8
  %conv13.i24 = sext i16 %16 to i32
  %add.ptr4.sum98 = add nuw nsw i32 %i.1113, 48
  %arrayidx15.i25 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum98
  %17 = load i16, i16* %arrayidx15.i25, align 2, !tbaa !8
  %conv16.i26 = sext i16 %17 to i32
  %add.ptr4.sum99 = add nuw nsw i32 %i.1113, 56
  %arrayidx18.i27 = getelementptr inbounds i16, i16* %data, i32 %add.ptr4.sum99
  %18 = load i16, i16* %arrayidx18.i27, align 2, !tbaa !8
  %conv19.i28 = sext i16 %18 to i32
  %add.i29 = add nsw i32 %conv10.i22, %conv.i14
  %mul20.i30 = mul nsw i32 %add.i29, 46341
  %sub.i31 = sub nsw i32 %conv.i14, %conv10.i22
  %mul21.i32 = mul nsw i32 %sub.i31, 46341
  %mul22.i33 = mul nsw i32 %conv4.i18, 25080
  %19 = mul i32 %conv16.i26, -60547
  %sub24158.i34110 = add i32 %mul22.i33, %19
  %mul25.i35 = mul nsw i32 %conv16.i26, 25080
  %mul26.i36 = mul nsw i32 %conv4.i18, 60547
  %add27.i37 = add nsw i32 %mul25.i35, %mul26.i36
  %sub30.i40 = sub nsw i32 %mul21.i32, %sub24158.i34110
  %sub31.i41 = sub nsw i32 %mul20.i30, %add27.i37
  %add32.i42 = add nsw i32 %conv13.i24, %conv7.i20
  %mul33.i43 = mul nsw i32 %add32.i42, 46341
  %add34.i44 = add nsw i32 %mul33.i43, 8192
  %shr.i45 = ashr i32 %add34.i44, 14
  %sub35.i46 = sub nsw i32 %conv7.i20, %conv13.i24
  %mul36.i47 = mul nsw i32 %sub35.i46, 46341
  %add37.i48 = add nsw i32 %mul36.i47, 8192
  %shr38.i49 = ashr i32 %add37.i48, 14
  %shl.i50 = shl nsw i32 %conv2.i16, 2
  %add39.i51 = add nsw i32 %shr.i45, %shl.i50
  %shl40.i52 = shl nsw i32 %conv19.i28, 2
  %add41.i53 = add nsw i32 %shr38.i49, %shl40.i52
  %sub43.i54 = sub nsw i32 %shl.i50, %shr.i45
  %sub45.i55 = sub nsw i32 %shl40.i52, %shr38.i49
  %mul46.i56 = mul nsw i32 %add39.i51, 16069
  %mul47.i57 = mul nsw i32 %add41.i53, 3196
  %add48.i58 = add nsw i32 %mul46.i56, %mul47.i57
  %mul49.i59 = mul nsw i32 %add39.i51, 3196
  %20 = mul i32 %add41.i53, -16069
  %sub51159.i60111 = add i32 %mul49.i59, %20
  %mul52.i61 = mul nsw i32 %sub43.i54, 9102
  %mul53.i62 = mul nsw i32 %sub45.i55, 13623
  %add54.i63 = add nsw i32 %mul52.i61, %mul53.i62
  %mul55.i64 = mul nsw i32 %sub43.i54, 13623
  %21 = mul i32 %sub45.i55, -9102
  %sub57160.i65112 = add i32 %mul55.i64, %21
  %add28.i38 = add i32 %mul20.i30, 65536
  %add58.i66 = add i32 %add28.i38, %add27.i37
  %add59.i67 = add i32 %add48.i58, %add58.i66
  %shr60.i68 = ashr i32 %add59.i67, 17
  %conv61.i69 = trunc i32 %shr60.i68 to i16
  store i16 %conv61.i69, i16* %add.ptr4, align 2, !tbaa !8
  %add29.i39 = add i32 %mul21.i32, 65536
  %add63.i70 = add i32 %add29.i39, %sub24158.i34110
  %add64.i71 = add i32 %sub57160.i65112, %add63.i70
  %shr65.i72 = ashr i32 %add64.i71, 17
  %conv66.i73 = trunc i32 %shr65.i72 to i16
  store i16 %conv66.i73, i16* %arrayidx1.i15, align 2, !tbaa !8
  %add68.i74 = add i32 %sub30.i40, 65536
  %add69.i75 = add i32 %add54.i63, %add68.i74
  %shr70.i76 = ashr i32 %add69.i75, 17
  %conv71.i77 = trunc i32 %shr70.i76 to i16
  store i16 %conv71.i77, i16* %arrayidx3.i17, align 2, !tbaa !8
  %add74.i78 = add i32 %sub31.i41, 65536
  %add75.i79 = add i32 %sub51159.i60111, %add74.i78
  %shr76.i80 = ashr i32 %add75.i79, 17
  %conv77.i81 = trunc i32 %shr76.i80 to i16
  store i16 %conv77.i81, i16* %arrayidx6.i19, align 2, !tbaa !8
  %add81.i82 = sub i32 %add74.i78, %sub51159.i60111
  %shr82.i83 = ashr i32 %add81.i82, 17
  %conv83.i84 = trunc i32 %shr82.i83 to i16
  store i16 %conv83.i84, i16* %arrayidx9.i21, align 2, !tbaa !8
  %add87.i85 = sub i32 %add68.i74, %add54.i63
  %shr88.i86 = ashr i32 %add87.i85, 17
  %conv89.i87 = trunc i32 %shr88.i86 to i16
  store i16 %conv89.i87, i16* %arrayidx12.i23, align 2, !tbaa !8
  %add93.i88 = sub i32 %add63.i70, %sub57160.i65112
  %shr94.i89 = ashr i32 %add93.i88, 17
  %conv95.i90 = trunc i32 %shr94.i89 to i16
  store i16 %conv95.i90, i16* %arrayidx15.i25, align 2, !tbaa !8
  %add99.i91 = sub i32 %add58.i66, %add48.i58
  %shr100.i92 = ashr i32 %add99.i91, 17
  %conv101.i93 = trunc i32 %shr100.i92 to i16
  store i16 %conv101.i93, i16* %arrayidx18.i27, align 2, !tbaa !8
  %inc6 = add nuw nsw i32 %i.1113, 1
  %exitcond = icmp eq i32 %inc6, 8
  br i1 %exitcond, label %for.end7, label %for.body3

for.end7:                                         ; preds = %for.body3
  ret void
}

; Function Attrs: nounwind
define void @dquantz_lum(i16* nocapture %data) #0 {
entry:
  %scevgep = getelementptr i16, i16* %data, i32 63
  %bound0 = icmp ule i16* %data, bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 63) to i16*)
  %bound1 = icmp uge i16* %scevgep, bitcast ([64 x i8]* @qtbl_lum to i16*)
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %entry
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader
  %0 = bitcast i16* %data to <8 x i16>*
  %wide.load = load <8 x i16>, <8 x i16>* %0, align 2, !tbaa !8
  %wide.load12 = load <8 x i8>, <8 x i8>* bitcast ([64 x i8]* @qtbl_lum to <8 x i8>*), align 1, !tbaa !7
  %1 = zext <8 x i8> %wide.load12 to <8 x i16>
  %2 = mul <8 x i16> %1, %wide.load
  %3 = bitcast i16* %data to <8 x i16>*
  store <8 x i16> %2, <8 x i16>* %3, align 2, !tbaa !8
  %4 = getelementptr inbounds i16, i16* %data, i32 8
  %5 = bitcast i16* %4 to <8 x i16>*
  %wide.load.1 = load <8 x i16>, <8 x i16>* %5, align 2, !tbaa !8
  %wide.load12.1 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 8) to <8 x i8>*), align 1, !tbaa !7
  %6 = zext <8 x i8> %wide.load12.1 to <8 x i16>
  %7 = mul <8 x i16> %6, %wide.load.1
  %8 = bitcast i16* %4 to <8 x i16>*
  store <8 x i16> %7, <8 x i16>* %8, align 2, !tbaa !8
  %9 = getelementptr inbounds i16, i16* %data, i32 16
  %10 = bitcast i16* %9 to <8 x i16>*
  %wide.load.2 = load <8 x i16>, <8 x i16>* %10, align 2, !tbaa !8
  %wide.load12.2 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 16) to <8 x i8>*), align 1, !tbaa !7
  %11 = zext <8 x i8> %wide.load12.2 to <8 x i16>
  %12 = mul <8 x i16> %11, %wide.load.2
  %13 = bitcast i16* %9 to <8 x i16>*
  store <8 x i16> %12, <8 x i16>* %13, align 2, !tbaa !8
  %14 = getelementptr inbounds i16, i16* %data, i32 24
  %15 = bitcast i16* %14 to <8 x i16>*
  %wide.load.3 = load <8 x i16>, <8 x i16>* %15, align 2, !tbaa !8
  %wide.load12.3 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 24) to <8 x i8>*), align 1, !tbaa !7
  %16 = zext <8 x i8> %wide.load12.3 to <8 x i16>
  %17 = mul <8 x i16> %16, %wide.load.3
  %18 = bitcast i16* %14 to <8 x i16>*
  store <8 x i16> %17, <8 x i16>* %18, align 2, !tbaa !8
  %19 = getelementptr inbounds i16, i16* %data, i32 32
  %20 = bitcast i16* %19 to <8 x i16>*
  %wide.load.4 = load <8 x i16>, <8 x i16>* %20, align 2, !tbaa !8
  %wide.load12.4 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 32) to <8 x i8>*), align 1, !tbaa !7
  %21 = zext <8 x i8> %wide.load12.4 to <8 x i16>
  %22 = mul <8 x i16> %21, %wide.load.4
  %23 = bitcast i16* %19 to <8 x i16>*
  store <8 x i16> %22, <8 x i16>* %23, align 2, !tbaa !8
  %24 = getelementptr inbounds i16, i16* %data, i32 40
  %25 = bitcast i16* %24 to <8 x i16>*
  %wide.load.5 = load <8 x i16>, <8 x i16>* %25, align 2, !tbaa !8
  %wide.load12.5 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 40) to <8 x i8>*), align 1, !tbaa !7
  %26 = zext <8 x i8> %wide.load12.5 to <8 x i16>
  %27 = mul <8 x i16> %26, %wide.load.5
  %28 = bitcast i16* %24 to <8 x i16>*
  store <8 x i16> %27, <8 x i16>* %28, align 2, !tbaa !8
  %29 = getelementptr inbounds i16, i16* %data, i32 48
  %30 = bitcast i16* %29 to <8 x i16>*
  %wide.load.6 = load <8 x i16>, <8 x i16>* %30, align 2, !tbaa !8
  %wide.load12.6 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 48) to <8 x i8>*), align 1, !tbaa !7
  %31 = zext <8 x i8> %wide.load12.6 to <8 x i16>
  %32 = mul <8 x i16> %31, %wide.load.6
  %33 = bitcast i16* %29 to <8 x i16>*
  store <8 x i16> %32, <8 x i16>* %33, align 2, !tbaa !8
  %34 = getelementptr inbounds i16, i16* %data, i32 56
  %35 = bitcast i16* %34 to <8 x i16>*
  %wide.load.7 = load <8 x i16>, <8 x i16>* %35, align 2, !tbaa !8
  %wide.load12.7 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 56) to <8 x i8>*), align 1, !tbaa !7
  %36 = zext <8 x i8> %wide.load12.7 to <8 x i16>
  %37 = mul <8 x i16> %36, %wide.load.7
  %38 = bitcast i16* %34 to <8 x i16>*
  store <8 x i16> %37, <8 x i16>* %38, align 2, !tbaa !8
  br label %middle.block

middle.block:                                     ; preds = %vector.body, %entry
  %resume.val = phi i1 [ false, %entry ], [ true, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %entry ], [ 64, %vector.body ]
  br i1 %resume.val, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ %trunc.resume.val, %for.body.preheader ]
  %add.ptr = getelementptr inbounds i16, i16* %data, i32 %i.09
  %39 = load i16, i16* %add.ptr, align 2, !tbaa !8
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 %i.09
  %40 = load i8, i8* %arrayidx, align 1, !tbaa !7
  %conv1 = zext i8 %40 to i16
  %mul = mul i16 %conv1, %39
  store i16 %mul, i16* %add.ptr, align 2, !tbaa !8
  %inc = add nuw nsw i32 %i.09, 1
  %exitcond = icmp eq i32 %inc, 64
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !10

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %value = alloca i32, align 4
  store i32 0, i32* @lastlong, align 4, !tbaa !1
  store i32 0, i32* @bitsleft, align 4, !tbaa !1
  store i32* getelementptr inbounds ([601 x i32], [601 x i32]* @huffbits, i32 0, i32 0), i32** @nextlong, align 4, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %prev.0143 = phi i32 [ 0, %entry ], [ %conv5, %for.body ]
  %i.0142 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  call void @huff_dc_dec(i32* %value)
  %0 = load i32, i32* %value, align 4, !tbaa !1
  %add = add nsw i32 %0, %prev.0143
  %conv = trunc i32 %add to i16
  %mul1 = shl nsw i32 %i.0142, 6
  %arrayidx = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul1
  store i16 %conv, i16* %arrayidx, align 2, !tbaa !8
  %sext = shl i32 %add, 16
  %conv5 = ashr exact i32 %sext, 16
  %inc = add nuw nsw i32 %i.0142, 1
  %exitcond146 = icmp eq i32 %inc, 600
  br i1 %exitcond146, label %for.body9.preheader, label %for.body

for.body9.preheader:                              ; preds = %for.body
  br label %for.body9

for.body9:                                        ; preds = %for.body9.preheader, %for.body9
  %i.1141 = phi i32 [ %inc13, %for.body9 ], [ 0, %for.body9.preheader ]
  %mul10 = shl nsw i32 %i.1141, 6
  %arrayidx11 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul10
  tail call void @huff_ac_dec(i16* %arrayidx11)
  %inc13 = add nuw nsw i32 %i.1141, 1
  %exitcond145 = icmp eq i32 %inc13, 600
  br i1 %exitcond145, label %for.body18.preheader, label %for.body9

for.body18.preheader:                             ; preds = %for.body9
  %wide.load158 = load <8 x i8>, <8 x i8>* bitcast ([64 x i8]* @qtbl_lum to <8 x i8>*), align 1, !tbaa !7
  %1 = zext <8 x i8> %wide.load158 to <8 x i16>
  %wide.load158.1 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 8) to <8 x i8>*), align 1, !tbaa !7
  %2 = zext <8 x i8> %wide.load158.1 to <8 x i16>
  %wide.load158.2 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 16) to <8 x i8>*), align 1, !tbaa !7
  %3 = zext <8 x i8> %wide.load158.2 to <8 x i16>
  %wide.load158.3 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 24) to <8 x i8>*), align 1, !tbaa !7
  %4 = zext <8 x i8> %wide.load158.3 to <8 x i16>
  %wide.load158.4 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 32) to <8 x i8>*), align 1, !tbaa !7
  %5 = zext <8 x i8> %wide.load158.4 to <8 x i16>
  %wide.load158.5 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 40) to <8 x i8>*), align 1, !tbaa !7
  %6 = zext <8 x i8> %wide.load158.5 to <8 x i16>
  %wide.load158.6 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 48) to <8 x i8>*), align 1, !tbaa !7
  %7 = zext <8 x i8> %wide.load158.6 to <8 x i16>
  %wide.load158.7 = load <8 x i8>, <8 x i8>* bitcast (i8* getelementptr inbounds ([64 x i8], [64 x i8]* @qtbl_lum, i32 0, i32 56) to <8 x i8>*), align 1, !tbaa !7
  %8 = zext <8 x i8> %wide.load158.7 to <8 x i16>
  br label %for.body18

for.body18:                                       ; preds = %for.body18.preheader, %vector.body
  %i.2140 = phi i32 [ %inc21, %vector.body ], [ 0, %for.body18.preheader ]
  %mul19 = shl i32 %i.2140, 6
  br label %vector.body

vector.body:                                      ; preds = %for.body18
  %9 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul19
  %10 = bitcast i16* %9 to <8 x i16>*
  %wide.load = load <8 x i16>, <8 x i16>* %10, align 2, !tbaa !8
  %11 = mul <8 x i16> %1, %wide.load
  %12 = bitcast i16* %9 to <8 x i16>*
  store <8 x i16> %11, <8 x i16>* %12, align 2, !tbaa !8
  %13 = add i32 8, %mul19
  %14 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %13
  %15 = bitcast i16* %14 to <8 x i16>*
  %wide.load.1 = load <8 x i16>, <8 x i16>* %15, align 2, !tbaa !8
  %16 = mul <8 x i16> %2, %wide.load.1
  %17 = bitcast i16* %14 to <8 x i16>*
  store <8 x i16> %16, <8 x i16>* %17, align 2, !tbaa !8
  %18 = add i32 16, %mul19
  %19 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %18
  %20 = bitcast i16* %19 to <8 x i16>*
  %wide.load.2 = load <8 x i16>, <8 x i16>* %20, align 2, !tbaa !8
  %21 = mul <8 x i16> %3, %wide.load.2
  %22 = bitcast i16* %19 to <8 x i16>*
  store <8 x i16> %21, <8 x i16>* %22, align 2, !tbaa !8
  %23 = add i32 24, %mul19
  %24 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %23
  %25 = bitcast i16* %24 to <8 x i16>*
  %wide.load.3 = load <8 x i16>, <8 x i16>* %25, align 2, !tbaa !8
  %26 = mul <8 x i16> %4, %wide.load.3
  %27 = bitcast i16* %24 to <8 x i16>*
  store <8 x i16> %26, <8 x i16>* %27, align 2, !tbaa !8
  %28 = add i32 32, %mul19
  %29 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %28
  %30 = bitcast i16* %29 to <8 x i16>*
  %wide.load.4 = load <8 x i16>, <8 x i16>* %30, align 2, !tbaa !8
  %31 = mul <8 x i16> %5, %wide.load.4
  %32 = bitcast i16* %29 to <8 x i16>*
  store <8 x i16> %31, <8 x i16>* %32, align 2, !tbaa !8
  %33 = add i32 40, %mul19
  %34 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %33
  %35 = bitcast i16* %34 to <8 x i16>*
  %wide.load.5 = load <8 x i16>, <8 x i16>* %35, align 2, !tbaa !8
  %36 = mul <8 x i16> %6, %wide.load.5
  %37 = bitcast i16* %34 to <8 x i16>*
  store <8 x i16> %36, <8 x i16>* %37, align 2, !tbaa !8
  %38 = add i32 48, %mul19
  %39 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %38
  %40 = bitcast i16* %39 to <8 x i16>*
  %wide.load.6 = load <8 x i16>, <8 x i16>* %40, align 2, !tbaa !8
  %41 = mul <8 x i16> %7, %wide.load.6
  %42 = bitcast i16* %39 to <8 x i16>*
  store <8 x i16> %41, <8 x i16>* %42, align 2, !tbaa !8
  %43 = add i32 56, %mul19
  %44 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %43
  %45 = bitcast i16* %44 to <8 x i16>*
  %wide.load.7 = load <8 x i16>, <8 x i16>* %45, align 2, !tbaa !8
  %46 = mul <8 x i16> %8, %wide.load.7
  %47 = bitcast i16* %44 to <8 x i16>*
  store <8 x i16> %46, <8 x i16>* %47, align 2, !tbaa !8
  %inc21 = add nuw nsw i32 %i.2140, 1
  %exitcond144 = icmp eq i32 %inc21, 600
  br i1 %exitcond144, label %for.body26.preheader, label %for.body18

for.body26.preheader:                             ; preds = %vector.body
  br label %for.body26

for.cond32.preheader:                             ; preds = %for.body26
  %48 = load i32, i32* @ncols, align 4, !tbaa !1
  %cmp4299 = icmp sgt i32 %48, 0
  %mul41 = shl i32 %48, 3
  br i1 %cmp4299, label %for.cond36.preheader.split.us.us.preheader, label %for.inc65.preheader

for.inc65.preheader:                              ; preds = %for.cond32.preheader
  br label %for.inc65

for.cond36.preheader.split.us.us.preheader:       ; preds = %for.cond32.preheader
  br label %for.cond36.preheader.split.us.us

for.inc65.us:                                     ; preds = %for.inc62.us.us
  %add55.us.us.7.lcssa.lcssa = phi i32 [ %add55.us.us.7.lcssa, %for.inc62.us.us ]
  %add67.us = add nsw i32 %mul41, %i.4104.us
  %cmp33.us = icmp slt i32 %add67.us, 38400
  br i1 %cmp33.us, label %for.cond36.preheader.split.us.us, label %for.end68

for.inc62.us.us:                                  ; preds = %for.cond45.preheader.us.us
  %add55.us.us.7.lcssa = phi i32 [ %add55.us.us.7, %for.cond45.preheader.us.us ]
  %add63.us.us = add nuw nsw i32 %j.0102.us.us, 8
  %cmp37.us.us = icmp slt i32 %add63.us.us, 64
  br i1 %cmp37.us.us, label %for.cond45.preheader.lr.ph.us.us, label %for.inc65.us

for.cond45.preheader.lr.ph.us.us:                 ; preds = %for.inc62.us.us, %for.cond36.preheader.split.us.us
  %sum.1103.us.us = phi i32 [ %sum.0106.us, %for.cond36.preheader.split.us.us ], [ %add55.us.us.7.lcssa, %for.inc62.us.us ]
  %j.0102.us.us = phi i32 [ 0, %for.cond36.preheader.split.us.us ], [ %add63.us.us, %for.inc62.us.us ]
  %add49.us.us = add i32 %j.0102.us.us, %i.4104.us
  br label %for.cond45.preheader.us.us

for.cond45.preheader.us.us:                       ; preds = %for.cond45.preheader.us.us, %for.cond45.preheader.lr.ph.us.us
  %sum.2101.us.us = phi i32 [ %sum.1103.us.us, %for.cond45.preheader.lr.ph.us.us ], [ %add55.us.us.7, %for.cond45.preheader.us.us ]
  %k.0100.us.us = phi i32 [ 0, %for.cond45.preheader.lr.ph.us.us ], [ %add60.us.us, %for.cond45.preheader.us.us ]
  %add50.us.us = add i32 %add49.us.us, %k.0100.us.us
  %arrayidx52.us.us = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add50.us.us
  %49 = load i16, i16* %arrayidx52.us.us, align 2, !tbaa !8
  %conv53.us.us = sext i16 %49 to i32
  %add54.us.us = add i32 %sum.2101.us.us, 64
  %add55.us.us = add i32 %add54.us.us, %conv53.us.us
  %add51.us.us.1148 = or i32 %add50.us.us, 1
  %arrayidx52.us.us.1 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.1148
  %50 = load i16, i16* %arrayidx52.us.us.1, align 2, !tbaa !8
  %conv53.us.us.1 = sext i16 %50 to i32
  %add54.us.us.1 = add i32 %add55.us.us, 64
  %add55.us.us.1 = add i32 %add54.us.us.1, %conv53.us.us.1
  %add51.us.us.2149 = or i32 %add50.us.us, 2
  %arrayidx52.us.us.2 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.2149
  %51 = load i16, i16* %arrayidx52.us.us.2, align 2, !tbaa !8
  %conv53.us.us.2 = sext i16 %51 to i32
  %add54.us.us.2 = add i32 %add55.us.us.1, 64
  %add55.us.us.2 = add i32 %add54.us.us.2, %conv53.us.us.2
  %add51.us.us.3150 = or i32 %add50.us.us, 3
  %arrayidx52.us.us.3 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.3150
  %52 = load i16, i16* %arrayidx52.us.us.3, align 2, !tbaa !8
  %conv53.us.us.3 = sext i16 %52 to i32
  %add54.us.us.3 = add i32 %add55.us.us.2, 64
  %add55.us.us.3 = add i32 %add54.us.us.3, %conv53.us.us.3
  %add51.us.us.4151 = or i32 %add50.us.us, 4
  %arrayidx52.us.us.4 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.4151
  %53 = load i16, i16* %arrayidx52.us.us.4, align 2, !tbaa !8
  %conv53.us.us.4 = sext i16 %53 to i32
  %add54.us.us.4 = add i32 %add55.us.us.3, 64
  %add55.us.us.4 = add i32 %add54.us.us.4, %conv53.us.us.4
  %add51.us.us.5152 = or i32 %add50.us.us, 5
  %arrayidx52.us.us.5 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.5152
  %54 = load i16, i16* %arrayidx52.us.us.5, align 2, !tbaa !8
  %conv53.us.us.5 = sext i16 %54 to i32
  %add54.us.us.5 = add i32 %add55.us.us.4, 64
  %add55.us.us.5 = add i32 %add54.us.us.5, %conv53.us.us.5
  %add51.us.us.6153 = or i32 %add50.us.us, 6
  %arrayidx52.us.us.6 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.6153
  %55 = load i16, i16* %arrayidx52.us.us.6, align 2, !tbaa !8
  %conv53.us.us.6 = sext i16 %55 to i32
  %add54.us.us.6 = add i32 %add55.us.us.5, 64
  %add55.us.us.6 = add i32 %add54.us.us.6, %conv53.us.us.6
  %add51.us.us.7154 = or i32 %add50.us.us, 7
  %arrayidx52.us.us.7 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %add51.us.us.7154
  %56 = load i16, i16* %arrayidx52.us.us.7, align 2, !tbaa !8
  %conv53.us.us.7 = sext i16 %56 to i32
  %add54.us.us.7 = add i32 %add55.us.us.6, 64
  %add55.us.us.7 = add i32 %add54.us.us.7, %conv53.us.us.7
  %add60.us.us = add nuw nsw i32 %k.0100.us.us, 64
  %cmp42.us.us = icmp slt i32 %add60.us.us, %mul41
  br i1 %cmp42.us.us, label %for.cond45.preheader.us.us, label %for.inc62.us.us

for.cond36.preheader.split.us.us:                 ; preds = %for.cond36.preheader.split.us.us.preheader, %for.inc65.us
  %sum.0106.us = phi i32 [ %add55.us.us.7.lcssa.lcssa, %for.inc65.us ], [ 0, %for.cond36.preheader.split.us.us.preheader ]
  %i.4104.us = phi i32 [ %add67.us, %for.inc65.us ], [ 0, %for.cond36.preheader.split.us.us.preheader ]
  br label %for.cond45.preheader.lr.ph.us.us

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %i.3139 = phi i32 [ %inc30, %for.body26 ], [ 0, %for.body26.preheader ]
  %mul27 = shl nsw i32 %i.3139, 6
  %add.ptr28 = getelementptr inbounds [38400 x i16], [38400 x i16]* @dct_data, i32 0, i32 %mul27
  tail call void @j_rev_dct(i16* %add.ptr28)
  %inc30 = add nuw nsw i32 %i.3139, 1
  %exitcond = icmp eq i32 %inc30, 600
  br i1 %exitcond, label %for.cond32.preheader, label %for.body26

for.inc65:                                        ; preds = %for.inc65.preheader, %for.inc65
  %i.4104 = phi i32 [ %add67, %for.inc65 ], [ 0, %for.inc65.preheader ]
  %add67 = add nsw i32 %mul41, %i.4104
  %cmp33 = icmp slt i32 %add67, 38400
  br i1 %cmp33, label %for.inc65, label %if.then.loopexit

for.end68:                                        ; preds = %for.inc65.us
  %add55.us.us.7.lcssa.lcssa.lcssa = phi i32 [ %add55.us.us.7.lcssa.lcssa, %for.inc65.us ]
  %cmp69 = icmp eq i32 %add55.us.us.7.lcssa.lcssa.lcssa, 2598822
  br i1 %cmp69, label %if.else, label %if.then

if.then.loopexit:                                 ; preds = %for.inc65
  br label %if.then

if.then:                                          ; preds = %if.then.loopexit, %for.end68
  %puts95 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

if.else:                                          ; preds = %for.end68
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ 15, %if.then ], [ 66, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!3, !3, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"short", !3, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}

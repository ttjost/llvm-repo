; ModuleID = 'rng.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.cmrg_state = type { i32, i32, i32, i32, i32, i32 }

@output_ref1 = global [500 x i32] [i32 964358945, i32 1687553058, i32 1133544872, i32 483368621, i32 1930585158, i32 698768346, i32 865721962, i32 1873721473, i32 298296029, i32 655454356, i32 2057901106, i32 1990839461, i32 33820472, i32 1366546749, i32 1562078405, i32 1961972811, i32 2032082729, i32 299798550, i32 40534506, i32 1510581586, i32 832449880, i32 483937119, i32 1613023061, i32 556359194, i32 907132839, i32 946215374, i32 1916315452, i32 103523352, i32 1803970007, i32 1827010459, i32 1309093000, i32 1093565421, i32 580175724, i32 229717736, i32 1182360473, i32 2119638938, i32 548534161, i32 297083690, i32 1703107377, i32 638701786, i32 502126394, i32 1948187840, i32 1266904428, i32 1777440463, i32 559388249, i32 1356531981, i32 756369411, i32 1719164695, i32 1459618765, i32 1062019108, i32 689909716, i32 2056272146, i32 106911207, i32 1504628398, i32 248488631, i32 358708440, i32 13282960, i32 1897982737, i32 1177770087, i32 646886354, i32 1678273845, i32 2137269953, i32 1900760280, i32 120671059, i32 1461847628, i32 784143663, i32 152289653, i32 1680947520, i32 964302130, i32 854660051, i32 760164626, i32 303515762, i32 2095132620, i32 1485258749, i32 412187601, i32 6946747, i32 824844167, i32 507587179, i32 1300696566, i32 1927814034, i32 2005215500, i32 474546183, i32 244049200, i32 590925555, i32 461387830, i32 794671555, i32 804739284, i32 690259609, i32 127186162, i32 1113069757, i32 21513353, i32 606816825, i32 2019317228, i32 1258838166, i32 1591385558, i32 436647027, i32 782937532, i32 1327371399, i32 1667371581, i32 627404749, i32 846700534, i32 1141855238, i32 651996000, i32 28728622, i32 209979715, i32 194505407, i32 1674669775, i32 312231145, i32 1451240494, i32 1646436149, i32 655849165, i32 1883811589, i32 2083619068, i32 1760832092, i32 1924885115, i32 47527934, i32 1581644745, i32 1729214957, i32 772501092, i32 752563490, i32 1033617733, i32 302794974, i32 529012588, i32 1435532332, i32 320902091, i32 1819125654, i32 371464137, i32 1580935759, i32 2031915971, i32 2090802727, i32 820132072, i32 884739305, i32 847501384, i32 1195712481, i32 2041349808, i32 102291517, i32 588095208, i32 1520354421, i32 109702764, i32 1146240277, i32 889137028, i32 1077619913, i32 636087486, i32 89523226, i32 274096892, i32 640372132, i32 1828535541, i32 151083761, i32 1164667070, i32 326415198, i32 2016236495, i32 122671481, i32 980989452, i32 463727538, i32 2062331822, i32 1249040880, i32 1308996533, i32 1485215682, i32 1346573409, i32 911394097, i32 75297585, i32 1583440698, i32 1235928310, i32 2121597073, i32 495772277, i32 1423981379, i32 1851677171, i32 1093407966, i32 1081626139, i32 356908111, i32 1214959301, i32 908235269, i32 342740368, i32 335525849, i32 997175261, i32 809721296, i32 45167367, i32 1188168814, i32 542418104, i32 243519895, i32 1456058625, i32 135034444, i32 489442935, i32 747109790, i32 1546747631, i32 1981849469, i32 1704329455, i32 649469817, i32 772098077, i32 676281821, i32 2101939151, i32 1797916325, i32 1878033285, i32 1033520702, i32 354776201, i32 677206779, i32 87366690, i32 642550899, i32 1710578019, i32 1978968242, i32 1790743375, i32 92533181, i32 1587219351, i32 383319154, i32 2132205334, i32 551833064, i32 1139992623, i32 1356879978, i32 1254985662, i32 1697712119, i32 984776965, i32 114137618, i32 1683033659, i32 2126779680, i32 513389423, i32 639532914, i32 687770212, i32 567728397, i32 1976339795, i32 892241998, i32 764459624, i32 1961821200, i32 1859442254, i32 401973249, i32 430893120, i32 1171575615, i32 468399993, i32 740018542, i32 407702049, i32 34869087, i32 1230195028, i32 1333266256, i32 1437404805, i32 1397960654, i32 1136813811, i32 411666006, i32 570850435, i32 632973735, i32 1051693126, i32 2122800755, i32 124570724, i32 398899971, i32 1445928226, i32 1973120964, i32 2142955627, i32 1401897592, i32 83367172, i32 840162320, i32 1771958982, i32 677290333, i32 1743885355, i32 593316903, i32 1729162540, i32 95137643, i32 1435959676, i32 1704316205, i32 1870850859, i32 1653932141, i32 80317998, i32 599928896, i32 123553942, i32 2098902480, i32 1379238845, i32 672899197, i32 990584796, i32 1816928533, i32 496083615, i32 2099835326, i32 64081404, i32 1302892482, i32 756382917, i32 116684225, i32 1628528472, i32 697475072, i32 2027891521, i32 860304214, i32 810242323, i32 518645994, i32 1979926463, i32 1151681876, i32 1291553071, i32 948111737, i32 603176386, i32 301701766, i32 996580448, i32 1759973200, i32 813319056, i32 601026148, i32 1580245728, i32 1506289135, i32 951802823, i32 164615204, i32 2016326065, i32 1945738918, i32 1514257305, i32 755983756, i32 1166903623, i32 630919618, i32 1082607004, i32 274064313, i32 526187876, i32 1900189053, i32 621448232, i32 1834431782, i32 1749724001, i32 1203895770, i32 790761133, i32 769585859, i32 1900080784, i32 2083022096, i32 764069961, i32 1974743239, i32 1609029419, i32 690447641, i32 1270850575, i32 9668991, i32 889856325, i32 1611462470, i32 656932163, i32 1811151309, i32 1128888759, i32 1933003043, i32 1404212728, i32 1073144499, i32 1131421860, i32 2033891120, i32 6862884, i32 1880137573, i32 1107248519, i32 451776987, i32 412370137, i32 412860715, i32 1355384581, i32 934925837, i32 601273828, i32 581408457, i32 346918859, i32 1439238448, i32 1579034160, i32 814508158, i32 593267485, i32 40367349, i32 1452578961, i32 924381442, i32 1726408989, i32 241498504, i32 155544733, i32 2115122568, i32 1752375652, i32 1951320571, i32 77699458, i32 35402730, i32 373187480, i32 1387696088, i32 1330706918, i32 1191333379, i32 300907659, i32 2101361863, i32 2108459258, i32 843514701, i32 1009581473, i32 914976492, i32 2003087715, i32 63930817, i32 533186068, i32 1891604791, i32 118371736, i32 2100025437, i32 184125301, i32 806035210, i32 1542128881, i32 1521630620, i32 1081261826, i32 1504837257, i32 26801196, i32 1722962148, i32 528122137, i32 2090964581, i32 1727439985, i32 250589180, i32 1203218798, i32 1286340584, i32 1428468506, i32 64235587, i32 1444594570, i32 874879200, i32 1556362413, i32 970208443, i32 387766393, i32 468140548, i32 1535190434, i32 137232796, i32 204351497, i32 249880945, i32 983958010, i32 835180576, i32 1910024929, i32 1227649184, i32 66185117, i32 1899773184, i32 1421901430, i32 1289606410, i32 1100916596, i32 962889962, i32 696875279, i32 100409280, i32 1072154334, i32 988717590, i32 347161783, i32 1836446650, i32 1866575756, i32 15763990, i32 1614305873, i32 1129812566, i32 808530383, i32 1557121492, i32 531058200, i32 992202536, i32 731662407, i32 1233590361, i32 1916003508, i32 1805123697, i32 219665615, i32 1431616065, i32 586614413, i32 306552815, i32 1000629321, i32 1147129326, i32 342902172, i32 1672181891, i32 1288445444, i32 1129144957, i32 874754941, i32 1887073149, i32 818658162, i32 795825649, i32 40137114, i32 523594605, i32 129379701, i32 1381283870, i32 44170140, i32 750581650, i32 985058111, i32 904026771, i32 1525206595, i32 1481106085, i32 155330201, i32 768924640, i32 1066859412, i32 1905452039, i32 663766324, i32 1228461230, i32 84691925, i32 539657003, i32 1181319869, i32 1273096005, i32 1336891048, i32 469514589, i32 48902359, i32 418269493, i32 1176214554, i32 422859772, i32 1342221713, i32 68900386, i32 1371494186, i32 1584064328, i32 898919139, i32 2028382000, i32 37524176, i32 1879569752, i32 1367969176, i32 815031544, i32 319731725, i32 2144168763, i32 1917600614, i32 72359894, i32 813795334, i32 245609404, i32 472499659, i32 1500680566, i32 1140867383, i32 27724078, i32 1926075844, i32 1616866598, i32 1257847219, i32 1578404345, i32 884325034, i32 96156762, i32 940156364, i32 1065733908, i32 1640232903, i32 2084646660, i32 1624352338, i32 1680795642, i32 1815466806, i32 1021923454, i32 158457939, i32 1985446531, i32 1902032048, i32 1051269948], align 4
@g = common global %struct.cmrg_state zeroinitializer, align 4
@.str = private unnamed_addr constant [13 x i8] c"result %lu, \00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %result = alloca [500 x i32], align 4
  %0 = bitcast [500 x i32]* %result to i8*
  call void @llvm.lifetime.start(i64 2000, i8* %0) #1
  store i32 -1155484576, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 0), align 4, !tbaa !1
  store i32 -723955400, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 1), align 4, !tbaa !6
  store i32 1033096058, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 2), align 4, !tbaa !7
  store i32 -1690734402, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 3), align 4, !tbaa !8
  store i32 -1557280266, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 4), align 4, !tbaa !9
  store i32 1327362106, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 5), align 4, !tbaa !10
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body
  %storemerge.i.lcssa = phi i32 [ %storemerge.i, %for.body ]
  %add25.sub19.i.lcssa = phi i32 [ %add25.sub19.i, %for.body ]
  %.lcssa49 = phi i32 [ %2, %for.body ]
  %add25.sub19.i33.lcssa = phi i32 [ %add25.sub19.i33, %for.body ]
  %storemerge.i37.lcssa = phi i32 [ %storemerge.i37, %for.body ]
  %storemerge.i3739.lcssa = phi i32 [ %storemerge.i3739, %for.body ]
  store i32 %.lcssa49, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 0), align 4, !tbaa !1
  store i32 %add25.sub19.i33.lcssa, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 1), align 4, !tbaa !6
  store i32 %add25.sub19.i.lcssa, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 2), align 4, !tbaa !7
  store i32 %storemerge.i3739.lcssa, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 3), align 4, !tbaa !8
  store i32 %storemerge.i.lcssa, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 5), align 4, !tbaa !10
  store i32 %storemerge.i37.lcssa, i32* getelementptr inbounds (%struct.cmrg_state, %struct.cmrg_state* @g, i32 0, i32 4), align 4, !tbaa !9
  br label %for.body3

for.body:                                         ; preds = %for.body, %entry
  %storemerge.i3739 = phi i32 [ -1557280266, %entry ], [ %storemerge.i37, %for.body ]
  %storemerge.i37 = phi i32 [ 1327362106, %entry ], [ %storemerge.i, %for.body ]
  %1 = phi i32 [ -1690734402, %entry ], [ %storemerge.i3739, %for.body ]
  %add25.sub19.i33 = phi i32 [ 1033096058, %entry ], [ %add25.sub19.i, %for.body ]
  %2 = phi i32 [ -723955400, %entry ], [ %add25.sub19.i33, %for.body ]
  %3 = phi i32 [ -1155484576, %entry ], [ %2, %for.body ]
  %i.028 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %div.i = sdiv i32 %3, 11714
  %4 = mul i32 %div.i, -11714
  %sub116.i19 = add i32 %3, %4
  %mul2.i = mul nsw i32 %sub116.i19, 183326
  %5 = mul nsw i32 %div.i, -2883
  %sub4117.i20 = add i32 %mul2.i, %5
  %div5.i = sdiv i32 %2, 33921
  %6 = mul i32 %div5.i, -33921
  %sub8118.i21 = add i32 %2, %6
  %mul9.i = mul nsw i32 %sub8118.i21, 63308
  %7 = mul nsw i32 %div5.i, -12979
  %sub11119.i22 = add i32 %mul9.i, %7
  %cmp.i = icmp slt i32 %sub4117.i20, 0
  %add.i = add i32 %sub4117.i20, 2147483647
  %add.sub4.i = select i1 %cmp.i, i32 %add.i, i32 %sub4117.i20
  %cmp12.i = icmp slt i32 %sub11119.i22, 0
  %add14.i = add i32 %sub11119.i22, 2147483647
  %p12.0.i = select i1 %cmp12.i, i32 %add14.i, i32 %sub11119.i22
  %sub19.i = sub nsw i32 %p12.0.i, %add.sub4.i
  %cmp22.i = icmp slt i32 %sub19.i, 0
  %add25.i = add i32 %sub19.i, 2147483647
  %add25.sub19.i = select i1 %cmp22.i, i32 %add25.i, i32 %sub19.i
  %div28.i = sdiv i32 %1, 3976
  %8 = mul i32 %div28.i, -3976
  %sub31120.i23 = add i32 %1, %8
  %mul32.i = mul nsw i32 %sub31120.i23, 539608
  %9 = mul i32 %div28.i, -2071
  %sub34121.i24 = add i32 %mul32.i, %9
  %div35.i = sdiv i32 %storemerge.i37, 24919
  %10 = mul i32 %div35.i, -24919
  %sub38122.i25 = add i32 %storemerge.i37, %10
  %mul39.i = mul nsw i32 %sub38122.i25, 86098
  %11 = mul nsw i32 %div35.i, -7417
  %sub41123.i26 = add i32 %mul39.i, %11
  %cmp42.i = icmp slt i32 %sub34121.i24, 0
  %add44.i = add nsw i32 %sub34121.i24, 2145483479
  %p23.0.i = select i1 %cmp42.i, i32 %add44.i, i32 %sub34121.i24
  %cmp46.i = icmp slt i32 %sub41123.i26, 0
  %add48.i = add i32 %sub41123.i26, 2145483479
  %add48.sub41.i = select i1 %cmp46.i, i32 %add48.i, i32 %sub41123.i26
  %sub53.i = sub nsw i32 %add48.sub41.i, %p23.0.i
  %cmp56.i = icmp slt i32 %sub53.i, 0
  %add59.i = add i32 %sub53.i, 2145483479
  %storemerge.i = select i1 %cmp56.i, i32 %add59.i, i32 %sub53.i
  %cmp64.i = icmp slt i32 %add25.sub19.i, %storemerge.i
  %sub68.i = sub nsw i32 %add25.sub19.i, %storemerge.i
  %add69.i = add i32 %sub68.i, 2147483647
  %retval.0.i = select i1 %cmp64.i, i32 %add69.i, i32 %sub68.i
  %arrayidx = getelementptr inbounds [500 x i32], [500 x i32]* %result, i32 0, i32 %i.028
  store i32 %retval.0.i, i32* %arrayidx, align 4, !tbaa !11
  %inc = add nuw nsw i32 %i.028, 1
  %exitcond = icmp eq i32 %inc, 500
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp slt i32 %inc10, 500
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1.preheader, %for.cond1
  %i.127 = phi i32 [ 0, %for.cond1.preheader ], [ %inc10, %for.cond1 ]
  %arrayidx4 = getelementptr inbounds [500 x i32], [500 x i32]* %result, i32 0, i32 %i.127
  %12 = load i32, i32* %arrayidx4, align 4, !tbaa !11
  %arrayidx5 = getelementptr inbounds [500 x i32], [500 x i32]* @output_ref1, i32 0, i32 %i.127
  %13 = load i32, i32* %arrayidx5, align 4, !tbaa !11
  %cmp6 = icmp eq i32 %12, %13
  %inc10 = add nuw nsw i32 %i.127, 1
  br i1 %cmp6, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.body3
  %.lcssa = phi i32 [ %12, %for.body3 ]
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %.lcssa) #1
  br label %cleanup

for.end11:                                        ; preds = %for.cond1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %cleanup

cleanup:                                          ; preds = %for.end11, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end11 ]
  call void @llvm.lifetime.end(i64 2000, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !3, i64 0}
!2 = !{!"cmrg_state", !3, i64 0, !3, i64 4, !3, i64 8, !3, i64 12, !3, i64 16, !3, i64 20}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!2, !3, i64 4}
!7 = !{!2, !3, i64 8}
!8 = !{!2, !3, i64 12}
!9 = !{!2, !3, i64 16}
!10 = !{!2, !3, i64 20}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !4, i64 0}

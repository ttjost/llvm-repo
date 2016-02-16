; ModuleID = 'fir.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@c = global [16 x i32] [i32 2, i32 4, i32 4, i32 2, i32 4, i32 2, i32 2, i32 4, i32 2, i32 4, i32 4, i32 2, i32 4, i32 2, i32 2, i32 4], align 4
@x = global [272 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -1155484576, i32 -723955400, i32 1033096058, i32 -1690734402, i32 -1557280266, i32 1327362106, i32 -1930858313, i32 502539523, i32 -1728529858, i32 -938301587, i32 1431162155, i32 1085665355, i32 1654374947, i32 -1661998771, i32 -65105105, i32 -73789608, i32 -518907128, i32 99135751, i32 -252332814, i32 755814641, i32 1180918287, i32 1344049776, i32 553609048, i32 1580443894, i32 629649304, i32 -1266264776, i32 99807007, i32 5955764, i32 -1946737912, i32 39620447, i32 -152527805, i32 -1877116806, i32 448784075, i32 1086124775, i32 -1609984092, i32 1227951724, i32 1764356251, i32 64111306, i32 -960731419, i32 -100082026, i32 -39845375, i32 -1339022546, i32 2092649110, i32 -568315836, i32 -1089884900, i32 -81839914, i32 -1146103148, i32 -1846688624, i32 -784703072, i32 55004124, i32 -691960657, i32 1770461755, i32 -2032810463, i32 -1177788003, i32 -432352882, i32 -65824064, i32 575267217, i32 -1949367821, i32 356750287, i32 798819494, i32 -92022521, i32 1318001577, i32 -1192467086, i32 -1412716779, i32 -1223932479, i32 276053035, i32 615126903, i32 1542603436, i32 1988388716, i32 1177882237, i32 19265476, i32 -1430871151, i32 307082914, i32 -1333570194, i32 1496453452, i32 -790542135, i32 1455004595, i32 -1690249972, i32 -604059026, i32 -290476856, i32 -122204761, i32 -1097539750, i32 -576617062, i32 -2002123957, i32 -1663951485, i32 193034304, i32 768747578, i32 1337360486, i32 934457803, i32 873612482, i32 -624972850, i32 355564760, i32 41547336, i32 1781447028, i32 -1321591463, i32 1081281446, i32 -982203381, i32 -222544851, i32 -1233998085, i32 -1331702554, i32 907249073, i32 206843130, i32 -931610657, i32 1697401307, i32 -234791961, i32 -996341162, i32 61144662, i32 -1638496702, i32 1693091376, i32 -1667947369, i32 -627963836, i32 105673451, i32 -918940699, i32 -300903254, i32 -28037702, i32 1358495114, i32 -502062723, i32 2056481282, i32 731396580, i32 617380302, i32 -162912754, i32 818693069, i32 -1184143835, i32 -410943565, i32 -1385753324, i32 1233308008, i32 -840115328, i32 -1474241772, i32 1895913584, i32 1376826901, i32 1984652857, i32 412901507, i32 -632101198, i32 2025024491, i32 -2139603013, i32 -1233011876, i32 -34604646, i32 -1854979571, i32 -131984708, i32 -1866233577, i32 1516579035, i32 1612513822, i32 203005342, i32 -911714850, i32 307621155, i32 13453556, i32 125015832, i32 483675743, i32 2077347671, i32 37011083, i32 -120473323, i32 2069609186, i32 -46741469, i32 1502566715, i32 -998828580, i32 -1206282339, i32 -2141482063, i32 -1550311379, i32 1097472880, i32 1449582151, i32 1327824311, i32 -1105846005, i32 -651630279, i32 -1174121238, i32 223701431, i32 810978550, i32 43703267, i32 835843581, i32 1519786882, i32 -772329283, i32 372536197, i32 -317962831, i32 -642907139, i32 -706495414, i32 15792134, i32 -1116133237, i32 1322391079, i32 -1231319713, i32 -2011725892, i32 1299386162, i32 -348690342, i32 1341976962, i32 1190607957, i32 -262501494, i32 -540039728, i32 -986836170, i32 -1675546118, i32 -1948015872, i32 -392391576, i32 638256747, i32 191085745, i32 -97160665, i32 -1517309270, i32 1375971382, i32 2133755906, i32 891811204, i32 -2118700536, i32 2110473668, i32 -2058625827, i32 861211557, i32 1573507430, i32 1625767564, i32 2051434938, i32 -1922104200, i32 -1271440420, i32 927536580, i32 1386277121, i32 1184911833, i32 50057146, i32 -185358571, i32 -1284027987, i32 -1025692308, i32 -1093701172, i32 -1116573039, i32 -1686684117, i32 2068400044, i32 1009668318, i32 -1847249948, i32 1670927751, i32 408998980, i32 -380240510, i32 1439774921, i32 718930634, i32 -1800042595, i32 16808464, i32 -1743967552, i32 1137718941, i32 252008887, i32 -460347667, i32 -1053605891, i32 1278046001, i32 947528252, i32 1842130704, i32 1599145891, i32 -1341955486, i32 1631478226, i32 1754478786, i32 -1370798799, i32 1516348954, i32 730123440, i32 -1409786204, i32 1491046204, i32 -1114899725, i32 -656053644, i32 -453397258, i32 -694901410, i32 -1804067552, i32 13393714, i32 -2101289195, i32 176533870, i32 1339899789, i32 -1511804464, i32 -1974699707, i32 -1660688399, i32 -115501757, i32 86156176], align 4
@y_ref = global [272 x i32] [i32 1983998144, i32 -1774881808, i32 -1156600492, i32 -160908028, i32 1069938876, i32 -593031208, i32 800580802, i32 1889808274, i32 -2086929984, i32 -881425036, i32 -1427893616, i32 -606182852, i32 -481847544, i32 271803794, i32 917382532, i32 851793868, i32 -1090370318, i32 -1147502036, i32 1464369876, i32 -2011081742, i32 -1684196762, i32 1155995158, i32 2101554326, i32 -168320710, i32 116511064, i32 729534344, i32 -47568092, i32 1290403922, i32 1732570274, i32 -1328582748, i32 -489088686, i32 1569794154, i32 -1171464876, i32 -104531016, i32 1571614010, i32 1477913470, i32 -362825234, i32 -454468750, i32 -1209149040, i32 1806425722, i32 -454215272, i32 356817696, i32 -2039610672, i32 988775842, i32 1282116484, i32 1960120828, i32 -1638512488, i32 -2014051156, i32 -1043176958, i32 -454120360, i32 -1116839212, i32 473486114, i32 -1288474144, i32 -736323078, i32 1086427908, i32 1795814540, i32 741582260, i32 -1530421186, i32 -1705694848, i32 49165494, i32 924599518, i32 432492658, i32 -2068177230, i32 424994804, i32 730812190, i32 -2111282694, i32 -1902706602, i32 376926040, i32 1163807628, i32 2144759986, i32 349926080, i32 174506234, i32 -1095316490, i32 -1451532548, i32 -199064044, i32 -1551813572, i32 1623974956, i32 -758473674, i32 886906762, i32 504418804, i32 1096275232, i32 -1684893996, i32 238139054, i32 2023123144, i32 -1513804734, i32 1767006904, i32 1695721118, i32 71935336, i32 2055378624, i32 -994673820, i32 1004557144, i32 1905946290, i32 1777903774, i32 541182528, i32 1862296284, i32 1090766374, i32 -1764960190, i32 1938704600, i32 -265860460, i32 -851153934, i32 -997135022, i32 988993302, i32 145059942, i32 -116029620, i32 78783570, i32 -234832500, i32 -690151394, i32 733713080, i32 -1083226722, i32 -332459078, i32 1343919248, i32 961661998, i32 1573974240, i32 -1506915800, i32 -497330964, i32 -646682252, i32 1712544784, i32 -1346234138, i32 -182049296, i32 1827786832, i32 1000654600, i32 -979103356, i32 -781660364, i32 1299124946, i32 -623910286, i32 -2133518946, i32 -94047134, i32 1013968778, i32 173894464, i32 1223160012, i32 285819514, i32 -2047437360, i32 250362316, i32 1563645738, i32 -1951911674, i32 301166068, i32 -1603074770, i32 1904052062, i32 -1311664272, i32 855713176, i32 -1370285468, i32 1771557120, i32 2066241066, i32 74268628, i32 -1785247822, i32 1485061846, i32 2086753292, i32 1632725402, i32 1131297740, i32 1864606960, i32 -1959981198, i32 -293219894, i32 128162058, i32 -1609673952, i32 77661078, i32 -1653029488, i32 -1949369136, i32 1310567164, i32 -1110826564, i32 -92548956, i32 -1339802984, i32 -2058298790, i32 -278552960, i32 1239064940, i32 1782844272, i32 1713043806, i32 2018595608, i32 -267128470, i32 -517967612, i32 902614248, i32 1914237574, i32 651211100, i32 -688124678, i32 -676303714, i32 1545163490, i32 364493176, i32 868199480, i32 1838222692, i32 1745291934, i32 -804241970, i32 -1571469828, i32 -405983368, i32 1245290934, i32 2045855326, i32 1735110490, i32 146108600, i32 753964804, i32 913337212, i32 -755350982, i32 -1327611154, i32 467368304, i32 -29747732, i32 605010134, i32 1445905924, i32 -1065200336, i32 -516848818, i32 -605324094, i32 -1311046076, i32 750761248, i32 -2138911180, i32 102017622, i32 -1642340700, i32 -1974372386, i32 98908794, i32 -619313188, i32 -1353007360, i32 -375801560, i32 72222088, i32 -1900400440, i32 1907070534, i32 1778192142, i32 1243085436, i32 -2062076650, i32 -1093459744, i32 668949290, i32 -1062729090, i32 1198320728, i32 -21243194, i32 -1827377168, i32 1171990778, i32 1456291124, i32 941610466, i32 548260336, i32 2081270756, i32 -1699112852, i32 -984501182, i32 140680454, i32 -1571786772, i32 424994878, i32 -1384970674, i32 2086892952, i32 -1553727288, i32 -1719848026, i32 -1324724964, i32 1581166078, i32 -212466308, i32 -1189857916, i32 -305209180, i32 -259065982, i32 220278914, i32 384968696, i32 -1130038792, i32 -1082050600, i32 796128290, i32 -462290032, i32 2049450408, i32 -2049770938, i32 1573272232, i32 976908946, i32 -372883008, i32 79607006, i32 -315989348, i32 -623200206, i32 -1185833888, i32 -1352719932, i32 -2033598710, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@y = common global [272 x i32] zeroinitializer, align 4

; Function Attrs: nounwind
define void @fir_original(i32* nocapture readonly %x, i32* nocapture readonly %c, i32 %M1, i32 %N1, i32* nocapture %y) #0 {
entry:
  %y23 = bitcast i32* %y to i8*
  %cmp21 = icmp sgt i32 %M1, 0
  br i1 %cmp21, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp218 = icmp sgt i32 %N1, 0
  br i1 %cmp218, label %for.body3.lr.ph.us.preheader, label %for.cond1.preheader.lr.ph.for.cond1.preheader.lr.ph.split_crit_edge

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %backedge.overflow = icmp eq i32 %N1, 0
  %n.vec = and i32 %N1, -8
  %cmp.zero = icmp eq i32 %n.vec, 0
  br label %for.body3.lr.ph.us

for.cond1.preheader.lr.ph.for.cond1.preheader.lr.ph.split_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %0 = shl i32 %M1, 2
  call void @llvm.memset.p0i8.i32(i8* %y23, i8 0, i32 %0, i32 4, i1 false)
  br label %for.end9

for.end.us.loopexit:                              ; preds = %for.body3.us
  %add5.us.lcssa45 = phi i32 [ %add5.us, %for.body3.us ]
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %middle.block
  %add5.us.lcssa = phi i32 [ %17, %middle.block ], [ %add5.us.lcssa45, %for.end.us.loopexit ]
  %arrayidx6.us = getelementptr inbounds i32, i32* %y, i32 %j.022.us
  store i32 %add5.us.lcssa, i32* %arrayidx6.us, align 4, !tbaa !1
  %inc8.us = add nuw nsw i32 %j.022.us, 1
  %exitcond24 = icmp eq i32 %inc8.us, %M1
  br i1 %exitcond24, label %for.end9.loopexit, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %output.020.us = phi i32 [ %add5.us, %for.body3.us ], [ %output.020.us.ph, %for.body3.us.preheader ]
  %i.019.us = phi i32 [ %inc.us, %for.body3.us ], [ %i.019.us.ph, %for.body3.us.preheader ]
  %arrayidx.us = getelementptr inbounds i32, i32* %c, i32 %i.019.us
  %1 = load i32, i32* %arrayidx.us, align 4, !tbaa !1
  %add.us = sub i32 %sub.us, %i.019.us
  %arrayidx4.us = getelementptr inbounds i32, i32* %x, i32 %add.us
  %2 = load i32, i32* %arrayidx4.us, align 4, !tbaa !1
  %mul.us = mul nsw i32 %2, %1
  %add5.us = add nsw i32 %mul.us, %output.020.us
  %inc.us = add nuw nsw i32 %i.019.us, 1
  %exitcond = icmp eq i32 %inc.us, %N1
  br i1 %exitcond, label %for.end.us.loopexit, label %for.body3.us, !llvm.loop !5

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.end.us
  %j.022.us = phi i32 [ %inc8.us, %for.end.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %sub.us = add i32 %j.022.us, %N1
  br i1 %backedge.overflow, label %for.body3.us.preheader, label %overflow.checked

for.body3.us.preheader:                           ; preds = %middle.block, %for.body3.lr.ph.us
  %output.020.us.ph = phi i32 [ 0, %for.body3.lr.ph.us ], [ %17, %middle.block ]
  %i.019.us.ph = phi i32 [ 0, %for.body3.lr.ph.us ], [ %resume.val, %middle.block ]
  br label %for.body3.us

overflow.checked:                                 ; preds = %for.body3.lr.ph.us
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %14, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %vec.phi25 = phi <4 x i32> [ %15, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %3 = getelementptr inbounds i32, i32* %c, i32 %index
  %4 = bitcast i32* %3 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %4, align 4, !tbaa !1
  %.sum39 = or i32 %index, 4
  %5 = getelementptr i32, i32* %c, i32 %.sum39
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load27 = load <4 x i32>, <4 x i32>* %6, align 4, !tbaa !1
  %7 = sub i32 %sub.us, %index
  %.sum = add i32 %7, -3
  %8 = getelementptr i32, i32* %x, i32 %.sum
  %9 = bitcast i32* %8 to <4 x i32>*
  %wide.load30 = load <4 x i32>, <4 x i32>* %9, align 4, !tbaa !1
  %reverse = shufflevector <4 x i32> %wide.load30, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %.sum41 = add i32 %7, -7
  %10 = getelementptr i32, i32* %x, i32 %.sum41
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load31 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !1
  %reverse32 = shufflevector <4 x i32> %wide.load31, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %12 = mul nsw <4 x i32> %reverse, %wide.load
  %13 = mul nsw <4 x i32> %reverse32, %wide.load27
  %14 = add nsw <4 x i32> %12, %vec.phi
  %15 = add nsw <4 x i32> %13, %vec.phi25
  %index.next = add i32 %index, 8
  %16 = icmp eq i32 %index.next, %n.vec
  br i1 %16, label %middle.block.loopexit, label %vector.body, !llvm.loop !9

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa44 = phi <4 x i32> [ %15, %vector.body ]
  %.lcssa = phi <4 x i32> [ %14, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.vec.exit.phi35 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa44, %middle.block.loopexit ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi35, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx36 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf37 = shufflevector <4 x i32> %bin.rdx36, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx38 = add <4 x i32> %bin.rdx36, %rdx.shuf37
  %17 = extractelement <4 x i32> %bin.rdx38, i32 0
  %cmp.n = icmp eq i32 %resume.val, %N1
  br i1 %cmp.n, label %for.end.us, label %for.body3.us.preheader

for.end9.loopexit:                                ; preds = %for.end.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %for.cond1.preheader.lr.ph.for.cond1.preheader.lr.ph.split_crit_edge, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %.pre = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 0), align 4, !tbaa !1
  %.pre9 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 1), align 4, !tbaa !1
  %.pre10 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 2), align 4, !tbaa !1
  %.pre11 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 3), align 4, !tbaa !1
  %.pre12 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 4), align 4, !tbaa !1
  %.pre13 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 5), align 4, !tbaa !1
  %.pre14 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 6), align 4, !tbaa !1
  %.pre15 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 7), align 4, !tbaa !1
  %.pre16 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 8), align 4, !tbaa !1
  %.pre17 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 9), align 4, !tbaa !1
  %.pre18 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 10), align 4, !tbaa !1
  %.pre19 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 11), align 4, !tbaa !1
  %.pre20 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 12), align 4, !tbaa !1
  %.pre21 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 13), align 4, !tbaa !1
  %.pre22 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 14), align 4, !tbaa !1
  %.pre23 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @c, i32 0, i32 15), align 4, !tbaa !1
  %broadcast.splatinsert26 = insertelement <4 x i32> undef, i32 %.pre, i32 0
  %broadcast.splat27 = shufflevector <4 x i32> %broadcast.splatinsert26, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert29 = insertelement <4 x i32> undef, i32 %.pre9, i32 0
  %broadcast.splat30 = shufflevector <4 x i32> %broadcast.splatinsert29, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert32 = insertelement <4 x i32> undef, i32 %.pre10, i32 0
  %broadcast.splat33 = shufflevector <4 x i32> %broadcast.splatinsert32, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert35 = insertelement <4 x i32> undef, i32 %.pre11, i32 0
  %broadcast.splat36 = shufflevector <4 x i32> %broadcast.splatinsert35, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert38 = insertelement <4 x i32> undef, i32 %.pre12, i32 0
  %broadcast.splat39 = shufflevector <4 x i32> %broadcast.splatinsert38, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert41 = insertelement <4 x i32> undef, i32 %.pre13, i32 0
  %broadcast.splat42 = shufflevector <4 x i32> %broadcast.splatinsert41, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert44 = insertelement <4 x i32> undef, i32 %.pre14, i32 0
  %broadcast.splat45 = shufflevector <4 x i32> %broadcast.splatinsert44, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <4 x i32> undef, i32 %.pre15, i32 0
  %broadcast.splat48 = shufflevector <4 x i32> %broadcast.splatinsert47, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert50 = insertelement <4 x i32> undef, i32 %.pre16, i32 0
  %broadcast.splat51 = shufflevector <4 x i32> %broadcast.splatinsert50, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert53 = insertelement <4 x i32> undef, i32 %.pre17, i32 0
  %broadcast.splat54 = shufflevector <4 x i32> %broadcast.splatinsert53, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <4 x i32> undef, i32 %.pre18, i32 0
  %broadcast.splat57 = shufflevector <4 x i32> %broadcast.splatinsert56, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <4 x i32> undef, i32 %.pre19, i32 0
  %broadcast.splat60 = shufflevector <4 x i32> %broadcast.splatinsert59, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert62 = insertelement <4 x i32> undef, i32 %.pre20, i32 0
  %broadcast.splat63 = shufflevector <4 x i32> %broadcast.splatinsert62, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert65 = insertelement <4 x i32> undef, i32 %.pre21, i32 0
  %broadcast.splat66 = shufflevector <4 x i32> %broadcast.splatinsert65, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <4 x i32> undef, i32 %.pre22, i32 0
  %broadcast.splat69 = shufflevector <4 x i32> %broadcast.splatinsert68, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <4 x i32> undef, i32 %.pre23, i32 0
  %broadcast.splat72 = shufflevector <4 x i32> %broadcast.splatinsert71, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i32 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = add i32 %index, 16
  %1 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %0
  %2 = bitcast i32* %1 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %2, align 4, !tbaa !1
  %3 = mul nsw <4 x i32> %wide.load, %broadcast.splat27
  %4 = add i32 %index, 15
  %5 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %4
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load28 = load <4 x i32>, <4 x i32>* %6, align 4, !tbaa !1
  %7 = mul nsw <4 x i32> %wide.load28, %broadcast.splat30
  %8 = add nsw <4 x i32> %7, %3
  %9 = add i32 %index, 14
  %10 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %9
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load31 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !1
  %12 = mul nsw <4 x i32> %wide.load31, %broadcast.splat33
  %13 = add nsw <4 x i32> %12, %8
  %14 = add i32 %index, 13
  %15 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %14
  %16 = bitcast i32* %15 to <4 x i32>*
  %wide.load34 = load <4 x i32>, <4 x i32>* %16, align 4, !tbaa !1
  %17 = mul nsw <4 x i32> %wide.load34, %broadcast.splat36
  %18 = add nsw <4 x i32> %17, %13
  %19 = add i32 %index, 12
  %20 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %19
  %21 = bitcast i32* %20 to <4 x i32>*
  %wide.load37 = load <4 x i32>, <4 x i32>* %21, align 4, !tbaa !1
  %22 = mul nsw <4 x i32> %wide.load37, %broadcast.splat39
  %23 = add nsw <4 x i32> %22, %18
  %24 = add i32 %index, 11
  %25 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %24
  %26 = bitcast i32* %25 to <4 x i32>*
  %wide.load40 = load <4 x i32>, <4 x i32>* %26, align 4, !tbaa !1
  %27 = mul nsw <4 x i32> %wide.load40, %broadcast.splat42
  %28 = add nsw <4 x i32> %27, %23
  %29 = add i32 %index, 10
  %30 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %29
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load43 = load <4 x i32>, <4 x i32>* %31, align 4, !tbaa !1
  %32 = mul nsw <4 x i32> %wide.load43, %broadcast.splat45
  %33 = add nsw <4 x i32> %32, %28
  %34 = add i32 %index, 9
  %35 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %34
  %36 = bitcast i32* %35 to <4 x i32>*
  %wide.load46 = load <4 x i32>, <4 x i32>* %36, align 4, !tbaa !1
  %37 = mul nsw <4 x i32> %wide.load46, %broadcast.splat48
  %38 = add nsw <4 x i32> %37, %33
  %39 = add i32 %index, 8
  %40 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %39
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load49 = load <4 x i32>, <4 x i32>* %41, align 4, !tbaa !1
  %42 = mul nsw <4 x i32> %wide.load49, %broadcast.splat51
  %43 = add nsw <4 x i32> %42, %38
  %44 = add i32 %index, 7
  %45 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %44
  %46 = bitcast i32* %45 to <4 x i32>*
  %wide.load52 = load <4 x i32>, <4 x i32>* %46, align 4, !tbaa !1
  %47 = mul nsw <4 x i32> %wide.load52, %broadcast.splat54
  %48 = add nsw <4 x i32> %47, %43
  %49 = add i32 %index, 6
  %50 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %49
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load55 = load <4 x i32>, <4 x i32>* %51, align 4, !tbaa !1
  %52 = mul nsw <4 x i32> %wide.load55, %broadcast.splat57
  %53 = add nsw <4 x i32> %52, %48
  %54 = add i32 %index, 5
  %55 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %54
  %56 = bitcast i32* %55 to <4 x i32>*
  %wide.load58 = load <4 x i32>, <4 x i32>* %56, align 4, !tbaa !1
  %57 = mul nsw <4 x i32> %wide.load58, %broadcast.splat60
  %58 = add nsw <4 x i32> %57, %53
  %59 = add i32 %index, 4
  %60 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %59
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load61 = load <4 x i32>, <4 x i32>* %61, align 4, !tbaa !1
  %62 = mul nsw <4 x i32> %wide.load61, %broadcast.splat63
  %63 = add nsw <4 x i32> %62, %58
  %64 = or i32 %index, 3
  %65 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %64
  %66 = bitcast i32* %65 to <4 x i32>*
  %wide.load64 = load <4 x i32>, <4 x i32>* %66, align 4, !tbaa !1
  %67 = mul nsw <4 x i32> %wide.load64, %broadcast.splat66
  %68 = add nsw <4 x i32> %67, %63
  %69 = or i32 %index, 2
  %70 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %69
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load67 = load <4 x i32>, <4 x i32>* %71, align 4, !tbaa !1
  %72 = mul nsw <4 x i32> %wide.load67, %broadcast.splat69
  %73 = add nsw <4 x i32> %72, %68
  %74 = or i32 %index, 1
  %75 = getelementptr inbounds [272 x i32], [272 x i32]* @x, i32 0, i32 %74
  %76 = bitcast i32* %75 to <4 x i32>*
  %wide.load70 = load <4 x i32>, <4 x i32>* %76, align 4, !tbaa !1
  %77 = mul nsw <4 x i32> %wide.load70, %broadcast.splat72
  %78 = add nsw <4 x i32> %77, %73
  %79 = getelementptr inbounds [272 x i32], [272 x i32]* @y, i32 0, i32 %index
  %80 = bitcast i32* %79 to <4 x i32>*
  store <4 x i32> %78, <4 x i32>* %80, align 4, !tbaa !1
  %index.next = add i32 %index, 4
  %81 = icmp eq i32 %index.next, 272
  br i1 %81, label %for.body.preheader, label %vector.body, !llvm.loop !10

for.body.preheader:                               ; preds = %vector.body
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.07 = phi i32 [ %inc, %for.inc ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [272 x i32], [272 x i32]* @y, i32 0, i32 %i.07
  %82 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx1 = getelementptr inbounds [272 x i32], [272 x i32]* @y_ref, i32 0, i32 %i.07
  %83 = load i32, i32* %arrayidx1, align 4, !tbaa !1
  %cmp2 = icmp eq i32 %82, %83
  br i1 %cmp2, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %i.07.lcssa = phi i32 [ %i.07, %for.body ]
  %add = add nsw i32 %i.07.lcssa, 10
  br label %return

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.07, 1
  %cmp = icmp slt i32 %inc, 256
  br i1 %cmp, label %for.body, label %return.loopexit

return.loopexit:                                  ; preds = %for.inc
  br label %return

return:                                           ; preds = %return.loopexit, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ -1, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !7, !8}
!6 = !{!"llvm.loop.unroll.runtime.disable"}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}

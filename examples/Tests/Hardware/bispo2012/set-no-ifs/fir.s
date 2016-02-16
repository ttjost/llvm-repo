.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-1056, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -1056
;;
	c0	stw 1052[$r0.1] = $r0.57
;;
	c0	stw 1048[$r0.1] = $l0.0
	c0	mov $r0.12 = x
;;
	c0	mov $r0.18 = c
	c0	ldw $r0.19 = 0[$r0.12]
	c0	add $r0.11 = $r0.1, 24
;;
	c0	mov $r0.16 = 0
	c0	ldw $r0.13 = 0[$r0.18]
	c0	add $r0.14 = $r0.11, 12
;;
;;
	c0	mpylu $r0.15 = $r0.19, $r0.13
	c0	mpyhs $r0.17 = $r0.19, $r0.13
;;
;;
	c0	add $r0.15 = $r0.15, $r0.17
;;
	c0	stw 24[$r0.1] = $r0.15
;;
	c0	ldw $r0.17 = 4[$r0.12]
;;
	c0	ldw $r0.15 = 4[$r0.18]
;;
	c0	mpyhs $r0.20 = $r0.17, $r0.13
	c0	mpylu $r0.21 = $r0.17, $r0.13
;;
	c0	mpylu $r0.22 = $r0.15, $r0.19
	c0	mpyhs $r0.23 = $r0.15, $r0.19
;;
	c0	add $r0.20 = $r0.21, $r0.20
;;
	c0	add $r0.21 = $r0.22, $r0.23
	c0	mpyhs $r0.22 = $r0.17, $r0.15
	c0	mpylu $r0.17 = $r0.17, $r0.15
;;
	c0	add $r0.20 = $r0.21, $r0.20
;;
	c0	add $r0.21 = $r0.17, $r0.22
	c0	stw 28[$r0.1] = $r0.20
;;
	c0	ldw $r0.20 = 8[$r0.12]
;;
	c0	ldw $r0.17 = 8[$r0.18]
;;
	c0	mpyhs $r0.22 = $r0.20, $r0.13
	c0	mpylu $r0.20 = $r0.20, $r0.13
;;
	c0	mpylu $r0.23 = $r0.19, $r0.17
	c0	mpyhs $r0.19 = $r0.19, $r0.17
;;
	c0	add $r0.20 = $r0.20, $r0.22
;;
	c0	add $r0.19 = $r0.23, $r0.19
	c0	add $r0.20 = $r0.21, $r0.20
;;
	c0	add $r0.19 = $r0.20, $r0.19
;;
	c0	stw 32[$r0.1] = $r0.19
;;
	c0	ldw $r0.18 = 12[$r0.18]
;;
LBB1_1::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.19 = $r0.12, $r0.16
;;
	c0	ldw $r0.20 = 24[$r0.19]
;;
	c0	ldw $r0.21 = 20[$r0.19]
;;
	c0	mpyhs $r0.22 = $r0.20, $r0.13
	c0	mpylu $r0.20 = $r0.20, $r0.13
;;
	c0	mpylu $r0.23 = $r0.21, $r0.13
	c0	mpyhs $r0.24 = $r0.21, $r0.13
;;
	c0	mpyhs $r0.25 = $r0.21, $r0.15
	c0	mpylu $r0.21 = $r0.21, $r0.15
	c0	ldw $r0.26 = 0[$r0.19]
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	add $r0.21 = $r0.21, $r0.25
	c0	mpyhs $r0.24 = $r0.26, $r0.18
	c0	add $r0.20 = $r0.20, $r0.22
	c0	mpylu $r0.22 = $r0.26, $r0.18
;;
	c0	ldw $r0.25 = 16[$r0.19]
;;
	c0	ldw $r0.26 = 4[$r0.19]
;;
	c0	mpylu $r0.27 = $r0.25, $r0.13
	c0	mpyhs $r0.28 = $r0.25, $r0.15
;;
	c0	mpylu $r0.29 = $r0.25, $r0.15
	c0	mpyhs $r0.30 = $r0.25, $r0.13
	c0	ldw $r0.31 = 8[$r0.19]
	c0	add $r0.20 = $r0.21, $r0.20
;;
;;
	c0	mpylu $r0.21 = $r0.31, $r0.15
	c0	mpyhs $r0.32 = $r0.31, $r0.15
	c0	add $r0.27 = $r0.27, $r0.30
	c0	add $r0.28 = $r0.29, $r0.28
;;
	c0	mpyhs $r0.29 = $r0.31, $r0.17
	c0	mpylu $r0.30 = $r0.25, $r0.17
;;
	c0	add $r0.21 = $r0.21, $r0.32
	c0	add $r0.23 = $r0.28, $r0.23
	c0	mpylu $r0.28 = $r0.31, $r0.17
	c0	mpyhs $r0.25 = $r0.25, $r0.17
;;
	c0	ldw $r0.19 = 12[$r0.19]
	c0	mpylu $r0.32 = $r0.26, $r0.17
;;
;;
	c0	mpylu $r0.33 = $r0.19, $r0.13
	c0	add $r0.28 = $r0.28, $r0.29
	c0	add $r0.25 = $r0.30, $r0.25
	c0	mpyhs $r0.29 = $r0.19, $r0.13
;;
	c0	mpylu $r0.30 = $r0.19, $r0.15
	c0	add $r0.22 = $r0.22, $r0.24
	c0	add $r0.20 = $r0.25, $r0.20
	c0	mpyhs $r0.24 = $r0.19, $r0.15
;;
	c0	mpylu $r0.25 = $r0.19, $r0.17
	c0	add $r0.29 = $r0.33, $r0.29
	c0	add $r0.33 = $r0.16, 16
	c0	mpyhs $r0.34 = $r0.26, $r0.17
;;
	c0	mpyhs $r0.35 = $r0.19, $r0.17
	c0	add $r0.24 = $r0.30, $r0.24
	c0	add $r0.21 = $r0.21, $r0.29
	c0	mpyhs $r0.29 = $r0.31, $r0.18
;;
	c0	mpyhs $r0.30 = $r0.26, $r0.18
	c0	add $r0.32 = $r0.32, $r0.34
	c0	add $r0.24 = $r0.24, $r0.27
	c0	mpylu $r0.26 = $r0.26, $r0.18
;;
	c0	mpylu $r0.27 = $r0.31, $r0.18
	c0	add $r0.25 = $r0.25, $r0.35
	c0	add $r0.24 = $r0.28, $r0.24
	c0	mpyhs $r0.28 = $r0.19, $r0.18
;;
	c0	mpylu $r0.19 = $r0.19, $r0.18
	c0	add $r0.23 = $r0.25, $r0.23
	c0	add $r0.21 = $r0.32, $r0.21
;;
;;
	c0	add $r0.19 = $r0.19, $r0.28
	c0	add $r0.25 = $r0.26, $r0.30
	c0	add $r0.26 = $r0.27, $r0.29
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	add $r0.22 = $r0.26, $r0.23
	c0	add $r0.23 = $r0.25, $r0.24
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	cmpne $b0.0 = $r0.33, 1008
	c0	add $r0.16 = $r0.14, $r0.16
;;
	c0	stw 12[$r0.16] = $r0.19
;;
	c0	stw 8[$r0.16] = $r0.22
;;
	c0	stw 4[$r0.16] = $r0.23
;;
	c0	stw 0[$r0.16] = $r0.21
	c0	mov $r0.16 = $r0.33
	c0	br $b0.0, LBB1_1
;;
## BB#2:                                ## %for.body24.lr.ph.us.i
	c0	ldw $r0.14 = 1016[$r0.12]
;;
	c0	ldw $r0.16 = 1020[$r0.12]
;;
	c0	mpyhs $r0.19 = $r0.14, $r0.15
	c0	mpylu $r0.14 = $r0.14, $r0.15
;;
	c0	mpyhs $r0.15 = $r0.16, $r0.13
	c0	mpylu $r0.13 = $r0.16, $r0.13
	c0	ldw $r0.16 = 1012[$r0.12]
;;
	c0	add $r0.14 = $r0.14, $r0.19
;;
	c0	mpylu $r0.19 = $r0.16, $r0.17
	c0	mpyhs $r0.16 = $r0.16, $r0.17
	c0	ldw $r0.12 = 1008[$r0.12]
;;
	c0	add $r0.13 = $r0.13, $r0.15
;;
	c0	add $r0.15 = $r0.19, $r0.16
	c0	mpyhs $r0.16 = $r0.12, $r0.18
	c0	mpylu $r0.12 = $r0.12, $r0.18
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.14 = $r0.15, $r0.13
;;
	c0	add $r0.15 = $r0.12, $r0.16
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = y_ref
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 1044[$r0.1] = $r0.14
;;
LBB1_3::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.14 = 0[$r0.13]
;;
	c0	ldw $r0.15 = 0[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.15, $r0.14
;;
;;
	c0	brf $b0.0, LBB1_4
;;
## BB#5:                                ## %for.inc
                                        ##   in Loop: Header=BB1_3 Depth=1
	c0	add $r0.12 = $r0.12, 1
	c0	add $r0.11 = $r0.11, 4
	c0	add $r0.13 = $r0.13, 4
;;
	c0	cmplt $b0.0 = $r0.12, 256
;;
;;
	c0	br $b0.0, LBB1_3
;;
	c0	goto LBB1_6
;;
LBB1_4::                                ## %if.then
	c0	add $r0.57 = $r0.12, 10
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB1_7
;;
LBB1_6::                                ## %for.end
	c0	mov $r0.57 = -1
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB1_7::                                ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 1048[$r0.1]
;;
	c0	ldw $r0.57 = 1052[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 1056, $l0.0
;;
.endp

.section .data

	.align	4                       ## @c
c::
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2

	.align	4                       ## @x
x::
	.data4	3139482720              ## 0xbb20b460
	.data4	3571011896              ## 0xd4d95138
	.data4	1033096058              ## 0x3d93cb7a
	.data4	2604232894              ## 0x9b3970be
	.data4	2737687030              ## 0xa32dc9f6
	.data4	1327362106              ## 0x4f1df03a
	.data4	2364108983              ## 0x8ce970b7
	.data4	502539523               ## 0x1df42503
	.data4	2566437438              ## 0x98f8ba3e
	.data4	3356665709              ## 0xc812a76d
	.data4	1431162155              ## 0x554dcd2b
	.data4	1085665355              ## 0x40b5f04b
	.data4	1654374947              ## 0x629bc223
	.data4	2632968525              ## 0x9cefe94d
	.data4	4229862191              ## 0xfc1e932f
	.data4	4221177688              ## 0xfb9a0f58
	.data4	3776060168              ## 0xe1121b08
	.data4	99135751                ## 0x5e8b107
	.data4	4042634482              ## 0xf0f5b4f2
	.data4	755814641               ## 0x2d0cd0f1
	.data4	1180918287              ## 0x4663620f
	.data4	1344049776              ## 0x501c9270
	.data4	553609048               ## 0x20ff6758
	.data4	1580443894              ## 0x5e33a8f6
	.data4	629649304               ## 0x2587af98
	.data4	3028702520              ## 0xb4865538
	.data4	99807007                ## 0x5f2ef1f
	.data4	5955764                 ## 0x5ae0b4
	.data4	2348229384              ## 0x8bf72308
	.data4	39620447                ## 0x25c8f5f
	.data4	4142439491              ## 0xf6e89c43
	.data4	2417850490              ## 0x901d787a
	.data4	448784075               ## 0x1abfe6cb
	.data4	1086124775              ## 0x40bcf2e7
	.data4	2684983204              ## 0xa00997a4
	.data4	1227951724              ## 0x49310e6c
	.data4	1764356251              ## 0x6929f09b
	.data4	64111306                ## 0x3d242ca
	.data4	3334235877              ## 0xc6bc66e5
	.data4	4194885270              ## 0xfa08de96
	.data4	4255121921              ## 0xfda00201
	.data4	2955944750              ## 0xb030232e
	.data4	2092649110              ## 0x7cbb4a96
	.data4	3726651460              ## 0xde203044
	.data4	3205082396              ## 0xbf09ad1c
	.data4	4213127382              ## 0xfb1f38d6
	.data4	3148864148              ## 0xbbafda94
	.data4	2448278672              ## 0x91edc490
	.data4	3510264224              ## 0xd13a61a0
	.data4	55004124                ## 0x3474bdc
	.data4	3603006639              ## 0xd6c184af
	.data4	1770461755              ## 0x69871a3b
	.data4	2262156833              ## 0x86d5c621
	.data4	3117179293              ## 0xb9cc619d
	.data4	3862614414              ## 0xe63ad18e
	.data4	4229143232              ## 0xfc139ac0
	.data4	575267217               ## 0x2249e191
	.data4	2345599475              ## 0x8bcf01f3
	.data4	356750287               ## 0x154393cf
	.data4	798819494               ## 0x2f9d04a6
	.data4	4202944775              ## 0xfa83d907
	.data4	1318001577              ## 0x4e8f1ba9
	.data4	3102500210              ## 0xb8ec6572
	.data4	2882250517              ## 0xabcba715
	.data4	3071034817              ## 0xb70c45c1
	.data4	276053035               ## 0x10743c2b
	.data4	615126903               ## 0x24aa1777
	.data4	1542603436              ## 0x5bf242ac
	.data4	1988388716              ## 0x7684676c
	.data4	1177882237              ## 0x46350e7d
	.data4	19265476                ## 0x125f7c4
	.data4	2864096145              ## 0xaab6a391
	.data4	307082914               ## 0x124db6a2
	.data4	2961397102              ## 0xb083556e
	.data4	1496453452              ## 0x5932114c
	.data4	3504425161              ## 0xd0e148c9
	.data4	1455004595              ## 0x56b99bb3
	.data4	2604717324              ## 0x9b40d50c
	.data4	3690908270              ## 0xdbfeca6e
	.data4	4004490440              ## 0xeeafacc8
	.data4	4172762535              ## 0xf8b74da7
	.data4	3197427546              ## 0xbe94df5a
	.data4	3718350234              ## 0xdda1859a
	.data4	2292843339              ## 0x88aa034b
	.data4	2631015811              ## 0x9cd21d83
	.data4	193034304               ## 0xb817840
	.data4	768747578               ## 0x2dd2283a
	.data4	1337360486              ## 0x4fb68066
	.data4	934457803               ## 0x37b2b1cb
	.data4	873612482               ## 0x341244c2
	.data4	3669994446              ## 0xdabfabce
	.data4	355564760               ## 0x15317cd8
	.data4	41547336                ## 0x279f648
	.data4	1781447028              ## 0x6a2eb974
	.data4	2973375833              ## 0xb13a1d59
	.data4	1081281446              ## 0x40730ba6
	.data4	3312763915              ## 0xc574c40b
	.data4	4072422445              ## 0xf2bc3c2d
	.data4	3060969211              ## 0xb672aefb
	.data4	2963264742              ## 0xb09fd4e6
	.data4	907249073               ## 0x361385b1
	.data4	206843130               ## 0xc542cfa
	.data4	3363356639              ## 0xc878bfdf
	.data4	1697401307              ## 0x652c49db
	.data4	4060175335              ## 0xf2015be7
	.data4	3298626134              ## 0xc49d0a56
	.data4	61144662                ## 0x3a4fe56
	.data4	2656470594              ## 0x9e568642
	.data4	1693091376              ## 0x64ea8630
	.data4	2627019927              ## 0x9c952497
	.data4	3667003460              ## 0xda920844
	.data4	105673451               ## 0x64c72eb
	.data4	3376026597              ## 0xc93a13e5
	.data4	3994064042              ## 0xee1094aa
	.data4	4266929594              ## 0xfe542dba
	.data4	1358495114              ## 0x50f8fd8a
	.data4	3792904573              ## 0xe213217d
	.data4	2056481282              ## 0x7a936a02
	.data4	731396580               ## 0x2b9839e4
	.data4	617380302               ## 0x24cc79ce
	.data4	4132054542              ## 0xf64a260e
	.data4	818693069               ## 0x30cc43cd
	.data4	3110823461              ## 0xb96b6625
	.data4	3884023731              ## 0xe7817fb3
	.data4	2909213972              ## 0xad671514
	.data4	1233308008              ## 0x4982c968
	.data4	3454851968              ## 0xcdecdb80
	.data4	2820725524              ## 0xa820db14
	.data4	1895913584              ## 0x71015870
	.data4	1376826901              ## 0x5210b615
	.data4	1984652857              ## 0x764b6639
	.data4	412901507               ## 0x189c6083
	.data4	3662866098              ## 0xda52e6b2
	.data4	2025024491              ## 0x78b36beb
	.data4	2155364283              ## 0x80783fbb
	.data4	3061955420              ## 0xb681bb5c
	.data4	4260362650              ## 0xfdeff99a
	.data4	2439987725              ## 0x916f420d
	.data4	4162982588              ## 0xf82212bc
	.data4	2428733719              ## 0x90c38917
	.data4	1516579035              ## 0x5a6528db
	.data4	1612513822              ## 0x601d021e
	.data4	203005342               ## 0xc199d9e
	.data4	3383252446              ## 0xc9a855de
	.data4	307621155               ## 0x1255ed23
	.data4	13453556                ## 0xcd48f4
	.data4	125015832               ## 0x7739718
	.data4	483675743               ## 0x1cd44e5f
	.data4	2077347671              ## 0x7bd1cf57
	.data4	37011083                ## 0x234be8b
	.data4	4174493973              ## 0xf8d1b915
	.data4	2069609186              ## 0x7b5bbae2
	.data4	4248225827              ## 0xfd36c823
	.data4	1502566715              ## 0x598f593b
	.data4	3296138716              ## 0xc47715dc
	.data4	3088684957              ## 0xb819979d
	.data4	2153485233              ## 0x805b93b1
	.data4	2744655917              ## 0xa398202d
	.data4	1097472880              ## 0x416a1b70
	.data4	1449582151              ## 0x5666de47
	.data4	1327824311              ## 0x4f24fdb7
	.data4	3189121291              ## 0xbe16210b
	.data4	3643337017              ## 0xd928e939
	.data4	3120846058              ## 0xba0454ea
	.data4	223701431               ## 0xd5569b7
	.data4	810978550               ## 0x30568cf6
	.data4	43703267                ## 0x29adbe3
	.data4	835843581               ## 0x31d1f5fd
	.data4	1519786882              ## 0x5a961b82
	.data4	3522638013              ## 0xd1f730bd
	.data4	372536197               ## 0x16347385
	.data4	3977004465              ## 0xed0c45b1
	.data4	3652060157              ## 0xd9ae03fd
	.data4	3588471882              ## 0xd5e3bc4a
	.data4	15792134                ## 0xf0f806
	.data4	3178834059              ## 0xbd79288b
	.data4	1322391079              ## 0x4ed21627
	.data4	3063647583              ## 0xb69b8d5f
	.data4	2283241404              ## 0x88177fbc
	.data4	1299386162              ## 0x4d730f32
	.data4	3946276954              ## 0xeb37685a
	.data4	1341976962              ## 0x4ffcf182
	.data4	1190607957              ## 0x46f73c55
	.data4	4032465802              ## 0xf05a8b8a
	.data4	3754927568              ## 0xdfcfa5d0
	.data4	3308131126              ## 0xc52e1336
	.data4	2619421178              ## 0x9c2131fa
	.data4	2346951424              ## 0x8be3a300
	.data4	3902575720              ## 0xe89c9468
	.data4	638256747               ## 0x260b066b
	.data4	191085745               ## 0xb63bcb1
	.data4	4197806631              ## 0xfa357227
	.data4	2777658026              ## 0xa58fb2aa
	.data4	1375971382              ## 0x5203a836
	.data4	2133755906              ## 0x7f2e8802
	.data4	891811204               ## 0x3527f584
	.data4	2176266760              ## 0x81b73208
	.data4	2110473668              ## 0x7dcb45c4
	.data4	2236341469              ## 0x854bdcdd
	.data4	861211557               ## 0x33550ba5
	.data4	1573507430              ## 0x5dc9d166
	.data4	1625767564              ## 0x60e73e8c
	.data4	2051434938              ## 0x7a4669ba
	.data4	2372863096              ## 0x8d6f0478
	.data4	3023526876              ## 0xb4375bdc
	.data4	927536580               ## 0x374915c4
	.data4	1386277121              ## 0x52a0e901
	.data4	1184911833              ## 0x46a051d9
	.data4	50057146                ## 0x2fbcfba
	.data4	4109608725              ## 0xf4f3a715
	.data4	3010939309              ## 0xb37749ad
	.data4	3269274988              ## 0xc2dd2d6c
	.data4	3201266124              ## 0xbecf71cc
	.data4	3178394257              ## 0xbd727291
	.data4	2608283179              ## 0x9b773e2b
	.data4	2068400044              ## 0x7b4947ac
	.data4	1009668318              ## 0x3c2e50de
	.data4	2447717348              ## 0x91e533e4
	.data4	1670927751              ## 0x63985587
	.data4	408998980               ## 0x1860d444
	.data4	3914726786              ## 0xe955fd82
	.data4	1439774921              ## 0x55d138c9
	.data4	718930634               ## 0x2ada02ca
	.data4	2494924701              ## 0x94b5879d
	.data4	16808464                ## 0x1007a10
	.data4	2550999744              ## 0x980d2ac0
	.data4	1137718941              ## 0x43d0369d
	.data4	252008887               ## 0xf0559b7
	.data4	3834619629              ## 0xe48fa6ed
	.data4	3241361405              ## 0xc1333ffd
	.data4	1278046001              ## 0x4c2d6f31
	.data4	947528252               ## 0x387a223c
	.data4	1842130704              ## 0x6dccaf10
	.data4	1599145891              ## 0x5f5107a3
	.data4	2953011810              ## 0xb0036262
	.data4	1631478226              ## 0x613e61d2
	.data4	1754478786              ## 0x689338c2
	.data4	2924168497              ## 0xae4b4531
	.data4	1516348954              ## 0x5a61a61a
	.data4	730123440               ## 0x2b84ccb0
	.data4	2885181092              ## 0xabf85ea4
	.data4	1491046204              ## 0x58df8f3c
	.data4	3180067571              ## 0xbd8bfaf3
	.data4	3638913652              ## 0xd8e56a74
	.data4	3841570038              ## 0xe4f9b4f6
	.data4	3600065886              ## 0xd694a55e
	.data4	2490899744              ## 0x94781d20
	.data4	13393714                ## 0xcc5f32
	.data4	2193678101              ## 0x82c0df15
	.data4	176533870               ## 0xa85b16e
	.data4	1339899789              ## 0x4fdd3f8d
	.data4	2783162832              ## 0xa5e3b1d0
	.data4	2320267589              ## 0x8a4c7945
	.data4	2634278897              ## 0x9d03e7f1
	.data4	4179465539              ## 0xf91d9543
	.data4	86156176                ## 0x522a390

	.align	4                       ## @y_ref
y_ref::
	.data4	1983998144              ## 0x764168c0
	.data4	2520085488              ## 0x963573f0
	.data4	3138366804              ## 0xbb0fad54
	.data4	4134059268              ## 0xf668bd04
	.data4	1396909884              ## 0x5343273c
	.data4	318792248               ## 0x13006238
	.data4	427076522               ## 0x1974abaa
	.data4	4066468278              ## 0xf26161b6
	.data4	2074323928              ## 0x7ba3abd8
	.data4	2242620748              ## 0x85abad4c
	.data4	1790012168              ## 0x6ab16b08
	.data4	685713266               ## 0x28df2772
	.data4	2909522168              ## 0xad6bc8f8
	.data4	1908553384              ## 0x71c236a8
	.data4	2010625204              ## 0x77d7b4b4
	.data4	547722470               ## 0x20a594e6
	.data4	3672543942              ## 0xdae692c6
	.data4	1992241644              ## 0x76bf31ec
	.data4	1963636944              ## 0x750ab8d0
	.data4	4155994070              ## 0xf7b76fd6
	.data4	279068088               ## 0x10a23db8
	.data4	1340431044              ## 0x4fe55ac4
	.data4	4128785038              ## 0xf618428e
	.data4	228457770               ## 0xd9dfd2a
	.data4	3893675336              ## 0xe814c548
	.data4	3120094040              ## 0xb9f8db58
	.data4	814039914               ## 0x3085436a
	.data4	900346356               ## 0x35aa31f4
	.data4	2586980300              ## 0x9a322fcc
	.data4	1105660908              ## 0x41e70bec
	.data4	668320650               ## 0x27d5c38a
	.data4	490595724               ## 0x1d3de58c
	.data4	1448165192              ## 0x56513f48
	.data4	448830312               ## 0x1ac09b68
	.data4	3460400900              ## 0xce418704
	.data4	1258034330              ## 0x4afc149a
	.data4	4172832580              ## 0xf8b85f44
	.data4	287551736               ## 0x1123b0f8
	.data4	3553343542              ## 0xd3cbb836
	.data4	4037035294              ## 0xf0a0451e
	.data4	100245378               ## 0x5f99f82
	.data4	3430717058              ## 0xcc7c9682
	.data4	2764629780              ## 0xa4c8e714
	.data4	1798183834              ## 0x6b2e1b9a
	.data4	1239518204              ## 0x49e18bfc
	.data4	1683782744              ## 0x645c7c58
	.data4	474197368               ## 0x1c43ad78
	.data4	2099982592              ## 0x7d2b3100
	.data4	3475616124              ## 0xcf29b17c
	.data4	177137056               ## 0xa8ee5a0
	.data4	593840238               ## 0x2365486e
	.data4	3718658530              ## 0xdda639e2
	.data4	358391714               ## 0x155c9fa2
	.data4	3801042440              ## 0xe28f4e08
	.data4	2718725770              ## 0xa20c768a
	.data4	2247069294              ## 0x85ef8e6e
	.data4	1097217940              ## 0x41663794
	.data4	1569298502              ## 0x5d899846
	.data4	3675384622              ## 0xdb11eb2e
	.data4	672670582               ## 0x28182376
	.data4	539498440               ## 0x202817c8
	.data4	1881724324              ## 0x7028d5a4
	.data4	4116621040              ## 0xf55ea6f0
	.data4	1787626660              ## 0x6a8d04a4
	.data4	2652304624              ## 0x9e16f4f0
	.data4	505476754               ## 0x1e20f692
	.data4	3203237064              ## 0xbeed84c8
	.data4	4202061666              ## 0xfa765f62
	.data4	274902970               ## 0x1062afba
	.data4	530117704               ## 0x1f98f448
	.data4	2903919748              ## 0xad164c84
	.data4	1608658686              ## 0x5fe22efe
	.data4	1618474898              ## 0x6077f792
	.data4	1466172208              ## 0x57640330
	.data4	320182778               ## 0x131599fa
	.data4	3979581886              ## 0xed3399be
	.data4	3066514070              ## 0xb6c74a96
	.data4	2270256800              ## 0x87515ea0
	.data4	564783466               ## 0x21a9e96a
	.data4	1741754078              ## 0x67d10ede
	.data4	1386881598              ## 0x52aa223e
	.data4	3536010572              ## 0xd2c33d4c
	.data4	1976768712              ## 0x75d318c8
	.data4	1939617204              ## 0x739c35b4
	.data4	1341922638              ## 0x4ffc1d4e
	.data4	1748401900              ## 0x68367eec
	.data4	239513110               ## 0xe46ae16
	.data4	3193945530              ## 0xbe5fbdba
	.data4	2089481878              ## 0x7c8af696
	.data4	3782058684              ## 0xe16da2bc
	.data4	67121820                ## 0x400329c
	.data4	3574603654              ## 0xd5101f86
	.data4	752687276               ## 0x2cdd18ac
	.data4	3901396740              ## 0xe88a9704
	.data4	1064956754              ## 0x3f79f352
	.data4	4085079824              ## 0xf37d5f10
	.data4	637247226               ## 0x25fb9efa
	.data4	1603006928              ## 0x5f8bf1d0
	.data4	3465508386              ## 0xce8f7622
	.data4	2430918274              ## 0x90e4de82
	.data4	3991507776              ## 0xede99340
	.data4	542843462               ## 0x205b2246
	.data4	4224709686              ## 0xfbcff436
	.data4	2310230652              ## 0x89b3527c
	.data4	3007264938              ## 0xb33f38aa
	.data4	1994533746              ## 0x76e22b72
	.data4	2887526742              ## 0xac1c2956
	.data4	1102571266              ## 0x41b7e702
	.data4	3674026860              ## 0xdafd336c
	.data4	1299740578              ## 0x4d7877a2
	.data4	4157589544              ## 0xf7cfc828
	.data4	3003819426              ## 0xb30aa5a2
	.data4	1326996916              ## 0x4f185db4
	.data4	3479131420              ## 0xcf5f551c
	.data4	3865830278              ## 0xe66be386
	.data4	3858312302              ## 0xe5f92c6e
	.data4	3715897694              ## 0xdd7c195e
	.data4	3187649428              ## 0xbdffab94
	.data4	1807523032              ## 0x6bbc9cd8
	.data4	2792212014              ## 0xa66dc62e
	.data4	592309992               ## 0x234deee8
	.data4	623082194               ## 0x25237ad2
	.data4	1489594194              ## 0x58c96752
	.data4	1685451594              ## 0x6475f34a
	.data4	1075464482              ## 0x401a4922
	.data4	1501475382              ## 0x597eb236
	.data4	1183068246              ## 0x46843056
	.data4	147747824               ## 0x8ce73f0
	.data4	1295982080              ## 0x4d3f1e00
	.data4	2760110394              ## 0xa483f13a
	.data4	1226882222              ## 0x4920bcae
	.data4	883680030               ## 0x34abe31e
	.data4	2489734270              ## 0x9466547e
	.data4	2847588636              ## 0xa9bac11c
	.data4	2118290160              ## 0x7e428af0
	.data4	106427060               ## 0x657f2b4
	.data4	3375282022              ## 0xc92eb766
	.data4	4120237928              ## 0xf595d768
	.data4	2596571852              ## 0x9ac48acc
	.data4	1135368326              ## 0x43ac5886
	.data4	4215227676              ## 0xfb3f451c
	.data4	1562440060              ## 0x5d20f17c
	.data4	599980366               ## 0x23c2f94e
	.data4	4176837730              ## 0xf8f57c62
	.data4	1005431922              ## 0x3bedac72
	.data4	2311510312              ## 0x89c6d928
	.data4	4005868104              ## 0xeec4b248
	.data4	2136471348              ## 0x7f57f734
	.data4	2321401458              ## 0x8a5dc672
	.data4	1978212894              ## 0x75e9221e
	.data4	593905264               ## 0x23664670
	.data4	3665097458              ## 0xda74f2f2
	.data4	3482115384              ## 0xcf8cdd38
	.data4	2265723060              ## 0x870c30b4
	.data4	3669894900              ## 0xdabe26f4
	.data4	3803872220              ## 0xe2ba7bdc
	.data4	2786627516              ## 0xa6188fbc
	.data4	2985498954              ## 0xb1f3194a
	.data4	2195076498              ## 0x82d63592
	.data4	1099813476              ## 0x418dd264
	.data4	1153311396              ## 0x44be22a4
	.data4	2502945006              ## 0x952fe8ee
	.data4	2483816968              ## 0x940c0a08
	.data4	1867435602              ## 0x6f4ece52
	.data4	3817606672              ## 0xe38c0e10
	.data4	811984610               ## 0x3065e6e2
	.data4	1877883982              ## 0x6fee3c4e
	.data4	1242849996              ## 0x4a1462cc
	.data4	3884750960              ## 0xe78c9870
	.data4	3670302524              ## 0xdac45f3c
	.data4	1111622656              ## 0x42420400
	.data4	804475758               ## 0x2ff3536e
	.data4	1682787916              ## 0x644d4e4c
	.data4	4078536278              ## 0xf3198656
	.data4	2587982986              ## 0x9a417c8a
	.data4	2309040720              ## 0x89a12a50
	.data4	1125394214              ## 0x43142726
	.data4	2688943506              ## 0xa0460592
	.data4	2698501798              ## 0xa0d7dea6
	.data4	861306654               ## 0x33567f1e
	.data4	2580555562              ## 0x99d0272a
	.data4	2463285420              ## 0x92d2c0ac
	.data4	363200126               ## 0x15a5fe7e
	.data4	318021412               ## 0x12f49f24
	.data4	1021333024              ## 0x3ce04e20
	.data4	1492345982              ## 0x58f3647e
	.data4	2901303072              ## 0xacee5f20
	.data4	1554228832              ## 0x5ca3a660
	.data4	4222133028              ## 0xfba8a324
	.data4	1448693354              ## 0x56594e6a
	.data4	1764567726              ## 0x692d2aae
	.data4	2338265486              ## 0x8b5f198e
	.data4	2912562570              ## 0xad9a2d8a
	.data4	971201810               ## 0x39e35d12
	.data4	3507838930              ## 0xd1155fd2
	.data4	4197978428              ## 0xfa38113c
	.data4	2026875540              ## 0x78cfaa94
	.data4	3580901820              ## 0xd57039bc
	.data4	1928430578              ## 0x72f183f2
	.data4	1987380702              ## 0x767505de
	.data4	2578305116              ## 0x99add05c
	.data4	283224830               ## 0x10e1aafe
	.data4	1442523782              ## 0x55fb2a86
	.data4	1126714580              ## 0x43284cd4
	.data4	1225977240              ## 0x4912ed98
	.data4	1773699148              ## 0x69b8804c
	.data4	1847697778              ## 0x6e21a172
	.data4	492263038               ## 0x1d57567e
	.data4	3650008676              ## 0xd98eb664
	.data4	3046745720              ## 0xb599a678
	.data4	3555529288              ## 0xd3ed1248
	.data4	761118036               ## 0x2d5dbd54
	.data4	1087901222              ## 0x40d80e26
	.data4	3901093212              ## 0xe885f55c
	.data4	2914019490              ## 0xadb068a2
	.data4	3621271008              ## 0xd7d835e0
	.data4	1313054266              ## 0x4e439e3a
	.data4	949438022               ## 0x38974646
	.data4	4128329070              ## 0xf6114d6e
	.data4	2132045808              ## 0x7f146ff0
	.data4	3864726008              ## 0xe65b09f8
	.data4	2041471928              ## 0x79ae63b8
	.data4	2199029576              ## 0x83128748
	.data4	4274256010              ## 0xfec3f88a
	.data4	2883686222              ## 0xabe18f4e
	.data4	3701891528              ## 0xdca661c8
	.data4	356650932               ## 0x15420fb4
	.data4	2407607554              ## 0x8f812d02
	.data4	1150280874              ## 0x448fe4aa
	.data4	3629838276              ## 0xd85aefc4
	.data4	1299262840              ## 0x4d712d78
	.data4	1872121610              ## 0x6f964f0a
	.data4	1889412046              ## 0x709e23ce
	.data4	4028117720              ## 0xf01832d8
	.data4	91350024                ## 0x571e408
	.data4	3681012184              ## 0xdb67c9d8
	.data4	3570373018              ## 0xd4cf919a
	.data4	3823352182              ## 0xe3e3b976
	.data4	3535407012              ## 0xd2ba07a4
	.data4	1256437776              ## 0x4ae3b810
	.data4	3424719570              ## 0xcc2112d2
	.data4	3296139260              ## 0xc47717fc
	.data4	3850454726              ## 0xe58146c6
	.data4	1667873516              ## 0x6369baec
	.data4	3581419008              ## 0xd5781e00
	.data4	532528714               ## 0x1fbdbe4a
	.data4	3371464824              ## 0xc8f47878
	.data4	2009018952              ## 0x77bf3248
	.data4	129825326               ## 0x7bcfa2e
	.data4	1278252600              ## 0x4c309638
	.data4	3597500298              ## 0xd66d7f8a
	.data4	3134514614              ## 0xbad4e5b6
	.data4	11016922                ## 0xa81ada
	.data4	2592275280              ## 0x9a82fb50
	.data4	3678671614              ## 0xdb4412fe
	.data4	2003054202              ## 0x77642e7a

	.section	.data
	.align	4                       ## @str
str::
	.data1 83
	.data1 117
	.data1 99
	.data1 99
	.data1 101
	.data1 115
	.data1 115
	.data1 33
	.data1 0
.skip 7

	.align	4                       ## @str2
str2::
	.data1 70
	.data1 97
	.data1 105
	.data1 108
	.data1 101
	.data1 100
	.data1 33
	.data1 0

.import printf
.type printf, @function

.import puts
.type puts, @function

.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @bubblesort
bubblesort::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $l0.0
;;
	c0	stw 40[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.3
;;
	c0	stw 32[$r0.1] = $r0.4
	c0	mov $r0.11 = 0
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	c0	ldw $r0.12 = 32[$r0.1]
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB0_8
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 24[$r0.1] = $r0.11
;;
LBB0_3::                                ## %for.cond1
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.12 = 32[$r0.1]
;;
	c0	add $r0.12 = $r0.12, -1
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB0_7
;;
## BB#4:                                ## %for.body3
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.12 = 36[$r0.1]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.13, $r0.12
;;
	c0	ldw $r0.13 = 4[$r0.12]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	cmple $b0.0 = $r0.12, $r0.13
;;
	c0	br $b0.0, LBB0_6
;;
## BB#5:                                ## %if.then
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.12 = 36[$r0.1]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.13, $r0.12
;;
	c0	ldw $r0.12 = 4[$r0.12]
;;
	c0	stw 20[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 36[$r0.1]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.13, $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.12]
;;
	c0	stw 4[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 36[$r0.1]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.13, $r0.12
	c0	ldw $r0.13 = 20[$r0.1]
;;
	c0	stw 0[$r0.12] = $r0.13
;;
LBB0_6::                                ## %for.inc
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	goto LBB0_3
;;
LBB0_7::                                ## %for.inc12
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	goto LBB0_1
;;
LBB0_8::                                ## %for.end14
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.57 = .str
;;
LBB0_9::                                ## %for.cond15
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 63
;;
	c0	br $b0.0, LBB0_11
;;
## BB#10:                               ## %for.inc19
                                        ##   in Loop: Header=BB0_9 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
	c0	sh2add $r0.11 = $r0.12, $r0.11
;;
	c0	ldw $r0.4 = 0[$r0.11]
	c0	mov $r0.3 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_9
;;
LBB0_11::                               ## %for.end21
	c0	ldw $r0.57 = 40[$r0.1]
;;
	c0	ldw $l0.0 = 44[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
;;
	c0	stw 24[$r0.1] = $r0.57
	c0	mov $r0.57 = 0
	c0	mov $r0.3 = ar
;;
	c0	mov $r0.4 = 64
	c0	stw 20[$r0.1] = $r0.57
;;
.call bubblesort, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = bubblesort
;;
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.57 = 24[$r0.1]
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
	.align	2                       ## @ar
ar::
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

	.section	.data
.str::                                  ## @.str
	.data1 37
	.data1 100
	.data1 44
	.data1 32
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
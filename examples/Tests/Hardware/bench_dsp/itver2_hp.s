 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/jost/Downloads/vex-3.43 -S -o itver2_hp.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
.equ _?1TEMPLATEPACKET.9, 0x0
 ## Begin itver2
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-2048, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32)
itver2::
.trace 18
	c0    add $r0.1 = $r0.1, (-0x800)
	c0    sxth $r0.37 = $r0.3   ## bblock 0, line 210,  t1040(SI16),  t1039
	c0    mov $r0.30 = 64   ## [spec] bblock 21, line 260,  t1063(SI16),  64(SI32)
;;								## 0
	c0    mov $r0.3 = $r0.1   ## bblock 0, line 239,  t0,  t1024
	c0    add $r0.7 = $r0.1, 0x400   ## bblock 0, line 239,  t1,  t1024,  offset(wi_buf1?1.2)=0x400(P32)
	c0    cmpne $b0.0 = $r0.37, $r0.0   ## bblock 0, line 258,  t1196(I1),  t1040(SI16),  0(SI32)
;;								## 1
	c0    mov $r0.36 = $r0.3   ## [spec] bblock 21, line 239,  t1060,  t0
	c0    mov $r0.15 = 2   ## [spec] bblock 21, line 262,  t1061(SI16),  2(SI32)
	c0    mov $r0.12 = 3   ## [spec] bblock 21, line 261,  t1062(SI16),  3(SI32)
	c0    mov $r0.2 = $r0.0   ## [spec] bblock 21, line 267,  t1069(SI16),  0(SI32)
;;								## 2
	c0    add $r0.8 = $r0.1, 0x500   ## [spec] bblock 21, line 264,  t1059,  t1024,  (offset(wi_buf1?1.2)=0x400(P32) + 0x100(I32))=0x500(P32)
	c0    mov $r0.5 = $r0.4   ## t1043
	c0    brf $b0.0, L0?3   ## bblock 0, line 258,  t1196(I1)
;;								## 3
.trace 7
L1?3:
	c0    sh2add $r0.6 = $r0.2, (zcos2_fixed + 0)   ## [spec] bblock 23, line 270,  t1296,  t1069(SI16),  addr(zcos2_fixed?1.0)(P32)
	c0    shl $r0.9 = $r0.2, 2   ## [spec] bblock 23, line 275,  t42,  t1069(SI16),  2(SI32)
	c0    sub $r0.4 = 63, $r0.2   ## [spec] bblock 23, line 276,  t49,  63(SI32),  t1069(SI16)
;;								## 0
	c0    ldw.d $r0.6 = 0[$r0.6]   ## [spec] bblock 23, line 270, t182, t1296
	c0    sh2add $r0.11 = $r0.2, (zsin2_fixed + 0)   ## [spec] bblock 23, line 271,  t1297,  t1069(SI16),  addr(zsin2_fixed?1.0)(P32)
	c0    sh2add $r0.10 = $r0.4, 2   ## [spec] bblock 23, line 276,  t36,  t49,  2(SI32)
;;								## 1
	c0    shl $r0.13 = $r0.2, 1   ## [spec] bblock 23, line 291,  t210,  t1069(SI16),  1(SI32)
	c0    ldw.d $r0.11 = 0[$r0.11]   ## [spec] bblock 23, line 271, t201, t1297
	c0    sh2add $r0.9 = $r0.9, $r0.5   ## [spec] bblock 23, line 275,  t31,  t42,  t1043
	c0    sh2add $r0.10 = $r0.10, $r0.5   ## [spec] bblock 23, line 276,  t39,  t36,  t1043
;;								## 2
	c0    ldw.d $r0.10 = 0[$r0.10]   ## [spec] bblock 23, line 276, t127, t39
	c0    sh2add $r0.4 = $r0.4, 3   ## [spec] bblock 23, line 278,  t51,  t49,  3(SI32)
	c0    sh1add $r0.13 = $r0.13, (bitrev + 0)   ## [spec] bblock 23, line 291,  t1314,  t210,  addr(bitrev?1.0)(P32)
;;								## 3
	c0    sh2add $r0.16 = $r0.2, 1   ## [spec] bblock 23, line 277,  t43,  t1069(SI16),  1(SI32)
	c0    zxth $r0.14 = $r0.6   ## [spec] bblock 23, line 280,  t177(I16),  t182
	c0    ldw.d $r0.9 = 0[$r0.9]   ## [spec] bblock 23, line 275, t108, t31
	c0    sh2add $r0.4 = $r0.4, $r0.5   ## [spec] bblock 23, line 278,  t54,  t51,  t1043
;;								## 4
	c0    cmplt $b0.0 = $r0.2, 64   ## bblock 22, line 267,  t1295(I1),  t1069(SI16),  64(SI32)
	c0    zxth $r0.17 = $r0.11   ## [spec] bblock 23, line 281,  t196(I16),  t201
	c0    sh2add $r0.16 = $r0.16, $r0.5   ## [spec] bblock 23, line 277,  t46,  t43,  t1043
	c0    ldh.d $r0.13 = 0[$r0.13]   ## [spec] bblock 23, line 291, t229(SI16), t1314
;;								## 5
	c0    zxth $r0.20 = $r0.10   ## [spec] bblock 23, line 280,  t114(I16),  t127
	c0    ldw.d $r0.4 = 0[$r0.4]   ## [spec] bblock 23, line 278, t203, t54
	c0    mpyh $r0.19 = $r0.14, $r0.10   ## [spec] bblock 23, line 280,  t66,  t177(I16),  t127
	c0    mpyhh $r0.18 = $r0.6, $r0.10   ## [spec] bblock 23, line 280,  t72,  t182,  t127
;;								## 6
	c0    zxth $r0.23 = $r0.9   ## [spec] bblock 23, line 281,  t95(I16),  t108
	c0    ldw.d $r0.16 = 0[$r0.16]   ## [spec] bblock 23, line 277, t184, t46
	c0    mpyh $r0.21 = $r0.17, $r0.9   ## [spec] bblock 23, line 281,  t85,  t196(I16),  t108
	c0    mpyhh $r0.22 = $r0.11, $r0.9   ## [spec] bblock 23, line 281,  t91,  t201,  t108
;;								## 7
	c0    mpyh $r0.24 = $r0.20, $r0.6   ## [spec] bblock 23, line 280,  t60,  t114(I16),  t182
	c0    shl $r0.18 = $r0.18, 1   ## [spec] bblock 23, line 280,  t73,  t72,  1(SI32)
	c0    mpyh $r0.25 = $r0.23, $r0.11   ## [spec] bblock 23, line 281,  t79,  t95(I16),  t201
	c0    shr $r0.19 = $r0.19, 15   ## [spec] bblock 23, line 280,  t67(SI17),  t66,  15(SI32)
;;								## 8
	c0    shl $r0.22 = $r0.22, 1   ## [spec] bblock 23, line 281,  t92,  t91,  1(SI32)
	c0    shr $r0.21 = $r0.21, 15   ## [spec] bblock 23, line 281,  t86(SI17),  t85,  15(SI32)
	c0    sh2add $r0.26 = $r0.13, $r0.3   ## [spec] bblock 23, line 293,  t1315,  t229(SI16),  t0
	c0    brf $b0.0, L2?3   ## bblock 22, line 267,  t1295(I1)
;;								## 9
	c0    shr $r0.24 = $r0.24, 15   ## bblock 23, line 280,  t61(SI17),  t60,  15(SI32)
	c0    shr $r0.25 = $r0.25, 15   ## bblock 23, line 281,  t80(SI17),  t79,  15(SI32)
	c0    sub $r0.18 = $r0.18, $r0.21   ## bblock 23, line 293,  t1298,  t73,  t86(SI17)
	c0    sub $r0.19 = $r0.19, $r0.22   ## bblock 23, line 293,  t1300,  t67(SI17),  t92
;;								## 10
	c0    mpyhh $r0.19 = $r0.6, $r0.4   ## bblock 23, line 285,  t148,  t182,  t203
	c0    mpyh $r0.21 = $r0.17, $r0.16   ## bblock 23, line 286,  t161,  t196(I16),  t184
	c0    sub $r0.24 = $r0.24, $r0.25   ## bblock 23, line 293,  t1299,  t61(SI17),  t80(SI17)
	c0    add $r0.18 = $r0.18, $r0.19   ## bblock 23, line 293,  t1301,  t1298,  t1300
;;								## 11
	c0    zxth $r0.25 = $r0.4   ## bblock 23, line 285,  t190(I16),  t203
	c0    mpyh $r0.22 = $r0.14, $r0.4   ## bblock 23, line 285,  t142,  t177(I16),  t203
	c0    mpyhh $r0.24 = $r0.11, $r0.16   ## bblock 23, line 286,  t167,  t201,  t184
	c0    add $r0.18 = $r0.18, $r0.24   ## bblock 23, line 293,  t214,  t1301,  t1299
;;								## 12
	c0    zxth $r0.28 = $r0.16   ## bblock 23, line 286,  t171(I16),  t184
	c0    mpyh $r0.27 = $r0.25, $r0.6   ## bblock 23, line 285,  t136,  t190(I16),  t182
	c0    shl $r0.19 = $r0.19, 1   ## bblock 23, line 285,  t149,  t148,  1(SI32)
	c0    shr $r0.21 = $r0.21, 15   ## bblock 23, line 286,  t162(SI17),  t161,  15(SI32)
;;								## 13
	c0    mpyh $r0.21 = $r0.28, $r0.11   ## bblock 23, line 286,  t155,  t171(I16),  t201
	c0    shl $r0.24 = $r0.24, 1   ## bblock 23, line 286,  t168,  t167,  1(SI32)
	c0    shr $r0.22 = $r0.22, 15   ## bblock 23, line 285,  t143(SI17),  t142,  15(SI32)
	c0    sub $r0.19 = $r0.19, $r0.21   ## bblock 23, line 295,  t1306,  t149,  t162(SI17)
;;								## 14
	c0    mpyhh $r0.29 = $r0.10, $r0.11   ## bblock 23, line 283,  t129,  t127,  t201
	c0    shr $r0.27 = $r0.27, 15   ## bblock 23, line 285,  t137(SI17),  t136,  15(SI32)
	c0    sub $r0.22 = $r0.22, $r0.24   ## bblock 23, line 295,  t1308,  t143(SI17),  t168
	c0    add $r0.24 = $r0.13, 64   ## bblock 23, line 294,  t225,  t229(SI16),  64(SI32)
;;								## 15
	c0    mpyh $r0.10 = $r0.17, $r0.10   ## bblock 23, line 283,  t123,  t196(I16),  t127
	c0    shr $r0.21 = $r0.21, 15   ## bblock 23, line 286,  t156(SI17),  t155,  15(SI32)
	c0    add $r0.19 = $r0.19, $r0.22   ## bblock 23, line 295,  t1309,  t1306,  t1308
	c0    sh2add $r0.22 = $r0.24, $r0.3   ## bblock 23, line 295,  t1316,  t225,  t0
;;								## 16
	c0    mpyh $r0.23 = $r0.23, $r0.6   ## bblock 23, line 282,  t98,  t95(I16),  t182
	c0    shl $r0.29 = $r0.29, 1   ## bblock 23, line 283,  t130,  t129,  1(SI32)
	c0    mpyh $r0.21 = $r0.14, $r0.9   ## bblock 23, line 282,  t104,  t177(I16),  t108
	c0    sub $r0.27 = $r0.27, $r0.21   ## bblock 23, line 295,  t1307,  t137(SI17),  t156(SI17)
;;								## 17
	c0    mpyh $r0.20 = $r0.20, $r0.11   ## bblock 23, line 283,  t117,  t114(I16),  t201
	c0    mpyhh $r0.9 = $r0.6, $r0.9   ## bblock 23, line 282,  t110,  t182,  t108
	c0    shr $r0.10 = $r0.10, 15   ## bblock 23, line 283,  t124(SI17),  t123,  15(SI32)
	c0    add $r0.19 = $r0.19, $r0.27   ## bblock 23, line 295,  t223,  t1309,  t1307
;;								## 18
	c0    shr $r0.23 = $r0.23, 15   ## bblock 23, line 282,  t99(SI17),  t98,  15(SI32)
	c0    shr $r0.21 = $r0.21, 15   ## bblock 23, line 282,  t105(SI17),  t104,  15(SI32)
	c0    add $r0.29 = $r0.29, $r0.10   ## bblock 23, line 294,  t1302,  t130,  t124(SI17)
	c0    sh2add $r0.24 = $r0.24, $r0.7   ## bblock 23, line 294,  t1317,  t225,  t1
;;								## 19
	c0    shl $r0.9 = $r0.9, 1   ## bblock 23, line 282,  t111,  t110,  1(SI32)
	c0    mpyhh $r0.10 = $r0.11, $r0.4   ## bblock 23, line 288,  t205,  t201,  t203
	c0    shr $r0.20 = $r0.20, 15   ## bblock 23, line 283,  t118(SI17),  t117,  15(SI32)
	c0    add $r0.23 = $r0.23, $r0.21   ## bblock 23, line 294,  t1304,  t99(SI17),  t105(SI17)
;;								## 20
	c0    mpyh $r0.28 = $r0.28, $r0.6   ## bblock 23, line 287,  t174,  t171(I16),  t182
	c0    mpyh $r0.17 = $r0.17, $r0.4   ## bblock 23, line 288,  t199,  t196(I16),  t203
	c0    add $r0.9 = $r0.9, $r0.20   ## bblock 23, line 294,  t1303,  t111,  t118(SI17)
	c0    add $r0.29 = $r0.29, $r0.23   ## bblock 23, line 294,  t1305,  t1302,  t1304
;;								## 21
	c0    mpyh $r0.25 = $r0.25, $r0.11   ## bblock 23, line 288,  t193,  t190(I16),  t201
	c0    shl $r0.10 = $r0.10, 1   ## bblock 23, line 288,  t206,  t205,  1(SI32)
	c0    mpyh $r0.14 = $r0.14, $r0.16   ## bblock 23, line 287,  t180,  t177(I16),  t184
	c0    add $r0.29 = $r0.29, $r0.9   ## bblock 23, line 294,  t218,  t1305,  t1303
;;								## 22
	c0    mpyhh $r0.6 = $r0.6, $r0.16   ## bblock 23, line 287,  t186,  t182,  t184
	c0    shr $r0.28 = $r0.28, 15   ## bblock 23, line 287,  t175(SI17),  t174,  15(SI32)
	c0    shr $r0.17 = $r0.17, 15   ## bblock 23, line 288,  t200(SI17),  t199,  15(SI32)
	c0    sh2add $r0.13 = $r0.13, $r0.7   ## bblock 23, line 296,  t1318,  t229(SI16),  t1
;;								## 23
	c0    add $r0.2 = $r0.2, 1   ## bblock 23, line 267,  t19,  t1069(SI16),  1(SI32)
	c0    shr $r0.14 = $r0.14, 15   ## bblock 23, line 287,  t181(SI17),  t180,  15(SI32)
	c0    shr $r0.25 = $r0.25, 15   ## bblock 23, line 288,  t194(SI17),  t193,  15(SI32)
	c0    add $r0.10 = $r0.10, $r0.17   ## bblock 23, line 296,  t1310,  t206,  t200(SI17)
;;								## 24
	c0    sxth $r0.2 = $r0.2   ## bblock 23, line 267,  t1069(SI16),  t19
	c0    shl $r0.6 = $r0.6, 1   ## bblock 23, line 287,  t187,  t186,  1(SI32)
	c0    add $r0.28 = $r0.28, $r0.14   ## bblock 23, line 296,  t1312,  t175(SI17),  t181(SI17)
	c0    stw 0[$r0.26] = $r0.18   ## bblock 23, line 293, t1315, t214
;;								## 25
	c0    add $r0.6 = $r0.6, $r0.25   ## bblock 23, line 296,  t1311,  t187,  t194(SI17)
	c0    add $r0.10 = $r0.10, $r0.28   ## bblock 23, line 296,  t1313,  t1310,  t1312
	c0    stw 0[$r0.22] = $r0.19   ## bblock 23, line 295, t1316, t223
;;								## 26
	c0    add $r0.10 = $r0.10, $r0.6   ## bblock 23, line 296,  t228,  t1313,  t1311
	c0    stw 0[$r0.24] = $r0.29   ## bblock 23, line 294, t1317, t218
;;								## 27
	c0    stw 0[$r0.13] = $r0.10   ## bblock 23, line 296, t1318, t228
	c0    goto L1?3 ## goto
;;								## 28
.trace 15
L2?3:
	c0    sub $r0.11 = 15, $r0.12   ## bblock 3, line 342,  t348,  15(SI32),  t1062(SI16)
	c0    add $r0.6 = $r0.12, 2   ## bblock 3, line 346,  t364,  t1062(SI16),  2(SI32)
	c0    mov $r0.10 = 32767   ## 32767(SI32)
;;								## 0
	c0    shr $r0.11 = $r0.10, $r0.11   ## bblock 3, line 342,  t349,  32767(SI32),  t348
	c0    add $r0.14 = $r0.12, 1   ## bblock 3, line 348,  t362,  t1062(SI16),  1(SI32)
	c0    sxth $r0.13 = $r0.6   ## bblock 3, line 346,  t12(SI16),  t364
	c0    mpyl $r0.9 = $r0.15, $r0.30   ## bblock 3, line 357,  t369,  t1061(SI16),  t1063(SI16)
;;								## 1
	c0    sxth $r0.32 = $r0.11   ## bblock 3, line 342,  t10(SI16),  t349
	c0    orc $r0.17 = $r0.11, $r0.0   ## bblock 3, line 343,  t351,  t349,  0(I32)
	c0    sub $r0.16 = 15, $r0.13   ## bblock 3, line 347,  t359,  15(SI32),  t12(SI16)
	c0    shl $r0.33 = $r0.14, $r0.6   ## bblock 3, line 348,  t1046,  t362,  t364
;;								## 2
	c0    sxth $r0.35 = $r0.17   ## bblock 3, line 343,  t11(SI16),  t351
	c0    shr $r0.34 = $r0.10, $r0.16   ## bblock 3, line 347,  t1045,  32767(SI32),  t359
	c0    mov $r0.2 = $r0.0   ## bblock 3, line 357,  t1110(SI16),  0(SI32)
	c0    sh2add $r0.4 = $r0.30, $r0.3   ## bblock 3, line 361,  t379,  t1063(SI16),  t0
;;								## 3
	c0    mov $r0.27 = $r0.5   ## t1043
	c0    mov $r0.28 = $r0.3   ## t0
	c0    mov $r0.29 = $r0.12   ## t1062(SI16)
	c0    mov $r0.31 = $r0.13   ## t12(SI16)
;;								## 4
	c0    mov $r0.3 = $r0.30   ## t1063(SI16)
;;								## 5
	c0    mov $r0.30 = $r0.15   ## t1061(SI16)
	c0    mov $r0.5 = $r0.36   ## t1060
;;								## 6
.trace 1
L3?3:
	c0    cmplt $b0.2 = $r0.2, $r0.9   ## bblock 4, line 357,  t1198(I1),  t1110(SI16),  t369
	c0    sub $r0.6 = $r0.2, $r0.3   ## [spec] bblock 19, line 364,  t390,  t1110(SI16),  t1063(SI16)
	c0    cmpge $b0.1 = $r0.2, $r0.3   ## [spec] bblock 19, line 364,  t1270(I1),  t1110(SI16),  t1063(SI16)
	c0    cmplt $b0.0 = $r0.2, $r0.3   ## [spec] bblock 19, line 359,  t1271(I1),  t1110(SI16),  t1063(SI16)
;;								## 0
	c0    slct $r0.6 = $b0.1, $r0.6, $r0.2   ## [spec] bblock 19, line 364,  t392,  t1270(I1),  t390,  t1110(SI16)
	c0    slct $r0.10 = $b0.0, $r0.0, 1   ## [spec] bblock 19, line 359,  t375,  t1271(I1),  0(SI32),  1(SI32)
	c0    add $r0.2 = $r0.2, 4   ## [spec] bblock 19, line 357,  t371,  t1110(SI16),  4(SI32)
;;								## 1
	c0    sxth $r0.10 = $r0.10   ## [spec] bblock 19, line 359,  t382(SI16),  t375
	c0    sxth $r0.6 = $r0.6   ## [spec] bblock 19, line 364,  t513(SI16),  t392
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 19, line 357,  t1110(SI16),  t371
	c0    brf $b0.2, L4?3   ## bblock 4, line 357,  t1198(I1)
;;								## 2
	c0    add $r0.11 = $r0.6, 1   ## bblock 19, line 368,  t474,  t513(SI16),  1(SI32)
	c0    cmpne $b0.0 = $r0.10, $r0.0   ## bblock 19, line 361,  t1272(I1),  t382(SI16),  0(SI32)
	c0    add $r0.13 = $r0.6, 2   ## bblock 19, line 370,  t494,  t513(SI16),  2(SI32)
	c0    add $r0.12 = $r0.6, 3   ## bblock 19, line 372,  t514,  t513(SI16),  3(SI32)
;;								## 3
	c0    slct $r0.5 = $b0.0, $r0.4, $r0.5   ## bblock 19, line 361,  t1060,  t1272(I1),  t379,  t1060
	c0    cmpne $b0.0 = $r0.10, $r0.0   ## bblock 19, line 362,  t1273(I1),  t382(SI16),  0(SI32)
;;								## 4
	c0    sh2add $r0.10 = $r0.6, $r0.5   ## bblock 19, line 366,  t448,  t513(SI16),  t1060
	c0    sh2add $r0.14 = $r0.11, $r0.5   ## bblock 19, line 368,  t467,  t474,  t1060
	c0    sh2add $r0.16 = $r0.13, $r0.5   ## bblock 19, line 370,  t487,  t494,  t1060
	c0    sh2add $r0.15 = $r0.12, $r0.5   ## bblock 19, line 372,  t507,  t514,  t1060
;;								## 5
	c0    slct $r0.8 = $b0.0, $r0.7, $r0.8   ## bblock 19, line 362,  t1059,  t1273(I1),  t1,  t1059
	c0    ldw $r0.17 = 0[$r0.10]   ## bblock 19, line 366, t501, t448
;;								## 6
	c0    sh2add $r0.6 = $r0.6, $r0.8   ## bblock 19, line 367,  t457,  t513(SI16),  t1059
	c0    sh2add $r0.11 = $r0.11, $r0.8   ## bblock 19, line 369,  t477,  t474,  t1059
	c0    ldw $r0.18 = 0[$r0.14]   ## bblock 19, line 368, t500, t467
	c0    sh2add $r0.13 = $r0.13, $r0.8   ## bblock 19, line 371,  t497,  t494,  t1059
;;								## 7
	c0    ldw $r0.19 = 0[$r0.15]   ## bblock 19, line 372, t508, t507
	c0    sh2add $r0.12 = $r0.12, $r0.8   ## bblock 19, line 373,  t517,  t514,  t1059
;;								## 8
	c0    ldw $r0.20 = 0[$r0.16]   ## bblock 19, line 370, t509, t487
;;								## 9
	c0    ldw $r0.22 = 0[$r0.6]   ## bblock 19, line 367, t511, t457
	c0    add $r0.21 = $r0.17, $r0.18   ## bblock 19, line 376,  t1160,  t501,  t500
	c0    sub $r0.17 = $r0.17, $r0.18   ## bblock 19, line 378,  t1166,  t501,  t500
;;								## 10
	c0    ldw $r0.23 = 0[$r0.11]   ## bblock 19, line 369, t510, t477
	c0    add $r0.18 = $r0.21, $r0.19   ## bblock 19, line 376,  t1274,  t1160,  t508
;;								## 11
	c0    ldw $r0.24 = 0[$r0.13]   ## bblock 19, line 371, t499, t497
	c0    add $r0.18 = $r0.18, $r0.20   ## bblock 19, line 376,  t444,  t1274,  t509
	c0    sub $r0.21 = $r0.21, $r0.20   ## bblock 19, line 380,  t1276,  t1160,  t509
;;								## 12
	c0    sub $r0.21 = $r0.21, $r0.19   ## bblock 19, line 380,  t482,  t1276,  t508
	c0    ldw $r0.25 = 0[$r0.12]   ## bblock 19, line 373, t498, t517
;;								## 13
	c0    add $r0.26 = $r0.22, $r0.23   ## bblock 19, line 377,  t1164,  t511,  t510
	c0    sub $r0.22 = $r0.22, $r0.23   ## bblock 19, line 379,  t1162,  t511,  t510
	c0    stw 0[$r0.10] = $r0.18   ## bblock 19, line 376, t448, t444
;;								## 14
	c0    sub $r0.18 = $r0.22, $r0.19   ## bblock 19, line 379,  t1275,  t1162,  t508
	c0    sub $r0.22 = $r0.22, $r0.20   ## bblock 19, line 383,  t1277,  t1162,  t509
	c0    sub $r0.10 = $r0.17, $r0.24   ## bblock 19, line 378,  t1279,  t1166,  t499
;;								## 15
	c0    add $r0.18 = $r0.18, $r0.20   ## bblock 19, line 379,  t472,  t1275,  t509
	c0    add $r0.23 = $r0.26, $r0.25   ## bblock 19, line 377,  t1278,  t1164,  t498
	c0    add $r0.10 = $r0.10, $r0.25   ## bblock 19, line 378,  t462,  t1279,  t498
	c0    sub $r0.26 = $r0.26, $r0.25   ## bblock 19, line 381,  t1280,  t1164,  t498
;;								## 16
	c0    add $r0.22 = $r0.22, $r0.19   ## bblock 19, line 383,  t512,  t1277,  t508
	c0    add $r0.23 = $r0.23, $r0.24   ## bblock 19, line 377,  t453,  t1278,  t499
	c0    sub $r0.26 = $r0.26, $r0.24   ## bblock 19, line 381,  t492,  t1280,  t499
	c0    sub $r0.17 = $r0.17, $r0.25   ## bblock 19, line 382,  t1281,  t1166,  t498
;;								## 17
	c0    stw 0[$r0.6] = $r0.23   ## bblock 19, line 377, t457, t453
	c0    add $r0.17 = $r0.17, $r0.24   ## bblock 19, line 382,  t502,  t1281,  t499
;;								## 18
	c0    stw 0[$r0.14] = $r0.10   ## bblock 19, line 378, t467, t462
;;								## 19
	c0    stw 0[$r0.11] = $r0.18   ## bblock 19, line 379, t477, t472
;;								## 20
	c0    stw 0[$r0.16] = $r0.21   ## bblock 19, line 380, t487, t482
;;								## 21
	c0    stw 0[$r0.13] = $r0.26   ## bblock 19, line 381, t497, t492
;;								## 22
	c0    stw 0[$r0.15] = $r0.17   ## bblock 19, line 382, t507, t502
;;								## 23
	c0    stw 0[$r0.12] = $r0.22   ## bblock 19, line 383, t517, t512
	c0    goto L3?3 ## goto
;;								## 24
.trace 16
L4?3:
	c0    sh2add $r0.6 = $r0.3, $r0.7   ## bblock 5, line 388,  t521,  t1063(SI16),  t1
	c0    cmpne $b0.0 = $r0.37, $r0.0   ## bblock 5, line 388,  t1199(I1),  t1040(SI16),  0(SI32)
	c0    mpyl $r0.18 = $r0.33, $r0.30   ## bblock 5, line 396,  t527,  t1046,  t1061(SI16)
	c0    sub $r0.8 = $r0.0, $r0.33   ## bblock 5, line 0,  t1144,  0(I32),  t1046
;;								## 0
	c0    mov $r0.17 = $r0.28   ## bblock 5, line 387,  t1112,  t0
	c0    sh2add $r0.16 = $r0.3, $r0.28   ## bblock 5, line 400,  t536,  t1063(SI16),  t0
	c0    slct $r0.13 = $b0.0, $r0.6, $r0.7   ## bblock 5, line 388,  t1111,  t1199(I1),  t521,  t1
	c0    mov $r0.4 = $r0.8   ## bblock 5, line 0,  t1143,  t1144
;;								## 1
	c0    mov $r0.2 = $r0.0   ## bblock 5, line 396,  t1047,  0(SI32)
	c0    mov $r0.9 = $r0.31   ## t12(SI16)
	c0    mov $r0.5 = $r0.34   ## t1045
	c0    mov $r0.3 = $r0.33   ## t1046
;;								## 2
	c0    mov $r0.14 = $r0.35   ## t11(SI16)
	c0    mov $r0.11 = $r0.32   ## t10(SI16)
	c0    mov $r0.12 = $r0.29   ## t1062(SI16)
	c0    mov $r0.15 = $r0.30   ## t1061(SI16)
;;								## 3
	c0    mov $r0.37 = $r0.27   ## t1043
	c0    mov $r0.38 = $r0.28   ## t0
	c0    mov $r0.39 = $r0.37   ## t1040(SI16)
;;								## 4
.trace 2
L5?3:
	c0    cmpltu $b0.0 = $r0.2, $r0.3   ## [spec] bblock 18, line 398,  t1248(I1),  t1047,  t1046
	c0    shru $r0.10 = $r0.4, $r0.9   ## [spec] bblock 18, line 402,  t547,  t1143,  t12(SI16)
	c0    and $r0.6 = $r0.4, $r0.5   ## [spec] bblock 18, line 405,  t556,  t1143,  t1045
	c0    and $r0.8 = $r0.2, $r0.5   ## [spec] bblock 18, line 406,  t559,  t1047,  t1045
;;								## 0
	c0    slct $r0.19 = $b0.0, $r0.0, 1   ## [spec] bblock 18, line 398,  t532,  t1248(I1),  0(SI32),  1(SI32)
	c0    shru $r0.20 = $r0.2, $r0.9   ## [spec] bblock 18, line 402,  t549,  t1047,  t12(SI16)
	c0    cmpeq $b0.0 = $r0.15, 2   ## [spec] bblock 18, line 408,  t1253(I1),  t1061(SI16),  2(SI32)
	c0    mov $r0.21 = 4   ## 4(SI32)
;;								## 1
	c0    cmpltu $b0.1 = $r0.2, $r0.18   ## bblock 6, line 396,  t1200(I1),  t1047,  t527
	c0    sxth $r0.19 = $r0.19   ## [spec] bblock 18, line 398,  t551(SI16),  t532
	c0    add $r0.4 = $r0.4, 1   ## [spec] bblock 18, line 0,  t1143,  t1143,  1(I32)
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 18, line 396,  t1047,  t1047,  1(SI32)
;;								## 2
	c0    cmpne $b0.3 = $r0.19, $r0.0   ## [spec] bblock 18, line 402,  t1249(I1),  t551(SI16),  0(SI32)
	c0    cmpne $b0.5 = $r0.19, $r0.0   ## [spec] bblock 18, line 400,  t1250(I1),  t551(SI16),  0(SI32)
	c0    cmpne $b0.4 = $r0.19, $r0.0   ## [spec] bblock 18, line 401,  t1251(I1),  t551(SI16),  0(SI32)
	c0    cmpne $b0.2 = $r0.19, $r0.0   ## [spec] bblock 18, line 406,  t1252(I1),  t551(SI16),  0(SI32)
;;								## 3
	c0    slct $r0.10 = $b0.3, $r0.10, $r0.20   ## [spec] bblock 18, line 402,  t584,  t1249(I1),  t547,  t549
	c0    slct $r0.17 = $b0.5, $r0.16, $r0.17   ## [spec] bblock 18, line 400,  t1112,  t1250(I1),  t536,  t1112
	c0    slct $r0.13 = $b0.4, $r0.7, $r0.13   ## [spec] bblock 18, line 401,  t1111,  t1251(I1),  t1,  t1111
	c0    slct $r0.6 = $b0.2, $r0.6, $r0.8   ## [spec] bblock 18, line 406,  t560,  t1252(I1),  t556,  t559
;;								## 4
	c0    sxth $r0.6 = $r0.6   ## [spec] bblock 18, line 406,  t5(SI16),  t560
	c0    shr $r0.8 = $r0.11, $r0.10   ## [spec] bblock 18, line 411,  t573,  t10(SI16),  t584
	c0    add $r0.19 = $r0.10, 3   ## [spec] bblock 18, line 411,  t576,  t584,  3(SI32)
	c0    sub $r0.20 = $r0.12, $r0.10   ## [spec] bblock 18, line 411,  t579,  t1062(SI16),  t584
;;								## 5
	c0    shr $r0.10 = $r0.14, $r0.10   ## [spec] bblock 18, line 408,  t568,  t11(SI16),  t584
	c0    and $r0.8 = $r0.6, $r0.8   ## [spec] bblock 18, line 411,  t574,  t5(SI16),  t573
	c0    shr $r0.20 = $r0.6, $r0.20   ## [spec] bblock 18, line 411,  t580,  t5(SI16),  t579
	c0    shl $r0.22 = $r0.21, $r0.10   ## [spec] bblock 18, line 413,  t585,  4(SI32),  t584
;;								## 6
	c0    and $r0.6 = $r0.6, $r0.10   ## [spec] bblock 18, line 408,  t569,  t5(SI16),  t568
	c0    shl $r0.8 = $r0.8, $r0.19   ## [spec] bblock 18, line 411,  t577,  t574,  t576
	c0    brf $b0.1, L6?3   ## bblock 6, line 396,  t1200(I1)
;;								## 7
	c0    shl $r0.10 = $r0.6, 1   ## bblock 18, line 408,  t566,  t569,  1(SI32)
	c0    add $r0.8 = $r0.8, $r0.20   ## bblock 18, line 411,  t581,  t577,  t580
;;								## 8
	c0    slct $r0.10 = $b0.0, $r0.10, $r0.6   ## bblock 18, line 408,  t570,  t1253(I1),  t566,  t569
	c0    sxth $r0.8 = $r0.8   ## bblock 18, line 411,  t699(SI16),  t581
	c0    add $r0.22 = $r0.8, $r0.22   ## bblock 18, line 413,  t587,  t581,  t585
;;								## 9
	c0    sxth $r0.10 = $r0.10   ## bblock 18, line 409,  t7(SI16),  t570
	c0    sh2add $r0.6 = $r0.8, $r0.17   ## bblock 18, line 418,  t694,  t699(SI16),  t1112
	c0    sh2add $r0.8 = $r0.8, $r0.13   ## bblock 18, line 419,  t702,  t699(SI16),  t1111
	c0    sxth $r0.22 = $r0.22   ## bblock 18, line 413,  t8(SI16),  t587
;;								## 10
	c0    sh2add $r0.22 = $r0.22, $r0.17   ## bblock 18, line 420,  t709,  t8(SI16),  t1112
	c0    sh2add $r0.19 = $r0.22, $r0.13   ## bblock 18, line 421,  t716,  t8(SI16),  t1111
	c0    sh2add $r0.20 = $r0.10, (xsin_fixed + 0)   ## bblock 18, line 416,  t1255,  t7(SI16),  addr(xsin_fixed?1.0)(P32)
;;								## 11
	c0    sh2add $r0.10 = $r0.10, (xcos_fixed + 0)   ## bblock 18, line 415,  t1254,  t7(SI16),  addr(xcos_fixed?1.0)(P32)
	c0    ldw $r0.21 = 0[$r0.19]   ## bblock 18, line 421, t682, t716
;;								## 12
	c0    ldw $r0.20 = 0[$r0.20]   ## bblock 18, line 416, t661, t1255
;;								## 13
	c0    ldw $r0.23 = 0[$r0.22]   ## bblock 18, line 420, t663, t709
;;								## 14
	c0    ldw $r0.10 = 0[$r0.10]   ## bblock 18, line 415, t680, t1254
	c0    zxth $r0.24 = $r0.21   ## bblock 18, line 426,  t669(I16),  t682
;;								## 15
	c0    zxth $r0.26 = $r0.20   ## bblock 18, line 426,  t656(I16),  t661
	c0    ldw $r0.28 = 0[$r0.6]   ## bblock 18, line 418, t705, t694
	c0    mpyh $r0.27 = $r0.24, $r0.20   ## bblock 18, line 426,  t634,  t669(I16),  t661
	c0    mpyhh $r0.25 = $r0.20, $r0.21   ## bblock 18, line 426,  t646,  t661,  t682
;;								## 16
	c0    ldw $r0.31 = 0[$r0.8]   ## bblock 18, line 419, t712, t702
	c0    zxth $r0.30 = $r0.23   ## bblock 18, line 425,  t650(I16),  t663
	c0    mpyhh $r0.32 = $r0.23, $r0.20   ## bblock 18, line 427,  t665,  t663,  t661
	c0    mpyh $r0.29 = $r0.26, $r0.21   ## bblock 18, line 426,  t640,  t656(I16),  t682
;;								## 17
	c0    zxth $r0.34 = $r0.10   ## bblock 18, line 425,  t675(I16),  t680
	c0    mpyh $r0.33 = $r0.30, $r0.10   ## bblock 18, line 425,  t615,  t650(I16),  t680
	c0    shl $r0.25 = $r0.25, 1   ## bblock 18, line 426,  t647,  t646,  1(SI32)
	c0    shr $r0.27 = $r0.27, 15   ## bblock 18, line 426,  t635(SI17),  t634,  15(SI32)
;;								## 18
	c0    mpyh $r0.35 = $r0.34, $r0.23   ## bblock 18, line 425,  t621,  t675(I16),  t663
	c0    mpyhh $r0.36 = $r0.10, $r0.23   ## bblock 18, line 425,  t627,  t680,  t663
	c0    shl $r0.32 = $r0.32, 1   ## bblock 18, line 427,  t666,  t665,  1(SI32)
	c0    shr $r0.29 = $r0.29, 15   ## bblock 18, line 426,  t641(SI17),  t640,  15(SI32)
;;								## 19
	c0    mpyh $r0.30 = $r0.30, $r0.20   ## bblock 18, line 427,  t653,  t650(I16),  t661
	c0    mpyhh $r0.20 = $r0.10, $r0.21   ## bblock 18, line 428,  t684,  t680,  t682
	c0    shr $r0.33 = $r0.33, 15   ## bblock 18, line 425,  t616(SI17),  t615,  15(SI32)
	c0    add $r0.25 = $r0.25, $r0.29   ## bblock 18, line 426,  t1257,  t647,  t641(SI17)
;;								## 20
	c0    mpyh $r0.24 = $r0.24, $r0.10   ## bblock 18, line 428,  t672,  t669(I16),  t680
	c0    shl $r0.36 = $r0.36, 1   ## bblock 18, line 425,  t628,  t627,  1(SI32)
	c0    shr $r0.35 = $r0.35, 15   ## bblock 18, line 425,  t622(SI17),  t621,  15(SI32)
	c0    add $r0.25 = $r0.25, $r0.27   ## bblock 18, line 426,  t1172,  t1257,  t635(SI17)
;;								## 21
	c0    shl $r0.20 = $r0.20, 1   ## bblock 18, line 428,  t685,  t684,  1(SI32)
	c0    sub $r0.27 = $r0.28, $r0.35   ## bblock 18, line 430,  t1258,  t705,  t622(SI17)
	c0    sub $r0.10 = $r0.25, $r0.33   ## bblock 18, line 430,  t1259,  t1172,  t616(SI17)
	c0    shr $r0.30 = $r0.30, 15   ## bblock 18, line 427,  t654(SI17),  t653,  15(SI32)
;;								## 22
	c0    mpyh $r0.26 = $r0.26, $r0.23   ## bblock 18, line 427,  t659,  t656(I16),  t663
	c0    sub $r0.27 = $r0.27, $r0.36   ## bblock 18, line 430,  t1260,  t1258,  t628
	c0    shr $r0.24 = $r0.24, 15   ## bblock 18, line 428,  t673(SI17),  t672,  15(SI32)
	c0    add $r0.29 = $r0.20, $r0.30   ## bblock 18, line 431,  t1266,  t685,  t654(SI17)
;;								## 23
	c0    mpyh $r0.34 = $r0.34, $r0.21   ## bblock 18, line 428,  t678,  t675(I16),  t682
	c0    add $r0.27 = $r0.27, $r0.10   ## bblock 18, line 430,  t690,  t1260,  t1259
	c0    sub $r0.28 = $r0.28, $r0.25   ## bblock 18, line 432,  t1261,  t705,  t1172
	c0    add $r0.10 = $r0.24, $r0.32   ## bblock 18, line 431,  t1267,  t673(SI17),  t666
;;								## 24
	c0    add $r0.36 = $r0.36, $r0.35   ## bblock 18, line 425,  t1256,  t628,  t622(SI17)
	c0    stw 0[$r0.6] = $r0.27   ## bblock 18, line 430, t694, t690
	c0    shr $r0.26 = $r0.26, 15   ## bblock 18, line 427,  t660(SI17),  t659,  15(SI32)
	c0    add $r0.29 = $r0.29, $r0.10   ## bblock 18, line 431,  t1269,  t1266,  t1267
;;								## 25
	c0    add $r0.36 = $r0.36, $r0.33   ## bblock 18, line 425,  t1174,  t1256,  t616(SI17)
	c0    add $r0.32 = $r0.32, $r0.26   ## bblock 18, line 427,  t1262,  t666,  t660(SI17)
	c0    shr $r0.34 = $r0.34, 15   ## bblock 18, line 428,  t679(SI17),  t678,  15(SI32)
	c0    sub $r0.6 = $r0.31, $r0.26   ## bblock 18, line 431,  t1265,  t712,  t660(SI17)
;;								## 26
	c0    add $r0.28 = $r0.28, $r0.36   ## bblock 18, line 432,  t706,  t1261,  t1174
	c0    add $r0.32 = $r0.32, $r0.30   ## bblock 18, line 427,  t1181,  t1262,  t654(SI17)
	c0    add $r0.20 = $r0.20, $r0.34   ## bblock 18, line 428,  t1263,  t685,  t679(SI17)
	c0    sub $r0.6 = $r0.6, $r0.34   ## bblock 18, line 431,  t1268,  t1265,  t679(SI17)
;;								## 27
	c0    add $r0.20 = $r0.20, $r0.24   ## bblock 18, line 428,  t1182,  t1263,  t673(SI17)
	c0    sub $r0.6 = $r0.6, $r0.29   ## bblock 18, line 431,  t698,  t1268,  t1269
;;								## 28
	c0    add $r0.31 = $r0.31, $r0.20   ## bblock 18, line 433,  t1264,  t712,  t1182
	c0    stw 0[$r0.8] = $r0.6   ## bblock 18, line 431, t702, t698
;;								## 29
	c0    add $r0.31 = $r0.31, $r0.32   ## bblock 18, line 433,  t713,  t1264,  t1181
	c0    stw 0[$r0.22] = $r0.28   ## bblock 18, line 432, t709, t706
;;								## 30
	c0    stw 0[$r0.19] = $r0.31   ## bblock 18, line 433, t716, t713
	c0    goto L5?3 ## goto
;;								## 31
.trace 17
L6?3:
	c0    cmpne $b0.0 = $r0.39, $r0.0   ## bblock 7, line 441,  t1201(I1),  t1040(SI16),  0(SI32)
	c0    mov $r0.2 = $r0.0   ## [spec] bblock 15, line 443,  t1114(SI16),  0(SI32)
	c0    mov $r0.3 = $r0.38   ## t0
	      xnop 1
;;								## 1
	c0    brf $b0.0, L7?3   ## bblock 7, line 441,  t1201(I1)
;;								## 2
.trace 9
L8?3:
	c0    add $r0.4 = $r0.2, 64   ## [spec] bblock 17, line 449,  t903,  t1114(SI16),  64(SI32)
	c0    sh2add $r0.6 = $r0.2, (zcos2_fixed + 0)   ## [spec] bblock 17, line 445,  t1222,  t1114(SI16),  addr(zcos2_fixed?1.0)(P32)
	c0    sh2add $r0.8 = $r0.2, $r0.3   ## [spec] bblock 17, line 448,  t1224,  t1114(SI16),  t0
;;								## 0
	c0    ldw.d $r0.6 = 0[$r0.6]   ## [spec] bblock 17, line 445, t864, t1222
	c0    sh2add $r0.10 = $r0.2, (zsin2_fixed + 0)   ## [spec] bblock 17, line 446,  t1223,  t1114(SI16),  addr(zsin2_fixed?1.0)(P32)
	c0    sh2add $r0.9 = $r0.4, $r0.7   ## [spec] bblock 17, line 449,  t1226,  t903,  t1
;;								## 1
	c0    cmplt $b0.0 = $r0.2, 64   ## bblock 16, line 443,  t1221(I1),  t1114(SI16),  64(SI32)
	c0    ldw.d $r0.9 = 0[$r0.9]   ## [spec] bblock 17, line 449, t790, t1226
	c0    sh2add $r0.12 = $r0.2, $r0.3   ## [spec] bblock 17, line 466,  t1232,  t1114(SI16),  t0
	c0    sh2add $r0.11 = $r0.4, $r0.7   ## [spec] bblock 17, line 467,  t1237,  t903,  t1
;;								## 2
	c0    ldw.d $r0.10 = 0[$r0.10]   ## [spec] bblock 17, line 446, t883, t1223
	c0    sh2add $r0.13 = $r0.4, $r0.3   ## [spec] bblock 17, line 451,  t1225,  t903,  t0
	c0    sh2add $r0.14 = $r0.2, $r0.7   ## [spec] bblock 17, line 452,  t1227,  t1114(SI16),  t1
	c0    sh2add $r0.4 = $r0.4, $r0.3   ## [spec] bblock 17, line 469,  t1242,  t903,  t0
;;								## 3
	c0    ldw.d $r0.8 = 0[$r0.8]   ## [spec] bblock 17, line 448, t809, t1224
	c0    zxth $r0.15 = $r0.6   ## [spec] bblock 17, line 456,  t859(I16),  t864
	c0    sh2add $r0.16 = $r0.2, $r0.7   ## [spec] bblock 17, line 470,  t1247,  t1114(SI16),  t1
	c0    brf $b0.0, L9?3   ## bblock 16, line 443,  t1221(I1)
;;								## 4
	c0    ldw $r0.13 = 0[$r0.13]   ## bblock 17, line 451, t885, t1225
	c0    zxth $r0.17 = $r0.9   ## bblock 17, line 457,  t777(I16),  t790
	c0    mpyh $r0.18 = $r0.15, $r0.9   ## bblock 17, line 458,  t786,  t859(I16),  t790
	c0    mpyhh $r0.19 = $r0.6, $r0.9   ## bblock 17, line 458,  t792,  t864,  t790
;;								## 5
	c0    ldw $r0.14 = 0[$r0.14]   ## bblock 17, line 452, t866, t1227
	c0    zxth $r0.21 = $r0.10   ## bblock 17, line 457,  t878(I16),  t883
	c0    mpyh $r0.20 = $r0.17, $r0.6   ## bblock 17, line 458,  t780,  t777(I16),  t864
	c0    mpyhh $r0.22 = $r0.10, $r0.9   ## bblock 17, line 457,  t773,  t883,  t790
;;								## 6
	c0    mpyh $r0.23 = $r0.21, $r0.8   ## bblock 17, line 459,  t805,  t878(I16),  t809
	c0    mpyhh $r0.24 = $r0.8, $r0.10   ## bblock 17, line 459,  t811,  t809,  t883
	c0    shl $r0.19 = $r0.19, 1   ## bblock 17, line 458,  t793,  t792,  1(SI32)
	c0    shr $r0.18 = $r0.18, 15   ## bblock 17, line 458,  t787(SI17),  t786,  15(SI32)
;;								## 7
	c0    zxth $r0.25 = $r0.8   ## bblock 17, line 456,  t796(I16),  t809
	c0    mpyhh $r0.26 = $r0.6, $r0.8   ## bblock 17, line 456,  t754,  t864,  t809
	c0    mpyh $r0.9 = $r0.21, $r0.9   ## bblock 17, line 457,  t767,  t878(I16),  t790
	c0    shr $r0.20 = $r0.20, 15   ## bblock 17, line 458,  t781(SI17),  t780,  15(SI32)
;;								## 8
	c0    mpyh $r0.18 = $r0.25, $r0.10   ## bblock 17, line 459,  t799,  t796(I16),  t883
	c0    shl $r0.24 = $r0.24, 1   ## bblock 17, line 459,  t812,  t811,  1(SI32)
	c0    shr $r0.23 = $r0.23, 15   ## bblock 17, line 459,  t806(SI17),  t805,  15(SI32)
	c0    add $r0.20 = $r0.20, $r0.18   ## bblock 17, line 467,  t1235,  t781(SI17),  t787(SI17)
;;								## 9
	c0    mpyh $r0.8 = $r0.15, $r0.8   ## bblock 17, line 456,  t748,  t859(I16),  t809
	c0    shl $r0.26 = $r0.26, 1   ## bblock 17, line 456,  t755,  t754,  1(SI32)
	c0    shr $r0.9 = $r0.9, 15   ## bblock 17, line 457,  t768(SI17),  t767,  15(SI32)
	c0    add $r0.24 = $r0.24, $r0.23   ## bblock 17, line 467,  t1233,  t812,  t806(SI17)
;;								## 10
	c0    shl $r0.22 = $r0.22, 1   ## bblock 17, line 457,  t774,  t773,  1(SI32)
	c0    sub $r0.26 = $r0.26, $r0.9   ## bblock 17, line 466,  t1228,  t755,  t768(SI17)
	c0    shr $r0.18 = $r0.18, 15   ## bblock 17, line 459,  t800(SI17),  t799,  15(SI32)
	c0    add $r0.24 = $r0.24, $r0.20   ## bblock 17, line 467,  t1236,  t1233,  t1235
;;								## 11
	c0    mpyh $r0.25 = $r0.25, $r0.6   ## bblock 17, line 456,  t742,  t796(I16),  t864
	c0    mpyh $r0.17 = $r0.17, $r0.10   ## bblock 17, line 457,  t761,  t777(I16),  t883
	c0    shr $r0.8 = $r0.8, 15   ## bblock 17, line 456,  t749(SI17),  t748,  15(SI32)
	c0    add $r0.19 = $r0.19, $r0.18   ## bblock 17, line 467,  t1234,  t793,  t800(SI17)
;;								## 12
	c0    mpyhh $r0.9 = $r0.6, $r0.13   ## bblock 17, line 461,  t830,  t864,  t885
	c0    mpyh $r0.18 = $r0.21, $r0.14   ## bblock 17, line 462,  t843,  t878(I16),  t866
	c0    sub $r0.8 = $r0.8, $r0.22   ## bblock 17, line 466,  t1230,  t749(SI17),  t774
	c0    add $r0.24 = $r0.24, $r0.19   ## bblock 17, line 467,  t896,  t1236,  t1234
;;								## 13
	c0    mpyh $r0.8 = $r0.15, $r0.13   ## bblock 17, line 461,  t824,  t859(I16),  t885
	c0    shr $r0.25 = $r0.25, 15   ## bblock 17, line 456,  t743(SI17),  t742,  15(SI32)
	c0    shr $r0.17 = $r0.17, 15   ## bblock 17, line 457,  t762(SI17),  t761,  15(SI32)
	c0    add $r0.26 = $r0.26, $r0.8   ## bblock 17, line 466,  t1231,  t1228,  t1230
;;								## 14
	c0    shl $r0.9 = $r0.9, 1   ## bblock 17, line 461,  t831,  t830,  1(SI32)
	c0    mpyhh $r0.17 = $r0.10, $r0.14   ## bblock 17, line 462,  t849,  t883,  t866
	c0    sub $r0.25 = $r0.25, $r0.17   ## bblock 17, line 466,  t1229,  t743(SI17),  t762(SI17)
	c0    shr $r0.18 = $r0.18, 15   ## bblock 17, line 462,  t844(SI17),  t843,  15(SI32)
;;								## 15
	c0    zxth $r0.18 = $r0.13   ## bblock 17, line 461,  t872(I16),  t885
	c0    add $r0.26 = $r0.26, $r0.25   ## bblock 17, line 466,  t892,  t1231,  t1229
	c0    shr $r0.8 = $r0.8, 15   ## bblock 17, line 461,  t825(SI17),  t824,  15(SI32)
	c0    sub $r0.9 = $r0.9, $r0.18   ## bblock 17, line 469,  t1238,  t831,  t844(SI17)
;;								## 16
	c0    zxth $r0.20 = $r0.14   ## bblock 17, line 462,  t853(I16),  t866
	c0    mpyh $r0.19 = $r0.18, $r0.6   ## bblock 17, line 461,  t818,  t872(I16),  t864
	c0    mpyhh $r0.22 = $r0.10, $r0.13   ## bblock 17, line 464,  t887,  t883,  t885
	c0    shl $r0.17 = $r0.17, 1   ## bblock 17, line 462,  t850,  t849,  1(SI32)
;;								## 17
	c0    add $r0.2 = $r0.2, 1   ## bblock 17, line 443,  t720,  t1114(SI16),  1(SI32)
	c0    mpyh $r0.17 = $r0.20, $r0.10   ## bblock 17, line 462,  t837,  t853(I16),  t883
	c0    mpyh $r0.21 = $r0.21, $r0.13   ## bblock 17, line 464,  t881,  t878(I16),  t885
	c0    sub $r0.8 = $r0.8, $r0.17   ## bblock 17, line 469,  t1240,  t825(SI17),  t850
;;								## 18
	c0    mpyh $r0.20 = $r0.20, $r0.6   ## bblock 17, line 463,  t856,  t853(I16),  t864
	c0    shl $r0.22 = $r0.22, 1   ## bblock 17, line 464,  t888,  t887,  1(SI32)
	c0    shr $r0.19 = $r0.19, 15   ## bblock 17, line 461,  t819(SI17),  t818,  15(SI32)
	c0    add $r0.9 = $r0.9, $r0.8   ## bblock 17, line 469,  t1241,  t1238,  t1240
;;								## 19
	c0    mpyh $r0.18 = $r0.18, $r0.10   ## bblock 17, line 464,  t875,  t872(I16),  t883
	c0    mpyh $r0.15 = $r0.15, $r0.14   ## bblock 17, line 463,  t862,  t859(I16),  t866
	c0    shr $r0.17 = $r0.17, 15   ## bblock 17, line 462,  t838(SI17),  t837,  15(SI32)
	c0    shr $r0.21 = $r0.21, 15   ## bblock 17, line 464,  t882(SI17),  t881,  15(SI32)
;;								## 20
	c0    mpyhh $r0.6 = $r0.6, $r0.14   ## bblock 17, line 463,  t868,  t864,  t866
	c0    sub $r0.19 = $r0.19, $r0.17   ## bblock 17, line 469,  t1239,  t819(SI17),  t838(SI17)
	c0    shr $r0.20 = $r0.20, 15   ## bblock 17, line 463,  t857(SI17),  t856,  15(SI32)
	c0    add $r0.22 = $r0.22, $r0.21   ## bblock 17, line 470,  t1243,  t888,  t882(SI17)
;;								## 21
	c0    add $r0.9 = $r0.9, $r0.19   ## bblock 17, line 469,  t901,  t1241,  t1239
	c0    shr $r0.15 = $r0.15, 15   ## bblock 17, line 463,  t863(SI17),  t862,  15(SI32)
	c0    shr $r0.18 = $r0.18, 15   ## bblock 17, line 464,  t876(SI17),  t875,  15(SI32)
	c0    sxth $r0.2 = $r0.2   ## bblock 17, line 443,  t1114(SI16),  t720
;;								## 22
	c0    shl $r0.6 = $r0.6, 1   ## bblock 17, line 463,  t869,  t868,  1(SI32)
	c0    stw 0[$r0.11] = $r0.24   ## bblock 17, line 467, t1237, t896
	c0    add $r0.20 = $r0.20, $r0.15   ## bblock 17, line 470,  t1245,  t857(SI17),  t863(SI17)
;;								## 23
	c0    stw 0[$r0.12] = $r0.26   ## bblock 17, line 466, t1232, t892
	c0    add $r0.6 = $r0.6, $r0.18   ## bblock 17, line 470,  t1244,  t869,  t876(SI17)
	c0    add $r0.22 = $r0.22, $r0.20   ## bblock 17, line 470,  t1246,  t1243,  t1245
;;								## 24
	c0    stw 0[$r0.4] = $r0.9   ## bblock 17, line 469, t1242, t901
	c0    add $r0.22 = $r0.22, $r0.6   ## bblock 17, line 470,  t906,  t1246,  t1244
;;								## 25
	c0    stw 0[$r0.16] = $r0.22   ## bblock 17, line 470, t1247, t906
	c0    goto L8?3 ## goto
;;								## 26
.trace 19
L9?3:
	c0    mov $r0.2 = $r0.0   ## bblock 10, line 496,  t1125(SI16),  0(SI32)
	c0    mov $r0.5 = $r0.37   ## t1043
;;								## 0
;;								## 1
.trace 3
L10?3:
	c0    cmplt $b0.0 = $r0.2, 128   ## bblock 11, line 496,  t1203(I1),  t1125(SI16),  128(SI32)
	c0    sh2add $r0.4 = $r0.2, $r0.3   ## [spec] bblock 13, line 499,  t1204,  t1125(SI16),  t0
	c0    sh2add $r0.6 = $r0.2, $r0.5   ## [spec] bblock 13, line 499,  t1135,  t1125(SI16),  t1043
	c0    sh2add $r0.8 = $r0.2, $r0.7   ## [spec] bblock 13, line 500,  t1205,  t1125(SI16),  t1
;;								## 0
	c0    add $r0.9 = $r0.2, 128   ## [spec] bblock 13, line 500,  t1141,  t1125(SI16),  128(SI32)
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 13, line 496,  t1134,  t1125(SI16),  1(SI32)
	c0    ldw.d $r0.4 = 0[$r0.4]   ## [spec] bblock 13, line 499, t1137, t1204
;;								## 1
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 13, line 496,  t1138(SI16),  t1134
	c0    sh2add $r0.9 = $r0.9, $r0.5   ## [spec] bblock 13, line 500,  t1139,  t1141,  t1043
	c0    brf $b0.0, L11?3   ## bblock 11, line 496,  t1203(I1)
;;								## 2
	c0    cmplt $b0.0 = $r0.2, 128   ## bblock 13, line 496-1,  t1206(I1),  t1138(SI16),  128(SI32)
	c0    sh2add $r0.10 = $r0.2, $r0.3   ## [spec] bblock 41, line 499-1,  t1324,  t1138(SI16),  t0
	c0    sh2add $r0.11 = $r0.2, $r0.5   ## [spec] bblock 41, line 499-1,  t1015,  t1138(SI16),  t1043
	c0    sh2add $r0.12 = $r0.2, $r0.7   ## [spec] bblock 41, line 500-1,  t1325,  t1138(SI16),  t1
;;								## 3
	c0    stw 0[$r0.6] = $r0.4   ## bblock 13, line 499, t1135, t1137
	c0    add $r0.13 = $r0.2, 128   ## [spec] bblock 41, line 500-1,  t1019,  t1138(SI16),  128(SI32)
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 41, line 496-1,  t1008,  t1138(SI16),  1(SI32)
;;								## 4
	c0    ldw $r0.8 = 0[$r0.8]   ## bblock 13, line 500, t1142, t1205
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 41, line 496-1,  t1115(SI16),  t1008
	c0    sh2add $r0.13 = $r0.13, $r0.5   ## [spec] bblock 41, line 500-1,  t1022,  t1019,  t1043
;;								## 5
	c0    cmplt $b0.1 = $r0.2, 128   ## [spec] bblock 41, line 496-2,  t1326(I1),  t1115(SI16),  128(SI32)
	c0    sh2add $r0.4 = $r0.2, $r0.3   ## [spec] bblock 38, line 499-2,  t1321,  t1115(SI16),  t0
	c0    sh2add $r0.6 = $r0.2, $r0.5   ## [spec] bblock 38, line 499-2,  t1121,  t1115(SI16),  t1043
	c0    sh2add $r0.14 = $r0.2, $r0.7   ## [spec] bblock 38, line 500-2,  t1322,  t1115(SI16),  t1
;;								## 6
	c0    add $r0.15 = $r0.2, 128   ## [spec] bblock 38, line 500-2,  t1119,  t1115(SI16),  128(SI32)
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 38, line 496-2,  t1124,  t1115(SI16),  1(SI32)
;;								## 7
	c0    stw 0[$r0.9] = $r0.8   ## bblock 13, line 500, t1139, t1142
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 38, line 496-2,  t1116(SI16),  t1124
	c0    sh2add $r0.15 = $r0.15, $r0.5   ## [spec] bblock 38, line 500-2,  t1117,  t1119,  t1043
	c0    brf $b0.0, L12?3   ## bblock 13, line 496-1,  t1206(I1)
;;								## 8
	c0    ldw $r0.10 = 0[$r0.10]   ## bblock 41, line 499-1, t1011, t1324
	c0    cmplt $b0.0 = $r0.2, 128   ## [spec] bblock 38, line 496-3,  t1323(I1),  t1116(SI16),  128(SI32)
	c0    sh2add $r0.8 = $r0.2, $r0.3   ## [spec] bblock 35, line 499-3,  t1319,  t1116(SI16),  t0
	c0    sh2add $r0.9 = $r0.2, $r0.5   ## [spec] bblock 35, line 499-3,  t1130,  t1116(SI16),  t1043
;;								## 9
	c0    add $r0.17 = $r0.2, 128   ## [spec] bblock 35, line 500-3,  t1128,  t1116(SI16),  128(SI32)
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 35, line 496-3,  t1133,  t1116(SI16),  1(SI32)
	c0    sh2add $r0.16 = $r0.2, $r0.7   ## [spec] bblock 35, line 500-3,  t1320,  t1116(SI16),  t1
;;								## 10
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 35, line 496-3,  t1125(SI16),  t1133
	c0    sh2add $r0.17 = $r0.17, $r0.5   ## [spec] bblock 35, line 500-3,  t1126,  t1128,  t1043
;;								## 11
	c0    stw 0[$r0.11] = $r0.10   ## bblock 41, line 499-1, t1015, t1011
;;								## 12
	c0    ldw $r0.12 = 0[$r0.12]   ## bblock 41, line 500-1, t1017, t1325
	      xnop 2
;;								## 15
	c0    stw 0[$r0.13] = $r0.12   ## bblock 41, line 500-1, t1022, t1017
	c0    brf $b0.1, L13?3   ## bblock 41, line 496-2,  t1326(I1)
;;								## 16
	c0    ldw $r0.4 = 0[$r0.4]   ## bblock 38, line 499-2, t1123, t1321
	      xnop 2
;;								## 19
	c0    stw 0[$r0.6] = $r0.4   ## bblock 38, line 499-2, t1121, t1123
;;								## 20
	c0    ldw $r0.14 = 0[$r0.14]   ## bblock 38, line 500-2, t1120, t1322
	      xnop 2
;;								## 23
	c0    stw 0[$r0.15] = $r0.14   ## bblock 38, line 500-2, t1117, t1120
	c0    brf $b0.0, L14?3   ## bblock 38, line 496-3,  t1323(I1)
;;								## 24
	c0    ldw $r0.8 = 0[$r0.8]   ## bblock 35, line 499-3, t1132, t1319
	      xnop 2
;;								## 27
	c0    stw 0[$r0.9] = $r0.8   ## bblock 35, line 499-3, t1130, t1132
;;								## 28
	c0    ldw $r0.16 = 0[$r0.16]   ## bblock 35, line 500-3, t1129, t1320
	      xnop 2
;;								## 31
	c0    stw 0[$r0.17] = $r0.16   ## bblock 35, line 500-3, t1126, t1129
	c0    goto L10?3 ## goto
;;								## 32
.trace 27
L14?3:
.return ret()
	c0    return $r0.1 = $r0.1, (0x800), $l0.0   ## bblock 12, line 523,  t1024,  ?2.1?2auto_size(I32),  t1023
;;								## 0
.trace 26
L13?3:
.return ret()
	c0    return $r0.1 = $r0.1, (0x800), $l0.0   ## bblock 12, line 523,  t1024,  ?2.1?2auto_size(I32),  t1023
;;								## 0
.trace 25
L12?3:
.return ret()
	c0    return $r0.1 = $r0.1, (0x800), $l0.0   ## bblock 12, line 523,  t1024,  ?2.1?2auto_size(I32),  t1023
;;								## 0
.trace 20
L11?3:
.return ret()
	c0    return $r0.1 = $r0.1, (0x800), $l0.0   ## bblock 12, line 523,  t1024,  ?2.1?2auto_size(I32),  t1023
;;								## 0
.trace 24
L7?3:
	c0    mov $r0.2 = $r0.0   ## bblock 8, line 477,  t1113(SI16),  0(SI32)
	c0    mov $r0.5 = $r0.37   ## t1043
;;								## 0
.trace 10
L15?3:
	c0    sh2add $r0.8 = $r0.2, $r0.3   ## [spec] bblock 14, line 479,  t1207,  t1113(SI16),  t0
	c0    sh2add $r0.6 = $r0.2, $r0.7   ## [spec] bblock 14, line 480,  t1208,  t1113(SI16),  t1
	c0    sh2add $r0.4 = $r0.2, (zsin1_fixed + 0)   ## [spec] bblock 14, line 482,  t1210,  t1113(SI16),  addr(zsin1_fixed?1.0)(P32)
;;								## 0
	c0    cmplt $b0.0 = $r0.2, 128   ## bblock 9, line 477,  t1202(I1),  t1113(SI16),  128(SI32)
	c0    sh2add $r0.9 = $r0.2, (zcos1_fixed + 0)   ## [spec] bblock 14, line 481,  t1209,  t1113(SI16),  addr(zcos1_fixed?1.0)(P32)
	c0    ldw.d $r0.4 = 0[$r0.4]   ## [spec] bblock 14, line 482, t991, t1210
;;								## 1
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 14, line 477,  t910,  t1113(SI16),  1(SI32)
	c0    ldw.d $r0.6 = 0[$r0.6]   ## [spec] bblock 14, line 480, t974, t1208
	c0    sh2add $r0.10 = $r0.2, $r0.3   ## [spec] bblock 14, line 490,  t1215,  t1113(SI16),  t0
	c0    sh2add $r0.11 = $r0.2, $r0.7   ## [spec] bblock 14, line 491,  t1220,  t1113(SI16),  t1
;;								## 2
	c0    ldw.d $r0.9 = 0[$r0.9]   ## [spec] bblock 14, line 481, t972, t1209
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 14, line 477,  t1113(SI16),  t910
	c0    brf $b0.0, L16?3   ## bblock 9, line 477,  t1202(I1)
;;								## 3
	c0    ldw $r0.8 = 0[$r0.8]   ## bblock 14, line 479, t993, t1207
	c0    zxth $r0.12 = $r0.4   ## bblock 14, line 486,  t986(I16),  t991
;;								## 4
	c0    zxth $r0.15 = $r0.6   ## bblock 14, line 486,  t961(I16),  t974
	c0    mpyh $r0.13 = $r0.12, $r0.6   ## bblock 14, line 486,  t951,  t986(I16),  t974
	c0    mpyhh $r0.14 = $r0.4, $r0.6   ## bblock 14, line 486,  t957,  t991,  t974
;;								## 5
	c0    zxth $r0.16 = $r0.9   ## bblock 14, line 485,  t967(I16),  t972
	c0    mpyh $r0.15 = $r0.15, $r0.9   ## bblock 14, line 487,  t964,  t961(I16),  t972
	c0    mpyh $r0.17 = $r0.15, $r0.4   ## bblock 14, line 486,  t945,  t961(I16),  t991
;;								## 6
	c0    mpyh $r0.19 = $r0.16, $r0.8   ## bblock 14, line 485,  t932,  t967(I16),  t993
	c0    mpyhh $r0.18 = $r0.9, $r0.8   ## bblock 14, line 485,  t938,  t972,  t993
	c0    shl $r0.14 = $r0.14, 1   ## bblock 14, line 486,  t958,  t957,  1(SI32)
	c0    shr $r0.13 = $r0.13, 15   ## bblock 14, line 486,  t952(SI17),  t951,  15(SI32)
;;								## 7
	c0    zxth $r0.20 = $r0.8   ## bblock 14, line 485,  t980(I16),  t993
	c0    mpyh $r0.12 = $r0.12, $r0.8   ## bblock 14, line 488,  t989,  t986(I16),  t993
	c0    mpyhh $r0.8 = $r0.8, $r0.4   ## bblock 14, line 488,  t995,  t993,  t991
	c0    shr $r0.17 = $r0.17, 15   ## bblock 14, line 486,  t946(SI17),  t945,  15(SI32)
;;								## 8
	c0    mpyh $r0.21 = $r0.20, $r0.9   ## bblock 14, line 485,  t926,  t980(I16),  t972
	c0    shl $r0.18 = $r0.18, 1   ## bblock 14, line 485,  t939,  t938,  1(SI32)
	c0    shr $r0.19 = $r0.19, 15   ## bblock 14, line 485,  t933(SI17),  t932,  15(SI32)
	c0    shr $r0.15 = $r0.15, 15   ## bblock 14, line 487,  t965(SI17),  t964,  15(SI32)
;;								## 9
	c0    shl $r0.8 = $r0.8, 1   ## bblock 14, line 488,  t996,  t995,  1(SI32)
	c0    sub $r0.18 = $r0.18, $r0.13   ## bblock 14, line 490,  t1211,  t939,  t952(SI17)
	c0    sub $r0.19 = $r0.19, $r0.14   ## bblock 14, line 490,  t1213,  t933(SI17),  t958
	c0    shr $r0.12 = $r0.12, 15   ## bblock 14, line 488,  t990(SI17),  t989,  15(SI32)
;;								## 10
	c0    mpyh $r0.16 = $r0.16, $r0.6   ## bblock 14, line 487,  t970,  t967(I16),  t974
	c0    shr $r0.21 = $r0.21, 15   ## bblock 14, line 485,  t927(SI17),  t926,  15(SI32)
	c0    add $r0.18 = $r0.18, $r0.19   ## bblock 14, line 490,  t1214,  t1211,  t1213
	c0    add $r0.8 = $r0.8, $r0.12   ## bblock 14, line 491,  t1216,  t996,  t990(SI17)
;;								## 11
	c0    mpyh $r0.20 = $r0.20, $r0.4   ## bblock 14, line 488,  t983,  t980(I16),  t991
	c0    mpyhh $r0.9 = $r0.9, $r0.6   ## bblock 14, line 487,  t976,  t972,  t974
	c0    sub $r0.21 = $r0.21, $r0.17   ## bblock 14, line 490,  t1212,  t927(SI17),  t946(SI17)
;;								## 12
	c0    add $r0.18 = $r0.18, $r0.21   ## bblock 14, line 490,  t1000,  t1214,  t1212
	c0    shr $r0.16 = $r0.16, 15   ## bblock 14, line 487,  t971(SI17),  t970,  15(SI32)
;;								## 13
	c0    shl $r0.9 = $r0.9, 1   ## bblock 14, line 487,  t977,  t976,  1(SI32)
	c0    stw 0[$r0.10] = $r0.18   ## bblock 14, line 490, t1215, t1000
	c0    shr $r0.20 = $r0.20, 15   ## bblock 14, line 488,  t984(SI17),  t983,  15(SI32)
	c0    add $r0.15 = $r0.15, $r0.16   ## bblock 14, line 491,  t1218,  t965(SI17),  t971(SI17)
;;								## 14
	c0    add $r0.9 = $r0.9, $r0.20   ## bblock 14, line 491,  t1217,  t977,  t984(SI17)
	c0    add $r0.8 = $r0.8, $r0.15   ## bblock 14, line 491,  t1219,  t1216,  t1218
;;								## 15
	c0    add $r0.8 = $r0.8, $r0.9   ## bblock 14, line 491,  t1004,  t1219,  t1217
;;								## 16
	c0    stw 0[$r0.11] = $r0.8   ## bblock 14, line 491, t1220, t1004
	c0    goto L15?3 ## goto
;;								## 17
.trace 23
L16?3:
	c0    mov $r0.2 = $r0.0   ## bblock 10, line 496,  t1125(SI16),  0(SI32)
;;								## 0
	c0    goto L10?3 ## goto
;;								## 1
.trace 21
L0?3:
	c0    mov $r0.8 = 128   ## bblock 1, line 304,  t1063(SI16),  128(SI32)
	c0    mov $r0.12 = 4   ## bblock 1, line 305,  t1062(SI16),  4(SI32)
	c0    mov $r0.15 = 1   ## bblock 1, line 306,  t1061(SI16),  1(SI32)
	c0    mov $r0.26 = $r0.3   ## bblock 1, line 307,  t1060,  t0
;;								## 0
	c0    mov $r0.27 = $r0.7   ## bblock 1, line 308,  t1059,  t1
	c0    mov $r0.2 = $r0.0   ## bblock 1, line 310,  t1109(SI16),  0(SI32)
;;								## 1
.trace 8
L17?3:
	c0    shl $r0.9 = $r0.2, 1   ## [spec] bblock 20, line 314,  t238,  t1109(SI16),  1(SI32)
	c0    sub $r0.4 = 127, $r0.2   ## [spec] bblock 20, line 315,  t244,  127(SI32),  t1109(SI16)
	c0    sh2add $r0.6 = $r0.2, (zcos1_fixed + 0)   ## [spec] bblock 20, line 316,  t1282,  t1109(SI16),  addr(zcos1_fixed?1.0)(P32)
;;								## 0
	c0    sh1add $r0.4 = $r0.4, 1   ## [spec] bblock 20, line 315,  t246,  t244,  1(SI32)
	c0    ldw.d $r0.6 = 0[$r0.6]   ## [spec] bblock 20, line 316, t307, t1282
	c0    sh2add $r0.10 = $r0.2, (zsin1_fixed + 0)   ## [spec] bblock 20, line 317,  t1283,  t1109(SI16),  addr(zsin1_fixed?1.0)(P32)
;;								## 1
	c0    cmplt $b0.0 = $r0.2, 128   ## bblock 2, line 310,  t1197(I1),  t1109(SI16),  128(SI32)
	c0    sh2add $r0.9 = $r0.9, $r0.5   ## [spec] bblock 20, line 314,  t241,  t238,  t1043
	c0    sh2add $r0.4 = $r0.4, $r0.5   ## [spec] bblock 20, line 315,  t249,  t246,  t1043
	c0    ldw.d $r0.10 = 0[$r0.10]   ## [spec] bblock 20, line 317, t326, t1283
;;								## 2
	c0    add $r0.2 = $r0.2, 1   ## [spec] bblock 20, line 310,  t235,  t1109(SI16),  1(SI32)
	c0    ldw.d $r0.4 = 0[$r0.4]   ## [spec] bblock 20, line 315, t328, t249
	c0    sh1add $r0.11 = $r0.2, (bitrev + 0)   ## [spec] bblock 20, line 325,  t1292,  t1109(SI16),  addr(bitrev?1.0)(P32)
;;								## 3
	c0    ldw.d $r0.9 = 0[$r0.9]   ## [spec] bblock 20, line 314, t309, t241
	c0    zxth $r0.13 = $r0.6   ## [spec] bblock 20, line 320,  t302(I16),  t307
	c0    sxth $r0.2 = $r0.2   ## [spec] bblock 20, line 310,  t1109(SI16),  t235
	c0    brf $b0.0, L18?3   ## bblock 2, line 310,  t1197(I1)
;;								## 4
	c0    zxth $r0.14 = $r0.10   ## bblock 20, line 321,  t321(I16),  t326
	c0    ldh $r0.11 = 0[$r0.11]   ## bblock 20, line 325, t343(SI16), t1292
;;								## 5
	c0    zxth $r0.18 = $r0.4   ## bblock 20, line 320,  t315(I16),  t328
	c0    mpyh $r0.17 = $r0.13, $r0.4   ## bblock 20, line 320,  t267,  t302(I16),  t328
	c0    mpyhh $r0.16 = $r0.6, $r0.4   ## bblock 20, line 320,  t273,  t307,  t328
;;								## 6
	c0    zxth $r0.21 = $r0.9   ## bblock 20, line 321,  t296(I16),  t309
	c0    mpyh $r0.19 = $r0.14, $r0.9   ## bblock 20, line 321,  t286,  t321(I16),  t309
	c0    mpyhh $r0.20 = $r0.10, $r0.9   ## bblock 20, line 321,  t292,  t326,  t309
;;								## 7
	c0    mpyh $r0.22 = $r0.18, $r0.6   ## bblock 20, line 320,  t261,  t315(I16),  t307
	c0    shl $r0.16 = $r0.16, 1   ## bblock 20, line 320,  t274,  t273,  1(SI32)
	c0    mpyh $r0.23 = $r0.21, $r0.10   ## bblock 20, line 321,  t280,  t296(I16),  t326
	c0    shr $r0.17 = $r0.17, 15   ## bblock 20, line 320,  t268(SI17),  t267,  15(SI32)
;;								## 8
	c0    mpyhh $r0.25 = $r0.4, $r0.10   ## bblock 20, line 323,  t330,  t328,  t326
	c0    shl $r0.20 = $r0.20, 1   ## bblock 20, line 321,  t293,  t292,  1(SI32)
	c0    shr $r0.19 = $r0.19, 15   ## bblock 20, line 321,  t287(SI17),  t286,  15(SI32)
	c0    sh2add $r0.24 = $r0.11, $r0.3   ## bblock 20, line 327,  t1293,  t343(SI16),  t0
;;								## 9
	c0    shr $r0.22 = $r0.22, 15   ## bblock 20, line 320,  t262(SI17),  t261,  15(SI32)
	c0    shr $r0.23 = $r0.23, 15   ## bblock 20, line 321,  t281(SI17),  t280,  15(SI32)
	c0    sub $r0.16 = $r0.16, $r0.19   ## bblock 20, line 327,  t1284,  t274,  t287(SI17)
	c0    sub $r0.17 = $r0.17, $r0.20   ## bblock 20, line 327,  t1286,  t268(SI17),  t293
;;								## 10
	c0    mpyh $r0.14 = $r0.14, $r0.4   ## bblock 20, line 323,  t324,  t321(I16),  t328
	c0    shl $r0.25 = $r0.25, 1   ## bblock 20, line 323,  t331,  t330,  1(SI32)
	c0    sub $r0.22 = $r0.22, $r0.23   ## bblock 20, line 327,  t1285,  t262(SI17),  t281(SI17)
	c0    add $r0.16 = $r0.16, $r0.17   ## bblock 20, line 327,  t1287,  t1284,  t1286
;;								## 11
	c0    mpyh $r0.21 = $r0.21, $r0.6   ## bblock 20, line 322,  t299,  t296(I16),  t307
	c0    mpyh $r0.13 = $r0.13, $r0.9   ## bblock 20, line 322,  t305,  t302(I16),  t309
	c0    add $r0.16 = $r0.16, $r0.22   ## bblock 20, line 327,  t338,  t1287,  t1285
	c0    sh2add $r0.11 = $r0.11, $r0.7   ## bblock 20, line 328,  t1294,  t343(SI16),  t1
;;								## 12
	c0    mpyh $r0.18 = $r0.18, $r0.10   ## bblock 20, line 323,  t318,  t315(I16),  t326
	c0    mpyhh $r0.6 = $r0.6, $r0.9   ## bblock 20, line 322,  t311,  t307,  t309
	c0    shr $r0.14 = $r0.14, 15   ## bblock 20, line 323,  t325(SI17),  t324,  15(SI32)
	c0    stw 0[$r0.24] = $r0.16   ## bblock 20, line 327, t1293, t338
;;								## 13
	c0    shr $r0.21 = $r0.21, 15   ## bblock 20, line 322,  t300(SI17),  t299,  15(SI32)
	c0    shr $r0.13 = $r0.13, 15   ## bblock 20, line 322,  t306(SI17),  t305,  15(SI32)
	c0    add $r0.25 = $r0.25, $r0.14   ## bblock 20, line 328,  t1288,  t331,  t325(SI17)
;;								## 14
	c0    shl $r0.6 = $r0.6, 1   ## bblock 20, line 322,  t312,  t311,  1(SI32)
	c0    shr $r0.18 = $r0.18, 15   ## bblock 20, line 323,  t319(SI17),  t318,  15(SI32)
	c0    add $r0.21 = $r0.21, $r0.13   ## bblock 20, line 328,  t1290,  t300(SI17),  t306(SI17)
;;								## 15
	c0    add $r0.6 = $r0.6, $r0.18   ## bblock 20, line 328,  t1289,  t312,  t319(SI17)
	c0    add $r0.25 = $r0.25, $r0.21   ## bblock 20, line 328,  t1291,  t1288,  t1290
;;								## 16
	c0    add $r0.25 = $r0.25, $r0.6   ## bblock 20, line 328,  t342,  t1291,  t1289
;;								## 17
	c0    stw 0[$r0.11] = $r0.25   ## bblock 20, line 328, t1294, t342
	c0    goto L17?3 ## goto
;;								## 18
.trace 22
L18?3:
	c0    mov $r0.30 = $r0.8   ## t1063(SI16)
	c0    mov $r0.8 = $r0.27   ## t1059
	c0    mov $r0.36 = $r0.26   ## t1060
;;								## 0
	c0    goto L2?3 ## goto
;;								## 1
.endp
.section .bss
.section .data
.equ _?1PACKET.34, 0x0
.equ _?1PACKET.35, 0x400
.section .data
.section .text
.equ ?2.1?2auto_size, 0x800
 ## End itver2
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 3
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    ldh $r0.3 = ((bswitch + 0) + 0)[$r0.0]   ## bblock 0, line 538, t0(SI16), 0(I32)
;;								## 0
	c0    mov $r0.4 = (tcbuf + 0)   ## addr(tcbuf?1.0)(P32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t16
;;								## 1
	c0    ldh $r0.5 = ((acmod + 0) + 0)[$r0.0]   ## bblock 0, line 538, t3(SI16), 0(I32)
;;								## 2
	c0    ldh $r0.6 = ((channum + 0) + 0)[$r0.0]   ## bblock 0, line 538, t4(SI16), 0(I32)
;;								## 3
	c0    ldw $r0.7 = ((slct + 0) + 0)[$r0.0]   ## bblock 0, line 538, t5, 0(I32)
	      xnop 1
;;								## 5
.call itver2, caller, arg($r0.3:s32,$r0.4:u32,$r0.5:s32,$r0.6:s32,$r0.7:s32), ret()
	c0    call $l0.0 = itver2   ## bblock 0, line 538,  raddr(itver2)(P32),  t0(SI16),  addr(tcbuf?1.0)(P32),  t3(SI16),  t4(SI16),  t5
;;								## 6
	c0    mov $r0.3 = (tcbuf + 0)   ## bblock 1, line 0,  t41,  addr(tcbuf?1.0)(P32)
	c0    mov $r0.5 = (tcbuf_out + 0)   ## bblock 1, line 0,  t42,  addr(tcbuf_out?1.0)(P32)
;;								## 7
	c0    mov $r0.2 = $r0.0   ## bblock 1, line 539,  t27,  0(SI32)
	c0    ldw $r0.9 = 0x10[$r0.1]  ## restore ## t16
	      xnop 1
;;								## 9
;;								## 10
.trace 1
L19?3:
	c0    cmplt $b0.0 = $r0.2, 256   ## bblock 2, line 539,  t62(I1),  t27,  256(SI32)
	c0    ldw.d $r0.4 = 0[$r0.3]   ## [spec] bblock 4, line 541, t30, t41
;;								## 0
	c0    ldw.d $r0.6 = 0[$r0.5]   ## [spec] bblock 4, line 541, t29, t42
;;								## 1
	c0    ldw.d $r0.7 = 4[$r0.3]   ## [spec] bblock 5, line 541-1, t35, t41
	c0    brf $b0.0, L20?3   ## bblock 2, line 539,  t62(I1)
;;								## 2
	c0    ldw.d $r0.8 = 4[$r0.5]   ## [spec] bblock 5, line 541-1, t36, t42
;;								## 3
	c0    cmpne $b0.0 = $r0.4, $r0.6   ## bblock 4, line 541,  t63(I1),  t30,  t29
	c0    ldw.d $r0.4 = 8[$r0.3]   ## [spec] bblock 19, line 541-2, t32, t41
;;								## 4
	c0    ldw.d $r0.6 = 8[$r0.5]   ## [spec] bblock 19, line 541-2, t33, t42
;;								## 5
	c0    cmpne $b0.0 = $r0.7, $r0.8   ## [spec] bblock 5, line 541-1,  t64(I1),  t35,  t36
	c0    ldw.d $r0.7 = 12[$r0.3]   ## [spec] bblock 14, line 541-3, t11, t41
	c0    add $r0.3 = $r0.3, 16   ## [spec] bblock 9, line 0,  t41,  t41,  16(I32)
	c0    br $b0.0, L21?3   ## bblock 4, line 541,  t63(I1)
;;								## 6
	c0    ldw.d $r0.8 = 12[$r0.5]   ## [spec] bblock 14, line 541-3, t14, t42
	c0    add $r0.5 = $r0.5, 16   ## [spec] bblock 9, line 0,  t42,  t42,  16(I32)
;;								## 7
	c0    cmpne $b0.0 = $r0.4, $r0.6   ## [spec] bblock 19, line 541-2,  t66(I1),  t32,  t33
	c0    br $b0.0, L22?3   ## bblock 5, line 541-1,  t64(I1)
;;								## 8
;;								## 9
	c0    cmpne $b0.0 = $r0.7, $r0.8   ## [spec] bblock 14, line 541-3,  t65(I1),  t11,  t14
	c0    br $b0.0, L23?3   ## bblock 19, line 541-2,  t66(I1)
;;								## 10
;;								## 11
	c0    br $b0.0, L24?3   ## bblock 14, line 541-3,  t65(I1)
;;								## 12
	c0    add $r0.2 = $r0.2, 4   ## bblock 9, line 539-3,  t27,  t27,  4(SI32)
	c0    goto L19?3 ## goto
;;								## 13
.trace 8
L24?3:
	c0    add $r0.3 = $r0.2, 3   ## bblock 11, line 0,  t31,  t27,  3(I32)
	c0    stw 0x10[$r0.1] = $r0.9  ## spill ## t16
	c0    mov $l0.0 = $r0.9   ## t16
	      xnop 1
;;								## 1
	c0    goto L25?3 ## goto
;;								## 2
.trace 7
L23?3:
	c0    add $r0.3 = $r0.2, 2   ## bblock 16, line 0,  t31,  t27,  2(I32)
	c0    stw 0x10[$r0.1] = $r0.9  ## spill ## t16
	c0    mov $l0.0 = $r0.9   ## t16
	      xnop 1
;;								## 1
	c0    goto L25?3 ## goto
;;								## 2
.trace 6
L22?3:
	c0    add $r0.3 = $r0.2, 1   ## bblock 21, line 0,  t31,  t27,  1(I32)
	c0    stw 0x10[$r0.1] = $r0.9  ## spill ## t16
	c0    mov $l0.0 = $r0.9   ## t16
	      xnop 1
;;								## 1
	c0    goto L25?3 ## goto
;;								## 2
.trace 4
L21?3:
	c0    mov $r0.3 = $r0.2   ## bblock 23, line 0,  t31,  t27
	c0    mov $l0.0 = $r0.9   ## t16
	c0    stw 0x10[$r0.1] = $r0.9  ## spill ## t16
	      xnop 2
;;								## 2
L25?3:
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 6, line 545,  t17,  ?2.2?2auto_size(I32),  t16
;;								## 3
.trace 5
L20?3:
	c0    mov $r0.3 = -1   ## -1(SI32)
	c0    mov $l0.0 = $r0.9   ## t16
	c0    stw 0x10[$r0.1] = $r0.9  ## spill ## t16
	      xnop 2
;;								## 2
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 551,  t17,  ?2.2?2auto_size(I32),  t16
;;								## 3
.endp
.section .bss
.section .data
.equ ?2.2?2scratch.0, 0x0
.equ ?2.2?2ras_p, 0x10
.section .data
.section .text
.equ ?2.2?2auto_size, 0x20
 ## End main
.section .bss
.section .data
zcos2_fixed::
    .data4 -2147473541
    .data4 -2146665075
    .data4 -2144563538
    .data4 -2141170197
    .data4 -2136487094
    .data4 -2130517052
    .data4 -2123263665
    .data4 -2114731305
    .data4 -2104925109
    .data4 -2093850984
    .data4 -2081515603
    .data4 -2067926394
    .data4 -2053091544
    .data4 -2037019988
    .data4 -2019721407
    .data4 -2001206222
    .data4 -1981485585
    .data4 -1960571375
    .data4 -1938476190
    .data4 -1915213340
    .data4 -1890796836
    .data4 -1865241388
    .data4 -1838562387
    .data4 -1810775906
    .data4 -1781898681
    .data4 -1751948107
    .data4 -1720942224
    .data4 -1688899711
    .data4 -1655839867
    .data4 -1621782607
    .data4 -1586748446
    .data4 -1550758488
    .data4 -1513834410
    .data4 -1475998455
    .data4 -1437273414
    .data4 -1397682613
    .data4 -1357249900
    .data4 -1315999631
    .data4 -1273956653
    .data4 -1231146290
    .data4 -1187594332
    .data4 -1143327011
    .data4 -1098370992
    .data4 -1052753356
    .data4 -1006501581
    .data4 -959643527
    .data4 -912207419
    .data4 -864221832
    .data4 -815715669
    .data4 -766718151
    .data4 -717258789
    .data4 -667367378
    .data4 -617073970
    .data4 -566408860
    .data4 -515402566
    .data4 -464085812
    .data4 -412489511
    .data4 -360644742
    .data4 -308582733
    .data4 -256334846
    .data4 -203932553
    .data4 -151407418
    .data4 -98791081
    .data4 -46115236
zsin2_fixed::
    .data4 -6588386
    .data4 -59288041
    .data4 -111951983
    .data4 -164548489
    .data4 -217045877
    .data4 -269412525
    .data4 -321616889
    .data4 -373627523
    .data4 -425413097
    .data4 -476942419
    .data4 -528184448
    .data4 -579108319
    .data4 -629683357
    .data4 -679879097
    .data4 -729665303
    .data4 -779011986
    .data4 -827889421
    .data4 -876268167
    .data4 -924119081
    .data4 -971413341
    .data4 -1018122458
    .data4 -1064218296
    .data4 -1109673088
    .data4 -1154459455
    .data4 -1198550419
    .data4 -1241919421
    .data4 -1284540337
    .data4 -1326387494
    .data4 -1367435684
    .data4 -1407660183
    .data4 -1447036759
    .data4 -1485541695
    .data4 -1523151796
    .data4 -1559844408
    .data4 -1595597427
    .data4 -1630389318
    .data4 -1664199124
    .data4 -1697006478
    .data4 -1728791619
    .data4 -1759535401
    .data4 -1789219304
    .data4 -1817825449
    .data4 -1845336603
    .data4 -1871736196
    .data4 -1897008325
    .data4 -1921137766
    .data4 -1944109987
    .data4 -1965911148
    .data4 -1986528118
    .data4 -2005948477
    .data4 -2024160528
    .data4 -2041153301
    .data4 -2056916559
    .data4 -2071440808
    .data4 -2084717298
    .data4 -2096738032
    .data4 -2107495770
    .data4 -2116984031
    .data4 -2125197100
    .data4 -2132130029
    .data4 -2137778644
    .data4 -2142139540
    .data4 -2145210092
    .data4 -2146988449
bitrev::
    .data2 0
    .data2 64
    .data2 32
    .data2 96
    .data2 16
    .data2 80
    .data2 48
    .data2 112
    .data2 8
    .data2 72
    .data2 40
    .data2 104
    .data2 24
    .data2 88
    .data2 56
    .data2 120
    .data2 4
    .data2 68
    .data2 36
    .data2 100
    .data2 20
    .data2 84
    .data2 52
    .data2 116
    .data2 12
    .data2 76
    .data2 44
    .data2 108
    .data2 28
    .data2 92
    .data2 60
    .data2 124
    .data2 2
    .data2 66
    .data2 34
    .data2 98
    .data2 18
    .data2 82
    .data2 50
    .data2 114
    .data2 10
    .data2 74
    .data2 42
    .data2 106
    .data2 26
    .data2 90
    .data2 58
    .data2 122
    .data2 6
    .data2 70
    .data2 38
    .data2 102
    .data2 22
    .data2 86
    .data2 54
    .data2 118
    .data2 14
    .data2 78
    .data2 46
    .data2 110
    .data2 30
    .data2 94
    .data2 62
    .data2 126
    .data2 1
    .data2 65
    .data2 33
    .data2 97
    .data2 17
    .data2 81
    .data2 49
    .data2 113
    .data2 9
    .data2 73
    .data2 41
    .data2 105
    .data2 25
    .data2 89
    .data2 57
    .data2 121
    .data2 5
    .data2 69
    .data2 37
    .data2 101
    .data2 21
    .data2 85
    .data2 53
    .data2 117
    .data2 13
    .data2 77
    .data2 45
    .data2 109
    .data2 29
    .data2 93
    .data2 61
    .data2 125
    .data2 3
    .data2 67
    .data2 35
    .data2 99
    .data2 19
    .data2 83
    .data2 51
    .data2 115
    .data2 11
    .data2 75
    .data2 43
    .data2 107
    .data2 27
    .data2 91
    .data2 59
    .data2 123
    .data2 7
    .data2 71
    .data2 39
    .data2 103
    .data2 23
    .data2 87
    .data2 55
    .data2 119
    .data2 15
    .data2 79
    .data2 47
    .data2 111
    .data2 31
    .data2 95
    .data2 63
    .data2 127
zcos1_fixed::
    .data4 -2147481121
    .data4 -2147278995
    .data4 -2146753496
    .data4 -2145904704
    .data4 -2144732747
    .data4 -2143237801
    .data4 -2141420092
    .data4 -2139279892
    .data4 -2136817525
    .data4 -2134033360
    .data4 -2130927818
    .data4 -2127501367
    .data4 -2123754521
    .data4 -2119687846
    .data4 -2115301954
    .data4 -2110597505
    .data4 -2105575207
    .data4 -2100235818
    .data4 -2094580141
    .data4 -2088609028
    .data4 -2082323378
    .data4 -2075724138
    .data4 -2068812302
    .data4 -2061588910
    .data4 -2054055050
    .data4 -2046211857
    .data4 -2038060512
    .data4 -2029602243
    .data4 -2020838323
    .data4 -2011770072
    .data4 -2002398856
    .data4 -1992726086
    .data4 -1982753219
    .data4 -1972481757
    .data4 -1961913246
    .data4 -1951049278
    .data4 -1939891490
    .data4 -1928441560
    .data4 -1916701215
    .data4 -1904672221
    .data4 -1892356391
    .data4 -1879755579
    .data4 -1866871683
    .data4 -1853706643
    .data4 -1840262441
    .data4 -1826541102
    .data4 -1812544693
    .data4 -1798275322
    .data4 -1783735137
    .data4 -1768926328
    .data4 -1753851125
    .data4 -1738511799
    .data4 -1722910659
    .data4 -1707050055
    .data4 -1690932376
    .data4 -1674560048
    .data4 -1657935538
    .data4 -1641061349
    .data4 -1623940022
    .data4 -1606574136
    .data4 -1588966305
    .data4 -1571119182
    .data4 -1553035455
    .data4 -1534717846
    .data4 -1516169114
    .data4 -1497392052
    .data4 -1478389489
    .data4 -1459164286
    .data4 -1439719338
    .data4 -1420057573
    .data4 -1400181953
    .data4 -1380095471
    .data4 -1359801152
    .data4 -1339302051
    .data4 -1318601257
    .data4 -1297701886
    .data4 -1276607086
    .data4 -1255320033
    .data4 -1233843934
    .data4 -1212182023
    .data4 -1190337562
    .data4 -1168313840
    .data4 -1146114174
    .data4 -1123741907
    .data4 -1101200410
    .data4 -1078493075
    .data4 -1055623324
    .data4 -1032594599
    .data4 -1009410370
    .data4 -986074127
    .data4 -962589385
    .data4 -938959680
    .data4 -915188572
    .data4 -891279639
    .data4 -867236484
    .data4 -843062725
    .data4 -818762004
    .data4 -794337981
    .data4 -769794334
    .data4 -745134758
    .data4 -720362968
    .data4 -695482693
    .data4 -670497682
    .data4 -645411696
    .data4 -620228513
    .data4 -594951927
    .data4 -569585742
    .data4 -544133781
    .data4 -518599874
    .data4 -492987869
    .data4 -467301621
    .data4 -441544999
    .data4 -415721883
    .data4 -389836160
    .data4 -363891729
    .data4 -337892498
    .data4 -311842381
    .data4 -285745301
    .data4 -259605190
    .data4 -233425983
    .data4 -207211623
    .data4 -180966058
    .data4 -154693239
    .data4 -128397125
    .data4 -102081674
    .data4 -75750851
    .data4 -49408619
    .data4 -23058947
zsin1_fixed::
    .data4 -3294197
    .data4 -29646846
    .data4 -55995030
    .data4 -82334781
    .data4 -108662133
    .data4 -134973121
    .data4 -161263783
    .data4 -187530158
    .data4 -213768293
    .data4 -239974235
    .data4 -266144037
    .data4 -292273759
    .data4 -318359466
    .data4 -344397229
    .data4 -370383127
    .data4 -396313247
    .data4 -422183683
    .data4 -447990540
    .data4 -473729932
    .data4 -499397981
    .data4 -524990823
    .data4 -550504603
    .data4 -575935480
    .data4 -601279622
    .data4 -626533214
    .data4 -651692452
    .data4 -676753548
    .data4 -701712728
    .data4 -726566232
    .data4 -751310317
    .data4 -775941259
    .data4 -800455346
    .data4 -824848887
    .data4 -849118210
    .data4 -873259658
    .data4 -897269597
    .data4 -921144410
    .data4 -944880502
    .data4 -968474299
    .data4 -991922247
    .data4 -1015220815
    .data4 -1038366495
    .data4 -1061355800
    .data4 -1084185270
    .data4 -1106851464
    .data4 -1129350972
    .data4 -1151680403
    .data4 -1173836395
    .data4 -1195815612
    .data4 -1217614743
    .data4 -1239230506
    .data4 -1260659645
    .data4 -1281898934
    .data4 -1302945174
    .data4 -1323795194
    .data4 -1344445856
    .data4 -1364894050
    .data4 -1385136695
    .data4 -1405170744
    .data4 -1424993180
    .data4 -1444601016
    .data4 -1463991301
    .data4 -1483161115
    .data4 -1502107569
    .data4 -1520827812
    .data4 -1539319024
    .data4 -1557578420
    .data4 -1575603250
    .data4 -1593390801
    .data4 -1610938392
    .data4 -1628243383
    .data4 -1645303165
    .data4 -1662115171
    .data4 -1678676869
    .data4 -1694985764
    .data4 -1711039401
    .data4 -1726835361
    .data4 -1742371266
    .data4 -1757644777
    .data4 -1772653592
    .data4 -1787395453
    .data4 -1801868138
    .data4 -1816069469
    .data4 -1829997306
    .data4 -1843649553
    .data4 -1857024152
    .data4 -1870119091
    .data4 -1882932396
    .data4 -1895462139
    .data4 -1907706432
    .data4 -1919663432
    .data4 -1931331337
    .data4 -1942708391
    .data4 -1953792881
    .data4 -1964583136
    .data4 -1975077532
    .data4 -1985274489
    .data4 -1995172471
    .data4 -2004769987
    .data4 -2014065592
    .data4 -2023057886
    .data4 -2031745515
    .data4 -2040127171
    .data4 -2048201591
    .data4 -2055967560
    .data4 -2063423907
    .data4 -2070569510
    .data4 -2077403294
    .data4 -2083924228
    .data4 -2090131330
    .data4 -2096023667
    .data4 -2101600350
    .data4 -2106860539
    .data4 -2111803444
    .data4 -2116428318
    .data4 -2120734466
    .data4 -2124721240
    .data4 -2128388038
    .data4 -2131734308
    .data4 -2134759548
    .data4 -2137463300
    .data4 -2139845158
    .data4 -2141904764
    .data4 -2143641806
    .data4 -2145056024
    .data4 -2146147205
    .data4 -2146915183
    .data4 -2147359844
xcos_fixed::
    .data4 -2147483648
    .data4 -2144896909
    .data4 -2137142927
    .data4 -2124240380
    .data4 -2106220351
    .data4 -2083126254
    .data4 -2055013723
    .data4 -2021950483
    .data4 -1984016188
    .data4 -1941302224
    .data4 -1893911494
    .data4 -1841958164
    .data4 -1785567396
    .data4 -1724875039
    .data4 -1660027308
    .data4 -1591180425
    .data4 -1518500249
    .data4 -1442161874
    .data4 -1362349204
    .data4 -1279254515
    .data4 -1193077990
    .data4 -1104027236
    .data4 -1012316784
    .data4 -918167571
    .data4 -821806413
    .data4 -723465451
    .data4 -623381597
    .data4 -521795963
    .data4 -418953276
    .data4 -315101294
    .data4 -210490206
    .data4 -105372028
    .data4 0
    .data4 105372028
    .data4 210490206
    .data4 315101294
    .data4 418953276
    .data4 521795963
    .data4 623381597
    .data4 723465451
    .data4 821806413
    .data4 918167571
    .data4 1012316784
    .data4 1104027236
    .data4 1193077990
    .data4 1279254515
    .data4 1362349204
    .data4 1442161874
    .data4 1518500249
    .data4 1591180425
    .data4 1660027308
    .data4 1724875039
    .data4 1785567396
    .data4 1841958164
    .data4 1893911494
    .data4 1941302224
    .data4 1984016188
    .data4 2021950483
    .data4 2055013723
    .data4 2083126254
    .data4 2106220351
    .data4 2124240380
    .data4 2137142927
    .data4 2144896909
xsin_fixed::
    .data4 0
    .data4 -105372028
    .data4 -210490206
    .data4 -315101294
    .data4 -418953276
    .data4 -521795963
    .data4 -623381597
    .data4 -723465451
    .data4 -821806413
    .data4 -918167571
    .data4 -1012316784
    .data4 -1104027236
    .data4 -1193077990
    .data4 -1279254515
    .data4 -1362349204
    .data4 -1442161874
    .data4 -1518500249
    .data4 -1591180425
    .data4 -1660027308
    .data4 -1724875039
    .data4 -1785567396
    .data4 -1841958164
    .data4 -1893911494
    .data4 -1941302224
    .data4 -1984016188
    .data4 -2021950483
    .data4 -2055013723
    .data4 -2083126254
    .data4 -2106220351
    .data4 -2124240380
    .data4 -2137142927
    .data4 -2144896909
    .data4 -2147483648
    .data4 -2144896909
    .data4 -2137142927
    .data4 -2124240380
    .data4 -2106220351
    .data4 -2083126254
    .data4 -2055013723
    .data4 -2021950483
    .data4 -1984016188
    .data4 -1941302224
    .data4 -1893911494
    .data4 -1841958164
    .data4 -1785567396
    .data4 -1724875039
    .data4 -1660027308
    .data4 -1591180425
    .data4 -1518500249
    .data4 -1442161874
    .data4 -1362349204
    .data4 -1279254515
    .data4 -1193077990
    .data4 -1104027236
    .data4 -1012316784
    .data4 -918167571
    .data4 -821806413
    .data4 -723465451
    .data4 -623381597
    .data4 -521795963
    .data4 -418953276
    .data4 -315101294
    .data4 -210490206
    .data4 -105372028
tcbuf::
    .data4 -373
    .data4 85
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
tcbuf_out::
    .data4 0
    .data4 5
    .data4 12
    .data4 24
    .data4 28
    .data4 37
    .data4 46
    .data4 57
    .data4 58
    .data4 70
    .data4 74
    .data4 85
    .data4 92
    .data4 100
    .data4 109
    .data4 116
    .data4 116
    .data4 119
    .data4 130
    .data4 142
    .data4 144
    .data4 150
    .data4 161
    .data4 170
    .data4 173
    .data4 176
    .data4 184
    .data4 194
    .data4 202
    .data4 204
    .data4 214
    .data4 222
    .data4 218
    .data4 211
    .data4 219
    .data4 231
    .data4 233
    .data4 238
    .data4 249
    .data4 255
    .data4 254
    .data4 254
    .data4 262
    .data4 269
    .data4 275
    .data4 276
    .data4 285
    .data4 291
    .data4 291
    .data4 282
    .data4 289
    .data4 298
    .data4 299
    .data4 301
    .data4 306
    .data4 313
    .data4 313
    .data4 310
    .data4 314
    .data4 316
    .data4 323
    .data4 321
    .data4 326
    .data4 330
    .data4 321
    .data4 310
    .data4 314
    .data4 315
    .data4 318
    .data4 316
    .data4 319
    .data4 319
    .data4 321
    .data4 314
    .data4 320
    .data4 318
    .data4 323
    .data4 319
    .data4 321
    .data4 320
    .data4 324
    .data4 318
    .data4 317
    .data4 318
    .data4 319
    .data4 316
    .data4 316
    .data4 314
    .data4 316
    .data4 315
    .data4 312
    .data4 310
    .data4 311
    .data4 309
    .data4 307
    .data4 306
    .data4 309
    .data4 314
    .data4 310
    .data4 304
    .data4 306
    .data4 305
    .data4 300
    .data4 297
    .data4 301
    .data4 301
    .data4 299
    .data4 294
    .data4 294
    .data4 293
    .data4 288
    .data4 286
    .data4 291
    .data4 298
    .data4 294
    .data4 287
    .data4 289
    .data4 290
    .data4 285
    .data4 279
    .data4 282
    .data4 287
    .data4 285
    .data4 280
    .data4 279
    .data4 281
    .data4 276
    .data4 273
    .data4 -288
    .data4 -307
    .data4 -304
    .data4 -300
    .data4 -301
    .data4 -301
    .data4 -297
    .data4 -296
    .data4 -297
    .data4 -306
    .data4 -301
    .data4 -300
    .data4 -295
    .data4 -301
    .data4 -297
    .data4 -297
    .data4 -300
    .data4 -310
    .data4 -308
    .data4 -306
    .data4 -305
    .data4 -310
    .data4 -308
    .data4 -306
    .data4 -306
    .data4 -314
    .data4 -314
    .data4 -313
    .data4 -309
    .data4 -315
    .data4 -312
    .data4 -311
    .data4 -316
    .data4 -322
    .data4 -321
    .data4 -324
    .data4 -323
    .data4 -326
    .data4 -324
    .data4 -327
    .data4 -326
    .data4 -332
    .data4 -329
    .data4 -332
    .data4 -330
    .data4 -333
    .data4 -334
    .data4 -335
    .data4 -330
    .data4 -332
    .data4 -333
    .data4 -337
    .data4 -335
    .data4 -334
    .data4 -335
    .data4 -338
    .data4 -334
    .data4 -333
    .data4 -334
    .data4 -337
    .data4 -335
    .data4 -333
    .data4 -336
    .data4 -336
    .data4 -326
    .data4 -312
    .data4 -313
    .data4 -318
    .data4 -314
    .data4 -312
    .data4 -315
    .data4 -317
    .data4 -310
    .data4 -304
    .data4 -304
    .data4 -305
    .data4 -304
    .data4 -300
    .data4 -300
    .data4 -300
    .data4 -289
    .data4 -276
    .data4 -278
    .data4 -281
    .data4 -274
    .data4 -268
    .data4 -269
    .data4 -269
    .data4 -264
    .data4 -251
    .data4 -251
    .data4 -250
    .data4 -248
    .data4 -239
    .data4 -239
    .data4 -236
    .data4 -223
    .data4 -203
    .data4 -201
    .data4 -200
    .data4 -194
    .data4 -185
    .data4 -186
    .data4 -180
    .data4 -172
    .data4 -159
    .data4 -158
    .data4 -152
    .data4 -148
    .data4 -138
    .data4 -136
    .data4 -129
    .data4 -123
    .data4 -108
    .data4 -103
    .data4 -97
    .data4 -91
    .data4 -83
    .data4 -76
    .data4 -69
    .data4 -64
    .data4 -53
    .data4 -47
    .data4 -37
    .data4 -34
    .data4 -25
    .data4 -18
    .data4 -10
chantab::
    .data2 0
    .data2 2
    .data2 5
    .data2 -1
    .data2 -1
    .data2 -1
    .data2 1
    .data2 5
    .data2 -1
    .data2 -1
    .data2 -1
    .data2 -1
    .data2 0
    .data2 2
    .data2 5
    .data2 -1
    .data2 -1
    .data2 -1
    .data2 0
    .data2 1
    .data2 2
    .data2 5
    .data2 -1
    .data2 -1
    .data2 0
    .data2 2
    .data2 3
    .data2 5
    .data2 -1
    .data2 -1
    .data2 0
    .data2 1
    .data2 2
    .data2 3
    .data2 5
    .data2 -1
    .data2 0
    .data2 2
    .data2 3
    .data2 4
    .data2 5
    .data2 -1
    .data2 0
    .data2 1
    .data2 2
    .data2 3
    .data2 4
    .data2 5
bswitch::
    .data2 0
.skip 2
acmod::
    .data2 7
.skip 2
channum::
    .data2 5
.skip 2
slct::
    .data4 0
.section .data
.section .text
.import itver2
.type itver2,@function

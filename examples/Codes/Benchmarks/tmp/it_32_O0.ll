; ModuleID = 'it.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@zcos1_fixed = global [128 x i32] [i32 -2147481121, i32 -2147278995, i32 -2146753496, i32 -2145904704, i32 -2144732747, i32 -2143237801, i32 -2141420092, i32 -2139279892, i32 -2136817525, i32 -2134033360, i32 -2130927818, i32 -2127501367, i32 -2123754521, i32 -2119687846, i32 -2115301954, i32 -2110597505, i32 -2105575207, i32 -2100235818, i32 -2094580141, i32 -2088609028, i32 -2082323378, i32 -2075724138, i32 -2068812302, i32 -2061588910, i32 -2054055050, i32 -2046211857, i32 -2038060512, i32 -2029602243, i32 -2020838323, i32 -2011770072, i32 -2002398856, i32 -1992726086, i32 -1982753219, i32 -1972481757, i32 -1961913246, i32 -1951049278, i32 -1939891490, i32 -1928441560, i32 -1916701215, i32 -1904672221, i32 -1892356391, i32 -1879755579, i32 -1866871683, i32 -1853706643, i32 -1840262441, i32 -1826541102, i32 -1812544693, i32 -1798275322, i32 -1783735137, i32 -1768926328, i32 -1753851125, i32 -1738511799, i32 -1722910659, i32 -1707050055, i32 -1690932376, i32 -1674560048, i32 -1657935538, i32 -1641061349, i32 -1623940022, i32 -1606574136, i32 -1588966305, i32 -1571119182, i32 -1553035455, i32 -1534717846, i32 -1516169114, i32 -1497392052, i32 -1478389489, i32 -1459164286, i32 -1439719338, i32 -1420057573, i32 -1400181953, i32 -1380095471, i32 -1359801152, i32 -1339302051, i32 -1318601257, i32 -1297701886, i32 -1276607086, i32 -1255320033, i32 -1233843934, i32 -1212182023, i32 -1190337562, i32 -1168313840, i32 -1146114174, i32 -1123741907, i32 -1101200410, i32 -1078493075, i32 -1055623324, i32 -1032594599, i32 -1009410370, i32 -986074127, i32 -962589385, i32 -938959680, i32 -915188572, i32 -891279639, i32 -867236484, i32 -843062725, i32 -818762004, i32 -794337981, i32 -769794334, i32 -745134758, i32 -720362968, i32 -695482693, i32 -670497682, i32 -645411696, i32 -620228513, i32 -594951927, i32 -569585742, i32 -544133781, i32 -518599874, i32 -492987869, i32 -467301621, i32 -441544999, i32 -415721883, i32 -389836160, i32 -363891729, i32 -337892498, i32 -311842381, i32 -285745301, i32 -259605190, i32 -233425983, i32 -207211623, i32 -180966058, i32 -154693239, i32 -128397125, i32 -102081674, i32 -75750851, i32 -49408619, i32 -23058947], align 4
@zsin1_fixed = global [128 x i32] [i32 -3294197, i32 -29646846, i32 -55995030, i32 -82334781, i32 -108662133, i32 -134973121, i32 -161263783, i32 -187530158, i32 -213768293, i32 -239974235, i32 -266144037, i32 -292273759, i32 -318359466, i32 -344397229, i32 -370383127, i32 -396313247, i32 -422183683, i32 -447990540, i32 -473729932, i32 -499397981, i32 -524990823, i32 -550504603, i32 -575935480, i32 -601279622, i32 -626533214, i32 -651692452, i32 -676753548, i32 -701712728, i32 -726566232, i32 -751310317, i32 -775941259, i32 -800455346, i32 -824848887, i32 -849118210, i32 -873259658, i32 -897269597, i32 -921144410, i32 -944880502, i32 -968474299, i32 -991922247, i32 -1015220815, i32 -1038366495, i32 -1061355800, i32 -1084185270, i32 -1106851464, i32 -1129350972, i32 -1151680403, i32 -1173836395, i32 -1195815612, i32 -1217614743, i32 -1239230506, i32 -1260659645, i32 -1281898934, i32 -1302945174, i32 -1323795194, i32 -1344445856, i32 -1364894050, i32 -1385136695, i32 -1405170744, i32 -1424993180, i32 -1444601016, i32 -1463991301, i32 -1483161115, i32 -1502107569, i32 -1520827812, i32 -1539319024, i32 -1557578420, i32 -1575603250, i32 -1593390801, i32 -1610938392, i32 -1628243383, i32 -1645303165, i32 -1662115171, i32 -1678676869, i32 -1694985764, i32 -1711039401, i32 -1726835361, i32 -1742371266, i32 -1757644777, i32 -1772653592, i32 -1787395453, i32 -1801868138, i32 -1816069469, i32 -1829997306, i32 -1843649553, i32 -1857024152, i32 -1870119091, i32 -1882932396, i32 -1895462139, i32 -1907706432, i32 -1919663432, i32 -1931331337, i32 -1942708391, i32 -1953792881, i32 -1964583136, i32 -1975077532, i32 -1985274489, i32 -1995172471, i32 -2004769987, i32 -2014065592, i32 -2023057886, i32 -2031745515, i32 -2040127171, i32 -2048201591, i32 -2055967560, i32 -2063423907, i32 -2070569510, i32 -2077403294, i32 -2083924228, i32 -2090131330, i32 -2096023667, i32 -2101600350, i32 -2106860539, i32 -2111803444, i32 -2116428318, i32 -2120734466, i32 -2124721240, i32 -2128388038, i32 -2131734308, i32 -2134759548, i32 -2137463300, i32 -2139845158, i32 -2141904764, i32 -2143641806, i32 -2145056024, i32 -2146147205, i32 -2146915183, i32 -2147359844], align 4
@zcos2_fixed = global [64 x i32] [i32 -2147473541, i32 -2146665075, i32 -2144563538, i32 -2141170197, i32 -2136487094, i32 -2130517052, i32 -2123263665, i32 -2114731305, i32 -2104925109, i32 -2093850984, i32 -2081515603, i32 -2067926394, i32 -2053091544, i32 -2037019988, i32 -2019721407, i32 -2001206222, i32 -1981485585, i32 -1960571375, i32 -1938476190, i32 -1915213340, i32 -1890796836, i32 -1865241388, i32 -1838562387, i32 -1810775906, i32 -1781898681, i32 -1751948107, i32 -1720942224, i32 -1688899711, i32 -1655839867, i32 -1621782607, i32 -1586748446, i32 -1550758488, i32 -1513834410, i32 -1475998455, i32 -1437273414, i32 -1397682613, i32 -1357249900, i32 -1315999631, i32 -1273956653, i32 -1231146290, i32 -1187594332, i32 -1143327011, i32 -1098370992, i32 -1052753356, i32 -1006501581, i32 -959643527, i32 -912207419, i32 -864221832, i32 -815715669, i32 -766718151, i32 -717258789, i32 -667367378, i32 -617073970, i32 -566408860, i32 -515402566, i32 -464085812, i32 -412489511, i32 -360644742, i32 -308582733, i32 -256334846, i32 -203932553, i32 -151407418, i32 -98791081, i32 -46115236], align 4
@zsin2_fixed = global [64 x i32] [i32 -6588386, i32 -59288041, i32 -111951983, i32 -164548489, i32 -217045877, i32 -269412525, i32 -321616889, i32 -373627523, i32 -425413097, i32 -476942419, i32 -528184448, i32 -579108319, i32 -629683357, i32 -679879097, i32 -729665303, i32 -779011986, i32 -827889421, i32 -876268167, i32 -924119081, i32 -971413341, i32 -1018122458, i32 -1064218296, i32 -1109673088, i32 -1154459455, i32 -1198550419, i32 -1241919421, i32 -1284540337, i32 -1326387494, i32 -1367435684, i32 -1407660183, i32 -1447036759, i32 -1485541695, i32 -1523151796, i32 -1559844408, i32 -1595597427, i32 -1630389318, i32 -1664199124, i32 -1697006478, i32 -1728791619, i32 -1759535401, i32 -1789219304, i32 -1817825449, i32 -1845336603, i32 -1871736196, i32 -1897008325, i32 -1921137766, i32 -1944109987, i32 -1965911148, i32 -1986528118, i32 -2005948477, i32 -2024160528, i32 -2041153301, i32 -2056916559, i32 -2071440808, i32 -2084717298, i32 -2096738032, i32 -2107495770, i32 -2116984031, i32 -2125197100, i32 -2132130029, i32 -2137778644, i32 -2142139540, i32 -2145210092, i32 -2146988449], align 4
@xcos_fixed = global [64 x i32] [i32 -2147483648, i32 -2144896909, i32 -2137142927, i32 -2124240380, i32 -2106220351, i32 -2083126254, i32 -2055013723, i32 -2021950483, i32 -1984016188, i32 -1941302224, i32 -1893911494, i32 -1841958164, i32 -1785567396, i32 -1724875039, i32 -1660027308, i32 -1591180425, i32 -1518500249, i32 -1442161874, i32 -1362349204, i32 -1279254515, i32 -1193077990, i32 -1104027236, i32 -1012316784, i32 -918167571, i32 -821806413, i32 -723465451, i32 -623381597, i32 -521795963, i32 -418953276, i32 -315101294, i32 -210490206, i32 -105372028, i32 0, i32 105372028, i32 210490206, i32 315101294, i32 418953276, i32 521795963, i32 623381597, i32 723465451, i32 821806413, i32 918167571, i32 1012316784, i32 1104027236, i32 1193077990, i32 1279254515, i32 1362349204, i32 1442161874, i32 1518500249, i32 1591180425, i32 1660027308, i32 1724875039, i32 1785567396, i32 1841958164, i32 1893911494, i32 1941302224, i32 1984016188, i32 2021950483, i32 2055013723, i32 2083126254, i32 2106220351, i32 2124240380, i32 2137142927, i32 2144896909], align 4
@xsin_fixed = global [64 x i32] [i32 0, i32 -105372028, i32 -210490206, i32 -315101294, i32 -418953276, i32 -521795963, i32 -623381597, i32 -723465451, i32 -821806413, i32 -918167571, i32 -1012316784, i32 -1104027236, i32 -1193077990, i32 -1279254515, i32 -1362349204, i32 -1442161874, i32 -1518500249, i32 -1591180425, i32 -1660027308, i32 -1724875039, i32 -1785567396, i32 -1841958164, i32 -1893911494, i32 -1941302224, i32 -1984016188, i32 -2021950483, i32 -2055013723, i32 -2083126254, i32 -2106220351, i32 -2124240380, i32 -2137142927, i32 -2144896909, i32 -2147483648, i32 -2144896909, i32 -2137142927, i32 -2124240380, i32 -2106220351, i32 -2083126254, i32 -2055013723, i32 -2021950483, i32 -1984016188, i32 -1941302224, i32 -1893911494, i32 -1841958164, i32 -1785567396, i32 -1724875039, i32 -1660027308, i32 -1591180425, i32 -1518500249, i32 -1442161874, i32 -1362349204, i32 -1279254515, i32 -1193077990, i32 -1104027236, i32 -1012316784, i32 -918167571, i32 -821806413, i32 -723465451, i32 -623381597, i32 -521795963, i32 -418953276, i32 -315101294, i32 -210490206, i32 -105372028], align 4
@bitrev = global [128 x i16] [i16 0, i16 64, i16 32, i16 96, i16 16, i16 80, i16 48, i16 112, i16 8, i16 72, i16 40, i16 104, i16 24, i16 88, i16 56, i16 120, i16 4, i16 68, i16 36, i16 100, i16 20, i16 84, i16 52, i16 116, i16 12, i16 76, i16 44, i16 108, i16 28, i16 92, i16 60, i16 124, i16 2, i16 66, i16 34, i16 98, i16 18, i16 82, i16 50, i16 114, i16 10, i16 74, i16 42, i16 106, i16 26, i16 90, i16 58, i16 122, i16 6, i16 70, i16 38, i16 102, i16 22, i16 86, i16 54, i16 118, i16 14, i16 78, i16 46, i16 110, i16 30, i16 94, i16 62, i16 126, i16 1, i16 65, i16 33, i16 97, i16 17, i16 81, i16 49, i16 113, i16 9, i16 73, i16 41, i16 105, i16 25, i16 89, i16 57, i16 121, i16 5, i16 69, i16 37, i16 101, i16 21, i16 85, i16 53, i16 117, i16 13, i16 77, i16 45, i16 109, i16 29, i16 93, i16 61, i16 125, i16 3, i16 67, i16 35, i16 99, i16 19, i16 83, i16 51, i16 115, i16 11, i16 75, i16 43, i16 107, i16 27, i16 91, i16 59, i16 123, i16 7, i16 71, i16 39, i16 103, i16 23, i16 87, i16 55, i16 119, i16 15, i16 79, i16 47, i16 111, i16 31, i16 95, i16 63, i16 127], align 2
@chantab = global [8 x [6 x i16]] [[6 x i16] [i16 0, i16 2, i16 5, i16 -1, i16 -1, i16 -1], [6 x i16] [i16 1, i16 5, i16 -1, i16 -1, i16 -1, i16 -1], [6 x i16] [i16 0, i16 2, i16 5, i16 -1, i16 -1, i16 -1], [6 x i16] [i16 0, i16 1, i16 2, i16 5, i16 -1, i16 -1], [6 x i16] [i16 0, i16 2, i16 3, i16 5, i16 -1, i16 -1], [6 x i16] [i16 0, i16 1, i16 2, i16 3, i16 5, i16 -1], [6 x i16] [i16 0, i16 2, i16 3, i16 4, i16 5, i16 -1], [6 x i16] [i16 0, i16 1, i16 2, i16 3, i16 4, i16 5]], align 2
@bswitch = global i16 0, align 2
@tcbuf = global [256 x i32] [i32 -373, i32 85, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@tcbuf_out = global [256 x i32] [i32 0, i32 5, i32 12, i32 24, i32 28, i32 37, i32 46, i32 57, i32 58, i32 70, i32 74, i32 85, i32 92, i32 100, i32 109, i32 116, i32 116, i32 119, i32 130, i32 142, i32 144, i32 150, i32 161, i32 170, i32 173, i32 176, i32 184, i32 194, i32 202, i32 204, i32 214, i32 222, i32 218, i32 211, i32 219, i32 231, i32 233, i32 238, i32 249, i32 255, i32 254, i32 254, i32 262, i32 269, i32 275, i32 276, i32 285, i32 291, i32 291, i32 282, i32 289, i32 298, i32 299, i32 301, i32 306, i32 313, i32 313, i32 310, i32 314, i32 316, i32 323, i32 321, i32 326, i32 330, i32 321, i32 310, i32 314, i32 315, i32 318, i32 316, i32 319, i32 319, i32 321, i32 314, i32 320, i32 318, i32 323, i32 319, i32 321, i32 320, i32 324, i32 318, i32 317, i32 318, i32 319, i32 316, i32 316, i32 314, i32 316, i32 315, i32 312, i32 310, i32 311, i32 309, i32 307, i32 306, i32 309, i32 314, i32 310, i32 304, i32 306, i32 305, i32 300, i32 297, i32 301, i32 301, i32 299, i32 294, i32 294, i32 293, i32 288, i32 286, i32 291, i32 298, i32 294, i32 287, i32 289, i32 290, i32 285, i32 279, i32 282, i32 287, i32 285, i32 280, i32 279, i32 281, i32 276, i32 273, i32 -288, i32 -307, i32 -304, i32 -300, i32 -301, i32 -301, i32 -297, i32 -296, i32 -297, i32 -306, i32 -301, i32 -300, i32 -295, i32 -301, i32 -297, i32 -297, i32 -300, i32 -310, i32 -308, i32 -306, i32 -305, i32 -310, i32 -308, i32 -306, i32 -306, i32 -314, i32 -314, i32 -313, i32 -309, i32 -315, i32 -312, i32 -311, i32 -316, i32 -322, i32 -321, i32 -324, i32 -323, i32 -326, i32 -324, i32 -327, i32 -326, i32 -332, i32 -329, i32 -332, i32 -330, i32 -333, i32 -334, i32 -335, i32 -330, i32 -332, i32 -333, i32 -337, i32 -335, i32 -334, i32 -335, i32 -338, i32 -334, i32 -333, i32 -334, i32 -337, i32 -335, i32 -333, i32 -336, i32 -336, i32 -326, i32 -312, i32 -313, i32 -318, i32 -314, i32 -312, i32 -315, i32 -317, i32 -310, i32 -304, i32 -304, i32 -305, i32 -304, i32 -300, i32 -300, i32 -300, i32 -289, i32 -276, i32 -278, i32 -281, i32 -274, i32 -268, i32 -269, i32 -269, i32 -264, i32 -251, i32 -251, i32 -250, i32 -248, i32 -239, i32 -239, i32 -236, i32 -223, i32 -203, i32 -201, i32 -200, i32 -194, i32 -185, i32 -186, i32 -180, i32 -172, i32 -159, i32 -158, i32 -152, i32 -148, i32 -138, i32 -136, i32 -129, i32 -123, i32 -108, i32 -103, i32 -97, i32 -91, i32 -83, i32 -76, i32 -69, i32 -64, i32 -53, i32 -47, i32 -37, i32 -34, i32 -25, i32 -18, i32 -10], align 4
@acmod = global i16 7, align 2
@channum = global i16 5, align 2
@slct = global i32 0, align 4
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1

; Function Attrs: nounwind
define void @itver2(i16 signext %bswitch, i32* %tcbuf, i16 signext %acmod, i16 signext %channum, i32 %slct) #0 {
entry:
  %bswitch.addr = alloca i16, align 2
  %tcbuf.addr = alloca i32*, align 4
  %acmod.addr = alloca i16, align 2
  %channum.addr = alloca i16, align 2
  %slct.addr = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %temp3 = alloca i32, align 4
  %temp4 = alloca i32, align 4
  %temp5 = alloca i32, align 4
  %temp6 = alloca i32, align 4
  %temp7 = alloca i32, align 4
  %temp8 = alloca i32, align 4
  %temp9 = alloca i32, align 4
  %temp10 = alloca i32, align 4
  %temp11 = alloca i32, align 4
  %temp12 = alloca i32, align 4
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %l = alloca i16, align 2
  %m = alloca i16, align 2
  %bg = alloca i16, align 2
  %gp = alloca i16, align 2
  %fftn = alloca i16, align 2
  %fftnlg2m3 = alloca i16, align 2
  %nstep = alloca i16, align 2
  %fftr_buf = alloca i32*, align 4
  %ffti_buf = alloca i32*, align 4
  %arf = alloca i32, align 4
  %aif = alloca i32, align 4
  %brf = alloca i32, align 4
  %bif = alloca i32, align 4
  %crf = alloca i32, align 4
  %cif = alloca i32, align 4
  %drf = alloca i32, align 4
  %dif = alloca i32, align 4
  %cr_fixed = alloca i32, align 4
  %ci_fixed = alloca i32, align 4
  %wr_buf1 = alloca [256 x i32], align 4
  %wi_buf1 = alloca [256 x i32], align 4
  %shft_gp = alloca i16, align 2
  %shft_bg = alloca i16, align 2
  %i1 = alloca i16, align 2
  %i2 = alloca i16, align 2
  %i3 = alloca i16, align 2
  %i4 = alloca i16, align 2
  %l_plus_bg = alloca i16, align 2
  %fftnby2 = alloca i16, align 2
  %mask_gp = alloca i16, align 2
  %neg_mask_gp = alloca i16, align 2
  %shft_fftnby2 = alloca i16, align 2
  %k = alloca i32, align 4
  %k1 = alloca i32, align 4
  %total_ops = alloca i32, align 4
  %mask_fftnby2 = alloca i32, align 4
  store i16 %bswitch, i16* %bswitch.addr, align 2
  store i32* %tcbuf, i32** %tcbuf.addr, align 4
  store i16 %acmod, i16* %acmod.addr, align 2
  store i16 %channum, i16* %channum.addr, align 2
  store i32 %slct, i32* %slct.addr, align 4
  %0 = load i16, i16* %bswitch.addr, align 2
  %tobool = icmp ne i16 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i16 64, i16* %fftn, align 2
  store i16 3, i16* %fftnlg2m3, align 2
  store i16 2, i16* %nstep, align 2
  %arraydecay = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  store i32* %arraydecay, i32** %fftr_buf, align 4
  %arraydecay1 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  %1 = load i16, i16* %fftn, align 2
  %conv = sext i16 %1 to i32
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i32 %conv
  store i32* %add.ptr, i32** %ffti_buf, align 4
  store i16 0, i16* %i, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i16, i16* %i, align 2
  %conv2 = sext i16 %2 to i32
  %cmp = icmp slt i32 %conv2, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i16, i16* %i, align 2
  %idxprom = sext i16 %3 to i32
  %arrayidx = getelementptr inbounds [64 x i32], [64 x i32]* @zcos2_fixed, i32 0, i32 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  store i32 %4, i32* %cr_fixed, align 4
  %5 = load i16, i16* %i, align 2
  %idxprom4 = sext i16 %5 to i32
  %arrayidx5 = getelementptr inbounds [64 x i32], [64 x i32]* @zsin2_fixed, i32 0, i32 %idxprom4
  %6 = load i32, i32* %arrayidx5, align 4
  store i32 %6, i32* %ci_fixed, align 4
  %7 = load i16, i16* %i, align 2
  %conv6 = sext i16 %7 to i32
  %shl = shl i32 %conv6, 2
  %8 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i32 %shl
  %9 = load i32, i32* %arrayidx7, align 4
  store i32 %9, i32* %aif, align 4
  %10 = load i16, i16* %i, align 2
  %conv8 = sext i16 %10 to i32
  %sub = sub nsw i32 63, %conv8
  %shl9 = shl i32 %sub, 2
  %add = add nsw i32 %shl9, 2
  %11 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i32 %add
  %12 = load i32, i32* %arrayidx10, align 4
  store i32 %12, i32* %arf, align 4
  %13 = load i16, i16* %i, align 2
  %conv11 = sext i16 %13 to i32
  %shl12 = shl i32 %conv11, 2
  %add13 = add nsw i32 %shl12, 1
  %14 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %14, i32 %add13
  %15 = load i32, i32* %arrayidx14, align 4
  store i32 %15, i32* %bif, align 4
  %16 = load i16, i16* %i, align 2
  %conv15 = sext i16 %16 to i32
  %sub16 = sub nsw i32 63, %conv15
  %shl17 = shl i32 %sub16, 2
  %add18 = add nsw i32 %shl17, 3
  %17 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %17, i32 %add18
  %18 = load i32, i32* %arrayidx19, align 4
  store i32 %18, i32* %brf, align 4
  %19 = load i32, i32* %arf, align 4
  %shr = ashr i32 %19, 16
  %20 = load i32, i32* %cr_fixed, align 4
  %shr20 = ashr i32 %20, 16
  %mul = mul nsw i32 %shr, %shr20
  %shl21 = shl i32 %mul, 1
  %21 = load i32, i32* %arf, align 4
  %shr22 = ashr i32 %21, 16
  %22 = load i32, i32* %cr_fixed, align 4
  %conv23 = trunc i32 %22 to i16
  %conv24 = zext i16 %conv23 to i32
  %mul25 = mul nsw i32 %shr22, %conv24
  %shr26 = ashr i32 %mul25, 15
  %add27 = add nsw i32 %shl21, %shr26
  %23 = load i32, i32* %cr_fixed, align 4
  %shr28 = ashr i32 %23, 16
  %24 = load i32, i32* %arf, align 4
  %conv29 = trunc i32 %24 to i16
  %conv30 = zext i16 %conv29 to i32
  %mul31 = mul nsw i32 %shr28, %conv30
  %shr32 = ashr i32 %mul31, 15
  %add33 = add nsw i32 %add27, %shr32
  store i32 %add33, i32* %temp1, align 4
  %25 = load i32, i32* %aif, align 4
  %shr34 = ashr i32 %25, 16
  %26 = load i32, i32* %ci_fixed, align 4
  %shr35 = ashr i32 %26, 16
  %mul36 = mul nsw i32 %shr34, %shr35
  %shl37 = shl i32 %mul36, 1
  %27 = load i32, i32* %aif, align 4
  %shr38 = ashr i32 %27, 16
  %28 = load i32, i32* %ci_fixed, align 4
  %conv39 = trunc i32 %28 to i16
  %conv40 = zext i16 %conv39 to i32
  %mul41 = mul nsw i32 %shr38, %conv40
  %shr42 = ashr i32 %mul41, 15
  %add43 = add nsw i32 %shl37, %shr42
  %29 = load i32, i32* %ci_fixed, align 4
  %shr44 = ashr i32 %29, 16
  %30 = load i32, i32* %aif, align 4
  %conv45 = trunc i32 %30 to i16
  %conv46 = zext i16 %conv45 to i32
  %mul47 = mul nsw i32 %shr44, %conv46
  %shr48 = ashr i32 %mul47, 15
  %add49 = add nsw i32 %add43, %shr48
  store i32 %add49, i32* %temp2, align 4
  %31 = load i32, i32* %aif, align 4
  %shr50 = ashr i32 %31, 16
  %32 = load i32, i32* %cr_fixed, align 4
  %shr51 = ashr i32 %32, 16
  %mul52 = mul nsw i32 %shr50, %shr51
  %shl53 = shl i32 %mul52, 1
  %33 = load i32, i32* %aif, align 4
  %shr54 = ashr i32 %33, 16
  %34 = load i32, i32* %cr_fixed, align 4
  %conv55 = trunc i32 %34 to i16
  %conv56 = zext i16 %conv55 to i32
  %mul57 = mul nsw i32 %shr54, %conv56
  %shr58 = ashr i32 %mul57, 15
  %add59 = add nsw i32 %shl53, %shr58
  %35 = load i32, i32* %cr_fixed, align 4
  %shr60 = ashr i32 %35, 16
  %36 = load i32, i32* %aif, align 4
  %conv61 = trunc i32 %36 to i16
  %conv62 = zext i16 %conv61 to i32
  %mul63 = mul nsw i32 %shr60, %conv62
  %shr64 = ashr i32 %mul63, 15
  %add65 = add nsw i32 %add59, %shr64
  store i32 %add65, i32* %temp3, align 4
  %37 = load i32, i32* %arf, align 4
  %shr66 = ashr i32 %37, 16
  %38 = load i32, i32* %ci_fixed, align 4
  %shr67 = ashr i32 %38, 16
  %mul68 = mul nsw i32 %shr66, %shr67
  %shl69 = shl i32 %mul68, 1
  %39 = load i32, i32* %arf, align 4
  %shr70 = ashr i32 %39, 16
  %40 = load i32, i32* %ci_fixed, align 4
  %conv71 = trunc i32 %40 to i16
  %conv72 = zext i16 %conv71 to i32
  %mul73 = mul nsw i32 %shr70, %conv72
  %shr74 = ashr i32 %mul73, 15
  %add75 = add nsw i32 %shl69, %shr74
  %41 = load i32, i32* %ci_fixed, align 4
  %shr76 = ashr i32 %41, 16
  %42 = load i32, i32* %arf, align 4
  %conv77 = trunc i32 %42 to i16
  %conv78 = zext i16 %conv77 to i32
  %mul79 = mul nsw i32 %shr76, %conv78
  %shr80 = ashr i32 %mul79, 15
  %add81 = add nsw i32 %add75, %shr80
  store i32 %add81, i32* %temp4, align 4
  %43 = load i32, i32* %brf, align 4
  %shr82 = ashr i32 %43, 16
  %44 = load i32, i32* %cr_fixed, align 4
  %shr83 = ashr i32 %44, 16
  %mul84 = mul nsw i32 %shr82, %shr83
  %shl85 = shl i32 %mul84, 1
  %45 = load i32, i32* %brf, align 4
  %shr86 = ashr i32 %45, 16
  %46 = load i32, i32* %cr_fixed, align 4
  %conv87 = trunc i32 %46 to i16
  %conv88 = zext i16 %conv87 to i32
  %mul89 = mul nsw i32 %shr86, %conv88
  %shr90 = ashr i32 %mul89, 15
  %add91 = add nsw i32 %shl85, %shr90
  %47 = load i32, i32* %cr_fixed, align 4
  %shr92 = ashr i32 %47, 16
  %48 = load i32, i32* %brf, align 4
  %conv93 = trunc i32 %48 to i16
  %conv94 = zext i16 %conv93 to i32
  %mul95 = mul nsw i32 %shr92, %conv94
  %shr96 = ashr i32 %mul95, 15
  %add97 = add nsw i32 %add91, %shr96
  store i32 %add97, i32* %temp5, align 4
  %49 = load i32, i32* %bif, align 4
  %shr98 = ashr i32 %49, 16
  %50 = load i32, i32* %ci_fixed, align 4
  %shr99 = ashr i32 %50, 16
  %mul100 = mul nsw i32 %shr98, %shr99
  %shl101 = shl i32 %mul100, 1
  %51 = load i32, i32* %bif, align 4
  %shr102 = ashr i32 %51, 16
  %52 = load i32, i32* %ci_fixed, align 4
  %conv103 = trunc i32 %52 to i16
  %conv104 = zext i16 %conv103 to i32
  %mul105 = mul nsw i32 %shr102, %conv104
  %shr106 = ashr i32 %mul105, 15
  %add107 = add nsw i32 %shl101, %shr106
  %53 = load i32, i32* %ci_fixed, align 4
  %shr108 = ashr i32 %53, 16
  %54 = load i32, i32* %bif, align 4
  %conv109 = trunc i32 %54 to i16
  %conv110 = zext i16 %conv109 to i32
  %mul111 = mul nsw i32 %shr108, %conv110
  %shr112 = ashr i32 %mul111, 15
  %add113 = add nsw i32 %add107, %shr112
  store i32 %add113, i32* %temp6, align 4
  %55 = load i32, i32* %bif, align 4
  %shr114 = ashr i32 %55, 16
  %56 = load i32, i32* %cr_fixed, align 4
  %shr115 = ashr i32 %56, 16
  %mul116 = mul nsw i32 %shr114, %shr115
  %shl117 = shl i32 %mul116, 1
  %57 = load i32, i32* %bif, align 4
  %shr118 = ashr i32 %57, 16
  %58 = load i32, i32* %cr_fixed, align 4
  %conv119 = trunc i32 %58 to i16
  %conv120 = zext i16 %conv119 to i32
  %mul121 = mul nsw i32 %shr118, %conv120
  %shr122 = ashr i32 %mul121, 15
  %add123 = add nsw i32 %shl117, %shr122
  %59 = load i32, i32* %cr_fixed, align 4
  %shr124 = ashr i32 %59, 16
  %60 = load i32, i32* %bif, align 4
  %conv125 = trunc i32 %60 to i16
  %conv126 = zext i16 %conv125 to i32
  %mul127 = mul nsw i32 %shr124, %conv126
  %shr128 = ashr i32 %mul127, 15
  %add129 = add nsw i32 %add123, %shr128
  store i32 %add129, i32* %temp7, align 4
  %61 = load i32, i32* %brf, align 4
  %shr130 = ashr i32 %61, 16
  %62 = load i32, i32* %ci_fixed, align 4
  %shr131 = ashr i32 %62, 16
  %mul132 = mul nsw i32 %shr130, %shr131
  %shl133 = shl i32 %mul132, 1
  %63 = load i32, i32* %brf, align 4
  %shr134 = ashr i32 %63, 16
  %64 = load i32, i32* %ci_fixed, align 4
  %conv135 = trunc i32 %64 to i16
  %conv136 = zext i16 %conv135 to i32
  %mul137 = mul nsw i32 %shr134, %conv136
  %shr138 = ashr i32 %mul137, 15
  %add139 = add nsw i32 %shl133, %shr138
  %65 = load i32, i32* %ci_fixed, align 4
  %shr140 = ashr i32 %65, 16
  %66 = load i32, i32* %brf, align 4
  %conv141 = trunc i32 %66 to i16
  %conv142 = zext i16 %conv141 to i32
  %mul143 = mul nsw i32 %shr140, %conv142
  %shr144 = ashr i32 %mul143, 15
  %add145 = add nsw i32 %add139, %shr144
  store i32 %add145, i32* %temp8, align 4
  %67 = load i16, i16* %i, align 2
  %conv146 = sext i16 %67 to i32
  %shl147 = shl i32 %conv146, 1
  %arrayidx148 = getelementptr inbounds [128 x i16], [128 x i16]* @bitrev, i32 0, i32 %shl147
  %68 = load i16, i16* %arrayidx148, align 2
  store i16 %68, i16* %j, align 2
  %69 = load i32, i32* %temp1, align 4
  %70 = load i32, i32* %temp2, align 4
  %sub149 = sub nsw i32 %69, %70
  %71 = load i16, i16* %j, align 2
  %idxprom150 = sext i16 %71 to i32
  %arrayidx151 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom150
  store i32 %sub149, i32* %arrayidx151, align 4
  %72 = load i32, i32* %temp3, align 4
  %73 = load i32, i32* %temp4, align 4
  %add152 = add nsw i32 %72, %73
  %74 = load i16, i16* %j, align 2
  %conv153 = sext i16 %74 to i32
  %add154 = add nsw i32 64, %conv153
  %arrayidx155 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %add154
  store i32 %add152, i32* %arrayidx155, align 4
  %75 = load i32, i32* %temp5, align 4
  %76 = load i32, i32* %temp6, align 4
  %sub156 = sub nsw i32 %75, %76
  %77 = load i16, i16* %j, align 2
  %conv157 = sext i16 %77 to i32
  %add158 = add nsw i32 64, %conv157
  %arrayidx159 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %add158
  store i32 %sub156, i32* %arrayidx159, align 4
  %78 = load i32, i32* %temp7, align 4
  %79 = load i32, i32* %temp8, align 4
  %add160 = add nsw i32 %78, %79
  %80 = load i16, i16* %j, align 2
  %idxprom161 = sext i16 %80 to i32
  %arrayidx162 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom161
  store i32 %add160, i32* %arrayidx162, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %81 = load i16, i16* %i, align 2
  %inc = add i16 %81, 1
  store i16 %inc, i16* %i, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else:                                          ; preds = %entry
  store i16 128, i16* %fftn, align 2
  store i16 4, i16* %fftnlg2m3, align 2
  store i16 1, i16* %nstep, align 2
  %arraydecay163 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  store i32* %arraydecay163, i32** %fftr_buf, align 4
  %arraydecay164 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  store i32* %arraydecay164, i32** %ffti_buf, align 4
  store i16 0, i16* %i, align 2
  br label %for.cond165

for.cond165:                                      ; preds = %for.inc255, %if.else
  %82 = load i16, i16* %i, align 2
  %conv166 = sext i16 %82 to i32
  %83 = load i16, i16* %fftn, align 2
  %conv167 = sext i16 %83 to i32
  %cmp168 = icmp slt i32 %conv166, %conv167
  br i1 %cmp168, label %for.body170, label %for.end257

for.body170:                                      ; preds = %for.cond165
  %84 = load i16, i16* %i, align 2
  %conv171 = sext i16 %84 to i32
  %shl172 = shl i32 %conv171, 1
  %85 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx173 = getelementptr inbounds i32, i32* %85, i32 %shl172
  %86 = load i32, i32* %arrayidx173, align 4
  store i32 %86, i32* %aif, align 4
  %87 = load i16, i16* %i, align 2
  %conv174 = sext i16 %87 to i32
  %sub175 = sub nsw i32 127, %conv174
  %shl176 = shl i32 %sub175, 1
  %add177 = add nsw i32 %shl176, 1
  %88 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx178 = getelementptr inbounds i32, i32* %88, i32 %add177
  %89 = load i32, i32* %arrayidx178, align 4
  store i32 %89, i32* %arf, align 4
  %90 = load i16, i16* %i, align 2
  %idxprom179 = sext i16 %90 to i32
  %arrayidx180 = getelementptr inbounds [128 x i32], [128 x i32]* @zcos1_fixed, i32 0, i32 %idxprom179
  %91 = load i32, i32* %arrayidx180, align 4
  store i32 %91, i32* %cr_fixed, align 4
  %92 = load i16, i16* %i, align 2
  %idxprom181 = sext i16 %92 to i32
  %arrayidx182 = getelementptr inbounds [128 x i32], [128 x i32]* @zsin1_fixed, i32 0, i32 %idxprom181
  %93 = load i32, i32* %arrayidx182, align 4
  store i32 %93, i32* %ci_fixed, align 4
  %94 = load i32, i32* %arf, align 4
  %shr183 = ashr i32 %94, 16
  %95 = load i32, i32* %cr_fixed, align 4
  %shr184 = ashr i32 %95, 16
  %mul185 = mul nsw i32 %shr183, %shr184
  %shl186 = shl i32 %mul185, 1
  %96 = load i32, i32* %arf, align 4
  %shr187 = ashr i32 %96, 16
  %97 = load i32, i32* %cr_fixed, align 4
  %conv188 = trunc i32 %97 to i16
  %conv189 = zext i16 %conv188 to i32
  %mul190 = mul nsw i32 %shr187, %conv189
  %shr191 = ashr i32 %mul190, 15
  %add192 = add nsw i32 %shl186, %shr191
  %98 = load i32, i32* %cr_fixed, align 4
  %shr193 = ashr i32 %98, 16
  %99 = load i32, i32* %arf, align 4
  %conv194 = trunc i32 %99 to i16
  %conv195 = zext i16 %conv194 to i32
  %mul196 = mul nsw i32 %shr193, %conv195
  %shr197 = ashr i32 %mul196, 15
  %add198 = add nsw i32 %add192, %shr197
  store i32 %add198, i32* %temp1, align 4
  %100 = load i32, i32* %aif, align 4
  %shr199 = ashr i32 %100, 16
  %101 = load i32, i32* %ci_fixed, align 4
  %shr200 = ashr i32 %101, 16
  %mul201 = mul nsw i32 %shr199, %shr200
  %shl202 = shl i32 %mul201, 1
  %102 = load i32, i32* %aif, align 4
  %shr203 = ashr i32 %102, 16
  %103 = load i32, i32* %ci_fixed, align 4
  %conv204 = trunc i32 %103 to i16
  %conv205 = zext i16 %conv204 to i32
  %mul206 = mul nsw i32 %shr203, %conv205
  %shr207 = ashr i32 %mul206, 15
  %add208 = add nsw i32 %shl202, %shr207
  %104 = load i32, i32* %ci_fixed, align 4
  %shr209 = ashr i32 %104, 16
  %105 = load i32, i32* %aif, align 4
  %conv210 = trunc i32 %105 to i16
  %conv211 = zext i16 %conv210 to i32
  %mul212 = mul nsw i32 %shr209, %conv211
  %shr213 = ashr i32 %mul212, 15
  %add214 = add nsw i32 %add208, %shr213
  store i32 %add214, i32* %temp2, align 4
  %106 = load i32, i32* %aif, align 4
  %shr215 = ashr i32 %106, 16
  %107 = load i32, i32* %cr_fixed, align 4
  %shr216 = ashr i32 %107, 16
  %mul217 = mul nsw i32 %shr215, %shr216
  %shl218 = shl i32 %mul217, 1
  %108 = load i32, i32* %aif, align 4
  %shr219 = ashr i32 %108, 16
  %109 = load i32, i32* %cr_fixed, align 4
  %conv220 = trunc i32 %109 to i16
  %conv221 = zext i16 %conv220 to i32
  %mul222 = mul nsw i32 %shr219, %conv221
  %shr223 = ashr i32 %mul222, 15
  %add224 = add nsw i32 %shl218, %shr223
  %110 = load i32, i32* %cr_fixed, align 4
  %shr225 = ashr i32 %110, 16
  %111 = load i32, i32* %aif, align 4
  %conv226 = trunc i32 %111 to i16
  %conv227 = zext i16 %conv226 to i32
  %mul228 = mul nsw i32 %shr225, %conv227
  %shr229 = ashr i32 %mul228, 15
  %add230 = add nsw i32 %add224, %shr229
  store i32 %add230, i32* %temp3, align 4
  %112 = load i32, i32* %arf, align 4
  %shr231 = ashr i32 %112, 16
  %113 = load i32, i32* %ci_fixed, align 4
  %shr232 = ashr i32 %113, 16
  %mul233 = mul nsw i32 %shr231, %shr232
  %shl234 = shl i32 %mul233, 1
  %114 = load i32, i32* %arf, align 4
  %shr235 = ashr i32 %114, 16
  %115 = load i32, i32* %ci_fixed, align 4
  %conv236 = trunc i32 %115 to i16
  %conv237 = zext i16 %conv236 to i32
  %mul238 = mul nsw i32 %shr235, %conv237
  %shr239 = ashr i32 %mul238, 15
  %add240 = add nsw i32 %shl234, %shr239
  %116 = load i32, i32* %ci_fixed, align 4
  %shr241 = ashr i32 %116, 16
  %117 = load i32, i32* %arf, align 4
  %conv242 = trunc i32 %117 to i16
  %conv243 = zext i16 %conv242 to i32
  %mul244 = mul nsw i32 %shr241, %conv243
  %shr245 = ashr i32 %mul244, 15
  %add246 = add nsw i32 %add240, %shr245
  store i32 %add246, i32* %temp4, align 4
  %118 = load i16, i16* %i, align 2
  %idxprom247 = sext i16 %118 to i32
  %arrayidx248 = getelementptr inbounds [128 x i16], [128 x i16]* @bitrev, i32 0, i32 %idxprom247
  %119 = load i16, i16* %arrayidx248, align 2
  store i16 %119, i16* %j, align 2
  %120 = load i32, i32* %temp1, align 4
  %121 = load i32, i32* %temp2, align 4
  %sub249 = sub nsw i32 %120, %121
  %122 = load i16, i16* %j, align 2
  %idxprom250 = sext i16 %122 to i32
  %arrayidx251 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom250
  store i32 %sub249, i32* %arrayidx251, align 4
  %123 = load i32, i32* %temp3, align 4
  %124 = load i32, i32* %temp4, align 4
  %add252 = add nsw i32 %123, %124
  %125 = load i16, i16* %j, align 2
  %idxprom253 = sext i16 %125 to i32
  %arrayidx254 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom253
  store i32 %add252, i32* %arrayidx254, align 4
  br label %for.inc255

for.inc255:                                       ; preds = %for.body170
  %126 = load i16, i16* %i, align 2
  %inc256 = add i16 %126, 1
  store i16 %inc256, i16* %i, align 2
  br label %for.cond165

for.end257:                                       ; preds = %for.cond165
  br label %if.end

if.end:                                           ; preds = %for.end257, %for.end
  store i16 4, i16* %bg, align 2
  %127 = load i16, i16* %fftn, align 2
  %conv258 = sext i16 %127 to i32
  %shr259 = ashr i32 %conv258, 3
  %conv260 = trunc i32 %shr259 to i16
  store i16 %conv260, i16* %gp, align 2
  %128 = load i16, i16* %fftnlg2m3, align 2
  store i16 %128, i16* %shft_gp, align 2
  %129 = load i16, i16* %shft_gp, align 2
  %conv261 = sext i16 %129 to i32
  %sub262 = sub nsw i32 15, %conv261
  %shr263 = ashr i32 32767, %sub262
  %conv264 = trunc i32 %shr263 to i16
  store i16 %conv264, i16* %mask_gp, align 2
  %130 = load i16, i16* %mask_gp, align 2
  %conv265 = sext i16 %130 to i32
  %neg = xor i32 %conv265, -1
  %conv266 = trunc i32 %neg to i16
  store i16 %conv266, i16* %neg_mask_gp, align 2
  store i16 3, i16* %shft_bg, align 2
  %131 = load i16, i16* %fftn, align 2
  %conv267 = sext i16 %131 to i32
  %shr268 = ashr i32 %conv267, 1
  %conv269 = trunc i32 %shr268 to i16
  store i16 %conv269, i16* %fftnby2, align 2
  %132 = load i16, i16* %fftnlg2m3, align 2
  %conv270 = sext i16 %132 to i32
  %add271 = add nsw i32 %conv270, 2
  %conv272 = trunc i32 %add271 to i16
  store i16 %conv272, i16* %shft_fftnby2, align 2
  %133 = load i16, i16* %shft_fftnby2, align 2
  %conv273 = sext i16 %133 to i32
  %sub274 = sub nsw i32 15, %conv273
  %shr275 = ashr i32 32767, %sub274
  store i32 %shr275, i32* %mask_fftnby2, align 4
  %134 = load i16, i16* %fftnlg2m3, align 2
  %conv276 = sext i16 %134 to i32
  %add277 = add nsw i32 %conv276, 1
  %135 = load i16, i16* %fftnlg2m3, align 2
  %conv278 = sext i16 %135 to i32
  %add279 = add nsw i32 %conv278, 2
  %shl280 = shl i32 %add277, %add279
  store i32 %shl280, i32* %total_ops, align 4
  store i16 0, i16* %i, align 2
  br label %for.cond281

for.cond281:                                      ; preds = %for.inc388, %if.end
  %136 = load i16, i16* %i, align 2
  %conv282 = sext i16 %136 to i32
  %137 = load i16, i16* %fftn, align 2
  %conv283 = sext i16 %137 to i32
  %138 = load i16, i16* %nstep, align 2
  %conv284 = sext i16 %138 to i32
  %mul285 = mul nsw i32 %conv283, %conv284
  %cmp286 = icmp slt i32 %conv282, %mul285
  br i1 %cmp286, label %for.body288, label %for.end392

for.body288:                                      ; preds = %for.cond281
  %139 = load i16, i16* %i, align 2
  %conv289 = sext i16 %139 to i32
  %140 = load i16, i16* %fftn, align 2
  %conv290 = sext i16 %140 to i32
  %cmp291 = icmp sge i32 %conv289, %conv290
  %cond = select i1 %cmp291, i32 1, i32 0
  %conv293 = trunc i32 %cond to i16
  store i16 %conv293, i16* %m, align 2
  %141 = load i16, i16* %m, align 2
  %conv294 = sext i16 %141 to i32
  %tobool295 = icmp ne i32 %conv294, 0
  br i1 %tobool295, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body288
  %arraydecay296 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  %142 = load i16, i16* %fftn, align 2
  %conv297 = sext i16 %142 to i32
  %add.ptr298 = getelementptr inbounds i32, i32* %arraydecay296, i32 %conv297
  br label %cond.end

cond.false:                                       ; preds = %for.body288
  %143 = load i32*, i32** %fftr_buf, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond299 = phi i32* [ %add.ptr298, %cond.true ], [ %143, %cond.false ]
  store i32* %cond299, i32** %fftr_buf, align 4
  %144 = load i16, i16* %m, align 2
  %conv300 = sext i16 %144 to i32
  %tobool301 = icmp ne i32 %conv300, 0
  br i1 %tobool301, label %cond.true302, label %cond.false304

cond.true302:                                     ; preds = %cond.end
  %arraydecay303 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %cond.end305

cond.false304:                                    ; preds = %cond.end
  %145 = load i32*, i32** %ffti_buf, align 4
  br label %cond.end305

cond.end305:                                      ; preds = %cond.false304, %cond.true302
  %cond306 = phi i32* [ %arraydecay303, %cond.true302 ], [ %145, %cond.false304 ]
  store i32* %cond306, i32** %ffti_buf, align 4
  %146 = load i16, i16* %i, align 2
  %conv307 = sext i16 %146 to i32
  %147 = load i16, i16* %fftn, align 2
  %conv308 = sext i16 %147 to i32
  %cmp309 = icmp sge i32 %conv307, %conv308
  br i1 %cmp309, label %cond.true311, label %cond.false315

cond.true311:                                     ; preds = %cond.end305
  %148 = load i16, i16* %i, align 2
  %conv312 = sext i16 %148 to i32
  %149 = load i16, i16* %fftn, align 2
  %conv313 = sext i16 %149 to i32
  %sub314 = sub nsw i32 %conv312, %conv313
  br label %cond.end317

cond.false315:                                    ; preds = %cond.end305
  %150 = load i16, i16* %i, align 2
  %conv316 = sext i16 %150 to i32
  br label %cond.end317

cond.end317:                                      ; preds = %cond.false315, %cond.true311
  %cond318 = phi i32 [ %sub314, %cond.true311 ], [ %conv316, %cond.false315 ]
  %conv319 = trunc i32 %cond318 to i16
  store i16 %conv319, i16* %l, align 2
  %151 = load i16, i16* %l, align 2
  %idxprom320 = sext i16 %151 to i32
  %152 = load i32*, i32** %fftr_buf, align 4
  %arrayidx321 = getelementptr inbounds i32, i32* %152, i32 %idxprom320
  %153 = load i32, i32* %arrayidx321, align 4
  store i32 %153, i32* %arf, align 4
  %154 = load i16, i16* %l, align 2
  %idxprom322 = sext i16 %154 to i32
  %155 = load i32*, i32** %ffti_buf, align 4
  %arrayidx323 = getelementptr inbounds i32, i32* %155, i32 %idxprom322
  %156 = load i32, i32* %arrayidx323, align 4
  store i32 %156, i32* %aif, align 4
  %157 = load i16, i16* %l, align 2
  %conv324 = sext i16 %157 to i32
  %add325 = add nsw i32 %conv324, 1
  %158 = load i32*, i32** %fftr_buf, align 4
  %arrayidx326 = getelementptr inbounds i32, i32* %158, i32 %add325
  %159 = load i32, i32* %arrayidx326, align 4
  store i32 %159, i32* %brf, align 4
  %160 = load i16, i16* %l, align 2
  %conv327 = sext i16 %160 to i32
  %add328 = add nsw i32 %conv327, 1
  %161 = load i32*, i32** %ffti_buf, align 4
  %arrayidx329 = getelementptr inbounds i32, i32* %161, i32 %add328
  %162 = load i32, i32* %arrayidx329, align 4
  store i32 %162, i32* %bif, align 4
  %163 = load i16, i16* %l, align 2
  %conv330 = sext i16 %163 to i32
  %add331 = add nsw i32 %conv330, 2
  %164 = load i32*, i32** %fftr_buf, align 4
  %arrayidx332 = getelementptr inbounds i32, i32* %164, i32 %add331
  %165 = load i32, i32* %arrayidx332, align 4
  store i32 %165, i32* %crf, align 4
  %166 = load i16, i16* %l, align 2
  %conv333 = sext i16 %166 to i32
  %add334 = add nsw i32 %conv333, 2
  %167 = load i32*, i32** %ffti_buf, align 4
  %arrayidx335 = getelementptr inbounds i32, i32* %167, i32 %add334
  %168 = load i32, i32* %arrayidx335, align 4
  store i32 %168, i32* %cif, align 4
  %169 = load i16, i16* %l, align 2
  %conv336 = sext i16 %169 to i32
  %add337 = add nsw i32 %conv336, 3
  %170 = load i32*, i32** %fftr_buf, align 4
  %arrayidx338 = getelementptr inbounds i32, i32* %170, i32 %add337
  %171 = load i32, i32* %arrayidx338, align 4
  store i32 %171, i32* %drf, align 4
  %172 = load i16, i16* %l, align 2
  %conv339 = sext i16 %172 to i32
  %add340 = add nsw i32 %conv339, 3
  %173 = load i32*, i32** %ffti_buf, align 4
  %arrayidx341 = getelementptr inbounds i32, i32* %173, i32 %add340
  %174 = load i32, i32* %arrayidx341, align 4
  store i32 %174, i32* %dif, align 4
  %175 = load i32, i32* %arf, align 4
  %176 = load i32, i32* %brf, align 4
  %add342 = add nsw i32 %175, %176
  %177 = load i32, i32* %crf, align 4
  %add343 = add nsw i32 %add342, %177
  %178 = load i32, i32* %drf, align 4
  %add344 = add nsw i32 %add343, %178
  %179 = load i16, i16* %l, align 2
  %idxprom345 = sext i16 %179 to i32
  %180 = load i32*, i32** %fftr_buf, align 4
  %arrayidx346 = getelementptr inbounds i32, i32* %180, i32 %idxprom345
  store i32 %add344, i32* %arrayidx346, align 4
  %181 = load i32, i32* %aif, align 4
  %182 = load i32, i32* %bif, align 4
  %add347 = add nsw i32 %181, %182
  %183 = load i32, i32* %cif, align 4
  %add348 = add nsw i32 %add347, %183
  %184 = load i32, i32* %dif, align 4
  %add349 = add nsw i32 %add348, %184
  %185 = load i16, i16* %l, align 2
  %idxprom350 = sext i16 %185 to i32
  %186 = load i32*, i32** %ffti_buf, align 4
  %arrayidx351 = getelementptr inbounds i32, i32* %186, i32 %idxprom350
  store i32 %add349, i32* %arrayidx351, align 4
  %187 = load i32, i32* %arf, align 4
  %188 = load i32, i32* %brf, align 4
  %sub352 = sub nsw i32 %187, %188
  %189 = load i32, i32* %cif, align 4
  %sub353 = sub nsw i32 %sub352, %189
  %190 = load i32, i32* %dif, align 4
  %add354 = add nsw i32 %sub353, %190
  %191 = load i16, i16* %l, align 2
  %conv355 = sext i16 %191 to i32
  %add356 = add nsw i32 %conv355, 1
  %192 = load i32*, i32** %fftr_buf, align 4
  %arrayidx357 = getelementptr inbounds i32, i32* %192, i32 %add356
  store i32 %add354, i32* %arrayidx357, align 4
  %193 = load i32, i32* %aif, align 4
  %194 = load i32, i32* %bif, align 4
  %sub358 = sub nsw i32 %193, %194
  %195 = load i32, i32* %crf, align 4
  %add359 = add nsw i32 %sub358, %195
  %196 = load i32, i32* %drf, align 4
  %sub360 = sub nsw i32 %add359, %196
  %197 = load i16, i16* %l, align 2
  %conv361 = sext i16 %197 to i32
  %add362 = add nsw i32 %conv361, 1
  %198 = load i32*, i32** %ffti_buf, align 4
  %arrayidx363 = getelementptr inbounds i32, i32* %198, i32 %add362
  store i32 %sub360, i32* %arrayidx363, align 4
  %199 = load i32, i32* %arf, align 4
  %200 = load i32, i32* %brf, align 4
  %add364 = add nsw i32 %199, %200
  %201 = load i32, i32* %crf, align 4
  %sub365 = sub nsw i32 %add364, %201
  %202 = load i32, i32* %drf, align 4
  %sub366 = sub nsw i32 %sub365, %202
  %203 = load i16, i16* %l, align 2
  %conv367 = sext i16 %203 to i32
  %add368 = add nsw i32 %conv367, 2
  %204 = load i32*, i32** %fftr_buf, align 4
  %arrayidx369 = getelementptr inbounds i32, i32* %204, i32 %add368
  store i32 %sub366, i32* %arrayidx369, align 4
  %205 = load i32, i32* %aif, align 4
  %206 = load i32, i32* %bif, align 4
  %add370 = add nsw i32 %205, %206
  %207 = load i32, i32* %cif, align 4
  %sub371 = sub nsw i32 %add370, %207
  %208 = load i32, i32* %dif, align 4
  %sub372 = sub nsw i32 %sub371, %208
  %209 = load i16, i16* %l, align 2
  %conv373 = sext i16 %209 to i32
  %add374 = add nsw i32 %conv373, 2
  %210 = load i32*, i32** %ffti_buf, align 4
  %arrayidx375 = getelementptr inbounds i32, i32* %210, i32 %add374
  store i32 %sub372, i32* %arrayidx375, align 4
  %211 = load i32, i32* %arf, align 4
  %212 = load i32, i32* %brf, align 4
  %sub376 = sub nsw i32 %211, %212
  %213 = load i32, i32* %cif, align 4
  %add377 = add nsw i32 %sub376, %213
  %214 = load i32, i32* %dif, align 4
  %sub378 = sub nsw i32 %add377, %214
  %215 = load i16, i16* %l, align 2
  %conv379 = sext i16 %215 to i32
  %add380 = add nsw i32 %conv379, 3
  %216 = load i32*, i32** %fftr_buf, align 4
  %arrayidx381 = getelementptr inbounds i32, i32* %216, i32 %add380
  store i32 %sub378, i32* %arrayidx381, align 4
  %217 = load i32, i32* %aif, align 4
  %218 = load i32, i32* %bif, align 4
  %sub382 = sub nsw i32 %217, %218
  %219 = load i32, i32* %crf, align 4
  %sub383 = sub nsw i32 %sub382, %219
  %220 = load i32, i32* %drf, align 4
  %add384 = add nsw i32 %sub383, %220
  %221 = load i16, i16* %l, align 2
  %conv385 = sext i16 %221 to i32
  %add386 = add nsw i32 %conv385, 3
  %222 = load i32*, i32** %ffti_buf, align 4
  %arrayidx387 = getelementptr inbounds i32, i32* %222, i32 %add386
  store i32 %add384, i32* %arrayidx387, align 4
  br label %for.inc388

for.inc388:                                       ; preds = %cond.end317
  %223 = load i16, i16* %i, align 2
  %conv389 = sext i16 %223 to i32
  %add390 = add nsw i32 %conv389, 4
  %conv391 = trunc i32 %add390 to i16
  store i16 %conv391, i16* %i, align 2
  br label %for.cond281

for.end392:                                       ; preds = %for.cond281
  %arraydecay393 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  store i32* %arraydecay393, i32** %fftr_buf, align 4
  %224 = load i16, i16* %bswitch.addr, align 2
  %conv394 = sext i16 %224 to i32
  %tobool395 = icmp ne i32 %conv394, 0
  br i1 %tobool395, label %cond.true396, label %cond.false400

cond.true396:                                     ; preds = %for.end392
  %arraydecay397 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  %225 = load i16, i16* %fftn, align 2
  %conv398 = sext i16 %225 to i32
  %add.ptr399 = getelementptr inbounds i32, i32* %arraydecay397, i32 %conv398
  br label %cond.end402

cond.false400:                                    ; preds = %for.end392
  %arraydecay401 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %cond.end402

cond.end402:                                      ; preds = %cond.false400, %cond.true396
  %cond403 = phi i32* [ %add.ptr399, %cond.true396 ], [ %arraydecay401, %cond.false400 ]
  store i32* %cond403, i32** %ffti_buf, align 4
  store i32 0, i32* %k1, align 4
  br label %for.cond404

for.cond404:                                      ; preds = %for.inc577, %cond.end402
  %226 = load i32, i32* %k1, align 4
  %227 = load i32, i32* %total_ops, align 4
  %228 = load i16, i16* %nstep, align 2
  %conv405 = sext i16 %228 to i32
  %mul406 = mul i32 %227, %conv405
  %cmp407 = icmp ult i32 %226, %mul406
  br i1 %cmp407, label %for.body409, label %for.end579

for.body409:                                      ; preds = %for.cond404
  %229 = load i32, i32* %k1, align 4
  %230 = load i32, i32* %total_ops, align 4
  %cmp410 = icmp uge i32 %229, %230
  %cond412 = select i1 %cmp410, i32 1, i32 0
  %conv413 = trunc i32 %cond412 to i16
  store i16 %conv413, i16* %m, align 2
  %231 = load i16, i16* %m, align 2
  %conv414 = sext i16 %231 to i32
  %tobool415 = icmp ne i32 %conv414, 0
  br i1 %tobool415, label %cond.true416, label %cond.false420

cond.true416:                                     ; preds = %for.body409
  %arraydecay417 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  %232 = load i16, i16* %fftn, align 2
  %conv418 = sext i16 %232 to i32
  %add.ptr419 = getelementptr inbounds i32, i32* %arraydecay417, i32 %conv418
  br label %cond.end421

cond.false420:                                    ; preds = %for.body409
  %233 = load i32*, i32** %fftr_buf, align 4
  br label %cond.end421

cond.end421:                                      ; preds = %cond.false420, %cond.true416
  %cond422 = phi i32* [ %add.ptr419, %cond.true416 ], [ %233, %cond.false420 ]
  store i32* %cond422, i32** %fftr_buf, align 4
  %234 = load i16, i16* %m, align 2
  %conv423 = sext i16 %234 to i32
  %tobool424 = icmp ne i32 %conv423, 0
  br i1 %tobool424, label %cond.true425, label %cond.false427

cond.true425:                                     ; preds = %cond.end421
  %arraydecay426 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %cond.end428

cond.false427:                                    ; preds = %cond.end421
  %235 = load i32*, i32** %ffti_buf, align 4
  br label %cond.end428

cond.end428:                                      ; preds = %cond.false427, %cond.true425
  %cond429 = phi i32* [ %arraydecay426, %cond.true425 ], [ %235, %cond.false427 ]
  store i32* %cond429, i32** %ffti_buf, align 4
  %236 = load i16, i16* %m, align 2
  %conv430 = sext i16 %236 to i32
  %tobool431 = icmp ne i32 %conv430, 0
  br i1 %tobool431, label %cond.true432, label %cond.false436

cond.true432:                                     ; preds = %cond.end428
  %237 = load i32, i32* %k1, align 4
  %238 = load i32, i32* %total_ops, align 4
  %sub433 = sub i32 %237, %238
  %239 = load i16, i16* %shft_fftnby2, align 2
  %conv434 = sext i16 %239 to i32
  %shr435 = lshr i32 %sub433, %conv434
  br label %cond.end439

cond.false436:                                    ; preds = %cond.end428
  %240 = load i32, i32* %k1, align 4
  %241 = load i16, i16* %shft_fftnby2, align 2
  %conv437 = sext i16 %241 to i32
  %shr438 = lshr i32 %240, %conv437
  br label %cond.end439

cond.end439:                                      ; preds = %cond.false436, %cond.true432
  %cond440 = phi i32 [ %shr435, %cond.true432 ], [ %shr438, %cond.false436 ]
  store i32 %cond440, i32* %k, align 4
  %242 = load i16, i16* %m, align 2
  %conv441 = sext i16 %242 to i32
  %tobool442 = icmp ne i32 %conv441, 0
  br i1 %tobool442, label %cond.true443, label %cond.false445

cond.true443:                                     ; preds = %cond.end439
  %243 = load i32, i32* %k1, align 4
  %244 = load i32, i32* %total_ops, align 4
  %sub444 = sub i32 %243, %244
  %245 = load i32, i32* %mask_fftnby2, align 4
  %and = and i32 %sub444, %245
  br label %cond.end447

cond.false445:                                    ; preds = %cond.end439
  %246 = load i32, i32* %k1, align 4
  %247 = load i32, i32* %mask_fftnby2, align 4
  %and446 = and i32 %246, %247
  br label %cond.end447

cond.end447:                                      ; preds = %cond.false445, %cond.true443
  %cond448 = phi i32 [ %and, %cond.true443 ], [ %and446, %cond.false445 ]
  %conv449 = trunc i32 %cond448 to i16
  store i16 %conv449, i16* %i1, align 2
  store i16 %conv449, i16* %i3, align 2
  store i16 %conv449, i16* %i2, align 2
  %248 = load i16, i16* %nstep, align 2
  %conv450 = sext i16 %248 to i32
  %cmp451 = icmp eq i32 %conv450, 2
  br i1 %cmp451, label %cond.true453, label %cond.false459

cond.true453:                                     ; preds = %cond.end447
  %249 = load i16, i16* %i1, align 2
  %conv454 = sext i16 %249 to i32
  %250 = load i16, i16* %neg_mask_gp, align 2
  %conv455 = sext i16 %250 to i32
  %251 = load i32, i32* %k, align 4
  %shr456 = ashr i32 %conv455, %251
  %and457 = and i32 %conv454, %shr456
  %shl458 = shl i32 %and457, 1
  br label %cond.end464

cond.false459:                                    ; preds = %cond.end447
  %252 = load i16, i16* %i1, align 2
  %conv460 = sext i16 %252 to i32
  %253 = load i16, i16* %neg_mask_gp, align 2
  %conv461 = sext i16 %253 to i32
  %254 = load i32, i32* %k, align 4
  %shr462 = ashr i32 %conv461, %254
  %and463 = and i32 %conv460, %shr462
  br label %cond.end464

cond.end464:                                      ; preds = %cond.false459, %cond.true453
  %cond465 = phi i32 [ %shl458, %cond.true453 ], [ %and463, %cond.false459 ]
  %conv466 = trunc i32 %cond465 to i16
  store i16 %conv466, i16* %i4, align 2
  %255 = load i16, i16* %i2, align 2
  %conv467 = sext i16 %255 to i32
  %256 = load i16, i16* %shft_gp, align 2
  %conv468 = sext i16 %256 to i32
  %257 = load i32, i32* %k, align 4
  %sub469 = sub i32 %conv468, %257
  %shr470 = ashr i32 %conv467, %sub469
  %258 = load i16, i16* %i3, align 2
  %conv471 = sext i16 %258 to i32
  %259 = load i16, i16* %mask_gp, align 2
  %conv472 = sext i16 %259 to i32
  %260 = load i32, i32* %k, align 4
  %shr473 = ashr i32 %conv472, %260
  %and474 = and i32 %conv471, %shr473
  %261 = load i16, i16* %shft_bg, align 2
  %conv475 = sext i16 %261 to i32
  %262 = load i32, i32* %k, align 4
  %add476 = add i32 %conv475, %262
  %shl477 = shl i32 %and474, %add476
  %add478 = add nsw i32 %shr470, %shl477
  %conv479 = trunc i32 %add478 to i16
  store i16 %conv479, i16* %l, align 2
  %263 = load i16, i16* %l, align 2
  %conv480 = sext i16 %263 to i32
  %264 = load i16, i16* %bg, align 2
  %conv481 = sext i16 %264 to i32
  %265 = load i32, i32* %k, align 4
  %shl482 = shl i32 %conv481, %265
  %add483 = add nsw i32 %conv480, %shl482
  %conv484 = trunc i32 %add483 to i16
  store i16 %conv484, i16* %l_plus_bg, align 2
  %266 = load i16, i16* %i4, align 2
  %idxprom485 = sext i16 %266 to i32
  %arrayidx486 = getelementptr inbounds [64 x i32], [64 x i32]* @xcos_fixed, i32 0, i32 %idxprom485
  %267 = load i32, i32* %arrayidx486, align 4
  store i32 %267, i32* %cr_fixed, align 4
  %268 = load i16, i16* %i4, align 2
  %idxprom487 = sext i16 %268 to i32
  %arrayidx488 = getelementptr inbounds [64 x i32], [64 x i32]* @xsin_fixed, i32 0, i32 %idxprom487
  %269 = load i32, i32* %arrayidx488, align 4
  store i32 %269, i32* %ci_fixed, align 4
  %270 = load i16, i16* %l, align 2
  %idxprom489 = sext i16 %270 to i32
  %271 = load i32*, i32** %fftr_buf, align 4
  %arrayidx490 = getelementptr inbounds i32, i32* %271, i32 %idxprom489
  %272 = load i32, i32* %arrayidx490, align 4
  store i32 %272, i32* %arf, align 4
  %273 = load i16, i16* %l, align 2
  %idxprom491 = sext i16 %273 to i32
  %274 = load i32*, i32** %ffti_buf, align 4
  %arrayidx492 = getelementptr inbounds i32, i32* %274, i32 %idxprom491
  %275 = load i32, i32* %arrayidx492, align 4
  store i32 %275, i32* %aif, align 4
  %276 = load i16, i16* %l_plus_bg, align 2
  %idxprom493 = sext i16 %276 to i32
  %277 = load i32*, i32** %fftr_buf, align 4
  %arrayidx494 = getelementptr inbounds i32, i32* %277, i32 %idxprom493
  %278 = load i32, i32* %arrayidx494, align 4
  store i32 %278, i32* %brf, align 4
  %279 = load i16, i16* %l_plus_bg, align 2
  %idxprom495 = sext i16 %279 to i32
  %280 = load i32*, i32** %ffti_buf, align 4
  %arrayidx496 = getelementptr inbounds i32, i32* %280, i32 %idxprom495
  %281 = load i32, i32* %arrayidx496, align 4
  store i32 %281, i32* %bif, align 4
  %282 = load i32, i32* %brf, align 4
  %shr497 = ashr i32 %282, 16
  %283 = load i32, i32* %cr_fixed, align 4
  %shr498 = ashr i32 %283, 16
  %mul499 = mul nsw i32 %shr497, %shr498
  %shl500 = shl i32 %mul499, 1
  %284 = load i32, i32* %brf, align 4
  %shr501 = ashr i32 %284, 16
  %285 = load i32, i32* %cr_fixed, align 4
  %conv502 = trunc i32 %285 to i16
  %conv503 = zext i16 %conv502 to i32
  %mul504 = mul nsw i32 %shr501, %conv503
  %shr505 = ashr i32 %mul504, 15
  %add506 = add nsw i32 %shl500, %shr505
  %286 = load i32, i32* %cr_fixed, align 4
  %shr507 = ashr i32 %286, 16
  %287 = load i32, i32* %brf, align 4
  %conv508 = trunc i32 %287 to i16
  %conv509 = zext i16 %conv508 to i32
  %mul510 = mul nsw i32 %shr507, %conv509
  %shr511 = ashr i32 %mul510, 15
  %add512 = add nsw i32 %add506, %shr511
  store i32 %add512, i32* %temp5, align 4
  %288 = load i32, i32* %bif, align 4
  %shr513 = ashr i32 %288, 16
  %289 = load i32, i32* %ci_fixed, align 4
  %shr514 = ashr i32 %289, 16
  %mul515 = mul nsw i32 %shr513, %shr514
  %shl516 = shl i32 %mul515, 1
  %290 = load i32, i32* %bif, align 4
  %shr517 = ashr i32 %290, 16
  %291 = load i32, i32* %ci_fixed, align 4
  %conv518 = trunc i32 %291 to i16
  %conv519 = zext i16 %conv518 to i32
  %mul520 = mul nsw i32 %shr517, %conv519
  %shr521 = ashr i32 %mul520, 15
  %add522 = add nsw i32 %shl516, %shr521
  %292 = load i32, i32* %ci_fixed, align 4
  %shr523 = ashr i32 %292, 16
  %293 = load i32, i32* %bif, align 4
  %conv524 = trunc i32 %293 to i16
  %conv525 = zext i16 %conv524 to i32
  %mul526 = mul nsw i32 %shr523, %conv525
  %shr527 = ashr i32 %mul526, 15
  %add528 = add nsw i32 %add522, %shr527
  store i32 %add528, i32* %temp6, align 4
  %294 = load i32, i32* %brf, align 4
  %shr529 = ashr i32 %294, 16
  %295 = load i32, i32* %ci_fixed, align 4
  %shr530 = ashr i32 %295, 16
  %mul531 = mul nsw i32 %shr529, %shr530
  %shl532 = shl i32 %mul531, 1
  %296 = load i32, i32* %brf, align 4
  %shr533 = ashr i32 %296, 16
  %297 = load i32, i32* %ci_fixed, align 4
  %conv534 = trunc i32 %297 to i16
  %conv535 = zext i16 %conv534 to i32
  %mul536 = mul nsw i32 %shr533, %conv535
  %shr537 = ashr i32 %mul536, 15
  %add538 = add nsw i32 %shl532, %shr537
  %298 = load i32, i32* %ci_fixed, align 4
  %shr539 = ashr i32 %298, 16
  %299 = load i32, i32* %brf, align 4
  %conv540 = trunc i32 %299 to i16
  %conv541 = zext i16 %conv540 to i32
  %mul542 = mul nsw i32 %shr539, %conv541
  %shr543 = ashr i32 %mul542, 15
  %add544 = add nsw i32 %add538, %shr543
  store i32 %add544, i32* %temp7, align 4
  %300 = load i32, i32* %bif, align 4
  %shr545 = ashr i32 %300, 16
  %301 = load i32, i32* %cr_fixed, align 4
  %shr546 = ashr i32 %301, 16
  %mul547 = mul nsw i32 %shr545, %shr546
  %shl548 = shl i32 %mul547, 1
  %302 = load i32, i32* %bif, align 4
  %shr549 = ashr i32 %302, 16
  %303 = load i32, i32* %cr_fixed, align 4
  %conv550 = trunc i32 %303 to i16
  %conv551 = zext i16 %conv550 to i32
  %mul552 = mul nsw i32 %shr549, %conv551
  %shr553 = ashr i32 %mul552, 15
  %add554 = add nsw i32 %shl548, %shr553
  %304 = load i32, i32* %cr_fixed, align 4
  %shr555 = ashr i32 %304, 16
  %305 = load i32, i32* %bif, align 4
  %conv556 = trunc i32 %305 to i16
  %conv557 = zext i16 %conv556 to i32
  %mul558 = mul nsw i32 %shr555, %conv557
  %shr559 = ashr i32 %mul558, 15
  %add560 = add nsw i32 %add554, %shr559
  store i32 %add560, i32* %temp8, align 4
  %306 = load i32, i32* %arf, align 4
  %307 = load i32, i32* %temp5, align 4
  %sub561 = sub nsw i32 %306, %307
  %308 = load i32, i32* %temp6, align 4
  %add562 = add nsw i32 %sub561, %308
  %309 = load i16, i16* %l, align 2
  %idxprom563 = sext i16 %309 to i32
  %310 = load i32*, i32** %fftr_buf, align 4
  %arrayidx564 = getelementptr inbounds i32, i32* %310, i32 %idxprom563
  store i32 %add562, i32* %arrayidx564, align 4
  %311 = load i32, i32* %aif, align 4
  %312 = load i32, i32* %temp7, align 4
  %sub565 = sub nsw i32 %311, %312
  %313 = load i32, i32* %temp8, align 4
  %sub566 = sub nsw i32 %sub565, %313
  %314 = load i16, i16* %l, align 2
  %idxprom567 = sext i16 %314 to i32
  %315 = load i32*, i32** %ffti_buf, align 4
  %arrayidx568 = getelementptr inbounds i32, i32* %315, i32 %idxprom567
  store i32 %sub566, i32* %arrayidx568, align 4
  %316 = load i32, i32* %arf, align 4
  %317 = load i32, i32* %temp5, align 4
  %add569 = add nsw i32 %316, %317
  %318 = load i32, i32* %temp6, align 4
  %sub570 = sub nsw i32 %add569, %318
  %319 = load i16, i16* %l_plus_bg, align 2
  %idxprom571 = sext i16 %319 to i32
  %320 = load i32*, i32** %fftr_buf, align 4
  %arrayidx572 = getelementptr inbounds i32, i32* %320, i32 %idxprom571
  store i32 %sub570, i32* %arrayidx572, align 4
  %321 = load i32, i32* %aif, align 4
  %322 = load i32, i32* %temp7, align 4
  %add573 = add nsw i32 %321, %322
  %323 = load i32, i32* %temp8, align 4
  %add574 = add nsw i32 %add573, %323
  %324 = load i16, i16* %l_plus_bg, align 2
  %idxprom575 = sext i16 %324 to i32
  %325 = load i32*, i32** %ffti_buf, align 4
  %arrayidx576 = getelementptr inbounds i32, i32* %325, i32 %idxprom575
  store i32 %add574, i32* %arrayidx576, align 4
  br label %for.inc577

for.inc577:                                       ; preds = %cond.end464
  %326 = load i32, i32* %k1, align 4
  %inc578 = add i32 %326, 1
  store i32 %inc578, i32* %k1, align 4
  br label %for.cond404

for.end579:                                       ; preds = %for.cond404
  %327 = load i16, i16* %bswitch.addr, align 2
  %tobool580 = icmp ne i16 %327, 0
  br i1 %tobool580, label %if.then581, label %if.else746

if.then581:                                       ; preds = %for.end579
  store i16 0, i16* %i, align 2
  br label %for.cond582

for.cond582:                                      ; preds = %for.inc743, %if.then581
  %328 = load i16, i16* %i, align 2
  %conv583 = sext i16 %328 to i32
  %cmp584 = icmp slt i32 %conv583, 64
  br i1 %cmp584, label %for.body586, label %for.end745

for.body586:                                      ; preds = %for.cond582
  %329 = load i16, i16* %i, align 2
  %idxprom587 = sext i16 %329 to i32
  %arrayidx588 = getelementptr inbounds [64 x i32], [64 x i32]* @zcos2_fixed, i32 0, i32 %idxprom587
  %330 = load i32, i32* %arrayidx588, align 4
  store i32 %330, i32* %cr_fixed, align 4
  %331 = load i16, i16* %i, align 2
  %idxprom589 = sext i16 %331 to i32
  %arrayidx590 = getelementptr inbounds [64 x i32], [64 x i32]* @zsin2_fixed, i32 0, i32 %idxprom589
  %332 = load i32, i32* %arrayidx590, align 4
  store i32 %332, i32* %ci_fixed, align 4
  %333 = load i16, i16* %i, align 2
  %idxprom591 = sext i16 %333 to i32
  %arrayidx592 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom591
  %334 = load i32, i32* %arrayidx592, align 4
  store i32 %334, i32* %arf, align 4
  %335 = load i16, i16* %i, align 2
  %conv593 = sext i16 %335 to i32
  %add594 = add nsw i32 64, %conv593
  %arrayidx595 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %add594
  %336 = load i32, i32* %arrayidx595, align 4
  store i32 %336, i32* %aif, align 4
  %337 = load i16, i16* %i, align 2
  %conv596 = sext i16 %337 to i32
  %add597 = add nsw i32 64, %conv596
  %arrayidx598 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %add597
  %338 = load i32, i32* %arrayidx598, align 4
  store i32 %338, i32* %brf, align 4
  %339 = load i16, i16* %i, align 2
  %idxprom599 = sext i16 %339 to i32
  %arrayidx600 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom599
  %340 = load i32, i32* %arrayidx600, align 4
  store i32 %340, i32* %bif, align 4
  %341 = load i32, i32* %arf, align 4
  %shr601 = ashr i32 %341, 16
  %342 = load i32, i32* %cr_fixed, align 4
  %shr602 = ashr i32 %342, 16
  %mul603 = mul nsw i32 %shr601, %shr602
  %shl604 = shl i32 %mul603, 1
  %343 = load i32, i32* %arf, align 4
  %shr605 = ashr i32 %343, 16
  %344 = load i32, i32* %cr_fixed, align 4
  %conv606 = trunc i32 %344 to i16
  %conv607 = zext i16 %conv606 to i32
  %mul608 = mul nsw i32 %shr605, %conv607
  %shr609 = ashr i32 %mul608, 15
  %add610 = add nsw i32 %shl604, %shr609
  %345 = load i32, i32* %cr_fixed, align 4
  %shr611 = ashr i32 %345, 16
  %346 = load i32, i32* %arf, align 4
  %conv612 = trunc i32 %346 to i16
  %conv613 = zext i16 %conv612 to i32
  %mul614 = mul nsw i32 %shr611, %conv613
  %shr615 = ashr i32 %mul614, 15
  %add616 = add nsw i32 %add610, %shr615
  store i32 %add616, i32* %temp5, align 4
  %347 = load i32, i32* %aif, align 4
  %shr617 = ashr i32 %347, 16
  %348 = load i32, i32* %ci_fixed, align 4
  %shr618 = ashr i32 %348, 16
  %mul619 = mul nsw i32 %shr617, %shr618
  %shl620 = shl i32 %mul619, 1
  %349 = load i32, i32* %aif, align 4
  %shr621 = ashr i32 %349, 16
  %350 = load i32, i32* %ci_fixed, align 4
  %conv622 = trunc i32 %350 to i16
  %conv623 = zext i16 %conv622 to i32
  %mul624 = mul nsw i32 %shr621, %conv623
  %shr625 = ashr i32 %mul624, 15
  %add626 = add nsw i32 %shl620, %shr625
  %351 = load i32, i32* %ci_fixed, align 4
  %shr627 = ashr i32 %351, 16
  %352 = load i32, i32* %aif, align 4
  %conv628 = trunc i32 %352 to i16
  %conv629 = zext i16 %conv628 to i32
  %mul630 = mul nsw i32 %shr627, %conv629
  %shr631 = ashr i32 %mul630, 15
  %add632 = add nsw i32 %add626, %shr631
  store i32 %add632, i32* %temp6, align 4
  %353 = load i32, i32* %aif, align 4
  %shr633 = ashr i32 %353, 16
  %354 = load i32, i32* %cr_fixed, align 4
  %shr634 = ashr i32 %354, 16
  %mul635 = mul nsw i32 %shr633, %shr634
  %shl636 = shl i32 %mul635, 1
  %355 = load i32, i32* %aif, align 4
  %shr637 = ashr i32 %355, 16
  %356 = load i32, i32* %cr_fixed, align 4
  %conv638 = trunc i32 %356 to i16
  %conv639 = zext i16 %conv638 to i32
  %mul640 = mul nsw i32 %shr637, %conv639
  %shr641 = ashr i32 %mul640, 15
  %add642 = add nsw i32 %shl636, %shr641
  %357 = load i32, i32* %cr_fixed, align 4
  %shr643 = ashr i32 %357, 16
  %358 = load i32, i32* %aif, align 4
  %conv644 = trunc i32 %358 to i16
  %conv645 = zext i16 %conv644 to i32
  %mul646 = mul nsw i32 %shr643, %conv645
  %shr647 = ashr i32 %mul646, 15
  %add648 = add nsw i32 %add642, %shr647
  store i32 %add648, i32* %temp7, align 4
  %359 = load i32, i32* %arf, align 4
  %shr649 = ashr i32 %359, 16
  %360 = load i32, i32* %ci_fixed, align 4
  %shr650 = ashr i32 %360, 16
  %mul651 = mul nsw i32 %shr649, %shr650
  %shl652 = shl i32 %mul651, 1
  %361 = load i32, i32* %arf, align 4
  %shr653 = ashr i32 %361, 16
  %362 = load i32, i32* %ci_fixed, align 4
  %conv654 = trunc i32 %362 to i16
  %conv655 = zext i16 %conv654 to i32
  %mul656 = mul nsw i32 %shr653, %conv655
  %shr657 = ashr i32 %mul656, 15
  %add658 = add nsw i32 %shl652, %shr657
  %363 = load i32, i32* %ci_fixed, align 4
  %shr659 = ashr i32 %363, 16
  %364 = load i32, i32* %arf, align 4
  %conv660 = trunc i32 %364 to i16
  %conv661 = zext i16 %conv660 to i32
  %mul662 = mul nsw i32 %shr659, %conv661
  %shr663 = ashr i32 %mul662, 15
  %add664 = add nsw i32 %add658, %shr663
  store i32 %add664, i32* %temp8, align 4
  %365 = load i32, i32* %brf, align 4
  %shr665 = ashr i32 %365, 16
  %366 = load i32, i32* %cr_fixed, align 4
  %shr666 = ashr i32 %366, 16
  %mul667 = mul nsw i32 %shr665, %shr666
  %shl668 = shl i32 %mul667, 1
  %367 = load i32, i32* %brf, align 4
  %shr669 = ashr i32 %367, 16
  %368 = load i32, i32* %cr_fixed, align 4
  %conv670 = trunc i32 %368 to i16
  %conv671 = zext i16 %conv670 to i32
  %mul672 = mul nsw i32 %shr669, %conv671
  %shr673 = ashr i32 %mul672, 15
  %add674 = add nsw i32 %shl668, %shr673
  %369 = load i32, i32* %cr_fixed, align 4
  %shr675 = ashr i32 %369, 16
  %370 = load i32, i32* %brf, align 4
  %conv676 = trunc i32 %370 to i16
  %conv677 = zext i16 %conv676 to i32
  %mul678 = mul nsw i32 %shr675, %conv677
  %shr679 = ashr i32 %mul678, 15
  %add680 = add nsw i32 %add674, %shr679
  store i32 %add680, i32* %temp9, align 4
  %371 = load i32, i32* %bif, align 4
  %shr681 = ashr i32 %371, 16
  %372 = load i32, i32* %ci_fixed, align 4
  %shr682 = ashr i32 %372, 16
  %mul683 = mul nsw i32 %shr681, %shr682
  %shl684 = shl i32 %mul683, 1
  %373 = load i32, i32* %bif, align 4
  %shr685 = ashr i32 %373, 16
  %374 = load i32, i32* %ci_fixed, align 4
  %conv686 = trunc i32 %374 to i16
  %conv687 = zext i16 %conv686 to i32
  %mul688 = mul nsw i32 %shr685, %conv687
  %shr689 = ashr i32 %mul688, 15
  %add690 = add nsw i32 %shl684, %shr689
  %375 = load i32, i32* %ci_fixed, align 4
  %shr691 = ashr i32 %375, 16
  %376 = load i32, i32* %bif, align 4
  %conv692 = trunc i32 %376 to i16
  %conv693 = zext i16 %conv692 to i32
  %mul694 = mul nsw i32 %shr691, %conv693
  %shr695 = ashr i32 %mul694, 15
  %add696 = add nsw i32 %add690, %shr695
  store i32 %add696, i32* %temp10, align 4
  %377 = load i32, i32* %bif, align 4
  %shr697 = ashr i32 %377, 16
  %378 = load i32, i32* %cr_fixed, align 4
  %shr698 = ashr i32 %378, 16
  %mul699 = mul nsw i32 %shr697, %shr698
  %shl700 = shl i32 %mul699, 1
  %379 = load i32, i32* %bif, align 4
  %shr701 = ashr i32 %379, 16
  %380 = load i32, i32* %cr_fixed, align 4
  %conv702 = trunc i32 %380 to i16
  %conv703 = zext i16 %conv702 to i32
  %mul704 = mul nsw i32 %shr701, %conv703
  %shr705 = ashr i32 %mul704, 15
  %add706 = add nsw i32 %shl700, %shr705
  %381 = load i32, i32* %cr_fixed, align 4
  %shr707 = ashr i32 %381, 16
  %382 = load i32, i32* %bif, align 4
  %conv708 = trunc i32 %382 to i16
  %conv709 = zext i16 %conv708 to i32
  %mul710 = mul nsw i32 %shr707, %conv709
  %shr711 = ashr i32 %mul710, 15
  %add712 = add nsw i32 %add706, %shr711
  store i32 %add712, i32* %temp11, align 4
  %383 = load i32, i32* %brf, align 4
  %shr713 = ashr i32 %383, 16
  %384 = load i32, i32* %ci_fixed, align 4
  %shr714 = ashr i32 %384, 16
  %mul715 = mul nsw i32 %shr713, %shr714
  %shl716 = shl i32 %mul715, 1
  %385 = load i32, i32* %brf, align 4
  %shr717 = ashr i32 %385, 16
  %386 = load i32, i32* %ci_fixed, align 4
  %conv718 = trunc i32 %386 to i16
  %conv719 = zext i16 %conv718 to i32
  %mul720 = mul nsw i32 %shr717, %conv719
  %shr721 = ashr i32 %mul720, 15
  %add722 = add nsw i32 %shl716, %shr721
  %387 = load i32, i32* %ci_fixed, align 4
  %shr723 = ashr i32 %387, 16
  %388 = load i32, i32* %brf, align 4
  %conv724 = trunc i32 %388 to i16
  %conv725 = zext i16 %conv724 to i32
  %mul726 = mul nsw i32 %shr723, %conv725
  %shr727 = ashr i32 %mul726, 15
  %add728 = add nsw i32 %add722, %shr727
  store i32 %add728, i32* %temp12, align 4
  %389 = load i32, i32* %temp5, align 4
  %390 = load i32, i32* %temp6, align 4
  %sub729 = sub nsw i32 %389, %390
  %391 = load i16, i16* %i, align 2
  %idxprom730 = sext i16 %391 to i32
  %arrayidx731 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom730
  store i32 %sub729, i32* %arrayidx731, align 4
  %392 = load i32, i32* %temp7, align 4
  %393 = load i32, i32* %temp8, align 4
  %add732 = add nsw i32 %392, %393
  %394 = load i16, i16* %i, align 2
  %conv733 = sext i16 %394 to i32
  %add734 = add nsw i32 64, %conv733
  %arrayidx735 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %add734
  store i32 %add732, i32* %arrayidx735, align 4
  %395 = load i32, i32* %temp9, align 4
  %396 = load i32, i32* %temp10, align 4
  %sub736 = sub nsw i32 %395, %396
  %397 = load i16, i16* %i, align 2
  %conv737 = sext i16 %397 to i32
  %add738 = add nsw i32 64, %conv737
  %arrayidx739 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %add738
  store i32 %sub736, i32* %arrayidx739, align 4
  %398 = load i32, i32* %temp11, align 4
  %399 = load i32, i32* %temp12, align 4
  %add740 = add nsw i32 %398, %399
  %400 = load i16, i16* %i, align 2
  %idxprom741 = sext i16 %400 to i32
  %arrayidx742 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom741
  store i32 %add740, i32* %arrayidx742, align 4
  br label %for.inc743

for.inc743:                                       ; preds = %for.body586
  %401 = load i16, i16* %i, align 2
  %inc744 = add i16 %401, 1
  store i16 %inc744, i16* %i, align 2
  br label %for.cond582

for.end745:                                       ; preds = %for.cond582
  br label %if.end833

if.else746:                                       ; preds = %for.end579
  store i16 0, i16* %i, align 2
  br label %for.cond747

for.cond747:                                      ; preds = %for.inc830, %if.else746
  %402 = load i16, i16* %i, align 2
  %conv748 = sext i16 %402 to i32
  %cmp749 = icmp slt i32 %conv748, 128
  br i1 %cmp749, label %for.body751, label %for.end832

for.body751:                                      ; preds = %for.cond747
  %403 = load i16, i16* %i, align 2
  %idxprom752 = sext i16 %403 to i32
  %arrayidx753 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom752
  %404 = load i32, i32* %arrayidx753, align 4
  store i32 %404, i32* %arf, align 4
  %405 = load i16, i16* %i, align 2
  %idxprom754 = sext i16 %405 to i32
  %arrayidx755 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom754
  %406 = load i32, i32* %arrayidx755, align 4
  store i32 %406, i32* %aif, align 4
  %407 = load i16, i16* %i, align 2
  %idxprom756 = sext i16 %407 to i32
  %arrayidx757 = getelementptr inbounds [128 x i32], [128 x i32]* @zcos1_fixed, i32 0, i32 %idxprom756
  %408 = load i32, i32* %arrayidx757, align 4
  store i32 %408, i32* %cr_fixed, align 4
  %409 = load i16, i16* %i, align 2
  %idxprom758 = sext i16 %409 to i32
  %arrayidx759 = getelementptr inbounds [128 x i32], [128 x i32]* @zsin1_fixed, i32 0, i32 %idxprom758
  %410 = load i32, i32* %arrayidx759, align 4
  store i32 %410, i32* %ci_fixed, align 4
  %411 = load i32, i32* %arf, align 4
  %shr760 = ashr i32 %411, 16
  %412 = load i32, i32* %cr_fixed, align 4
  %shr761 = ashr i32 %412, 16
  %mul762 = mul nsw i32 %shr760, %shr761
  %shl763 = shl i32 %mul762, 1
  %413 = load i32, i32* %arf, align 4
  %shr764 = ashr i32 %413, 16
  %414 = load i32, i32* %cr_fixed, align 4
  %conv765 = trunc i32 %414 to i16
  %conv766 = zext i16 %conv765 to i32
  %mul767 = mul nsw i32 %shr764, %conv766
  %shr768 = ashr i32 %mul767, 15
  %add769 = add nsw i32 %shl763, %shr768
  %415 = load i32, i32* %cr_fixed, align 4
  %shr770 = ashr i32 %415, 16
  %416 = load i32, i32* %arf, align 4
  %conv771 = trunc i32 %416 to i16
  %conv772 = zext i16 %conv771 to i32
  %mul773 = mul nsw i32 %shr770, %conv772
  %shr774 = ashr i32 %mul773, 15
  %add775 = add nsw i32 %add769, %shr774
  store i32 %add775, i32* %temp9, align 4
  %417 = load i32, i32* %aif, align 4
  %shr776 = ashr i32 %417, 16
  %418 = load i32, i32* %ci_fixed, align 4
  %shr777 = ashr i32 %418, 16
  %mul778 = mul nsw i32 %shr776, %shr777
  %shl779 = shl i32 %mul778, 1
  %419 = load i32, i32* %aif, align 4
  %shr780 = ashr i32 %419, 16
  %420 = load i32, i32* %ci_fixed, align 4
  %conv781 = trunc i32 %420 to i16
  %conv782 = zext i16 %conv781 to i32
  %mul783 = mul nsw i32 %shr780, %conv782
  %shr784 = ashr i32 %mul783, 15
  %add785 = add nsw i32 %shl779, %shr784
  %421 = load i32, i32* %ci_fixed, align 4
  %shr786 = ashr i32 %421, 16
  %422 = load i32, i32* %aif, align 4
  %conv787 = trunc i32 %422 to i16
  %conv788 = zext i16 %conv787 to i32
  %mul789 = mul nsw i32 %shr786, %conv788
  %shr790 = ashr i32 %mul789, 15
  %add791 = add nsw i32 %add785, %shr790
  store i32 %add791, i32* %temp10, align 4
  %423 = load i32, i32* %aif, align 4
  %shr792 = ashr i32 %423, 16
  %424 = load i32, i32* %cr_fixed, align 4
  %shr793 = ashr i32 %424, 16
  %mul794 = mul nsw i32 %shr792, %shr793
  %shl795 = shl i32 %mul794, 1
  %425 = load i32, i32* %aif, align 4
  %shr796 = ashr i32 %425, 16
  %426 = load i32, i32* %cr_fixed, align 4
  %conv797 = trunc i32 %426 to i16
  %conv798 = zext i16 %conv797 to i32
  %mul799 = mul nsw i32 %shr796, %conv798
  %shr800 = ashr i32 %mul799, 15
  %add801 = add nsw i32 %shl795, %shr800
  %427 = load i32, i32* %cr_fixed, align 4
  %shr802 = ashr i32 %427, 16
  %428 = load i32, i32* %aif, align 4
  %conv803 = trunc i32 %428 to i16
  %conv804 = zext i16 %conv803 to i32
  %mul805 = mul nsw i32 %shr802, %conv804
  %shr806 = ashr i32 %mul805, 15
  %add807 = add nsw i32 %add801, %shr806
  store i32 %add807, i32* %temp11, align 4
  %429 = load i32, i32* %arf, align 4
  %shr808 = ashr i32 %429, 16
  %430 = load i32, i32* %ci_fixed, align 4
  %shr809 = ashr i32 %430, 16
  %mul810 = mul nsw i32 %shr808, %shr809
  %shl811 = shl i32 %mul810, 1
  %431 = load i32, i32* %arf, align 4
  %shr812 = ashr i32 %431, 16
  %432 = load i32, i32* %ci_fixed, align 4
  %conv813 = trunc i32 %432 to i16
  %conv814 = zext i16 %conv813 to i32
  %mul815 = mul nsw i32 %shr812, %conv814
  %shr816 = ashr i32 %mul815, 15
  %add817 = add nsw i32 %shl811, %shr816
  %433 = load i32, i32* %ci_fixed, align 4
  %shr818 = ashr i32 %433, 16
  %434 = load i32, i32* %arf, align 4
  %conv819 = trunc i32 %434 to i16
  %conv820 = zext i16 %conv819 to i32
  %mul821 = mul nsw i32 %shr818, %conv820
  %shr822 = ashr i32 %mul821, 15
  %add823 = add nsw i32 %add817, %shr822
  store i32 %add823, i32* %temp12, align 4
  %435 = load i32, i32* %temp9, align 4
  %436 = load i32, i32* %temp10, align 4
  %sub824 = sub nsw i32 %435, %436
  %437 = load i16, i16* %i, align 2
  %idxprom825 = sext i16 %437 to i32
  %arrayidx826 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom825
  store i32 %sub824, i32* %arrayidx826, align 4
  %438 = load i32, i32* %temp11, align 4
  %439 = load i32, i32* %temp12, align 4
  %add827 = add nsw i32 %438, %439
  %440 = load i16, i16* %i, align 2
  %idxprom828 = sext i16 %440 to i32
  %arrayidx829 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom828
  store i32 %add827, i32* %arrayidx829, align 4
  br label %for.inc830

for.inc830:                                       ; preds = %for.body751
  %441 = load i16, i16* %i, align 2
  %inc831 = add i16 %441, 1
  store i16 %inc831, i16* %i, align 2
  br label %for.cond747

for.end832:                                       ; preds = %for.cond747
  br label %if.end833

if.end833:                                        ; preds = %for.end832, %for.end745
  store i16 0, i16* %i, align 2
  br label %for.cond834

for.cond834:                                      ; preds = %for.inc848, %if.end833
  %442 = load i16, i16* %i, align 2
  %conv835 = sext i16 %442 to i32
  %cmp836 = icmp slt i32 %conv835, 128
  br i1 %cmp836, label %for.body838, label %for.end850

for.body838:                                      ; preds = %for.cond834
  %443 = load i16, i16* %i, align 2
  %idxprom839 = sext i16 %443 to i32
  %arrayidx840 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom839
  %444 = load i32, i32* %arrayidx840, align 4
  %445 = load i16, i16* %i, align 2
  %idxprom841 = sext i16 %445 to i32
  %446 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx842 = getelementptr inbounds i32, i32* %446, i32 %idxprom841
  store i32 %444, i32* %arrayidx842, align 4
  %447 = load i16, i16* %i, align 2
  %idxprom843 = sext i16 %447 to i32
  %arrayidx844 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom843
  %448 = load i32, i32* %arrayidx844, align 4
  %449 = load i16, i16* %i, align 2
  %conv845 = sext i16 %449 to i32
  %add846 = add nsw i32 128, %conv845
  %450 = load i32*, i32** %tcbuf.addr, align 4
  %arrayidx847 = getelementptr inbounds i32, i32* %450, i32 %add846
  store i32 %448, i32* %arrayidx847, align 4
  br label %for.inc848

for.inc848:                                       ; preds = %for.body838
  %451 = load i16, i16* %i, align 2
  %inc849 = add i16 %451, 1
  store i16 %inc849, i16* %i, align 2
  br label %for.cond834

for.end850:                                       ; preds = %for.cond834
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i16, i16* @bswitch, align 2
  %1 = load i16, i16* @acmod, align 2
  %2 = load i16, i16* @channum, align 2
  %3 = load i32, i32* @slct, align 4
  call void @itver2(i16 signext %0, i32* getelementptr inbounds ([256 x i32], [256 x i32]* @tcbuf, i32 0, i32 0), i16 signext %1, i16 signext %2, i32 %3)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %4, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @tcbuf, i32 0, i32 %5
  %6 = load i32, i32* %arrayidx, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [256 x i32], [256 x i32]* @tcbuf_out, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx1, align 4
  %cmp2 = icmp ne i32 %6, %8
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [256 x i32], [256 x i32]* @tcbuf, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx3, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %10)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0))
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval
  ret i32 %12
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}

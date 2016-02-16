; ModuleID = 'it.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

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
@str = private unnamed_addr constant [3 x i8] c"-1\00"

; Function Attrs: nounwind
define void @itver2(i16 signext %bswitch, i32* nocapture %tcbuf, i16 signext %acmod, i16 signext %channum, i32 %slct) #0 {
entry:
  %wr_buf1 = alloca [256 x i32], align 4
  %wi_buf1 = alloca [256 x i32], align 4
  %0 = bitcast [256 x i32]* %wr_buf1 to i8*
  call void @llvm.lifetime.start(i64 1024, i8* %0) #1
  %1 = bitcast [256 x i32]* %wi_buf1 to i8*
  call void @llvm.lifetime.start(i64 1024, i8* %1) #1
  %tobool = icmp ne i16 %bswitch, 0
  %arraydecay = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 0
  br i1 %tobool, label %for.body.preheader, label %for.body170.preheader

for.body170.preheader:                            ; preds = %entry
  br label %for.body170

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv1269 = phi i32 [ %indvars.iv.next1270, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds [64 x i32], [64 x i32]* @zcos2_fixed, i32 0, i32 %indvars.iv1269
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx5 = getelementptr inbounds [64 x i32], [64 x i32]* @zsin2_fixed, i32 0, i32 %indvars.iv1269
  %3 = load i32, i32* %arrayidx5, align 4, !tbaa !1
  %shl = shl nsw i32 %indvars.iv1269, 2
  %arrayidx7 = getelementptr inbounds i32, i32* %tcbuf, i32 %shl
  %4 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %sub = sub nuw nsw i32 63, %indvars.iv1269
  %shl9 = shl nsw i32 %sub, 2
  %add1220 = or i32 %shl9, 2
  %arrayidx10 = getelementptr inbounds i32, i32* %tcbuf, i32 %add1220
  %5 = load i32, i32* %arrayidx10, align 4, !tbaa !1
  %add131221 = or i32 %shl, 1
  %arrayidx14 = getelementptr inbounds i32, i32* %tcbuf, i32 %add131221
  %6 = load i32, i32* %arrayidx14, align 4, !tbaa !1
  %add181222 = or i32 %shl9, 3
  %arrayidx19 = getelementptr inbounds i32, i32* %tcbuf, i32 %add181222
  %7 = load i32, i32* %arrayidx19, align 4, !tbaa !1
  %shr = ashr i32 %5, 16
  %shr20 = ashr i32 %2, 16
  %mul = shl nsw i32 %shr20, 1
  %shl21 = mul i32 %mul, %shr
  %conv24 = and i32 %2, 65535
  %mul25 = mul nsw i32 %shr, %conv24
  %shr26 = ashr i32 %mul25, 15
  %conv30 = and i32 %5, 65535
  %mul31 = mul nsw i32 %conv30, %shr20
  %shr32 = ashr i32 %mul31, 15
  %shr34 = ashr i32 %4, 16
  %shr35 = ashr i32 %3, 16
  %mul36 = shl nsw i32 %shr35, 1
  %shl37 = mul i32 %mul36, %shr34
  %conv40 = and i32 %3, 65535
  %mul41 = mul nsw i32 %shr34, %conv40
  %shr42 = ashr i32 %mul41, 15
  %conv46 = and i32 %4, 65535
  %mul47 = mul nsw i32 %conv46, %shr35
  %shr48 = ashr i32 %mul47, 15
  %shl53 = mul nsw i32 %shr34, %shr20
  %mul57 = mul nsw i32 %shr34, %conv24
  %shr58 = ashr i32 %mul57, 15
  %mul63 = mul nsw i32 %conv46, %shr20
  %shr64 = ashr i32 %mul63, 15
  %shl69 = mul nsw i32 %shr, %shr35
  %mul73 = mul nsw i32 %shr, %conv40
  %shr74 = ashr i32 %mul73, 15
  %mul79 = mul nsw i32 %conv30, %shr35
  %shr80 = ashr i32 %mul79, 15
  %shr82 = ashr i32 %7, 16
  %shl85 = mul i32 %mul, %shr82
  %mul89 = mul nsw i32 %shr82, %conv24
  %shr90 = ashr i32 %mul89, 15
  %conv94 = and i32 %7, 65535
  %mul95 = mul nsw i32 %conv94, %shr20
  %shr96 = ashr i32 %mul95, 15
  %shr98 = ashr i32 %6, 16
  %shl101 = mul i32 %mul36, %shr98
  %mul105 = mul nsw i32 %shr98, %conv40
  %shr106 = ashr i32 %mul105, 15
  %conv110 = and i32 %6, 65535
  %mul111 = mul nsw i32 %conv110, %shr35
  %shr112 = ashr i32 %mul111, 15
  %shl117 = mul nsw i32 %shr98, %shr20
  %mul121 = mul nsw i32 %shr98, %conv24
  %shr122 = ashr i32 %mul121, 15
  %mul127 = mul nsw i32 %conv110, %shr20
  %shr128 = ashr i32 %mul127, 15
  %shl133 = mul nsw i32 %shr82, %shr35
  %mul137 = mul nsw i32 %shr82, %conv40
  %shr138 = ashr i32 %mul137, 15
  %mul143 = mul nsw i32 %conv94, %shr35
  %shr144 = ashr i32 %mul143, 15
  %shl147 = shl nsw i32 %indvars.iv1269, 1
  %arrayidx148 = getelementptr inbounds [128 x i16], [128 x i16]* @bitrev, i32 0, i32 %shl147
  %8 = load i16, i16* %arrayidx148, align 2, !tbaa !5
  %sum = add i32 %shl37, %shr42
  %sum1257 = add i32 %sum, %shr48
  %add27 = sub i32 %shr26, %sum1257
  %add33 = add i32 %add27, %shl21
  %sub149 = add i32 %add33, %shr32
  %idxprom150 = sext i16 %8 to i32
  %arrayidx151 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom150
  store i32 %sub149, i32* %arrayidx151, align 4, !tbaa !1
  %tmp = add i32 %shl69, %shl53
  %tmp1223 = shl i32 %tmp, 1
  %add81 = add nsw i32 %shr64, %shr58
  %add59 = add nsw i32 %add81, %shr74
  %add65 = add nsw i32 %add59, %shr80
  %add152 = add i32 %add65, %tmp1223
  %add154 = add nsw i32 %idxprom150, 64
  %arrayidx155 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %add154
  store i32 %add152, i32* %arrayidx155, align 4, !tbaa !1
  %sum1258 = add i32 %shl101, %shr106
  %sum1259 = add i32 %sum1258, %shr112
  %add91 = sub i32 %shr90, %sum1259
  %add97 = add i32 %add91, %shl85
  %sub156 = add i32 %add97, %shr96
  %arrayidx159 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %add154
  store i32 %sub156, i32* %arrayidx159, align 4, !tbaa !1
  %tmp1224 = add i32 %shl133, %shl117
  %tmp1225 = shl i32 %tmp1224, 1
  %add145 = add nsw i32 %shr128, %shr122
  %add123 = add nsw i32 %add145, %shr138
  %add129 = add nsw i32 %add123, %shr144
  %add160 = add i32 %add129, %tmp1225
  %arrayidx162 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom150
  store i32 %add160, i32* %arrayidx162, align 4, !tbaa !1
  %indvars.iv.next1270 = add nuw nsw i32 %indvars.iv1269, 1
  %exitcond1271 = icmp eq i32 %indvars.iv.next1270, 64
  br i1 %exitcond1271, label %if.end.loopexit, label %for.body

for.body170:                                      ; preds = %for.body170.preheader, %for.body170
  %indvars.iv1272 = phi i32 [ %indvars.iv.next1273, %for.body170 ], [ 0, %for.body170.preheader ]
  %shl172 = shl nsw i32 %indvars.iv1272, 1
  %arrayidx173 = getelementptr inbounds i32, i32* %tcbuf, i32 %shl172
  %9 = load i32, i32* %arrayidx173, align 4, !tbaa !1
  %sub175 = sub nuw nsw i32 127, %indvars.iv1272
  %shl176 = shl nsw i32 %sub175, 1
  %add1771219 = or i32 %shl176, 1
  %arrayidx178 = getelementptr inbounds i32, i32* %tcbuf, i32 %add1771219
  %10 = load i32, i32* %arrayidx178, align 4, !tbaa !1
  %arrayidx180 = getelementptr inbounds [128 x i32], [128 x i32]* @zcos1_fixed, i32 0, i32 %indvars.iv1272
  %11 = load i32, i32* %arrayidx180, align 4, !tbaa !1
  %arrayidx182 = getelementptr inbounds [128 x i32], [128 x i32]* @zsin1_fixed, i32 0, i32 %indvars.iv1272
  %12 = load i32, i32* %arrayidx182, align 4, !tbaa !1
  %shr183 = ashr i32 %10, 16
  %shr184 = ashr i32 %11, 16
  %mul185 = shl nsw i32 %shr183, 1
  %shl186 = mul i32 %mul185, %shr184
  %conv189 = and i32 %11, 65535
  %mul190 = mul nsw i32 %conv189, %shr183
  %shr191 = ashr i32 %mul190, 15
  %conv195 = and i32 %10, 65535
  %mul196 = mul nsw i32 %shr184, %conv195
  %shr197 = ashr i32 %mul196, 15
  %shr199 = ashr i32 %9, 16
  %shr200 = ashr i32 %12, 16
  %mul201 = shl nsw i32 %shr199, 1
  %shl202 = mul i32 %mul201, %shr200
  %conv205 = and i32 %12, 65535
  %mul206 = mul nsw i32 %conv205, %shr199
  %shr207 = ashr i32 %mul206, 15
  %conv211 = and i32 %9, 65535
  %mul212 = mul nsw i32 %shr200, %conv211
  %shr213 = ashr i32 %mul212, 15
  %shl218 = mul nsw i32 %shr184, %shr199
  %mul222 = mul nsw i32 %conv189, %shr199
  %shr223 = ashr i32 %mul222, 15
  %mul228 = mul nsw i32 %shr184, %conv211
  %shr229 = ashr i32 %mul228, 15
  %shl234 = mul nsw i32 %shr200, %shr183
  %mul238 = mul nsw i32 %conv205, %shr183
  %shr239 = ashr i32 %mul238, 15
  %mul244 = mul nsw i32 %shr200, %conv195
  %shr245 = ashr i32 %mul244, 15
  %arrayidx248 = getelementptr inbounds [128 x i16], [128 x i16]* @bitrev, i32 0, i32 %indvars.iv1272
  %13 = load i16, i16* %arrayidx248, align 2, !tbaa !5
  %add208.neg = add i32 %shl186, %shr191
  %add214.neg = add i32 %add208.neg, %shr197
  %add192 = sub i32 %add214.neg, %shr207
  %add198 = sub i32 %add192, %shl202
  %sub249 = sub i32 %add198, %shr213
  %idxprom250 = sext i16 %13 to i32
  %arrayidx251 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %idxprom250
  store i32 %sub249, i32* %arrayidx251, align 4, !tbaa !1
  %tmp1226 = add i32 %shl234, %shl218
  %tmp1227 = shl i32 %tmp1226, 1
  %add246 = add nsw i32 %shr229, %shr223
  %add224 = add nsw i32 %add246, %shr239
  %add230 = add nsw i32 %add224, %shr245
  %add252 = add i32 %add230, %tmp1227
  %arrayidx254 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %idxprom250
  store i32 %add252, i32* %arrayidx254, align 4, !tbaa !1
  %indvars.iv.next1273 = add nuw nsw i32 %indvars.iv1272, 1
  %exitcond1274 = icmp eq i32 %indvars.iv.next1273, 128
  br i1 %exitcond1274, label %if.end.loopexit1238, label %for.body170

if.end.loopexit:                                  ; preds = %for.body
  %add.ptr = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 64
  br label %if.end

if.end.loopexit1238:                              ; preds = %for.body170
  %arraydecay164 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit1238, %if.end.loopexit
  %nstep.0 = phi i32 [ 2, %if.end.loopexit ], [ 1, %if.end.loopexit1238 ]
  %ffti_buf.0 = phi i32* [ %add.ptr, %if.end.loopexit ], [ %arraydecay164, %if.end.loopexit1238 ]
  %fftnlg2m3.0 = phi i32 [ 3, %if.end.loopexit ], [ 4, %if.end.loopexit1238 ]
  %fftn.0 = phi i32 [ 64, %if.end.loopexit ], [ 128, %if.end.loopexit1238 ]
  %14 = xor i32 %fftnlg2m3.0, 15
  %shr263 = lshr i32 32767, %14
  %sext = shl i32 %shr263, 16
  %conv265 = ashr exact i32 %sext, 16
  %add271 = add nuw nsw i32 %fftnlg2m3.0, 2
  %sub274 = sub nsw i32 13, %fftnlg2m3.0
  %shr275 = lshr i32 32767, %sub274
  %add277 = add nuw nsw i32 %fftnlg2m3.0, 1
  %shl280 = shl i32 %add277, %add271
  %mul285 = mul nuw nsw i32 %fftn.0, %nstep.0
  %cmp2861249 = icmp eq i32 %mul285, 0
  br i1 %cmp2861249, label %if.end.for.end392_crit_edge, label %for.body288.lr.ph

if.end.for.end392_crit_edge:                      ; preds = %if.end
  %.pre = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %for.end392

for.body288.lr.ph:                                ; preds = %if.end
  %add.ptr298 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %fftn.0
  %arraydecay303 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 0
  br label %for.body288

for.body288:                                      ; preds = %for.body288.lr.ph, %for.body288
  %conv2821252 = phi i32 [ 0, %for.body288.lr.ph ], [ %conv282, %for.body288 ]
  %ffti_buf.11251 = phi i32* [ %ffti_buf.0, %for.body288.lr.ph ], [ %cond306, %for.body288 ]
  %fftr_buf.11250 = phi i32* [ %arraydecay, %for.body288.lr.ph ], [ %cond299, %for.body288 ]
  %cmp291 = icmp sge i32 %conv2821252, %fftn.0
  %cond299 = select i1 %cmp291, i32* %add.ptr298, i32* %fftr_buf.11250
  %cond306 = select i1 %cmp291, i32* %arraydecay303, i32* %ffti_buf.11251
  %sub314 = select i1 %cmp291, i32 %fftn.0, i32 0
  %sub314.conv282 = sub nsw i32 %conv2821252, %sub314
  %sext1218 = shl i32 %sub314.conv282, 16
  %idxprom320 = ashr exact i32 %sext1218, 16
  %arrayidx321 = getelementptr inbounds i32, i32* %cond299, i32 %idxprom320
  %15 = load i32, i32* %arrayidx321, align 4, !tbaa !1
  %arrayidx323 = getelementptr inbounds i32, i32* %cond306, i32 %idxprom320
  %16 = load i32, i32* %arrayidx323, align 4, !tbaa !1
  %add325 = add nsw i32 %idxprom320, 1
  %arrayidx326 = getelementptr inbounds i32, i32* %cond299, i32 %add325
  %17 = load i32, i32* %arrayidx326, align 4, !tbaa !1
  %arrayidx329 = getelementptr inbounds i32, i32* %cond306, i32 %add325
  %18 = load i32, i32* %arrayidx329, align 4, !tbaa !1
  %add331 = add nsw i32 %idxprom320, 2
  %arrayidx332 = getelementptr inbounds i32, i32* %cond299, i32 %add331
  %19 = load i32, i32* %arrayidx332, align 4, !tbaa !1
  %arrayidx335 = getelementptr inbounds i32, i32* %cond306, i32 %add331
  %20 = load i32, i32* %arrayidx335, align 4, !tbaa !1
  %add337 = add nsw i32 %idxprom320, 3
  %arrayidx338 = getelementptr inbounds i32, i32* %cond299, i32 %add337
  %21 = load i32, i32* %arrayidx338, align 4, !tbaa !1
  %arrayidx341 = getelementptr inbounds i32, i32* %cond306, i32 %add337
  %22 = load i32, i32* %arrayidx341, align 4, !tbaa !1
  %add342 = add nsw i32 %17, %15
  %add343 = add nsw i32 %19, %add342
  %add344 = add nsw i32 %add343, %21
  store i32 %add344, i32* %arrayidx321, align 4, !tbaa !1
  %add347 = add nsw i32 %18, %16
  %add348 = add nsw i32 %20, %add347
  %add349 = add nsw i32 %add348, %22
  store i32 %add349, i32* %arrayidx323, align 4, !tbaa !1
  %sub352 = sub nsw i32 %15, %17
  %sub353 = sub i32 %sub352, %20
  %add354 = add nsw i32 %sub353, %22
  store i32 %add354, i32* %arrayidx326, align 4, !tbaa !1
  %sub358 = sub nsw i32 %16, %18
  %add359 = add nsw i32 %sub358, %19
  %sub360 = sub i32 %add359, %21
  store i32 %sub360, i32* %arrayidx329, align 4, !tbaa !1
  %sub365 = sub i32 %add342, %19
  %sub366 = sub i32 %sub365, %21
  store i32 %sub366, i32* %arrayidx332, align 4, !tbaa !1
  %sub371 = sub i32 %add347, %20
  %sub372 = sub i32 %sub371, %22
  store i32 %sub372, i32* %arrayidx335, align 4, !tbaa !1
  %add377 = add nsw i32 %20, %sub352
  %sub378 = sub i32 %add377, %22
  store i32 %sub378, i32* %arrayidx338, align 4, !tbaa !1
  %sub383 = sub i32 %sub358, %19
  %add384 = add nsw i32 %sub383, %21
  store i32 %add384, i32* %arrayidx341, align 4, !tbaa !1
  %add390 = shl nsw i32 %conv2821252, 16
  %sext1212 = add i32 %add390, 262144
  %conv282 = ashr exact i32 %sext1212, 16
  %cmp286 = icmp slt i32 %conv282, %mul285
  br i1 %cmp286, label %for.body288, label %for.end392.loopexit

for.end392.loopexit:                              ; preds = %for.body288
  br label %for.end392

for.end392:                                       ; preds = %for.end392.loopexit, %if.end.for.end392_crit_edge
  %arraydecay397.pre-phi = phi i32* [ %.pre, %if.end.for.end392_crit_edge ], [ %arraydecay303, %for.end392.loopexit ]
  %mul406 = mul i32 %shl280, %nstep.0
  %cmp4071245 = icmp eq i32 %mul406, 0
  br i1 %cmp4071245, label %for.end579, label %for.body409.lr.ph

for.body409.lr.ph:                                ; preds = %for.end392
  %tobool395 = icmp eq i16 %bswitch, 0
  %add.ptr399 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %fftn.0
  %arraydecay397.add.ptr399 = select i1 %tobool395, i32* %arraydecay397.pre-phi, i32* %add.ptr399
  %add.ptr419 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %fftn.0
  %cmp451 = icmp eq i32 %nstep.0, 2
  %sext1214 = xor i32 %sext, -65536
  %conv455 = ashr exact i32 %sext1214, 16
  %shl458 = zext i1 %cmp451 to i32
  br label %for.body409

for.body409:                                      ; preds = %for.body409, %for.body409.lr.ph
  %k1.01248 = phi i32 [ 0, %for.body409.lr.ph ], [ %inc578, %for.body409 ]
  %ffti_buf.21247 = phi i32* [ %arraydecay397.add.ptr399, %for.body409.lr.ph ], [ %cond429, %for.body409 ]
  %fftr_buf.21246 = phi i32* [ %arraydecay, %for.body409.lr.ph ], [ %cond422, %for.body409 ]
  %cmp410 = icmp uge i32 %k1.01248, %shl280
  %cond422 = select i1 %cmp410, i32* %add.ptr419, i32* %fftr_buf.21246
  %cond429 = select i1 %cmp410, i32* %arraydecay397.pre-phi, i32* %ffti_buf.21247
  %sub433 = select i1 %cmp410, i32 %shl280, i32 0
  %sub433.pn = sub i32 %k1.01248, %sub433
  %cond440 = lshr i32 %sub433.pn, %add271
  %cond448 = and i32 %sub433.pn, %shr275
  %sext1213 = shl i32 %cond448, 16
  %conv454 = ashr exact i32 %sext1213, 16
  %shr456 = ashr i32 %conv455, %cond440
  %and457 = and i32 %conv454, %shr456
  %cond465 = shl nsw i32 %and457, %shl458
  %sub469 = sub i32 %fftnlg2m3.0, %cond440
  %shr470 = ashr i32 %conv454, %sub469
  %shr473 = ashr i32 %conv265, %cond440
  %and474 = and i32 %conv454, %shr473
  %add476 = add i32 %cond440, 3
  %shl477 = shl i32 %and474, %add476
  %add478 = add nsw i32 %shl477, %shr470
  %sext1215 = shl i32 %add478, 16
  %conv480 = ashr exact i32 %sext1215, 16
  %shl482 = shl i32 4, %cond440
  %add483 = add nsw i32 %conv480, %shl482
  %sext1216 = shl i32 %cond465, 16
  %idxprom485 = ashr exact i32 %sext1216, 16
  %arrayidx486 = getelementptr inbounds [64 x i32], [64 x i32]* @xcos_fixed, i32 0, i32 %idxprom485
  %23 = load i32, i32* %arrayidx486, align 4, !tbaa !1
  %arrayidx488 = getelementptr inbounds [64 x i32], [64 x i32]* @xsin_fixed, i32 0, i32 %idxprom485
  %24 = load i32, i32* %arrayidx488, align 4, !tbaa !1
  %arrayidx490 = getelementptr inbounds i32, i32* %cond422, i32 %conv480
  %25 = load i32, i32* %arrayidx490, align 4, !tbaa !1
  %arrayidx492 = getelementptr inbounds i32, i32* %cond429, i32 %conv480
  %26 = load i32, i32* %arrayidx492, align 4, !tbaa !1
  %sext1217 = shl i32 %add483, 16
  %idxprom493 = ashr exact i32 %sext1217, 16
  %arrayidx494 = getelementptr inbounds i32, i32* %cond422, i32 %idxprom493
  %27 = load i32, i32* %arrayidx494, align 4, !tbaa !1
  %arrayidx496 = getelementptr inbounds i32, i32* %cond429, i32 %idxprom493
  %28 = load i32, i32* %arrayidx496, align 4, !tbaa !1
  %shr497 = ashr i32 %27, 16
  %shr498 = ashr i32 %23, 16
  %mul499 = shl nsw i32 %shr498, 1
  %shl500 = mul i32 %mul499, %shr497
  %conv503 = and i32 %23, 65535
  %mul504 = mul nsw i32 %shr497, %conv503
  %shr505 = ashr i32 %mul504, 15
  %add506 = add nsw i32 %shl500, %shr505
  %conv509 = and i32 %27, 65535
  %mul510 = mul nsw i32 %conv509, %shr498
  %shr511 = ashr i32 %mul510, 15
  %add512 = add nsw i32 %add506, %shr511
  %shr513 = ashr i32 %28, 16
  %shr514 = ashr i32 %24, 16
  %mul515 = shl nsw i32 %shr514, 1
  %shl516 = mul i32 %mul515, %shr513
  %conv519 = and i32 %24, 65535
  %mul520 = mul nsw i32 %shr513, %conv519
  %shr521 = ashr i32 %mul520, 15
  %add522 = add nsw i32 %shl516, %shr521
  %conv525 = and i32 %28, 65535
  %mul526 = mul nsw i32 %conv525, %shr514
  %shr527 = ashr i32 %mul526, 15
  %add528 = add nsw i32 %add522, %shr527
  %shl532 = mul i32 %mul515, %shr497
  %mul536 = mul nsw i32 %shr497, %conv519
  %shr537 = ashr i32 %mul536, 15
  %add538 = add nsw i32 %shl532, %shr537
  %mul542 = mul nsw i32 %conv509, %shr514
  %shr543 = ashr i32 %mul542, 15
  %add544 = add nsw i32 %add538, %shr543
  %shl548 = mul i32 %mul499, %shr513
  %mul552 = mul nsw i32 %shr513, %conv503
  %shr553 = ashr i32 %mul552, 15
  %add554 = add nsw i32 %shl548, %shr553
  %mul558 = mul nsw i32 %conv525, %shr498
  %shr559 = ashr i32 %mul558, 15
  %add560 = add nsw i32 %add554, %shr559
  %sub561 = sub i32 %25, %add512
  %add562 = add nsw i32 %sub561, %add528
  store i32 %add562, i32* %arrayidx490, align 4, !tbaa !1
  %sub565 = sub i32 %26, %add544
  %sub566 = sub i32 %sub565, %add560
  store i32 %sub566, i32* %arrayidx492, align 4, !tbaa !1
  %add569 = add nsw i32 %add512, %25
  %sub570 = sub i32 %add569, %add528
  store i32 %sub570, i32* %arrayidx494, align 4, !tbaa !1
  %add573 = add nsw i32 %add544, %26
  %add574 = add nsw i32 %add573, %add560
  store i32 %add574, i32* %arrayidx496, align 4, !tbaa !1
  %inc578 = add nuw i32 %k1.01248, 1
  %exitcond1268 = icmp eq i32 %inc578, %mul406
  br i1 %exitcond1268, label %for.end579.loopexit, label %for.body409

for.end579.loopexit:                              ; preds = %for.body409
  br label %for.end579

for.end579:                                       ; preds = %for.end579.loopexit, %for.end392
  br i1 %tobool, label %vector.body1283.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.end579
  br label %vector.body

vector.body1283.preheader:                        ; preds = %for.end579
  br label %vector.body1283

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %29 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %index
  %30 = bitcast i32* %29 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %30, align 4, !tbaa !1
  %31 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %index
  %32 = bitcast i32* %31 to <4 x i32>*
  %wide.load1277 = load <4 x i32>, <4 x i32>* %32, align 4, !tbaa !1
  %33 = getelementptr inbounds [128 x i32], [128 x i32]* @zcos1_fixed, i32 0, i32 %index
  %34 = bitcast i32* %33 to <4 x i32>*
  %wide.load1278 = load <4 x i32>, <4 x i32>* %34, align 4, !tbaa !1
  %35 = getelementptr inbounds [128 x i32], [128 x i32]* @zsin1_fixed, i32 0, i32 %index
  %36 = bitcast i32* %35 to <4 x i32>*
  %wide.load1279 = load <4 x i32>, <4 x i32>* %36, align 4, !tbaa !1
  %37 = ashr <4 x i32> %wide.load, <i32 16, i32 16, i32 16, i32 16>
  %38 = ashr <4 x i32> %wide.load1278, <i32 16, i32 16, i32 16, i32 16>
  %39 = shl nsw <4 x i32> %37, <i32 1, i32 1, i32 1, i32 1>
  %40 = mul <4 x i32> %39, %38
  %41 = and <4 x i32> %wide.load1278, <i32 65535, i32 65535, i32 65535, i32 65535>
  %42 = mul nsw <4 x i32> %41, %37
  %43 = ashr <4 x i32> %42, <i32 15, i32 15, i32 15, i32 15>
  %44 = and <4 x i32> %wide.load, <i32 65535, i32 65535, i32 65535, i32 65535>
  %45 = mul nsw <4 x i32> %38, %44
  %46 = ashr <4 x i32> %45, <i32 15, i32 15, i32 15, i32 15>
  %47 = ashr <4 x i32> %wide.load1277, <i32 16, i32 16, i32 16, i32 16>
  %48 = ashr <4 x i32> %wide.load1279, <i32 16, i32 16, i32 16, i32 16>
  %49 = shl nsw <4 x i32> %47, <i32 1, i32 1, i32 1, i32 1>
  %50 = mul <4 x i32> %49, %48
  %51 = and <4 x i32> %wide.load1279, <i32 65535, i32 65535, i32 65535, i32 65535>
  %52 = mul nsw <4 x i32> %51, %47
  %53 = ashr <4 x i32> %52, <i32 15, i32 15, i32 15, i32 15>
  %54 = and <4 x i32> %wide.load1277, <i32 65535, i32 65535, i32 65535, i32 65535>
  %55 = mul nsw <4 x i32> %48, %54
  %56 = ashr <4 x i32> %55, <i32 15, i32 15, i32 15, i32 15>
  %57 = mul nsw <4 x i32> %38, %47
  %58 = mul nsw <4 x i32> %41, %47
  %59 = ashr <4 x i32> %58, <i32 15, i32 15, i32 15, i32 15>
  %60 = mul nsw <4 x i32> %38, %54
  %61 = ashr <4 x i32> %60, <i32 15, i32 15, i32 15, i32 15>
  %62 = mul nsw <4 x i32> %48, %37
  %63 = mul nsw <4 x i32> %51, %37
  %64 = ashr <4 x i32> %63, <i32 15, i32 15, i32 15, i32 15>
  %65 = mul nsw <4 x i32> %48, %44
  %66 = ashr <4 x i32> %65, <i32 15, i32 15, i32 15, i32 15>
  %67 = add <4 x i32> %40, %43
  %68 = add <4 x i32> %67, %46
  %69 = sub <4 x i32> %68, %53
  %70 = sub <4 x i32> %69, %50
  %71 = sub <4 x i32> %70, %56
  %72 = bitcast i32* %29 to <4 x i32>*
  store <4 x i32> %71, <4 x i32>* %72, align 4, !tbaa !1
  %73 = add <4 x i32> %62, %57
  %74 = shl <4 x i32> %73, <i32 1, i32 1, i32 1, i32 1>
  %75 = add nsw <4 x i32> %61, %59
  %76 = add nsw <4 x i32> %75, %64
  %77 = add nsw <4 x i32> %76, %66
  %78 = add <4 x i32> %77, %74
  %79 = bitcast i32* %31 to <4 x i32>*
  store <4 x i32> %78, <4 x i32>* %79, align 4, !tbaa !1
  %index.next = add i32 %index, 4
  %80 = icmp eq i32 %index.next, 128
  br i1 %80, label %vector.body1306.preheader.loopexit1322, label %vector.body, !llvm.loop !7

vector.body1283:                                  ; preds = %vector.body1283.preheader, %vector.body1283
  %index1286 = phi i32 [ %index.next1293, %vector.body1283 ], [ 0, %vector.body1283.preheader ]
  %81 = getelementptr inbounds [64 x i32], [64 x i32]* @zcos2_fixed, i32 0, i32 %index1286
  %82 = bitcast i32* %81 to <4 x i32>*
  %wide.load1297 = load <4 x i32>, <4 x i32>* %82, align 4, !tbaa !1
  %83 = getelementptr inbounds [64 x i32], [64 x i32]* @zsin2_fixed, i32 0, i32 %index1286
  %84 = bitcast i32* %83 to <4 x i32>*
  %wide.load1298 = load <4 x i32>, <4 x i32>* %84, align 4, !tbaa !1
  %85 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %index1286
  %86 = bitcast i32* %85 to <4 x i32>*
  %wide.load1299 = load <4 x i32>, <4 x i32>* %86, align 4, !tbaa !1
  %87 = add i32 %index1286, 64
  %88 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %87
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load1300 = load <4 x i32>, <4 x i32>* %89, align 4, !tbaa !1
  %90 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %87
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load1301 = load <4 x i32>, <4 x i32>* %91, align 4, !tbaa !1
  %92 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %index1286
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load1302 = load <4 x i32>, <4 x i32>* %93, align 4, !tbaa !1
  %94 = ashr <4 x i32> %wide.load1299, <i32 16, i32 16, i32 16, i32 16>
  %95 = ashr <4 x i32> %wide.load1297, <i32 16, i32 16, i32 16, i32 16>
  %96 = shl nsw <4 x i32> %95, <i32 1, i32 1, i32 1, i32 1>
  %97 = mul <4 x i32> %96, %94
  %98 = and <4 x i32> %wide.load1297, <i32 65535, i32 65535, i32 65535, i32 65535>
  %99 = mul nsw <4 x i32> %94, %98
  %100 = ashr <4 x i32> %99, <i32 15, i32 15, i32 15, i32 15>
  %101 = and <4 x i32> %wide.load1299, <i32 65535, i32 65535, i32 65535, i32 65535>
  %102 = mul nsw <4 x i32> %101, %95
  %103 = ashr <4 x i32> %102, <i32 15, i32 15, i32 15, i32 15>
  %104 = ashr <4 x i32> %wide.load1300, <i32 16, i32 16, i32 16, i32 16>
  %105 = ashr <4 x i32> %wide.load1298, <i32 16, i32 16, i32 16, i32 16>
  %106 = shl nsw <4 x i32> %105, <i32 1, i32 1, i32 1, i32 1>
  %107 = mul <4 x i32> %106, %104
  %108 = and <4 x i32> %wide.load1298, <i32 65535, i32 65535, i32 65535, i32 65535>
  %109 = mul nsw <4 x i32> %104, %108
  %110 = ashr <4 x i32> %109, <i32 15, i32 15, i32 15, i32 15>
  %111 = and <4 x i32> %wide.load1300, <i32 65535, i32 65535, i32 65535, i32 65535>
  %112 = mul nsw <4 x i32> %111, %105
  %113 = ashr <4 x i32> %112, <i32 15, i32 15, i32 15, i32 15>
  %114 = mul nsw <4 x i32> %104, %95
  %115 = mul nsw <4 x i32> %104, %98
  %116 = ashr <4 x i32> %115, <i32 15, i32 15, i32 15, i32 15>
  %117 = mul nsw <4 x i32> %111, %95
  %118 = ashr <4 x i32> %117, <i32 15, i32 15, i32 15, i32 15>
  %119 = mul nsw <4 x i32> %94, %105
  %120 = mul nsw <4 x i32> %94, %108
  %121 = ashr <4 x i32> %120, <i32 15, i32 15, i32 15, i32 15>
  %122 = mul nsw <4 x i32> %101, %105
  %123 = ashr <4 x i32> %122, <i32 15, i32 15, i32 15, i32 15>
  %124 = ashr <4 x i32> %wide.load1301, <i32 16, i32 16, i32 16, i32 16>
  %125 = mul <4 x i32> %96, %124
  %126 = mul nsw <4 x i32> %124, %98
  %127 = ashr <4 x i32> %126, <i32 15, i32 15, i32 15, i32 15>
  %128 = and <4 x i32> %wide.load1301, <i32 65535, i32 65535, i32 65535, i32 65535>
  %129 = mul nsw <4 x i32> %128, %95
  %130 = ashr <4 x i32> %129, <i32 15, i32 15, i32 15, i32 15>
  %131 = ashr <4 x i32> %wide.load1302, <i32 16, i32 16, i32 16, i32 16>
  %132 = mul <4 x i32> %106, %131
  %133 = mul nsw <4 x i32> %131, %108
  %134 = ashr <4 x i32> %133, <i32 15, i32 15, i32 15, i32 15>
  %135 = and <4 x i32> %wide.load1302, <i32 65535, i32 65535, i32 65535, i32 65535>
  %136 = mul nsw <4 x i32> %135, %105
  %137 = ashr <4 x i32> %136, <i32 15, i32 15, i32 15, i32 15>
  %138 = mul nsw <4 x i32> %131, %95
  %139 = mul nsw <4 x i32> %131, %98
  %140 = ashr <4 x i32> %139, <i32 15, i32 15, i32 15, i32 15>
  %141 = mul nsw <4 x i32> %135, %95
  %142 = ashr <4 x i32> %141, <i32 15, i32 15, i32 15, i32 15>
  %143 = mul nsw <4 x i32> %124, %105
  %144 = mul nsw <4 x i32> %124, %108
  %145 = ashr <4 x i32> %144, <i32 15, i32 15, i32 15, i32 15>
  %146 = mul nsw <4 x i32> %128, %105
  %147 = ashr <4 x i32> %146, <i32 15, i32 15, i32 15, i32 15>
  %148 = add <4 x i32> %97, %100
  %149 = add <4 x i32> %148, %103
  %150 = sub <4 x i32> %149, %110
  %151 = sub <4 x i32> %150, %107
  %152 = sub <4 x i32> %151, %113
  %153 = bitcast i32* %85 to <4 x i32>*
  store <4 x i32> %152, <4 x i32>* %153, align 4, !tbaa !1
  %154 = add <4 x i32> %114, %119
  %155 = shl <4 x i32> %154, <i32 1, i32 1, i32 1, i32 1>
  %156 = add nsw <4 x i32> %123, %121
  %157 = add nsw <4 x i32> %156, %116
  %158 = add nsw <4 x i32> %157, %118
  %159 = add <4 x i32> %158, %155
  %160 = bitcast i32* %88 to <4 x i32>*
  store <4 x i32> %159, <4 x i32>* %160, align 4, !tbaa !1
  %161 = add <4 x i32> %125, %127
  %162 = add <4 x i32> %161, %130
  %163 = sub <4 x i32> %162, %134
  %164 = sub <4 x i32> %163, %132
  %165 = sub <4 x i32> %164, %137
  %166 = bitcast i32* %90 to <4 x i32>*
  store <4 x i32> %165, <4 x i32>* %166, align 4, !tbaa !1
  %167 = add <4 x i32> %138, %143
  %168 = shl <4 x i32> %167, <i32 1, i32 1, i32 1, i32 1>
  %169 = add nsw <4 x i32> %147, %145
  %170 = add nsw <4 x i32> %169, %140
  %171 = add nsw <4 x i32> %170, %142
  %172 = add <4 x i32> %171, %168
  %173 = bitcast i32* %92 to <4 x i32>*
  store <4 x i32> %172, <4 x i32>* %173, align 4, !tbaa !1
  %index.next1293 = add i32 %index1286, 4
  %174 = icmp eq i32 %index.next1293, 64
  br i1 %174, label %vector.body1306.preheader.loopexit, label %vector.body1283, !llvm.loop !10

vector.body1306.preheader.loopexit:               ; preds = %vector.body1283
  br label %vector.body1306.preheader

vector.body1306.preheader.loopexit1322:           ; preds = %vector.body
  br label %vector.body1306.preheader

vector.body1306.preheader:                        ; preds = %vector.body1306.preheader.loopexit1322, %vector.body1306.preheader.loopexit
  br label %vector.body1306

vector.body1306:                                  ; preds = %vector.body1306.preheader, %vector.body1306
  %index1309 = phi i32 [ %index.next1316, %vector.body1306 ], [ 0, %vector.body1306.preheader ]
  %175 = getelementptr inbounds [256 x i32], [256 x i32]* %wr_buf1, i32 0, i32 %index1309
  %176 = bitcast i32* %175 to <4 x i32>*
  %wide.load1320 = load <4 x i32>, <4 x i32>* %176, align 4, !tbaa !1
  %177 = getelementptr inbounds i32, i32* %tcbuf, i32 %index1309
  %178 = bitcast i32* %177 to <4 x i32>*
  store <4 x i32> %wide.load1320, <4 x i32>* %178, align 4, !tbaa !1
  %179 = getelementptr inbounds [256 x i32], [256 x i32]* %wi_buf1, i32 0, i32 %index1309
  %180 = bitcast i32* %179 to <4 x i32>*
  %wide.load1321 = load <4 x i32>, <4 x i32>* %180, align 4, !tbaa !1
  %181 = add i32 %index1309, 128
  %182 = getelementptr inbounds i32, i32* %tcbuf, i32 %181
  %183 = bitcast i32* %182 to <4 x i32>*
  store <4 x i32> %wide.load1321, <4 x i32>* %183, align 4, !tbaa !1
  %index.next1316 = add i32 %index1309, 4
  %184 = icmp eq i32 %index.next1316, 128
  br i1 %184, label %for.end850, label %vector.body1306, !llvm.loop !11

for.end850:                                       ; preds = %vector.body1306
  call void @llvm.lifetime.end(i64 1024, i8* %1) #1
  call void @llvm.lifetime.end(i64 1024, i8* %0) #1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = load i16, i16* @bswitch, align 2, !tbaa !5
  tail call void @itver2(i16 signext %0, i32* getelementptr inbounds ([256 x i32], [256 x i32]* @tcbuf, i32 0, i32 0), i16 signext undef, i16 signext undef, i32 undef)
  br label %for.body

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i32 %inc, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.cond
  %i.08 = phi i32 [ 0, %entry ], [ %inc, %for.cond ]
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @tcbuf, i32 0, i32 %i.08
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx1 = getelementptr inbounds [256 x i32], [256 x i32]* @tcbuf_out, i32 0, i32 %i.08
  %2 = load i32, i32* %arrayidx1, align 4, !tbaa !1
  %cmp2 = icmp eq i32 %1, %2
  %inc = add nuw nsw i32 %i.08, 1
  br i1 %cmp2, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  %.lcssa = phi i32 [ %1, %for.body ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %.lcssa) #1
  br label %return

for.end:                                          ; preds = %for.cond
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ 1, %for.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !3, i64 0}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !8, !9}
!11 = distinct !{!11, !8, !9}

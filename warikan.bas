10 ' ###############
20 '
30 ' ÜØ¶Ý ¹²»Ý ±ÌßØ
40 '  *Ö³¹Ý »Ýº³:
50 '   SII ENERUS
60 '   ÜØ¶Ý ÃÞÝÀ¸
70 '
80 ' By Mutsumi Ryocka
90 ' Apr. 2021
100 '
110 ' ###############
120 '
130 ' ==========
140 ' ´ÝÄØ- Îß²ÝÄ
150 ' ==========
160 ' -----
170 ' ¼®·¶
180 ' -----
190 *INIT
200 CLEAR
210 KM$ = CHR$ (236)
220 MR$ = CHR$ (237)
230 EN$ = CHR$ (241)
240 DIM ER$(9) * 64
250 FOR I = 0 TO 9
260   READ ER$(I)
270 NEXT I
280 CLS
290 '
300 ' -----
310 ' ¶²¼ ¶ÞÒÝ
320 ' -----
330 *TITLE
340 CLS
350 FOR I = 0 TO 11
360   TF$ = TF$ + KM$
370 NEXT I
380 PRINT TF$; TF$
390 PRINT KM$; "      ÜØ¶Ý ÃÞÝÀ¸      " ; KM$
400 PRINT TF$; TF$
410 LOCATE 3, 3
420 PRINT "2021 Machinadelic"
430 LOCATE 6, 5
440 PRINT "·- ¦ µ¼Ã ¶²¼"
450 GOSUB *WAITINPUT
460 '
470 ' -----
480 ' Æ­³Ø®¸ ¶ÞÒÝ 1
490 ' -----
500 *INPUT1
510 CLS
520 PRINT MR$; " ÜØ¶Ý ·Ý¶Þ¸ ÀÝ²"
530 LOCATE 0, 2
540 PRINT "1. 1"; EN$
550 LOCATE 12, 2
560 PRINT "2. 10"; EN$
570 LOCATE 0, 3
580 PRINT "3. 100"; EN$
590 LOCATE 12, 3
600 PRINT "4. 1000"; EN$
610 LOCATE 0, 1
620 INPUT "½³¼Þ ÃÞ ¾ÝÀ¸: "; WU
630 GOSUB *VALIDATE1
640 GOSUB *ISERROR
650 IF (E = 1) THEN
660   GOSUB *DISPERROR
670   GOTO *INPUT1
680 ENDIF
690 '
700 ' -----
710 ' Æ­³Ø®¸ ¶ÞÒÝ 2
720 ' -----
730 *INPUT2
740 CLS
750 PRINT MR$; " Ë¯½ ¼Þ®³Î³"
760 PRINT "½³¼Þ ¦ Æ­³Ø®¸"
770 LOCATE 0, 3
780 PRINT "(*ÀÝ² "; EN$; ")"
790 LOCATE 0, 2
800 IF (SG = 0) THEN
810   INPUT "¿³¶Þ¸: "; SG
820 ELSE
830   PRINT "¿³¶Þ¸: "; STR$ (SG)
840 ENDIF
850 LOCATE 0, 5
860 PRINT "(*ÀÝ² ÆÝ)"
870 LOCATE 0, 4
880 IF (NZ = 0) THEN
890   INPUT "ÆÝ½Þ³: "; NZ
900 ELSE
910   PRINT "ÆÝ½Þ³: "; STR$ (NZ)
920   GOSUB *WAITINPUT
930 ENDIF
940 GOSUB *VALIDATE2
950 GOSUB *ISERROR
960 IF (E = 1) THEN
970   GOSUB *DISPERROR
980   GOTO *INPUT2
990 ENDIF
1000 '
1010 ' -----
1020 ' Æ­³Ø®¸ ¶ÞÒÝ 3
1030 ' -----
1040 *INPUT3
1050 CLS
1060 PRINT MR$; " ÜØËÞ· ¾¯Ã²"
1070 LOCATE 0, 2
1080 PRINT "1. ÜØËÞ·¶Þ¸"
1090 LOCATE 13, 2
1100 PRINT "2. ÜØËÞ·ØÂ"
1110 LOCATE 0, 3
1120 PRINT "3. ÜØËÞ·Å¼"
1130 LOCATE 0, 1
1140 INPUT "½³¼Þ ÃÞ ¾ÝÀ¸: "; WT
1150 GOSUB *VALIDATE3
1160 GOSUB *ISERROR
1170 IF (E = 1) THEN
1180   GOSUB *DISPERROR
1190   GOTO *INPUT3
1200 ENDIF
1210 '
1220 ' -----
1230 ' Æ­³Ø®¸ ¶ÞÒÝ 4
1240 ' -----
1250 *INPUT4
1260 CLS
1270 PRINT MR$; " ÜØËÞ· ¾¯Ã²"
1280 PRINT "½³¼Þ ¦ Æ­³Ø®¸"
1290 SWITCH WT
1300 CASE 1
1310   LOCATE 0, 3
1320   PRINT "(*ÀÝ² "; EN$; ")"
1330   LOCATE 0, 2
1340   INPUT "ÜØËÞ·¶Þ¸: "; WG
1350 CASE 2
1360   LOCATE 0, 3
1370   PRINT "(*ÀÝ² %)"
1380   LOCATE 0, 2
1390   INPUT "ÜØËÞ·ØÂ: "; WR
1400 ENDSWITCH
1410 GOSUB *VALIDATE4
1420 GOSUB *ISERROR
1430 IF (E = 1) THEN
1440   GOSUB *DISPERROR
1450   GOTO *INPUT4
1460 ENDIF
1470 '
1480 ' -----
1490 ' Æ­³Ø®¸ Å²Ö³ Ë®³¼Þ ¶ÞÒÝ
1500 ' -----
1510 *DISPINPUT
1520 CLS
1530 WU = 1 * (10 ^ (WU - 1))
1540 PRINT MR$; " Æ­³Ø®¸ Å²Ö³ ¶¸ÆÝ"
1550 PRINT "ÜØ¶Ý ÀÝ²: ";  STR$ (WU); EN$
1560 PRINT "¿³¶Þ¸   : "; STR$ (SG); EN$
1570 PRINT "ÆÝ½Þ³   : "; STR$ (NZ); "ÆÝ"
1580 SWITCH WT
1590 CASE 1
1600   PRINT "ÜØËÞ·¶Þ¸: "; STR$ (WG); EN$
1610 CASE 2
1620   PRINT "ÜØËÞ·ØÂ : "; STR$ (WR); "%"
1630 CASE 3
1640   PRINT "ÜØËÞ·   : Å¼"
1650 ENDSWITCH
1660 PRINT "·- ¦ µ¼Ã ¹¯¶ ¦ Ë®³¼Þ >>"
1670 GOSUB *WAITINPUT
1680 '
1690 ' -----
1700 ' ÜØ¶Ý ·Ý¶Þ¸ ¹²»Ý
1710 ' -----
1720 *CALCULATE
1730 SWITCH WT
1740 CASE 1
1750   SG = SG - WG
1760 CASE 2
1770   SG = INT (SG * (100 - WR) / 100)
1780 ENDSWITCH
1790 HT = INT (SG / NZ /  WU) * WU
1800 HS = SG - (HT * NZ)
1810 '
1820 ' -----
1830 ' ¹²»Ý ¹¯¶ Ë®³¼Þ ¶ÞÒÝ
1840 ' -----
1850 *RESULT
1860 CLS
1870 PRINT MR$; " ÜØ¶Ý ¹¯¶"
1880 PRINT "ËÄØ±ÀØ: "; STR$ (HT); EN$
1890 PRINT "Ì¿¸   : "; STR$ (HS); EN$
1900 LOCATE 0, 5
1910 PRINT "·- ¦ µ¼Ã ¼­³Ø®³ X"
1920 GOSUB *WAITINPUT
1930 CLS
1940 END
1950 '
1960 ;===========
1970 ' »ÌÞ Ó¼Þ­-Ù
1980 ' ==========
1990 ' -----
2000 ' ·- Æ­³Ø®¸ ¦ ÏÂ
2010 ' -----
2020 *WAITINPUT
2030 K$ = INKEY$
2040 IF (K$ = "") THEN
2050   GOTO *WAITINPUT
2060 ENDIF
2070 *KEYRELEASE
2080 K$ = INKEY$
2090 IF (K$ <> "") THEN
2100   GOTO *KEYRELEASE
2110 ENDIF
2120 RETURN
2130 '
2140 ' -----
2150 ' ´×- É ³Ñ ¦ ¼­Ä¸
2160 ' -----
2170 *ISERROR
2180 E = 0
2190 FOR I = 0 TO 9
2200   IF (EI(I) <> 0) THEN
2210     E = 1
2220     I = 9
2230   ENDIF
2240 NEXT I
2250 RETURN
2260 '
2270 ' -----
2280 ' ´×- Ò¯¾-¼Þ ¦ Ë®³¼Þ
2290 ' -----
2300 *DISPERROR
2310 CLS
2320 PRINT "[!´×-]"
2330 FOR I = 0 TO 9
2340   IF (EI(I) = 1) THEN
2350     PRINT ER$(I)
2360   ENDIF
2370 NEXT I
2380 LOCATE 0, 5
2390 PRINT "<< ·- ¦ µ¼Ã ÓÄÞÙ"
2400 GOSUB *WAITINPUT
2410 RETURN
2420 '
2430 ' -----
2440 ' Æ­³Ø®¸Á ¹Ý¼®³ - ¶ÞÒÝ 1
2450 ' -----
2460 *VALIDATE1
2470 ERASE EI
2480 DIM EI(9)
2490 IF (WU <> 1) AND (WU <> 2) AND (WU <> 3) AND (WU <> 4) THEN
2500   EI(0) = 1
2510   WU = 0
2520 ENDIF
2530 RETURN
2540 '
2550 ' -----
2560 ' Æ­³Ø®¸Á ¹Ý¼®³ - ¶ÞÒÝ 2
2570 ' -----
2580 *VALIDATE2
2590 ERASE EI
2600 DIM EI(9)
2610 IF (SG < 1) THEN
2620   EI(1) = 1
2630   SG = 0
2640 ENDIF
2650 IF (SG > 9999999) THEN
2660   EI(2) = 1
2670   SG = 0
2680 ENDIF
2690 IF (NZ < 1) THEN
2700   EI(3) = 1
2710   NZ = 0
2720 ENDIF
2730 IF (NZ > 99) THEN
2740   EI(4) = 1
2750   NZ = 0
2760 ENDIF
2770 RETURN
2780 '
2790 ' -----
2800 ' Æ­³Ø®¸Á ¹Ý¼®³ - ¶ÞÒÝ 3
2810 ' -----
2820 *VALIDATE3
2830 ERASE EI
2840 DIM EI(9)
2850 IF (WT <> 1) AND (WT <> 2) AND (WT <> 3) THEN
2860   EI(5) = 1
2870   WT = 0
2880 ENDIF
2890 RETURN
2900 '
2910 ' -----
2920 ' Æ­³Ø®¸Á ¹Ý¼®³ - ¶ÞÒÝ 4
2930 ' -----
2940 *VALIDATE4
2950 ERASE EI
2960 DIM EI(9)
2970 IF (WT = 1) THEN
2980   IF (WG < 0) THEN
2990     EI(6) = 1
3000     WG = -1
3010   ENDIF
3020   IF (WG > 9999999) THEN
3030     EI(7) = 1
3040     WG = -1
3050   ENDIF
3060   IF (WG > SG) THEN
3070     EI(8) = 1
3080     WG = -1
3090   ENDIF
3100 ENDIF
3110 IF (WT = 2) AND NOT ((WR >= 0) AND (WR <= 100)) THEN
3120   EI(9) = 1
3130   WR = -1
3140 ENDIF
3150 RETURN
3160 '
3170 ' ==========
3180 ' ´×- Ò¯¾-¼Þ ÃÞ-À
3190 ' ==========
3200 DATA "ÜØ¶Ý ÀÝ²: 1 ¶× 4 É ²½ÞÚ¶ ¦ Æ­³Ø®¸ ¼Ã ´×ÝÃÞ ¸ÀÞ»²¡"
3210 DATA "¿³¶Þ¸: 1 ²¼Þ®³ É ½³¼Þ ¦ Æ­³Ø®¸ ¼Ã ¸ÀÞ»²¡"
3220 DATA "¿³¶Þ¸: ·Ý¶Þ¸ ¶Þ µµ½·ÞÏ½¡ (»²ÀÞ² 9999999 ÏÃÞ)"
3230 DATA "ÆÝ½Þ³: 1 ²¼Þ®³É ½³¼Þ ¦ Æ­³Ø®¸ ¼Ã ¸ÀÞ»²¡"
3240 DATA "ÆÝ½Þ³: ÆÝ½Þ³ ¶Þ µµ½·ÞÏ½¡ (»²ÀÞ² 99 ÏÃÞ)"
3250 DATA "ÜØËÞ· ¾¯Ã²: 1 ¶× 3 É ²½ÞÚ¶ ¦ Æ­³Ø®¸ ¼Ã ´×ÝÃÞ ¸ÀÞ»²¡"
3260 DATA "ÜØËÞ·¶Þ¸: 0 ²¼Þ®³ É ½³¼Þ ¦ Æ­³Ø®¸ ¼Ã ¸ÀÞ»²¡"
3270 DATA "ÜØËÞ·¶Þ¸: ·Ý¶Þ¸ ¶Þ µµ½·ÞÏ½¡ (»²ÀÞ² 9999999 ÏÃÞ)"
3280 DATA "ÜØËÞ·¶Þ¸: ÜØËÞ·¶Þ¸ ¶Þ ¿³¶Þ¸ ¦ º´Ã ²Ï½¡"
3290 DATA "ÜØËÞ·ØÂ: 0 ¶× 100 ÏÃÞ É ²½ÞÚ¶ É ½³¼Þ ¦ Æ­³Ø®¸ ¼Ã ¸ÀÞ»²¡"

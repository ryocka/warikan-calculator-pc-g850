10 ' ###############
20 '
30 ' �ض� ���� ����
40 '  *ֳ�� �ݺ�:
50 '   SII ENERUS
60 '   �ض� �����
70 '
80 ' By Mutsumi Ryocka
90 ' Apr. 2021
100 '
110 ' ###############
120 '
130 ' ==========
140 ' ����- �߲��
150 ' ==========
160 ' -----
170 ' ����
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
310 ' ��� ����
320 ' -----
330 *TITLE
340 CLS
350 FOR I = 0 TO 11
360   TF$ = TF$ + KM$
370 NEXT I
380 PRINT TF$; TF$
390 PRINT KM$; "      �ض� �����      " ; KM$
400 PRINT TF$; TF$
410 LOCATE 3, 3
420 PRINT "2021 Machinadelic"
430 LOCATE 6, 5
440 PRINT "�- � ��� ���"
450 GOSUB *WAITINPUT
460 '
470 ' -----
480 ' ƭ�خ� ���� 1
490 ' -----
500 *INPUT1
510 CLS
520 PRINT MR$; " �ض� �ݶ޸ �ݲ"
530 LOCATE 0, 2
540 PRINT "1. 1"; EN$
550 LOCATE 12, 2
560 PRINT "2. 10"; EN$
570 LOCATE 0, 3
580 PRINT "3. 100"; EN$
590 LOCATE 12, 3
600 PRINT "4. 1000"; EN$
610 LOCATE 0, 1
620 INPUT "���� �� ����: "; WU
630 GOSUB *VALIDATE1
640 GOSUB *ISERROR
650 IF (E = 1) THEN
660   GOSUB *DISPERROR
670   GOTO *INPUT1
680 ENDIF
690 '
700 ' -----
710 ' ƭ�خ� ���� 2
720 ' -----
730 *INPUT2
740 CLS
750 PRINT MR$; " ˯� �ޮ�γ"
760 PRINT "���� � ƭ�خ�"
770 LOCATE 0, 3
780 PRINT "(*�ݲ "; EN$; ")"
790 LOCATE 0, 2
800 IF (SG = 0) THEN
810   INPUT "���޸: "; SG
820 ELSE
830   PRINT "���޸: "; STR$ (SG)
840 ENDIF
850 LOCATE 0, 5
860 PRINT "(*�ݲ ��)"
870 LOCATE 0, 4
880 IF (NZ = 0) THEN
890   INPUT "�ݽ޳: "; NZ
900 ELSE
910   PRINT "�ݽ޳: "; STR$ (NZ)
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
1020 ' ƭ�خ� ���� 3
1030 ' -----
1040 *INPUT3
1050 CLS
1060 PRINT MR$; " ���޷ ��ò"
1070 LOCATE 0, 2
1080 PRINT "1. ���޷�޸"
1090 LOCATE 13, 2
1100 PRINT "2. ���޷��"
1110 LOCATE 0, 3
1120 PRINT "3. ���޷ż"
1130 LOCATE 0, 1
1140 INPUT "���� �� ����: "; WT
1150 GOSUB *VALIDATE3
1160 GOSUB *ISERROR
1170 IF (E = 1) THEN
1180   GOSUB *DISPERROR
1190   GOTO *INPUT3
1200 ENDIF
1210 '
1220 ' -----
1230 ' ƭ�خ� ���� 4
1240 ' -----
1250 *INPUT4
1260 CLS
1270 PRINT MR$; " ���޷ ��ò"
1280 PRINT "���� � ƭ�خ�"
1290 SWITCH WT
1300 CASE 1
1310   LOCATE 0, 3
1320   PRINT "(*�ݲ "; EN$; ")"
1330   LOCATE 0, 2
1340   INPUT "���޷�޸: "; WG
1350 CASE 2
1360   LOCATE 0, 3
1370   PRINT "(*�ݲ %)"
1380   LOCATE 0, 2
1390   INPUT "���޷��: "; WR
1400 ENDSWITCH
1410 GOSUB *VALIDATE4
1420 GOSUB *ISERROR
1430 IF (E = 1) THEN
1440   GOSUB *DISPERROR
1450   GOTO *INPUT4
1460 ENDIF
1470 '
1480 ' -----
1490 ' ƭ�خ� Ųֳ ˮ��� ����
1500 ' -----
1510 *DISPINPUT
1520 CLS
1530 WU = 1 * (10 ^ (WU - 1))
1540 PRINT MR$; " ƭ�خ� Ųֳ ����"
1550 PRINT "�ض� �ݲ: ";  STR$ (WU); EN$
1560 PRINT "���޸   : "; STR$ (SG); EN$
1570 PRINT "�ݽ޳   : "; STR$ (NZ); "��"
1580 SWITCH WT
1590 CASE 1
1600   PRINT "���޷�޸: "; STR$ (WG); EN$
1610 CASE 2
1620   PRINT "���޷�� : "; STR$ (WR); "%"
1630 CASE 3
1640   PRINT "���޷   : ż"
1650 ENDSWITCH
1660 PRINT "�- � ��� ��� � ˮ��� >>"
1670 GOSUB *WAITINPUT
1680 '
1690 ' -----
1700 ' �ض� �ݶ޸ ����
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
1830 ' ���� ��� ˮ��� ����
1840 ' -----
1850 *RESULT
1860 CLS
1870 PRINT MR$; " �ض� ���"
1880 PRINT "��ر��: "; STR$ (HT); EN$
1890 PRINT "̿�   : "; STR$ (HS); EN$
1900 LOCATE 0, 5
1910 PRINT "�- � ��� ���خ� X"
1920 GOSUB *WAITINPUT
1930 CLS
1940 END
1950 '
1960 ;===========
1970 ' ��� Ӽޭ-�
1980 ' ==========
1990 ' -----
2000 ' �- ƭ�خ� � ��
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
2150 ' ��- � �� � ��ĸ
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
2280 ' ��- ү�-�� � ˮ���
2290 ' -----
2300 *DISPERROR
2310 CLS
2320 PRINT "[!��-]"
2330 FOR I = 0 TO 9
2340   IF (EI(I) = 1) THEN
2350     PRINT ER$(I)
2360   ENDIF
2370 NEXT I
2380 LOCATE 0, 5
2390 PRINT "<< �- � ��� ����"
2400 GOSUB *WAITINPUT
2410 RETURN
2420 '
2430 ' -----
2440 ' ƭ�خ�� �ݼ�� - ���� 1
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
2560 ' ƭ�خ�� �ݼ�� - ���� 2
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
2800 ' ƭ�خ�� �ݼ�� - ���� 3
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
2920 ' ƭ�خ�� �ݼ�� - ���� 4
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
3180 ' ��- ү�-�� ��-�
3190 ' ==========
3200 DATA "�ض� �ݲ: 1 �� 4 � ���ڶ � ƭ�خ� �� ����� ��޻��"
3210 DATA "���޸: 1 ��ޮ� � ���� � ƭ�خ� �� ��޻��"
3220 DATA "���޸: �ݶ޸ �� �����Ͻ� (���޲ 9999999 ���)"
3230 DATA "�ݽ޳: 1 ��ޮ�� ���� � ƭ�خ� �� ��޻��"
3240 DATA "�ݽ޳: �ݽ޳ �� �����Ͻ� (���޲ 99 ���)"
3250 DATA "���޷ ��ò: 1 �� 3 � ���ڶ � ƭ�خ� �� ����� ��޻��"
3260 DATA "���޷�޸: 0 ��ޮ� � ���� � ƭ�خ� �� ��޻��"
3270 DATA "���޷�޸: �ݶ޸ �� �����Ͻ� (���޲ 9999999 ���)"
3280 DATA "���޷�޸: ���޷�޸ �� ���޸ � ��� �Ͻ�"
3290 DATA "���޷��: 0 �� 100 ��� � ���ڶ � ���� � ƭ�خ� �� ��޻��"

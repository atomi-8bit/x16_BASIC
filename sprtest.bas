10 REM SAMPLE MOVING SPRITE USING ARROW KEYS
20 SCREEN $80
30 COLOR 1,6
40 CLS
50 BVLOAD "JDSPR.BIN", 8,1,$3100
60 KI=0: X=160: Y=120: XD=0: YD=0: SP=1
70 SPRMEM 1,1,$3100,1
80 SPRITE 1,3,2 ,0,1,1,1
100 GOSUB 300: GOSUB 500
120 MOVSPR 1,X,Y
130 KP=KP+1: IF KP=10 THEN KP=0
140 IF KP=0 THEN KI=KI+1
150 IF KI=3 THEN KI=0
160 SPRMEM 1,1,$3100+256*(KI+3*AP),1
180 GOTO 100
300 GET A$
310 IF A$="" THEN RETURN
315 LOCATE 1,10:PRINT "                     "
317 LOCATE 1,10:PRINT X;Y;XD;YD;AP
320 IF A$=CHR$(157) THEN XD=-SP:YD=0: AP=1
330 IF A$=CHR$(29) THEN XD= SP:YD=0:AP=0
340 IF A$=CHR$(145) THEN XD= 0:YD=-SP:AP=2
345 IF A$=CHR$(27 ) THEN GOTO 9990
350 IF A$=CHR$(17) THEN XD= 0:YD=SP:AP=3
360 RETURN
500 REM MOVING
510 X1=X+XD
520 IF X1>300 OR X1<1 THEN XD=0
530 Y1=Y+YD
540 IF Y1>226 OR Y1<8 THEN YD=0
600 X=X+XD
610 Y=Y+YD
699 RETURN
9990 SCREEN 0:END

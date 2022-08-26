10 LET width = 38
20 LET height = 22
30 DIM snake(width*height, 2), coll(width, height)

100 FOR i = 0 TO width
110 FOR j = 0 TO height
120 coll(i,j) = 0
130 NEXT j
140 NEXT i

150 HOME: GR: POKE 49234,0

160 COLOR=2
170 VLIN 0, 2*height+3 AT 0
180 VLIN 0, 2*height+3 AT width+1
190 HLIN 0, width+1 AT 0
200 HLIN 0, width+1 AT 1
210 HLIN 0, width+1 AT 2*height+2
220 HLIN 0, width+1 AT 2*height+3

310 LET XPlayer = 1+INT(RND(1)*(width-1))
320 LET YPlayer = 1+INT(RND(1)*(height-1))

330 snake(0,0) = XPlayer: snake(0,1) = YPlayer
340 LET size = 1

350 LET XFood = 1+INT(RND(1)*(width-1))
360 LET YFood = 1+INT(RND(1)*(height-1))

370 LET XMove = 0
380 LET YMove = 0

390 LET sStart = 0
400 LET sFin = 1



1000 rem begin main loop

1020 LET keystroke = peek(-16384) - 128
1030 IF keystroke = asc("w") AND NOT (YMove = 1 AND size >= 2) THEN XMove = 0: YMove = -1
1040 IF keystroke = asc("a") AND NOT (XMove = 1 AND size >= 2) THEN XMove = -1: YMove = 0
1050 IF keystroke = asc("s") AND NOT (YMove = -1 AND size >= 2) THEN XMove = 0: YMove = 1
1060 IF keystroke = asc("d") AND NOT (XMove = -1 AND size >= 2) THEN Xmove = 1: YMove = 0

1070 XPlayer = XPlayer + XMove
1080 YPlayer = YPlayer + YMove

1090 IF XPlayer = 0 THEN XPlayer = width
1100 IF XPlayer = width+1 THEN XPlayer = 1
1110 IF YPlayer = 0 THEN YPlayer = height
1120 IF YPlayer = height+1 THEN YPlayer = 1

1130 IF XPlayer = XFood AND YPlayer = YFood THEN size = size + 1: XFood = 1+INT(RND(1)*(width-1)): YFood = 1+INT(RND(1)*(height-1)): GOTO 1180

1140 sFin = sFin - 1
1150 IF sFin = -1 THEN sFin = (width*height)-1

1160 COLOR=0: VLIN 2*snake(sFin,1), 2*snake(sFin,1)+1 AT snake(sFin,0)
1170 coll(snake(sFin,0), snake(sFin,1)) = 0

1180 IF coll(XPlayer, YPlayer) = 1 GOTO 2000

1190 sStart = sStart - 1
1200 IF sStart = -1 THEN sStart = (width*height)-1

1230 snake(sStart,0) = XPlayer: snake(sStart,1) = YPlayer

1240 COLOR=1
1250 VLIN 2*YPlayer, 2*YPlayer+1 AT XPlayer

1260 coll(XPlayer, YPlayer) = 1

1270 COLOR=13
1280 VLIN 2*YFood, 2*YFood+1 AT XFood

1500 FOR i = 0 TO 100
1510 NEXT i
1520 GOTO 1000



2000 TEXT: INVERSE: PRINT "GAME OVER!": NORMAL
2010 INPUT "Would You Like to Play Again? Y/N    "; r$
2020 IF asc(r$) = asc("y") or asc(r$) = asc("Y") GOTO 100
2030 IF asc(r$) = asc("n") or asc(r$) = asc("N") GOTO 2100
2040 GOTO 2010

2100 PRINT "Come Again!"
2110 END

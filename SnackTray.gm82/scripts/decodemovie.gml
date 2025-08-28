///decodemovie()
//reads button state from the movie buffer

var /*sonic*/ c,d;

if (gamemanager.stop || gamemanager.meta) {
    left=0
    right=0
    up=0
    down=0
    akey=0
    bkey=0
    ckey=0
    skey=0
    xkey=0
    ykey=0
    zkey=0
    rkey=0
    exit
}

c=readbyte(global.keylog)
if (c=$ff) {gamemanager.meta=1 setpos(getpos(global.keylog)-1,global.keylog) exit}
d=readbyte(global.keylog)
global.pos+=1

if (global.pos>=global.length && !flag.yup) {
    gamemanager.stop=1
    gamemanager.alarm[10]=20
    discardmovie()
    exit
}

left=0
right=0
up=0
down=0
akey=0
bkey=0
ckey=0
skey=0
if (c>=128) {skey=1  c-=128}
if (c>=64 ) {ckey=1  c-=64}
if (c>=32 ) {bkey=1  c-=32}
if (c>=16 ) {akey=1  c-=16}
if (c>=8  ) {down=1  c-=8 }
if (c>=4  ) {up=1    c-=4 }
if (c>=2  ) {right=1 c-=2 }
if (c>=1  ) {left=1  c-=1 }

xkey=0
ykey=0
zkey=0
rkey=0
if (c>=8  ) {rkey=1  c-=8}
if (c>=4  ) {zkey=1  c-=4}
if (c>=2  ) {ykey=1  c-=2}
if (c>=1  ) {xkey=1  c-=1}

var cl,cr,cu,cd,cx,cy,cc;

if (expulsionbias=0) expulsionbias=-xsc
tempkill=1

if (jump) exit

y=round((y-2)/16)*16+2
cx=floor(x/16)*16+8
cy=floor((y+6)/16)*16+8
cc=!!position_meeting(cx,cy,collider)+!!position_meeting(cx,cy,grateblock)
cl=!!position_meeting(x-10,cy,collider)+!!position_meeting(x-10,cy,grateblock)
cr=!!position_meeting(x+10,cy,collider)+!!position_meeting(x+10,cy,grateblock)
cu=!!position_meeting(cx,cy-16,collider)+!!position_meeting(cx,cy-16,grateblock)
cd=!!position_meeting(cx,cy+16,collider)+!!position_meeting(cx,cy+16,grateblock)

if (cu && !cd) y+=max(0,y-bbox_top)
if (cc && !cu) y-=8
if (cu && cd) y=cy-6

if (cr!=cl) expulsionbias=cl-cr

x+=expulsionbias

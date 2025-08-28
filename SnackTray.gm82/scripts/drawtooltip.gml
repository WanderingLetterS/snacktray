var w,h,dx,dy,str;

str=string(argument[2])
if (str="") str="[empty]"

dx=floor(argument[0])
dy=floor(argument[1])

global.tcalc=1
global.tscale=2
draw_systext(0,0,str)
global.tcalc=0

w=maxx+10
h=maxy+10

if (argument[3]=1) dx-=floor(w/2)
if (argument[3]=2) dx-=w

draw_set_color(0)
draw_roundrect(dx,dy,dx+w,dy+h,0)
draw_set_color($ffffff)
draw_roundrect(dx,dy,dx+w,dy+h,1)

draw_systext(dx+5,dy+7,str)
global.tscale=1

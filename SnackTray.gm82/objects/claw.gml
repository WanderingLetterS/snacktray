#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hsp=0
vsp=0
hasomething=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.x+lengthdir_x(hsp+2+16*3,clawang-90)
y=owner.y+lengthdir_y(vsp+2+16*3,clawang-90)
clawangdiv=abs(clawang)/25
if clawang!=0 && !mov
clawang=max(0,abs(clawang)-2/clawangdiv)*sign(clawang)

coll=instance_place(x,y+8,player)
if coll && coll.y>y+2 && !holding
holding=coll.id

if holding
{
clawdir=(holding.right-holding.left)
if clawang!=0
clawang+=2*clawdir/clawangdiv
else
clawang+=clawdir*0.1
if clawdir!=0
mov=1
else
mov=0
holding.clawheldby=id
holding.x=x
holding.y=y
holding.vsp=0
holding.hsp=0
if holding.abut
{
holding.jump=1
holding.vsp=-5
holding.y-=4
holding.clawheldby=noone
holding=noone
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_background_part_ext(global.masterobjects[biome],232,152,48,32,x-48/2,y-32/2,1,1,$ffffff,1)

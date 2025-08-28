#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
length = "0"
spd=1
y-=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=4

with dirchange{ if abs(x-other.x)<4 && abs(y-other.y)<4 {other.angle=0 while string(other.angle)!=dir other.angle+=1  }}

hsp=lengthdir_x(spd,angle)
vsp=lengthdir_y(spd,angle)

x+=hsp

y-=4

//these 2 lines move the player along the platform.
coll=instance_place(x,y-2,player)
if (coll) {if (!coll.jump) coll.x += hsp}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if length = "0"
{
ssw_tile("platform")
}
else
{
draw_background_part_ext(global.master[biome],328,8,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.master[biome],360,8,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
}

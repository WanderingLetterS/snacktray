#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
length = "0"
hsp=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//these 2 lines move the player along the platform.
coll=instance_place(x,y-2,player)
if (coll) {if (!coll.jump) hsp=1 coll.x += hsp}

x+=hsp if (x=xstart) hsp=0

if (x>region.x+48) x=region.lefthand-48
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

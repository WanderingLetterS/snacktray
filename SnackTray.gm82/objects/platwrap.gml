#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = "0"
vsp=-1

getregion(x)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=vsp

if (y>region.ky) {y=-16 with (player) if (instance_place(x,y,other.id)) y=other.y-14}
if (y<-16) {y=region.ky with (player) if (instance_place(x,y,other.id)) y=other.y-14}
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
draw_background_part_ext(global.master[biome],328,24,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.master[biome],360,24,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
}

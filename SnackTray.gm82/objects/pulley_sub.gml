#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
main=id
length = "0"
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
draw_background_part_ext(global.master[biome],320,8,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.master[biome],352,8,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
}

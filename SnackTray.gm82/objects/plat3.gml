#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = "1"
getregion(x)
type="plat3"
mask_index=spr_plat3
vsp=-1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=vsp

if (y>240) {y=32 event_user(0)}
if (y<32) {y=240 event_user(0)}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.master[biome],320,24,16,16,x-16,y,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.master[biome],352,24,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)

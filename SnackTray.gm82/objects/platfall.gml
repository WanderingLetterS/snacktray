#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
length = "0"
yy=y
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var wc;

vsp=0

wc=0

with (player) if (!jump) if (instance_place(x,y+4,other.id)) wc+=weight
image_xscale=1.1
with (player) if (name="knux" && climb && xsc=sign(x-other.x)) if (instance_place(x,y,other.id)) wc+=weight
image_xscale=1

vsp=2*wc
yy+=vsp

var p; p=y
y=round(yy)
vsp=y-p
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

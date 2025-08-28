#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

spr=global.effectssheet[biome]

gravity=0.3
alarm[0]=300
alarm[1]=10
type=0

image_xscale=2
image_yscale=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot+=90*rotdir
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=1
ysc=1

if (global.frame8flip) xsc=-1
if (global.frame8flipy) ysc=-1

draw_sprite_part_ext(spr,0,133+(25*type),108,24,24,floor(x-12*xsc),floor(y-12*ysc),xsc,ysc,$ffffff,1)

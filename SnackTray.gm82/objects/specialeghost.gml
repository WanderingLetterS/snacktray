#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=-round(y/32)*32-1

t+=0.1

image_alpha=0.5+0.25*sin(t)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=specialecur.x
y=specialecur.y
draw_sprite_ext(spr_specialepal,specialectrl.cur,round(x/32)*32,round(y/32)*32,1,1,0,$ffffff,image_alpha)

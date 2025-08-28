#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
del=0
fade=0
a=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=stuck.x+stuckx
y=stuck.y+stucky

if (fade) {
    a=max(0,a-0.02)
    if (a=0) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (del) draw_sprite_ext(spr_blood,b,x,y,1,1,0,$ffffff,a)
else {
    //this was inlined for speed
    draw_sprite_part_ext(sheet,0,u,v,6,6,round(x-3),round(y-3),1,1,$ffffff,a)
}

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
grab=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+xstart+floor((view_wview[0]-1074)/2)
y=view_yview[0]+ystart
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible && over && mouse_check_button_pressed(mb_left)) {
    if (sub=0) specialenew()
    if (sub=1) specialeload()
    if (sub=2) specialesave()
    if (sub=6) specialetest()
    if (sub=5) specialequit()
}
#define Collision_specialecur
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_editorbutton,!!over,x,y)
draw_sprite(spr_editoricons,sub,x+7,y+7)

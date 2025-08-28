#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+xstart+floor((view_wview[0]-1074)/2)
y=view_yview[0]+view_hview[0]-51
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
specialectrl.cur=type
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_specialebutton,specialectrl.cur=type,x,y)
draw_sprite(spr_specialepal,type,x,y)

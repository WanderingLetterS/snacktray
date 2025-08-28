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
x=view_wview[0]/2-400+xstart
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
if (over && editcursor.leftp) event_user(0)
if (over && editcursor.rightp) event_user(1)
#define Collision_editcursor
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
draw_sprite_ext(spr_editorbuttonshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorbutton,!!over,x,y)

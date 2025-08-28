#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=!on
with (drawregion) event_user(7)
if !(settings("nolemonsound")) sound("lemonselecttool")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(spr_editorbuttonshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorbutton,on,x,y)
draw_sprite_ext(spr_editoricons,3,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,3,x+7,y+7)

if (over) drawtooltip((bbox_left+bbox_right)/2,97,"Grid (G)",1)

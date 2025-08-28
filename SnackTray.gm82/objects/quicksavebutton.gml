#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(settings("nolemonsound")) sound("lemoncontext")
editquicksave()
if !(settings("nolemonsound")) sound("lemonselectitem")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (editmanager.alarm[0]==-1) {
    draw_sprite_ext(spr_editoricons,16,x+8,y+8,1,1,0,c_black,0.5)
    draw_sprite(spr_editoricons,16,x+7,y+7)
    if (over) drawtooltip(bbox_left,97,"Quicksave Off",0)
} else {
    draw_sprite_part(spr_editorbutton,2,0,0,36*(3600-editmanager.alarm[0])/3600,36,x-3,y-3)
    draw_sprite_ext(spr_editoricons,14,x+8,y+8,1,1,0,c_black,0.5)
    draw_sprite(spr_editoricons,14,x+7,y+7)
    if (over) drawtooltip(bbox_left,97,"Quicksave in "+string(floor(editmanager.alarm[0]/60))+"s",0)
}

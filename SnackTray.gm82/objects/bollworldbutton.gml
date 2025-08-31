#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(drawregion)) if (!drawregion.unchanged) if (!show_question("You have unsaved changes!##Discard?")) exit
global.lemontest=0
room_goto(worldlemon)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_sprite(spr_editoricons,28,x+7,y+7)

if (over) drawtooltip(bbox_right,97,"World Map Editor",2)

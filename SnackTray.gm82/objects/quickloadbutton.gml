#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
flash=0
quick=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

flash=max(0,flash-1)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!global.lemontest) {
    if (file_exists(editmanager.autosave)) {flash=600 quick=1}
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
flash=0
if (quick) {
    doo=show_contextmenu("Load Quicksave|-|Open file...",-1)
    if (doo=-1) exit
    if (doo=0) editload(editmanager.autosave)
    else editload()
} else editload()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash mod 60>30) over+=2
event_inherited()
if (flash mod 60>30) over-=2
draw_sprite_ext(spr_editoricons,1,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,1,x+7,y+7)
if (over && quick) drawtooltip(bbox_left,97,"There is a quicksave file available",0)
else if (over) drawtooltip(bbox_left,97,"Open",0)

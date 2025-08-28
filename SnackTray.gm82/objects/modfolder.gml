#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("systemgo")

if (!directory_exists(globalmanager.moddir))
    directory_create(filename_fixname(globalmanager.moddir))

if (modctrl.cur!=-1) execute_shell(globalmanager.moddir+"character\"+global.charname[modctrl.cur+global.charmstart]+"\","")
else execute_shell(globalmanager.moddir,"")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)
over=0

global.halign=1
draw_systext(x,y-4,lang("mod folder"))
global.halign=0

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) if (!settings(global.charname[modctrl.cur+global.charmstart]+" broken")) {
    setname=global.charname[modctrl.cur+global.charmstart]+" disabled"

    settings(setname,!settings(setname))
    sound("systemselect")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    image_index=!settings(global.charname[modctrl.cur+global.charmstart]+" disabled")*2+!!over
    draw_self()
    over=0
    global.valign=1
    draw_systext(x+24,y,lang("mod enable"))
    global.valign=0
}

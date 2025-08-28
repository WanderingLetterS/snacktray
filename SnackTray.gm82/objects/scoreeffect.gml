#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-2
friction=0.1
alarm[0]=40
y-=24
tokend=0
getregion(x)
name=""
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (view_current=p2) {
    if (tokend) {
        global.halign=1
        draw_skintext(x,y,tokend,col)
        global.halign=0
    } else if name!="" {
        global.halign=1
        draw_skintext(x,y,name,col)
        global.halign=0
    } else ssw_weffects("score")
}

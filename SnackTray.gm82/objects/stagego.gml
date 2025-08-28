#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
no=0

if (global.stagecount || room = ta_menu) no=1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.y<y+24) {
    if (no) sound("systemreturn")
    else {
        global.tasing=!global.tasing
        sound("systemselect")
    }
} else {
    with (stagectrl) event_user(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,over+global.tasing*2,x,y)
if (no) draw_sprite(sprite_index,4,x,y)
global.halign=1
global.valign=1
if (global.tasing) draw_systext(x+20,y+44,"TAS",$ff)
else draw_systext(x+20,y+44,lang("stage ready"))
global.halign=0
global.valign=0

if (global.levellist[stagepick.sel+1,2] == 1) draw_sprite(sprite_index,5,x,y)

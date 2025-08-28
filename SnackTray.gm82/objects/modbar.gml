#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mouse_wheel_down()) with (modscrolldown) event_user(0)
if (mouse_wheel_up()) with (modscroll) event_user(0)

if (modctrl.l<=5) {
    y=-999
    grab=0
} else {
    if (grab) {
        if (!genericcursor.akey) grab=0
        else {
            y=median(modscroll.y+20,modscrolldown.y-20,genericcursor.y)
            f=(y-(modscroll.y+20))/((modscrolldown.y-20)-(modscroll.y+20))
            opage=modctrl.page
            modctrl.page=floor((modctrl.l-5)*f)
            if (modctrl.page!=opage) sound("systemselect")
        }
    }
    y=lerp(modscroll.y+20,modscrolldown.y-20,(modctrl.page/(modctrl.l-5)))
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grab=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over || grab,x,y)

over=0

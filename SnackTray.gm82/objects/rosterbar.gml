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
if (instance_exists(segafade)) if (segafade.object_index=segafade) exit

if (rosterctrl.maxpage=1) {
    x=verybignumber
    grab=0
} else {
    with (rostercursor) if (p2==0 && within(x,y,238,264,124,68)) {
        if (mouse_wheel_down()) with (rosterscrolldown) event_user(0)
        if (mouse_wheel_up()) with (rosterscroll) event_user(0)
    }

    if (grab) {
        if (!rostercursor.akey) grab=0
        else {
            y=median(ystart,ystart+44,grab.y)
            opage=rosterctrl.page
            rosterctrl.page=min(rosterctrl.maxpage+1,floor(((y-ystart)/44)*(rosterctrl.maxpage+1)))
            if (rosterctrl.page!=opage) sound("systemselect")
        }
    } else y=ystart+44*((rosterctrl.page+1)/(rosterctrl.maxpage))
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grab=other.id
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_line(x,ystart-8,x,ystart+43+8)

draw_sprite(sprite_index,!!over || grab,x,y)

over=0

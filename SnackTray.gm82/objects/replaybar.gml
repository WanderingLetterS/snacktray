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
if (!replayctrl.selgo) {
    if (mouse_wheel_down()) with (replayscrolldown) event_user(0)
    if (mouse_wheel_up()) with (replayscroll) event_user(0)

    if (replayctrl.l<=5) {
        y=-999
        grab=0
    } else {
        if (grab) {
            if (!genericcursor.akey) grab=0
            else {
                y=median(replayscroll.y+20,replayscrolldown.y-20,genericcursor.y)
                f=(y-(replayscroll.y+20))/((replayscrolldown.y-20)-(replayscroll.y+20))
                opage=replayctrl.page
                replayctrl.page=floor((replayctrl.l-5)*f)
                if (replayctrl.page!=opage) sound("systemselect")
            }
        }
        y=lerp(replayscroll.y+20,replayscrolldown.y-20,(replayctrl.page/(replayctrl.l-5)))
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
replaybomber.bomb=0
grab=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over || grab,x,y)

over=0

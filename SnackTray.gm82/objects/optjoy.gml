#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joy_detect()
with (genericcursor) input_clear()
if (global.joynum=0) {
    sound("systemreturn")
    ping(lang("error no joy config"))
} else {
    sound("systemselect")
    with (instance_create(0,0,keyconfig)) {
        mode="joy"
        event_user(0)
    }
    test=0
    for (i=0;i<global.joynum;i+=1) for (j=i+1;j<global.joynum;j+=1)
        if (joy_get(i,3,0)=joy_get(j,3,0)) {test=1 break}
    if (test) ping(lang("error identical gamepads"))
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)

over=0

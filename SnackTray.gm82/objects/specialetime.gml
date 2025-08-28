#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over && mouse_check_button_pressed(mb_left)) {
    specialectrl.time=median(30,get_integer("Time :",specialectrl.time),300)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_editorbuttonlong,!!over,x,y)
global.tscale=2
global.halign=1
global.valign=1
draw_systext(x+24,y+15,specialectrl.time)
global.tscale=1
global.halign=0
global.valign=0

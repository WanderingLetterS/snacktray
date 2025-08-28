#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
goto=mainmenu
room_speed=60
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
rect(-1,-1,global.w+2,global.h+2,color,0.5)  //intel graphics performing unnecessary alpha test
draw_set_blend_mode(bm_add)
rect(-1,-1,global.w+2,global.h+2,0,1)
draw_set_blend_mode(0)

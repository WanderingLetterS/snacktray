#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=cosine(xstart,xstart+23,replaybox.f)
if (x=xstart) y=-999 else y=ystart
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (replayctrl) if (selgo) {
    sound("systemreturn")
    selgo=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,!!over,x,y,1,1,0,$ffffff,replaybox.f)

draw_sprite_ext(sprite_index,6,x,y,1,1,0,$ffffff,replaybox.f)

over=0

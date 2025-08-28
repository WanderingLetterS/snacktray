#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (biosctrl) {
    sound("systemselect")
    trophy=modulo(trophy-1,0,maxtrophies)
    event_user(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)

draw_sprite(sprite_index,8,x,y)

over=0

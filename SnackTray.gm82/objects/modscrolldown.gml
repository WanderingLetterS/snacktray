#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (modctrl) {
    sound("systemselect")
    cur=-1
    page=min(page+5,max(0,l-5))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)

draw_sprite(sprite_index,3,x,y)

over=0

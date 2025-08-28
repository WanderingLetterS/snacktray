#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (modctrl) {
    sound("systemselect")
    cur=-1
    page=max(0,page-5)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_line_width(x,y,modscrolldown.x,modscrolldown.y,2)

draw_sprite(sprite_index,!!over,x,y)

draw_sprite(sprite_index,2,x,y)

over=0

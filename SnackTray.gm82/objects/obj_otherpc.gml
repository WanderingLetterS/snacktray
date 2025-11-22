#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
sureface("onlineplayer_"+string(my_id),50,50)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room!=game {
    sprite_index=spr_cursor
    image_blend=c_aqua

} else {sprite_index=spr_spawner image_blend=c_white}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=game {
    //draw_self()

    draw_surface(sureface_get("onlineplayer_"+string(my_id)),
    x-surface_get_width(sureface_get("onlineplayer_"+string(my_id)))/2,
    y-surface_get_height(sureface_get("onlineplayer_"+string(my_id)))/2)

}

else draw_self()

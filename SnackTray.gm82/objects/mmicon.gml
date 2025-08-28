#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
s=-1
s2=-1
time=0
over=0

if (room=stagesel && image_index=1 && global.stagecount) instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=0) {
    time+=1
    s=sureface("icon1",80,80)
    s2=sureface("icon2",40,40)

    if (!sureface_set_target("icon2")) exit
    draw_clear_alpha(0,1)
    draw_set_blend_mode(bm_subtract)
    draw_circle(20,20,16.75,0)
    draw_set_blend_mode(0)

    if (!sureface_set_target("icon1")) exit
    draw_clear_alpha(0,0)

    d3d_set_projection_ortho(0,0,160,160,0)
    draw_clear_alpha(0,0)

    d3d_set_lighting(1)
    d3d_light_define_ambient(0)
    if (over) {
        d3d_light_define_direction(0,-1,1,-1,$aa00)
        d3d_light_define_direction(2,1,-1,1,$8000)
    } else {
        d3d_light_define_direction(0,-1,1,-1,$aaaaaa)
        d3d_light_define_direction(2,1,-1,1,$808080)
    }
    d3d_light_enable(0,1)
    d3d_light_enable(1,0)
    d3d_light_enable(2,1)
    d3d_set_culling(1)
    d3d_transform_add_rotation_y(time)
    d3d_transform_add_rotation_x(time*1.3)
    d3d_transform_add_rotation_z(time*0.7)
    d3d_transform_add_translation(80,80,0)
    d3d_model_draw(global.boll,0,0,0,-1)
    d3d_transform_set_identity()
    d3d_set_lighting(0)
    d3d_set_culling(0)

    d3d_set_projection_ortho(0,0,80,80,0)
    draw_set_blend_mode(bm_subtract)
    draw_surface_stretched(s2,0,0,80,80)
    draw_set_blend_mode(0)

    surface_reset_target()
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=0) {
    sureface_free("icon1")
    sureface_free("icon2")
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=0) segafadeto(roster,"systemstart")
if (image_index=1) menu_cancel()
if (image_index=2) menu_quickplay()
if (image_index=3) segafadeto(options,"systemstart")
if (image_index=4) {url_open("https://discord.gg/DfZYkFTa6T") sound("systemstart")} //find out more button turn into a discords Some kind of "Poker's ball"?
if (image_index=5) {sound("systemreturn") menu_closebutton()}
if (image_index=6) segafadeto(lemon,"systemstart")
if (image_index=7) segafadeto(credroll,"systemstart")
if (image_index=8) {segafadeto(ta_roster,"systemstart")} //time attack menu coming soon
if (image_index=9) segafadeto(replays,"systemstart")
if (image_index=10) segafadeto(charactercreator, "systemstart")
if (image_index=13) {url_open("https://youtube.com/@bolldeluxe") sound("systemstart")}
if (image_index=14) segafadeto(modloader,"systemstart")
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mmlegends.str=lang("mm "+string(image_index))
mmlegends.yeah=""

over=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


lookx=genericcursor.x
looky=genericcursor.y
dx=0
dy=0
if room==mainmenu{
dx=-(lookx-x)/3
dy=-(looky-y)/4
}

repeat (1+9*(room==mainmenu)){
if (image_index=0) {
    if (sureface_exists("icon1")) {
        d3d_set_fog(1,$a0a0a0,0,0)
        draw_surface_stretched(s,x-21+dx,y-21+dy,40,40)
        draw_surface_stretched(s,x-19+dx,y-19+dy,40,40)
        draw_surface_stretched(s,x-21+dx,y-19+dy,40,40)
        draw_surface_stretched(s,x-19+dx,y-21+dy,40,40)
        d3d_set_fog(1,$ffffff,0,0)
        draw_surface_stretched(s,x-21+dx,y-20+dy,40,40)
        draw_surface_stretched(s,x-19+dx,y-20+dy,40,40)
        draw_surface_stretched(s,x-20+dx,y-21+dy,40,40)
        draw_surface_stretched(s,x-20+dx,y-19+dy,40,40)
        d3d_set_fog(0,0,0,0)
        texture_set_interpolation(1)
        draw_surface_stretched(s,x-20+dx,y-20+dy,40,40)
        texture_set_interpolation(0)
    }
}

draw_sprite(sprite_index,image_index+over*image_number/2,x+dx,y+dy)

dy*=0.98
dx*=0.98
}
over=0

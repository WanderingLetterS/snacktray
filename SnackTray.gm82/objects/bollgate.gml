#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=1
scale=0
rad=0
col=0
sty=0

stage=0
alarm[0]=60

colt=playerskindat(0,"bollcoltop0") //these can just be 0 because special stages are only in classic gamemode
colm=playerskindat(0,"bollcolmid0")
colb=playerskindat(0,"bollcolbot0")
bolltex=playerskindat(0,"bolltex0")

if (bolltex) bolltex=sprite_get_texture(bolltex,0)

d3d_light_define_ambient(colm)
d3d_light_define_direction(0,-1,1,-1,colt)
d3d_light_define_direction(1,1,-1,1,colb)
d3d_light_enable(0,1)
d3d_light_enable(1,1)
d3d_light_enable(2,0)

with (player) {
    piped=1
    alarm[2]=-1
    star=0
    depth=-11
    hspeed=hsp
    vspeed=vsp
    friction=0.05
    jump=0
    com_landing()
    jump=1
    spriteswitch(1)
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gamemanager.alarm[0]=2

io_clear()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stage=1
mus_stop()
sound("specialnoise")
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
player.x=(player.x*4+x)/5
player.y=(player.y*4+y-((player.bbox_top+player.bbox_bottom)/2-player.y))/5
player.vsp/=2
player.ready=-1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=(time+2)*1.01
if (stage=0) scale=(scale*39+0.5)/40
else if (stage=1) {rad=min(400,rad+5) if (rad=400) {stage=2 with (player) {visible=0 friction=0 speed=0 depth=0}} global.bgscroll-=1}
else if (stage=2) {rad=max(0,rad-20) if (rad=0) stage=3 global.bgscroll-=1}
else if (stage=3) {scale=max(0,scale-0.05) rad=min(400,rad+20) if (rad=400) {instance_create(x,y,moranboll) stage=4 global.sty=view_yview[0] view_yview[0]=0 /*fix for special stage bg*/} global.bgscroll-=1}
else if (stage=5) {time=0 rad=max(0,rad-20) scale=0.5 if (rad=0) {stage=6  player.visible=1 sound("specialtele") stagemusic(player) with (player) player_camera(1)} global.bgscroll-=1}
else if (stage=6) {scale=max(0,scale-0.05) if (scale=0) {instance_destroy() with (player) {piped=0 hsp=0 vsp=0 flash=1}}}

if (stage=1 || stage=2) {
    draw_set_blend_mode_ext(10,1)
    draw_circle(x,y,floor(rad/10)*10,0)
    draw_set_blend_mode(0)
}
if (stage=3 || stage=4) draw_circle(x,y,rad,0)

if (stage!=4) {
    d3d_set_lighting(1)
    d3d_transform_add_scaling(scale,scale,scale)
    d3d_transform_add_rotation_y(time)
    d3d_transform_add_rotation_x(time*1.3)
    d3d_transform_add_rotation_z(time*0.7)
    d3d_transform_add_translation(x,y,0)
    d3d_set_culling(1)
    if (bolltex) {d3d_set_shading(1) d3d_draw_ellipsoid(-72,-72,-72,72,72,72,bolltex,1,1,64)}
    else d3d_model_draw(global.boll,0,0,0,-1)
    d3d_set_culling(0)
    d3d_set_lighting(0)
    d3d_transform_set_identity()
    if (stage=5) {
        draw_set_color(col)
        draw_circle(x,y,rad,0)
        draw_set_color($ffffff)
    }
}

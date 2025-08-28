#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
musinst=mus_play("credits",1)
str=credits()
h=1096

if (global.discordoverride<2) {discord_update_presence("","Watching the credits","boll-icon","credits-icon")}

dead=0
spd=1
s=-1

repeat (32) instance_create(0,0,credslide)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=sureface("godrays",400,224)
if (!sureface_set_target("godrays")) exit

d3d_set_projection_ortho(0,0,400,224,0)
draw_clear_alpha(0,1)
draw_set_blend_mode(bm_add)
draw_sprite_ext(spr_sun,0,200,100,3,1.5,0,$40ff,0.4)
draw_sprite_ext(spr_sun,0,200,100,1,1,45,$80ff,1)
draw_set_blend_mode(0)
with (credslide) draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,0,1)
rect(0,102,401,225,0,1)

with (credmode7) {
    d3d_set_projection_ext(0,0,0,0,-10,3,0,0,-1,105,400/224,1,1000)
    texture_set_repeat(1)
    d3d_primitive_begin(pr_trianglestrip)
        d3d_vertex_color(-70,-40,-5,0,0)
        d3d_vertex_color(70,-40,-5,0,0)
        d3d_vertex_color(-70,-5,-5,0,1)
        d3d_vertex_color(70,-5,-5,0,1)
    d3d_primitive_end()
    draw_set_blend_mode(0)

    d3d_set_projection_ortho(0,0,400,224,0)
}

surface_reset_target()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sureface_free("godrays")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sureface_exists(s)) {
    texture_set_interpolation(1)
    draw_set_blend_mode(bm_add)
    for (i=0;i<50;i+=1) {
        f=sqr(1+i/35)
        draw_surface_stretched_ext(s,200*(1-f),80*(1-f),400*f,224*f,$ffffff,0.04/f)
    }
    draw_set_blend_mode(0)
    texture_set_interpolation(0)
}

global.halign=1
draw_systext(200,round(224-k),str)
global.halign=0
spd=median(1,spd-0.05+0.1*advance(),4)
draw_sprite(spr_introborder,0,0,0)
draw_set_blend_mode(bm_subtract)
draw_circle_color(200,112,300,0,$606060,0)
draw_set_blend_mode(0)

FMODInstanceSetPitch(musinst,spd)

k+=spd*0.25
if (k>h || input_esc()) {
    segafadeto(finaldemorm)
    segafade.slow=1
}

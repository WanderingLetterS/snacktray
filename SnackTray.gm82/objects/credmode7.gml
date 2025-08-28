#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex1=sprite_get_texture(tex_clouds,0)
tex2=sprite_get_texture(tex_introground,0)

xx=0
x2=0
x3=0
yy=0

surf=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surf=sureface("mode7",800,448)

if (sureface_set_target("mode7")) {
    xx=(xx+0.0015*credctrl.spd) mod 1
    yy=(yy+0.0025*credctrl.spd) mod 1
    x2+=0.0125*credctrl.spd
    x3=(x3+0.25*credctrl.spd) mod 256

    d3d_set_projection_ortho(0,0,400,224,0)

    texture_set_interpolation(1)
    draw_sprite_stretched_ext(tex_sky,1,0,0,401,104,$808080,1)

    draw_sprite_ext(spr_sun,0,200,100,5,2,0,$ff,0.5)
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(spr_sun,0,200,100,3,1.5,0,$40ff,0.2)
    draw_sprite_ext(spr_sun,0,200,100,1,1,0,$80ff,1)

    d3d_set_projection_ext(0,0,0,0,-10,3,0,0,-1,105,400/224,1,1000)
    texture_set_repeat(1)
    d3d_primitive_begin_texture(pr_trianglestrip,tex1)
        d3d_vertex_texture_color(-70,-40,-5,xx,yy,$80ff,0)
        d3d_vertex_texture_color(70,-40,-5,xx+lengthdir_x(2.5,30),yy+lengthdir_y(2.5,30),$80ff,0)
        d3d_vertex_texture_color(-70,-5,-5,xx+lengthdir_x(2.5,300),yy+lengthdir_y(2.5,300),$80ff,1)
        d3d_vertex_texture_color(70,-5,-5,xx+lengthdir_x(2.5,30)+lengthdir_x(2.5,300),yy+lengthdir_y(2.5,30)+lengthdir_y(2.5,300),$80ff,1)
    d3d_primitive_end()
    draw_set_blend_mode(0)

    texture_set_interpolation(1)
    d3d_primitive_begin_texture(pr_trianglestrip,tex2)
        d3d_vertex_texture_color(-70,-30,5,x2,0,$104080,1)
        d3d_vertex_texture_color(-70,0,5,x2,8,0,1)
        d3d_vertex_texture_color(70,-30,5,x2+16,0,$104080,1)
        d3d_vertex_texture_color(70,0,5,x2+16,8,0,1)
    d3d_primitive_end()
    texture_set_interpolation(0)

    d3d_set_projection_ortho(0,0,400,224,0)
    draw_set_blend_mode(bm_subtract)
    with (credslide) draw_ellipse_color(x-20+hspeed,y-8,x+20+hspeed,y+8,$606060,0,0)
    draw_set_blend_mode(bm_add)
    rect(0,0,400,224,0,1)
    draw_set_blend_mode(0)

    surface_reset_target()
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sureface_free("mode7")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sureface_exists("mode7")) draw_surface_stretched(surf,0,0,400,224)

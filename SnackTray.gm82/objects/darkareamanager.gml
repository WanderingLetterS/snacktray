#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

//dark area
lightlevel=5
global.overridelightlevel=-1
global.overridelight=0
glowoff=0
lalpha=1
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Light Manager
global.glowoff = wave_val(-5,5,2,0)

if !(player.star)
{
    global.overridelight = -1
}
else global.overridelight = min(lightlevel,1)
instance_activate_object(flag)

with flag with player if (other.passed[p2] || finish) && (bigger_light<15) {
    bigger_light+=0.015+(bigger_light/5)
    lalpha-=0.025
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///The Dark
if global.mplay > 1 exit;

//clear the surface at the beginning of each frame
if !sureface_exists("lightsurface") {
    global.lightsurface=sureface("lightsurface",400,224)
}

sureface_set_target("lightsurface");
draw_clear_alpha(c_black,0);

//the lighter the color, the darker the shade and vice-versa
//a 100% white pixel will draw 100% black for example since the blend mode is set to subtract
if (global.overridelightlevel == -1) { //why are there two variables for overriding the light level i dont get it
    lightlevel=(gamemanager.players[0]).region.lightlevel
} else lightlevel=global.overridelightlevel

if !(global.overridelight)
draw_sprite_ext(spr_syslightlevel,unreal(lightlevel,0),0,0,view_xview[0]+400,view_yview[0]+244,0,c_white,lalpha);
else
draw_sprite_ext(spr_syslightlevel,global.overridelight,0,0,view_xview[0]+400,view_yview[0]+224,0,c_white,lalpha);

sureface_set_target("appsurf");
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw spotlights for objects.
if global.mplay > 1 exit;

//set blend mode
draw_set_blend_mode(bm_subtract);

for (i=0;i<global.mplay;i+=1) {
sureface_set_target("lightsurface");

//player glow
for (j=0;j<global.mplay;j+=1) {
    camx = view_xview[j]
    camy = view_yview[j]
    if (bigger_light) radius=50*bigger_light
    else radius = 50
    xx=gamemanager.players[j].x
    yy=gamemanager.players[j].y
    draw_circle_color(xx-camx,yy-camy-8,radius+20+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(xx-camx,yy-camy-8,radius+10+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(xx-camx,yy-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(charmdeath){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=50
    radius2=10
    draw_circle_color(x-camx,y-camy-8,radius+(radius2*2)+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+radius2+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(lightbulb){ //real shit
    if (real(channelid) && global.channel[real(channelid)]) || (!real(channelid)) {

    camx = view_xview[other.i]
    camy = view_yview[other.i]
    xx=8*image_xscale+x+8-camx
    yy=8*image_yscale+y-camy
    w=real(width)*16
    h=real(height)*16
    if (shape) == "ellipse" {
        draw_ellipse_color(xx-(w/2)-(10+global.glowoff),yy-(h/2)-(10+global.glowoff),xx+(w/2)+(10+global.glowoff),yy+(h/2)+(10+global.glowoff),make_color_rgb(245,245,245),c_dkgray,false)
        draw_ellipse_color(xx-(w/2)-(5+global.glowoff),yy-(h/2)-(5+global.glowoff),xx+(w/2)+(5+global.glowoff),yy+(h/2)+(5+global.glowoff),make_color_rgb(175,175,175),c_gray,false)
        draw_ellipse_color(xx-(w/2)-global.glowoff,yy-(h/2)-global.glowoff,xx+(w/2)+global.glowoff,yy+(h/2)+global.glowoff,c_white,c_white,false)
    } else if (shape) == "square" {
        draw_rectangle_color(xx-(w/2)-(10+global.glowoff),yy-(h/2)-(10+global.glowoff),xx+(w/2)+(10+global.glowoff),yy+(h/2)+(10+global.glowoff),c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
        draw_rectangle_color(xx-(w/2)-(5+global.glowoff),yy-(h/2)-(5+global.glowoff),xx+(w/2)+(5+global.glowoff),yy+(h/2)+(5+global.glowoff),c_gray,c_gray,c_gray,c_gray,false)
        draw_rectangle_color(xx-(w/2)-global.glowoff,yy-(h/2)-global.glowoff,xx+(w/2)+global.glowoff,yy+(h/2)+global.glowoff,c_white,c_white,c_white,c_white,false)
    } else if (shape) == "spotlight" {
        var _steps, _xx, _yy, _radius;
        _steps = 12;
        _xx = xx;
        _yy = yy-(h/2);
        _radius = 18+global.glowoff;
        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(_xx, _yy, c_dkgray, 1);
        for(i = 0; i <= _steps; i+=1;)
        {
            draw_vertex_color(_xx + lengthdir_x(_radius, 180 * i / _steps), _yy + lengthdir_y(_radius, 180 * i / _steps), c_dkgray, 1);
        }
        draw_primitive_end();

        _radius = 13+global.glowoff;
        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(_xx, _yy, c_gray, 1);
        for(i = 0; i <= _steps; i+=1;)
        {
            draw_vertex_color(_xx + lengthdir_x(_radius, 180 * i / _steps), _yy + lengthdir_y(_radius, 180 * i / _steps), c_gray, 1);
        }
        draw_primitive_end();

        _radius = 8+global.glowoff;
        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(_xx, _yy, c_white, 1);
        for(i = 0; i <= _steps; i+=1;)
        {
            draw_vertex_color(_xx + lengthdir_x(_radius, 180 * i / _steps), _yy + lengthdir_y(_radius, 180 * i / _steps), c_white, 1);
        }
        draw_primitive_end();

        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(xx-8-(10+global.glowoff), yy-(h/2),c_dkgray,1); //top left
        draw_vertex_color(xx-(w/2)-(10+global.glowoff),yy+(h/2),c_dkgray,1); //bottom left
        draw_vertex_color(xx+(w/2)+(10+global.glowoff),yy+(h/2),c_dkgray,1); //bottom right
        draw_vertex_color(xx+8+(10+global.glowoff), yy-(h/2),c_dkgray,1); //top right
        draw_primitive_end();

        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(xx-8-(5+global.glowoff), yy-(h/2),c_gray,1); //top left
        draw_vertex_color(xx-(w/2)-(5+global.glowoff),yy+(h/2),c_gray,1); //bottom left
        draw_vertex_color(xx+(w/2)+(5+global.glowoff),yy+(h/2),c_gray,1); //bottom right
        draw_vertex_color(xx+8+(5+global.glowoff), yy-(h/2),c_gray,1); //top right
        draw_primitive_end();

        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(xx-8-(global.glowoff), yy-(h/2),c_white,1); //top left
        draw_vertex_color(xx-(w/2)-(global.glowoff),yy+(h/2),c_white,1); //bottom left
        draw_vertex_color(xx+(w/2)+(global.glowoff),yy+(h/2),c_white,1); //bottom right
        draw_vertex_color(xx+8+(global.glowoff), yy-(h/2),c_white,1); //top right
        draw_primitive_end();

    }

    }
}

with(projectile){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    draw_circle_color(x-camx,y-camy-8,radius+(radius2*2)+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+radius2+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(podoboo){
    if visible {
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=30
    draw_circle_color(x-camx-8,y-camy-16,radius+10+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx-8,y-camy-16,radius+5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx-8,y-camy-16,radius+global.glowoff,c_white,c_white,false);
    }
}

with(lavablock){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=40
    draw_roundrect_color(x-(radius/3)-15-global.glowoff-camx,y-radius-15-global.glowoff-camy,x+(16*image_xscale)+(radius/3)+15+global.glowoff-camx,y+radius+15+global.glowoff-camy,make_color_rgb(245,245,245),c_dkgray,false);
    draw_roundrect_color(x-(radius/3)-10-global.glowoff-camx,y-radius-10-global.glowoff-camy,x+(16*image_xscale)+(radius/3)+10+global.glowoff-camx,y+radius+10+global.glowoff-camy,make_color_rgb(175,175,175),c_gray,false);
    draw_roundrect_color(x-(radius/3)-global.glowoff-camx,y-radius-global.glowoff-camy,x+(16*image_xscale)+(radius/3)+global.glowoff-camx,y+radius+global.glowoff-camy,c_white,c_white,false);
}

with(firebar){

    xx=x-4 yy=y-8
    repeat (length) {
        xx+=lengthdir_x(8,angle) yy+=lengthdir_y(8,angle)
        camx = view_xview[other.i]
        camy = view_yview[other.i]
        radius=15
        draw_circle_color(round(xx)-camx,round(yy)-camy,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
        draw_circle_color(round(xx)-camx,round(yy)-camy,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
        draw_circle_color(round(xx)-camx,round(yy)-camy,radius+global.glowoff,c_white,c_white,false);
    }
}

with(checkpoint){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=50
    draw_circle_color(x-camx+8,y-camy,radius+20+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx+8,y-camy,radius+10+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx+8,y-camy,radius+global.glowoff,c_white,c_white,false);
}

/*with(item){
    camx = real(view_xview[other.i])
    camy = real(view_yview[other.i])
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}*/

with(starman){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(fireball){
    camx = real(view_xview[other.i])
    camy = real(view_yview[other.i])
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(orbifireball){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(firemissile){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=20
    draw_circle_color(x-camx-4*xsc,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx-4*xsc,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx-4*xsc,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(firemissilesmall){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx+8,y-camy-4,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx+8,y-camy-4,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx+8,y-camy-4,radius+global.glowoff,c_white,c_white,false);
}

with(crabfireball){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(newtronfireball){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(bombfireball){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}


with(fireballplant){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=10
    draw_circle_color(x-camx,y-camy-8,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx,y-camy-8,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx,y-camy-8,radius+global.glowoff,c_white,c_white,false);
}

with(monitor){
    camx = view_xview[other.i]
    camy = view_yview[other.i]
    radius=15
    draw_circle_color(x-camx+8,y-camy,radius+5+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
    draw_circle_color(x-camx+8,y-camy,radius+2.5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
    draw_circle_color(x-camx+8,y-camy,radius+global.glowoff,c_white,c_white,false);
}

with(onoffscreen){
    if ((active) && real(type)==2) || real(type)!=2 {
        camx = view_xview[other.i]
        camy = view_yview[other.i]
        radius=40
        draw_circle_color(x-camx+8,y-camy,radius+10+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
        draw_circle_color(x-camx+8,y-camy,radius+5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
        draw_circle_color(x-camx+8,y-camy,radius+global.glowoff,c_white,c_white,false);
    }
}

with(timerblock){
    if (frm) {
        camx = view_xview[other.i]
        camy = view_yview[other.i]
        radius=20
        draw_circle_color(x-camx+8,y-camy,radius+10+global.glowoff,make_color_rgb(245,245,245),c_dkgray,false);
        draw_circle_color(x-camx+8,y-camy,radius+5+global.glowoff,make_color_rgb(175,175,175),c_gray,false);
        draw_circle_color(x-camx+8,y-camy,radius+global.glowoff,c_white,c_white,false);
    }
}

sureface_set_target("appsurf");

}

draw_set_blend_mode(bm_normal);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sureface_free("lightsurface");
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw Dark Surface

with gamemanager { //Generate replay thumbnail here because dark area manager keeps covering the world in darkness
    if theyremakingamovie {
        makemoviethumb() //secret hud on movies fix simply dont draw the hud yet its easy
        theyremakingamovie=0
        with hudlayer event_user(0)
    }
}

if global.mplay > 1 exit;


//draw the surface to the position of the camera
draw_set_alpha(1)
draw_set_blend_mode(bm_subtract);

if sureface_exists("lightsurface") {
    if global.lightsurface!=0 && surface_exists(global.lightsurface)
    draw_surface(global.lightsurface,view_xview[0],view_yview[0])
}

draw_set_blend_mode(bm_normal);

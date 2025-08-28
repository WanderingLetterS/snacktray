#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
colt=playerskindat(0,"bollcoltop0") //these can just be 0 because special stages are only in classic gamemode
colm=playerskindat(0,"bollcolmid0")
colb=playerskindat(0,"bollcolbot0")
bolltex=playerskindat(0,"bolltex0")

if (bolltex) bolltex=sprite_get_texture(bolltex,0)

d3d_light_enable(0,1)
d3d_light_enable(1,1)
d3d_light_enable(2,0)

name=player.name
endstr=playerskinstr(0,"wspecial0")
endstrall=playerskinstr(0,"aspecial0")
sheet=player.sheets[1]

instance_deactivate_all(1)
instance_activate_object(globalmanager)
instance_activate_object(gamemanager)
instance_activate_object(lemongrab)
instance_activate_object(bgmanager)
instance_activate_object(credmode7)
instance_activate_object(credctrl)
instance_activate_object(runes)
instance_activate_object(bollgate)
instance_activate_object(green_demon)
instance_activate_object(global.screen_manager)

if room=speciale {/*viewhandler(global.s)*/ john_j_background=instance_create(x,y,bgmanager)}

global.mbspr=skindat("tex_specialstage"+string(1+(global.special mod skindat("specialsheets"))))

l=skindat("maxspecial")
surf=-1
surf2=-1

playing=global.special

for (i=0;i<l;i+=1) if (!global.moranplayed[i]) {
    while (global.moranplayed[global.special]) global.special=(global.special+1) mod l
    playing=global.special
    break
}

global.special=(global.special+1) mod l

time=skindat("specialtime"+string(playing))
str=skinstr("specialstr"+string(playing))

coinangle=0

v=0
p=string_pos("|",str)
while (p) {
    line=string_copy(str,1,p-1)
    l=string_length(line)
    str=string_delete(str,1,p)

    for (u=1;u<=l;u+=1) specialepieces(u,v,string_char_at(line,u))
    v+=1
    p=string_pos("|",str)
}

if (global.emeralds=7) with (bollgem) {instance_create(x,y,bollmoon) instance_destroy()}


with (bollblockon) y=-verybignumber
with (moranparent) event_user(1)
with (bollfloor) event_user(1)
with (moranparent)
with (bollcheck) event_user(2)
with (bolldiagtl) event_user(2)
with (bolldiagtr) event_user(2)
with (bolldiagbl) event_user(2)
with (bolldiagbr) event_user(2)
with (bollblockon) y=ystart

camx=x-64
camy=y
camz=z+32
topx=0
topy=0
z=200
zspd=0
ts=-1

global.color1=$ffffff
global.color2=$dddddd
global.color3=$aaaaaa
global.color4=$808080

draw_set_circle_precision(12)

lx=1 ly=0 lz=0
tx=0 ty=0 tz=-1

xd=x yd=y
xp=xd yp=yd
xdb=x ydb=y

dampmul=0.7
dampsub=0.1

alpha=1
if global.respawnmoran fadeblack=1
alpha2=0
alpha3=0
sha=1

controls=0

coins=0
moon=0
dead=0
alarm[0]=60

vww=floor(view_wview[0]/2)
slide1=-100
slide2=600
slide3=-300
slide4=800
points=0
perfect=0
resc=0
mode=0
mempts=0
kek=0

event_user(15)
alarm[11]=4

global.music=""
if !global.respawnmoran mus_play("special",1)
global.respawnmoran=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rezpawn=(global.shards && destroy)

if (!rezpawn) instance_activate_all()
with (moranparent) instance_destroy()

draw_set_circle_precision(64)
view_yview[0]=global.sty

sureface_free("moranboll")
sureface_free("moranboll2")
sureface_free("moranbolltemp")

if (john_j_background > 0 && instance_exists(john_j_background)) instance_destroy_id(john_j_background)

if (!global.shards) {
    bollgate.stage=5
    bollgate.col=$ffffff*result
}

if (rezpawn) instance_activate_object(player)
if (global.wanna) {if (mempts) player.bow=1}
else global.lifes+=mempts
global.scor[0]+=points
if (!rezpawn) with (player) if name="super" gosuper()

with (specialectrl) {alarm[0]=1 instance_create(0,0,segafadein)}

d3d_end()

if global.shards && rezpawn {global.shards-=1 if !win global.respawnmoran=1 instance_create(x,y,moranboll)}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time-=1
if (time<=0) dead=1
else alarm[0]=60
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///win

win=1

if (moon) {
   if !settings("cog inflives") {
      global.scores[6,0]+=1
      global.lifes+=3
    } else global.scor[0]+=10000
} else {
    global.emeralds+=1
}

global.moranplayed[playing]=1

zspd=0
if room!=speciale sound("specialwin")
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("item1up")
alarm[3]=40
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("item1up")
#define Alarm_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[11]=4
/*instance_deactivate_object(moranparent)
instance_activate_region(x-600,y-600,1200,1200,1)
instance_deactivate_object(bollwall)
instance_deactivate_object(bollwallcircle)
instance_deactivate_object(bolldiagtl)
instance_deactivate_object(bolldiagtr)
instance_deactivate_object(bolldiagbl)
instance_deactivate_object(bolldiagbr)
instance_activate_object(bollcheck)
instance_activate_object(bollblockon)
instance_activate_region(x-256,y-256,512,512,1)

the area activation ends up activating level objects, which
causes errors, so it's disabled by now 
*/

with (moranparent) {  
    d=point_distance(cx,cy,other.camx,other.camy)
    a=median(0,1-(d-500)/100,1)
    s=median(0,1-(d-224)/32,1)
    c1=merge_color(0,$606060,s)
    c2=merge_color(0,$303030,s)
    c3=merge_color(0,$606060,a)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
od=cd
cd=point_direction(x,y,camx,camy)

coinangle-=5
alpha=max(0,alpha-0.02)

if (global.playback) decodemovie()
else {input_get(global.input[0]) input_keystates() encodemovie()}

if (dead && !result) {
    if (win && room != speciale) {
        alpha3=min(1,alpha3+0.025)
        if (alpha3=1) {
            result=1
            if !moon
            mus_play("finishsign")
            else mus_play("finish")
        }
    } else {
        alpha2=min(1,alpha2+0.025)
        if room == speciale mus_volume(1 - (alpha2*1.1))
        if (alpha2=1) destroy=1
    }
}

if (stop) speed=max(0,speed*0.87-0.05)

if (!stop && controls) {
    if ((right-left!=0 || down-up!=0) && !falling) {
        d=point_direction(0,0,right-left,down-up)+90+cd
        if (z>zg) motion_add(d,0.05)
        else motion_add(d,0.1*(1+0.5*(anglediff(direction,d)>135)))
        topx=(topx*9+lengthdir_x(1.4,d))/10
        topy=(topy*9+lengthdir_y(1.4,d))/10
    } else {
        topx*=0.9
        topy*=0.9
    }
}

if (!falling) {
    nzg=8
    with (moranparent) {
        coll=0
        if (point_distance(x,y,other.x,other.y)<64) coll=place_meeting(x,y,other.id)
        if (coll && object_index=bollcheck) {if (val<=other.coins) {coll=0 sound("specialbutton") instance_destroy()}}
        if (coll && object_index=bollpiston) {if (abs(other.x-x)<16 && abs(other.y-y)<16) other.nzg=max(other.nzg,z+8)}
        if (coll && other.z>12) if (object_index=bollwall || object_index=bollwallcircle || object_index=bollbumper || object_index=bollblockon || object_index=bolldiagtl || object_index=bolldiagtr || object_index=bolldiagbl || object_index=bolldiagbr)
            other.nzg=24+8*(object_index=bollwallcircle)
    }

    //wall collisions
    if (z>0 && z<14) event_user(2)
    if (z>14 && z<24) event_user(8)

    distfall=24
    nearer=noone

    if (z>12) {
        near=instance_nearest(x,y,bollwallcircle)
        if (near) {odf=distfall distfall=min(24,max(16,point_distance(x,y,near.x,near.y)-(root2times16-16))) if (distfall<odf) nearer=near}
        if (distfall=24) {
            nzg=min(nzg,24)
            near=instance_nearest(x,y,bollwall)
            if (near) {odf=distfall distfall=min(distfall,max(16,abs(x-near.x),abs(y-near.y))) if (distfall<odf) nearer=near}
            if (distfall>16) {
                near=instance_nearest(x,y,bolldiagtl)
                if (near) {odf=distfall distfall=min(distfall,max(16,16+(y-(near.y-(x-near.x)))/1.42)) if (distfall<odf) nearer=near}
                if (distfall>16) {
                    near=instance_nearest(x,y,bolldiagtr)
                    if (near) {odf=distfall distfall=min(distfall,max(16,16+(y-(near.y+(x-near.x)))/1.42)) if (distfall<odf) nearer=near}
                    if (distfall>16) {
                        near=instance_nearest(x,y,bolldiagbl)
                        if (near) {odf=distfall distfall=min(distfall,max(16,16-(y-(near.y+(x-near.x)))/1.42)) if (distfall<odf) nearer=near}
                        if (distfall>16) {
                            near=instance_nearest(x,y,bolldiagbr)
                            if (near) {odf=distfall distfall=min(distfall,max(16,16-(y-(near.y-(x-near.x)))/1.42)) if (distfall<odf) nearer=near}
                            if (distfall>16) {
                                near=instance_nearest(x,y,bollpiston)
                                if (near) if (near.extendo) {odf=distfall distfall=min(distfall,max(16,abs(x-near.x),abs(y-near.y))) if (distfall<odf) nearer=near}
                            }
                        }
                    }
                }
            }
        }
        if (distfall=24) nzg=8
    }

    if (distfall=24) {
        near=instance_nearest(x,y,bollfloor)
        distfall=min(24,max(16,abs(x-near.x),abs(y-near.y)))
        nearer=near
    }

    sha=1-(distfall-16)/8

    if (!stop) {
        zg=nzg-(1-cos((distfall-16)/8*pi/2))*8
        if (z>zg || zspd>0) {
            zspd-=0.1
            z+=zspd
            x+=lengthdir_y(zspd,topx*10)
            y+=lengthdir_y(zspd,topy*10)
        }
        if (z<=nzg) {
            if (distfall=24) z+=zspd
            else {
                controls=1
                oz=z z=max(z,zg)
                if (zspd<0 && z>oz) bop=1
                zspd=max(0,abs(zspd)*0.6-0.5)
                if (bop) zspd=min(3,max(zspd,(z-oz)*(speed/6)))
                speed=median(0,speed*0.99-0.01,7)
                if (distfall>16 && nearer) {
                    vx=0 vy=0
                    if (x>nearer.x+16) vx=1
                    if (x<nearer.x-16) vx=-1
                    if (y>nearer.y+16) vy=1
                    if (y<nearer.y-16) vy=-1
                    if (nearer.object_index=bolldiagtl) {vx=1 vy=1}
                    if (nearer.object_index=bolldiagtr) {vx=-1 vy=1}
                    if (nearer.object_index=bolldiagbl) {vx=1 vy=-1}
                    if (nearer.object_index=bolldiagbr) {vx=-1 vy=-1}
                    motion_add(point_direction(0,0,vx,vy),(distfall-16)/8*0.05+0.5*zspd)
                }
            }
        }
        if (z<4 && zspd<=0) {
            falling=1
            alarm[0]=-1
            sound("specialfall")
        }
    }
} else {
    zspd=max(-7,zspd-0.1)
    z+=zspd
    if (z<-300) dead=1
}

if (z<zg+10) {
    xp=xd yp=yd
    xd=(xd*2+x)/3
    yd=(yd*2+y)/3
}

if (win && room != speciale) {zspd+=0.05 z+=zspd if (z>300) dead=1 xp=0 yp=0 xd=cos(a)*3 yd=-sin(a)*3 a+=0.1}
else if (win) {waitone+=0.05 waittwo+=waitone if (waittwo>180) {dead=1}}

xdb=mean(x,xdb)
ydb=mean(y,ydb)

if (point_distance(xdb,ydb,camx,camy)<64) cd+=cd-od

cd=modulo(cd,0,360)

camx=(camx*4+xdb+lengthdir_x(64,cd))/5
camy=(camy*4+ydb+lengthdir_y(64,cd))/5
if (!win) camz=(camz*9+z+32+max(0,min(96,z*1.3)))/10

bgmanager.offmoran+=anglediff(od,cd)*pi*speed
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (destroy) instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var asp;

asp=25/14

if (!result) {
    surf=sureface("moranboll",global.screenwidth,global.screenheight) //double size so i can supersample
    surf2=sureface("moranboll2",400,224)
    ts=sureface("moranbolltemp",256,128)

    //build dynamic textures
    if (!sureface_set_target("moranbolltemp")) exit
    d3d_set_projection_ortho(0,0,256,128,0)
    draw_clear_alpha(0,0)
    draw_sprite(global.mbspr,0,0,0)
    if (room=speciale) draw_sprite(spr_emerald,0,184,79)
    else draw_sprite_part(sheet,0,97+17*global.emeralds,10,16,16,184,79)
    surface_reset_target()
    global.mbtex=surface_get_texture(ts)

    //prerender background so the shadow blending doesnt cut holes
    if (!sureface_set_target("moranboll2")) exit
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    draw_clear_alpha($ff8000,1) //editor sky color
    drawlayeredbackground(0)
    surface_reset_target()

    //main surface
    if (!sureface_set_target("moranboll")) exit

    //background
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    draw_clear_alpha(0,0)
    d3d_set_zwriteenable(0)
    draw_surface_stretched(surf2,0,0,global.screenwidth,global.screenheight)
    d3d_set_zwriteenable(1)

    d3d_start()

    d3d_set_projection_ext(camx,camy,camz,xdb,ydb,z+16,0,0,1,60,asp,2,2048)
    d3d_transform_add_translation(-xdb,-ydb,-z)
    d3d_transform_add_rotation_y(-topx*10)
    d3d_transform_add_rotation_x(topy*10)
    d3d_transform_add_translation(xdb,ydb,z)

    d3d_set_hidden(1)

    //static geometry
    d3d_model_draw(staticmodel,0,0,0,global.mbtex)

    //shadows
    d3d_set_zwriteenable(0)
    d3d_set_depth(0.01)
    draw_set_blend_mode(bm_subtract)
    event_user(4)
    draw_set_blend_mode(0)
    d3d_set_zwriteenable(1)
    d3d_set_depth(0)

    //draw dynamic objects
    d3d_primitive_begin_texture(pr_trianglelist,global.mbtex)
    d3d_set_culling(1)
    event_user(1)
    d3d_set_culling(0)
    d3d_primitive_end()

    //player shadow
    d3d_set_zwriteenable(0)
    draw_set_blend_mode(bm_subtract)
    d3d_set_depth(nzg-7.99)
    draw_circle_color(xdb-lengthdir_y(z-nzg,topx*10),ydb-lengthdir_y(z-nzg,topy*10),12/(1+abs(z-nzg-8)/128),merge_color(0,$cccccc,sha),0,0)
    d3d_set_zwriteenable(1)
    draw_set_blend_mode(0)
    d3d_set_depth(0)

    d3d_transform_set_identity()

    //boll
    event_user(3)

    d3d_set_hidden(0)
    d3d_end()

    //fix alpha
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    draw_set_blend_mode(bm_add)
    rect(0,0,global.screenwidth,global.screenheight,0,1)
    draw_set_blend_mode(0)

    surface_reset_target()
}
#define Collision_bollbutton
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && z<9) {
    if (!other.lock) {
        with (bollblockoff) alarm[0]=2
        with (bollblockon) alarm[0]=2
        sound("specialbutton")
    }
    other.lock=1
    other.alarm[0]=30
}
#define Collision_bollbumper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && z<32) {
    if (!other.lock) sound("specialbumper")
    other.lock=1
    other.alarm[0]=2
    speed=4
    zspd=1
    direction=point_direction(other.x,other.y,x,y)
    if (point_distance(x,y,other.x,other.y<20)) {
        xc=other.x+lengthdir_x(20,direction)
        yc=other.y+lengthdir_y(20,direction)
        x=xc+hspeed
        y=yc+vspeed
    }
}
#define Collision_bollspring
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && (z+zspd<9)) {
    sound("specialspring")
    zspd=5
    speed*=0.7
}
#define Collision_bollcoin
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && z<24 && !falling && point_distance(x,y,other.x,other.y)<16) {
    with (other) instance_destroy()
    coins+=1
    sound("specialcoin")
    stats("coins collected",stats("coins collected")+1)
    if (!instance_exists(bollcoin)) perfect=10000
}
#define Collision_bolltimer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && z<24 && !falling && point_distance(x,y,other.x,other.y)<12) {
    with (other) instance_destroy()
    time+=15
    sound("specialclock")
}
#define Collision_bollgem
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!stop && !dead && z>0 && z<24 && !falling && point_distance(x,y,other.x,other.y)<12) {
    mus_fade()
    stats("emeralds collected",stats("emeralds collected")+1)
    sound("specialgem")
    stop=1
    alarm[0]=-1
    alarm[1]=70
}
#define Collision_bollmoon
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (z>0 && z<24 && !falling && point_distance(x,y,other.x,other.y)<12) {
    with (other) instance_destroy()
    mus_fade()
    sound("item1up")
    stop=1
    moon=1
    alarm[0]=-1
    alarm[1]=70
    alarm[2]=40
}
#define Collision_bollpiston
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(other.x-x)<16 && abs(other.y-y)<16) {
    if (other.extendo) {
        other.alarm[0]=2
    } else {
        other.extendo=1
        other.alarm[0]=2
        sound("specialpiston")
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///wall collision
var d,b;

if (point_distance(xc,yc,x,y)<=8) {
    d=point_direction(xc,yc,x,y)

    //check if the ball is actually moving towards the surface normal
    if (abs(((((direction - d+180) mod 360) + 540) mod 360) - 180)<90) {
        //expulse
        x=xc+lengthdir_x(8,d)
        y=yc+lengthdir_y(8,d)

        //reflect
        xc=max(0,lengthdir_x(speed,180-direction+d)*dampmul-dampsub)
        yc=lengthdir_y(speed,180-direction+d)
        speed=point_distance(0,0,xc,yc)
        b=direction
        direction=point_direction(0,0,xc,yc)+d

        vol=min(1,abs(anglediff(b,direction))/180*speed)
        if (vol>0.05) sound("specialbump",0,1,vol)
        if (zspd>0 && zspd<2) zspd=-zspd
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///dynamic geometry
var xd,yd,d;

xd=lengthdir_x(8,coinangle)
yd=lengthdir_y(8,coinangle)
d=point_direction(moranboll.xdb,moranboll.ydb,moranboll.camx,moranboll.camy)-90

with (bollpiston) if (z>0) {
    d3d_vertex_texture_color(x-16,y-16,z,9*u,9*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y-16,z,41*u,9*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y+16,z,9*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y+16,z,9*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y-16,z,41*u,9*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y+16,z,41*u,41*v,global.color2,a)

    d3d_vertex_texture_color(x-16,y-16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y-16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y-16,z,44*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y-16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y-16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y-16,z,44*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,z,44*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x-16,y+16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y+16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x-16,y-16,z,44*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y-16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x-16,y-16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x-16,y+16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y-16,z,76*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y-16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y+16,z,44*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y-16,z-16,76*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y+16,z-16,44*u,76*v,global.color4,a)
    d3d_vertex_texture_color(x+16,y+16,z,44*u,60*v,global.color3,a)
}

with (bollbutton) if (!lock && a>0) {
    d3d_vertex_texture_color(x-8,y-8,4,60*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+8,y-8,4,44*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-8,y+8,4,60*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x-8,y+8,4,60*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+8,y-8,4,44*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+8,y+8,4,44*u,95*v,global.color1,a)

    d3d_vertex_texture_color(x-8,y-8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y-8,0,60*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y-8,4,44*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y-8,0,60*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y-8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y-8,4,44*u,95*v,global.color3,a)

    d3d_vertex_texture_color(x-8,y+8,4,44*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x+8,y+8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y+8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x-8,y+8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y+8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x+8,y+8,0,60*u,103*v,global.color2,a)

    d3d_vertex_texture_color(x-8,y-8,4,44*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y+8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y-8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x-8,y-8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x-8,y+8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x-8,y+8,0,60*u,103*v,global.color2,a)

    d3d_vertex_texture_color(x+8,y-8,4,60*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x+8,y-8,0,60*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y+8,4,44*u,95*v,global.color3,a)
    d3d_vertex_texture_color(x+8,y-8,0,60*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y+8,0,44*u,103*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y+8,4,44*u,95*v,global.color3,a)
}
with (bollblockon) if (a>0) {
    d3d_vertex_texture_color(x-16,y-16,16,79*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x+16,y-16,16,111*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x-16,y+16,16,79*u,41*v,global.color1,a)
    d3d_vertex_texture_color(x-16,y+16,16,79*u,41*v,global.color1,a)
    d3d_vertex_texture_color(x+16,y-16,16,111*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x+16,y+16,16,111*u,41*v,global.color1,a)

    d3d_vertex_texture_color(x-16,y-16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y-16,0,111*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y-16,16,79*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y-16,0,111*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y-16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y-16,16,79*u,44*v,global.color2,a)

    d3d_vertex_texture_color(x-16,y+16,16,79*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y+16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y+16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y+16,0,111*u,60*v,global.color3,a)

    d3d_vertex_texture_color(x-16,y-16,16,79*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y+16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y-16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y-16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x-16,y+16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x-16,y+16,0,111*u,60*v,global.color3,a)

    d3d_vertex_texture_color(x+16,y-16,16,111*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y-16,0,111*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,16,79*u,44*v,global.color2,a)
    d3d_vertex_texture_color(x+16,y-16,0,111*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,0,79*u,60*v,global.color3,a)
    d3d_vertex_texture_color(x+16,y+16,16,79*u,44*v,global.color2,a)
}
with (bollcheck) if (a>0) {
    d3d_vertex_texture_color(x-8,y-8,0,165*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y-8,0,149*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x,y,32,157*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x+8,y-8,0,165*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x+8,y+8,0,149*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x,y,32,157*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x+8,y+8,0,165*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x-8,y+8,0,149*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x,y,32,157*u,9*v,global.color1,a)
    d3d_vertex_texture_color(x-8,y+8,0,165*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x-8,y-8,0,149*u,41*v,global.color2,a)
    d3d_vertex_texture_color(x,y,32,157*u,9*v,global.color1,a)
}
with (bollcoin) if (a>0) {
    d3d_vertex_texture_color(x-xd,y-yd,20,79*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,95*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,79*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,79*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,95*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,4,95*u,95*v,global.color1,a)

    d3d_vertex_texture_color(x-xd,y-yd,20,95*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,95*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,79*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,95*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,4,79*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,79*u,79*v,global.color1,a)
}
with (bolltimer) if (a>0) {
    d3d_vertex_texture_color(x-xd,y-yd,20,114*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,130*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,114*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,114*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,130*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,4,130*u,95*v,global.color1,a)

    d3d_vertex_texture_color(x-xd,y-yd,20,130*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,130*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,114*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xd,y-yd,4,130*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,4,114*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xd,y+yd,20,114*u,79*v,global.color1,a)
}
with (bollgem) if (a>0) {
    dl=d+0.5*anglediff(d,point_direction(x,y,moranboll.camx,moranboll.camy)-90)
    xdl=lengthdir_x(8,dl)*f
    ydl=lengthdir_y(8,dl)*f
    h1=12+z-8*f
    h2=12+z+8*f

    d3d_vertex_texture_color(x-xdl,y-ydl,h2,184*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,h2,200*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xdl,y-ydl,h1,184*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x-xdl,y-ydl,h1,184*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,h2,200*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,h1,200*u,95*v,global.color1,a)
}
with (bollmoon) if (a>0) {
    dl=d+0.5*anglediff(d,point_direction(x,y,moranboll.camx,moranboll.camy)-90)
    xdl=lengthdir_x(8,dl)
    ydl=lengthdir_y(8,dl)

    d3d_vertex_texture_color(x-xdl,y-ydl,20+z,149*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,20+z,165*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x-xdl,y-ydl,4+z,149*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x-xdl,y-ydl,4+z,149*u,95*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,20+z,165*u,79*v,global.color1,a)
    d3d_vertex_texture_color(x+xdl,y+ydl,4+z,165*u,95*v,global.color1,a)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///eject on ground

with (bollwallcircle) if (coll) with (other) {
    if (point_distance(x,y,other.x,other.y)<=root2times16+8) {
        d=point_direction(other.x,other.y,x,y)
        xc=other.x+lengthdir_x(root2times16,d)
        yc=other.y+lengthdir_y(root2times16,d)
        event_user(0)
    }
}

with (bolldiagtl) if (coll) with (other) {
    if (y>(other.y-(x-other.x)) && x>other.x-16 && y>other.y-16) {//diagonal side
        xc=other.x-(y-other.y-(x-other.x))/2 yc=other.y-(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) event_user(0)
    } else if (abs(y-other.y)<=16) {//x wall
        if (x=median(other.x-24,x,other.x-16)) {xc=other.x-16 yc=y event_user(0)}
    } else if (abs(x-other.x)<=16) {//y wall
        if (y=median(other.y-24,y,other.y-16)) {xc=x yc=other.y-16 event_user(0)}
    }
}

with (bolldiagtr) if (coll) with (other) {
    if (y>=(other.y+(x-other.x)) && x<=other.x+16 && y>=other.y-16) {//diagonal side
        xc=other.x+(y-other.y+(x-other.x))/2 yc=other.y+(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) event_user(0)
    } else if (abs(y-other.y)<=16) {//x wall
        if (x=median(other.x+16,x,other.x+24)) {xc=other.x+16 yc=y event_user(0)}
    } else if (abs(x-other.x)<=16) {//y wall
        if (y=median(other.y-24,y,other.y-16)) {xc=x yc=other.y-16 event_user(0)}
    }
}

with (bolldiagbr) if (coll) with (other) {
    if (y<=(other.y-(x-other.x)) && x<=other.x+16 && y<=other.y+16) {//diagonal side
        xc=other.x-(y-other.y-(x-other.x))/2 yc=other.y-(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) event_user(0)
    } else if (abs(y-other.y)<=16) {//x wall
        if (x=median(other.x+16,x,other.x+24)) {xc=other.x+16 yc=y event_user(0)}
    } else if (abs(x-other.x)<=16) {//y wall
        if (y=median(other.y+16,y,other.y+24)) {xc=x yc=other.y+16 event_user(0)}
    }
}

with (bolldiagbl) if (coll) with (other) {
    if (y<=(other.y+(x-other.x)) && x>=other.x-16 && y<=other.y+16) {//diagonal side
        xc=other.x+(y-other.y+(x-other.x))/2 yc=other.y+(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) event_user(0)
    } else if (abs(y-other.y)<=16) {//x wall
        if (x=median(other.x-24,x,other.x-16)) {xc=other.x-16 yc=y event_user(0)}
    } else if (abs(x-other.x)<=16) {//y wall
        if (y=median(other.y+16,y,other.y+24)) {xc=x yc=other.y+16 event_user(0)}
    }
}

with (bollwall) if (coll) with (other) {
    if (abs(y-other.y)<=16) {//x wall
        if (x=median(other.x-24,x,other.x+24)) {xc=other.x+16*sign(x-other.x) yc=y event_user(0)}
    } else if (abs(x-other.x)<=16) {//y wall
        if (y=median(other.y-24,y,other.y+24)) {xc=x yc=other.y+16*sign(y-other.y) event_user(0)}
    }
}

//corners

with (bolldiagtl) if (coll) with (other) {
    if (y>(other.y-(x-other.x)) && x>other.x-16 && y>other.y-16) {//diagonal side
        xc=median(other.x-16,other.x-(y-other.y-(x-other.x))/2,other.x+16) yc=other.y-(xc-other.x) event_user(0)
    } else if (abs(y-other.y)>16 && abs(x-other.x)>16 && !(x>other.x && y>other.y)) {//corner hit
        if (x<other.x) xc=other.x-16 else xc=other.x+16
        if (y<other.y) yc=other.y-16 else yc=other.y+16
        event_user(0)
    }
}

with (bolldiagtr) if (coll) with (other) {
    if (y>=(other.y+(x-other.x)) && x<=other.x+16 && y>=other.y-16) {//diagonal side
        xc=median(other.x-16,other.x+(y-other.y+(x-other.x))/2,other.x+16) yc=other.y+(xc-other.x) event_user(0)
    } else if (abs(y-other.y)>16 && abs(x-other.x)>16 && !(x<other.x && y>other.y)) {//corner hit
        if (x<other.x) xc=other.x-16 else xc=other.x+16
        if (y<other.y) yc=other.y-16 else yc=other.y+16
        event_user(0)
    }
}

with (bolldiagbr) if (coll) with (other) {
    if (y<=(other.y-(x-other.x)) && x<=other.x+16 && y<=other.y+16) {//diagonal side
        xc=median(other.x-16,other.x-(y-other.y-(x-other.x))/2,other.x+16) yc=other.y-(xc-other.x) event_user(0)
    } else if (abs(y-other.y)>16 && abs(x-other.x)>16 && !(x<other.x && y<other.y)) {//corner hit
        if (x<other.x) xc=other.x-16 else xc=other.x+16
        if (y<other.y) yc=other.y-16 else yc=other.y+16
        event_user(0)
    }
}

with (bolldiagbl) if (coll) with (other) {
    if (y<=(other.y+(x-other.x)) && x>=other.x-16 && y<=other.y+16) {//diagonal side
        xc=median(other.x-16,other.x+(y-other.y+(x-other.x))/2,other.x+16) yc=other.y+(xc-other.x) event_user(0)
    } else if (abs(y-other.y)>16 && abs(x-other.x)>16 && !(x>other.x && y<other.y)) {//corner hit
        if (x<other.x) xc=other.x-16 else xc=other.x+16
        if (y<other.y) yc=other.y-16 else yc=other.y+16
        event_user(0)
    }
}

with (bollwall) if (coll) with (other) {
    if (abs(y-other.y)>16 && abs(x-other.x)>16) {//corner hit
        if (x<other.x) xc=other.x-16 else xc=other.x+16
        if (y<other.y) yc=other.y-16 else yc=other.y+16
        event_user(0)
    }
}
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw boll
d3d_set_lighting(1)
d3d_light_define_ambient(colm)
d3d_light_define_direction(0,-1,1,-1,colt)
d3d_light_define_direction(1,1,-1,1,colb)
offx=(xd-xp)/(14*pi)*360
offy=(yd-yp)/(14*pi)*360
l=point_distance(0,0,lx,lz) d=point_direction(0,0,lx,lz) lx=lengthdir_x(l,d+offx) lz=lengthdir_y(l,d+offx)
l=point_distance(0,0,ly,lz) d=point_direction(0,0,ly,lz) ly=lengthdir_x(l,d+offy) lz=lengthdir_y(l,d+offy)
l=point_distance(0,0,tx,tz) d=point_direction(0,0,tx,tz) tx=lengthdir_x(l,d+offx) tz=lengthdir_y(l,d+offx)
l=point_distance(0,0,ty,tz) d=point_direction(0,0,ty,tz) ty=lengthdir_x(l,d+offy) tz=lengthdir_y(l,d+offy)
n=point_distance_3d(lx,ly,lz,tx,ty,tz)/1.4142 if (n=0) {lx=1 ly=0 lz=0 tx=0 ty=0 tz=-1} else {lx/=n ly/=n lz/=n}
n=point_distance_3d(0,0,0,lx,ly,lz) if (n=0) {lx=1 ly=0 lz=0} else {lx/=n ly/=n lz/=n}
n=point_distance_3d(0,0,0,tx,ty,tz) if (n=0) {tx=0 ty=0 tz=-1} else {tx/=n ty/=n tz/=n}
l=point_distance(0,0,tx,ty) d=point_direction(0,0,tx,ty)-point_direction(0,0,lx,ly) dx=lengthdir_x(l,d) dy=lengthdir_y(l,d)
l=point_distance(0,0,dx,tz) d=point_direction(0,0,dx,tz)-point_direction(0,0,point_distance(0,0,lx,ly),lz) dx=lengthdir_x(l,d) dz=lengthdir_y(l,d)
d3d_transform_add_scaling(0.112,0.112,0.112)
d3d_transform_add_rotation_y(-point_direction(0,0,point_distance(0,0,lx,ly),lz))
d3d_transform_add_rotation_z(point_direction(0,0,lx,ly))
d3d_transform_add_rotation_axis(lx,ly,lz,point_direction(0,0,dy,dz))
d3d_transform_add_translation(xdb,ydb,z)
if (bolltex) {d3d_set_shading(1) d3d_draw_ellipsoid(-72,-72,-72,72,72,72,bolltex,1,1,64)}
else d3d_model_draw(global.boll,0,0,0,-1)
d3d_transform_set_identity()
d3d_set_lighting(0)
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///shadows

with (bollpiston) if (z>0) {
    if (ftl) draw_circle_color(x-8,y-8,24,c1,0,0)
    if (ftr) draw_circle_color(x+8,y-8,24,c1,0,0)
    if (fbl) draw_circle_color(x-8,y+8,24,c1,0,0)
    if (fbr) draw_circle_color(x+8,y+8,24,c1,0,0)
}
with (bollwall) if (object_index=bollwall && s>0) {
    if (ftl) draw_circle_color(x-8,y-8,24,c1,0,0)
    if (ftr) draw_circle_color(x+8,y-8,24,c1,0,0)
    if (fbl) draw_circle_color(x-8,y+8,24,c1,0,0)
    if (fbr) draw_circle_color(x+8,y+8,24,c1,0,0)
}
with (bollwallcircle) if (s>0) {
    draw_circle_color(x,y,40,merge_color(0,$aaaaaa,s),0,0)
}
with (bolldiagtl) if (s>0) {
    if (ftr) draw_circle_color(x+8,y-8,20,c2,0,0)
    if (fbl) draw_circle_color(x-8,y+8,20,c2,0,0)
    if (floored) draw_circle_color(x,y,16,c2,0,0)
}
with (bolldiagtr) if (s>0) {
    if (ftl) draw_circle_color(x-8,y-8,20,c2,0,0)
    if (fbr) draw_circle_color(x+8,y+8,20,c2,0,0)
    if (floored) draw_circle_color(x,y,16,c2,0,0)
}
with (bolldiagbl) if (s>0) {
    if (ftl) draw_circle_color(x-8,y-8,20,c2,0,0)
    if (fbr) draw_circle_color(x+8,y+8,20,c2,0,0)
    if (floored) draw_circle_color(x,y,16,c2,0,0)
}
with (bolldiagbr) if (s>0) {
    if (ftr) draw_circle_color(x+8,y-8,20,c2,0,0)
    if (fbl) draw_circle_color(x-8,y+8,20,c2,0,0)
    if (floored) draw_circle_color(x,y,16,c2,0,0)
}
with (bollcoin) if (a>0) {
    draw_circle_color(x,y,8,c3,0,0)
}
with (bolltimer) if (a>0) {
    draw_circle_color(x,y,8,c3,0,0)
}
with (bollgem) if (a>0) {
    draw_circle_color(x,y,8,c3,0,0)
}
with (bollmoon)  if (a>0) {
    draw_circle_color(x,y,8,c3,0,0)
}
#define Other_18
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///eject on fall

with (bollcheck) if (coll) with (other) {
    if (point_distance(x,y,other.x,other.y)<=16) {
        d=point_direction(other.x,other.y,x,y)
        x=inch(x,other.x+lengthdir_x(100,d),4)
        y=inch(y,other.y+lengthdir_y(100,d),4)
    }
}

/*with (bolldiagtl) if (coll) with (other) {
    if (y>(other.y-(x-other.x)) && x>other.x-16 && y>other.y-16) {//diagonal side
        xc=other.x-(y-other.y-(x-other.x))/2 yc=other.y-(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) {x=max(x,inch(x,xc+7,4)) y=max(y,inch(y,yc+7,4))}
    }
}

with (bolldiagtr) if (coll) with (other) {
    if (y>=(other.y+(x-other.x)) && x<=other.x+16 && y>=other.y-16) {//diagonal side
        xc=other.x+(y-other.y+(x-other.x))/2 yc=other.y+(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) {x=min(x,inch(x,xc-7,4)) y=max(y,inch(y,yc+7,4))}
    }
}

with (bolldiagbr) if (coll) with (other) {
    if (y<=(other.y-(x-other.x)) && x<=other.x+16 && y<=other.y+16) {//diagonal side
        xc=other.x-(y-other.y-(x-other.x))/2 yc=other.y-(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) {x=min(x,inch(x,xc-7,4)) y=min(y,inch(y,yc-7,4))}
    }
}

with (bolldiagbl) if (coll) with (other) {
    if (y<=(other.y+(x-other.x)) && x>=other.x-16 && y<=other.y+16) {//diagonal side
        xc=other.x+(y-other.y+(x-other.x))/2 yc=other.y+(xc-other.x)
        if (xc=median(other.x-16,xc,other.x+16)) {x=max(x,inch(x,xc+7,4)) y=min(y,inch(y,yc-7,4))}
    }
}  */
#define Other_24
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw results screen

slide1=min(vww,slide1+16)
slide2=max(vww,slide2-16)
slide3=min(vww,slide3+16)
slide4=max(vww,slide4-16)

if (mode=0) alpha3=max(0,alpha3-0.05)

if (slide4=vww && !mode) mode=1
if (mode=1) {
    resc+=1
    if (resc=120) {
        sound("systemtimecount",1)
        mode=2
        resc=0
    }
}
if (mode=2) {
    kek=!kek
    if (kek) {
        if (coins) {coins-=1 points+=500}
        if (time) {time-=1 points+=500}
        if (perfect) {perfect-=500 points+=500}
    }

    if (floor(points/20000)>mempts) {
        mempts+=1
        if (global.wanna) playgrowsfx("")
        else sound("item1up")
    }

    if (coins<=0 && time<=0 && perfect<=0) {
        soundstop("systemtimecount")
        sound("systemregister")
        mode=3
    }
}
if (mode=3) {
    resc+=1
    if (resc=64) {
        sound("itemspecial")
        mode=4
    }
}
if (mode=4) {
    alpha3=min(1,alpha3+0.05)
    if (alpha3=1) destroy=1
}

d3d_set_projection_ortho(view_xview[0],view_yview[0],400,224,0)
offmoran-=1
draw_clear_alpha(0,1)
drawlayeredbackground(0)
d3d_set_projection_ortho(0,0,400,224,0)

t+=0.25
for (i=0;i<global.emeralds;i+=1) {
    if (global.greenmode) draw_sprite_part(sheet,0,97+17,10,16,16,200-global.emeralds*12+24*i,64+round(sin(i*24+t/2)*2))
    else draw_sprite_part(sheet,0,97+17*i,10,16,16,200-global.emeralds*12+24*i,64+round(sin(i*24+t/2)*2))
}

global.halign=1

global.tscale=2
if (global.emeralds=7) draw_skintext(vww,16,wordwrap(endstrall,24))
else draw_skintext(vww,16,wordwrap(endstr,24))
global.tscale=1

global.halign=2

draw_skintext(slide1,96,lang("score 3")+":",$ffff,1)
draw_skintext(slide2,112,lang("score 5")+":",$ffff,1)
draw_skintext(slide3,128,lang("score 9")+":",$ffff,1)
draw_skintext(slide4,144,lang("score 0")+":",$ffff,1)

global.halign=0

draw_skintext(slide1,96," "+string(coins))
draw_skintext(slide2,112," "+string(time))
draw_skintext(slide3,128," "+string(perfect))
draw_skintext(slide4,144," "+string(points))
#define Other_25
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///bake
/*

wip ping renex if this breaks

note: move to usage when done
note: account for 32000 vertex

*/
var i,x1,y1,x2,y2,u1,u2;
var m;

m=d3d_model_create()
d3d_model_primitive_begin(m,pr_trianglelist)

with (bollfloor) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,9*u,9*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,41*u,9*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,9*u,41*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,9*u,41*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,41*u,9*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,41*u,41*v,global.color2,a)
    if (top) {
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
    }
    if (bot) {
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,-16,76*u,76*v,global.color4,a)
    }
    if (lef) {
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,-16,76*u,76*v,global.color4,a)
    }
    if (rig) {
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
    }
}

with (bollwall) if (object_index=bollwall) {
    d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,41*v,global.color1,a)
    if (top) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
    }
    if (bot) {
        d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
    }
    if (lef) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
    }
    if (rig) {
        d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
    }
}

with (bollwallcircle) {
    for (i=0;i<18;i+=1) {
        x1=x+lengthdir_x(root2times16*0.85,i*20)
        x2=x+lengthdir_x(root2times16*0.85,i*20+20)
        y1=y+lengthdir_y(root2times16*0.85,i*20)
        y2=y+lengthdir_y(root2times16*0.85,i*20+20)
        u1=9+((32*i)/6) mod 32
        u2=9+((32*(i+1))/6) mod 32.000001

        d3d_model_vertex_texture_color(m,x1,y1,16,u1*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,16,u2*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x1,y1,0,u1*u,111*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x1,y1,0,u1*u,111*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x2,y2,16,u2*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,0,u2*u,111*v,global.color2,a)
    }

    for (i=0;i<18;i+=1) {
        x1=x+lengthdir_x(root2times16,i*20)
        x2=x+lengthdir_x(root2times16,i*20+20)
        y1=y+lengthdir_y(root2times16,i*20)
        y2=y+lengthdir_y(root2times16,i*20+20)
        u1=9+((32*i)/6) mod 32
        u2=9+((32*(i+1))/6) mod 32.000001

        d3d_model_vertex_texture_color(m,x1,y1,32,u1*u,79*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,32,u2*u,79*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x1,y1,16,u1*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x1,y1,16,u1*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,32,u2*u,79*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,16,u2*u,95*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x,y,32,13*u,60*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x2,y2,32,17*u,76*v,global.color1,a)
        d3d_model_vertex_texture_color(m,x1,y1,32,9*u,76*v,global.color1,a)
    }
}

with (bolldiagtl) {
    d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,41*v,global.color1,a)
    if (top) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
    }
    if (lef) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
    }
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,44*v,global.color2,a)

    if (!floored) {
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
    }
}

with (bolldiagtr) {
    d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,41*v,global.color1,a)
    if (top) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
    }
    if (rig) {
        d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
    }
    d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)

    if (!floored) {
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,-16,76*u,76*v,global.color4,a)
    }
}

with (bolldiagbl) {
    d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,41*v,global.color1,a)
    if (bot) {
        d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
    }
    if (lef) {
        d3d_model_vertex_texture_color(m,x-16,y-16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
    }
    d3d_model_vertex_texture_color(m,x-16,y-16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)

    if (!floored) {
        d3d_model_vertex_texture_color(m,x-16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y-16,-16,76*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
    }
}

with (bolldiagbr) {
    d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,41*v,global.color1,a)
    if (bot) {
        d3d_model_vertex_texture_color(m,x-16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,76*u,60*v,global.color3,a)
    }
    if (rig) {
        d3d_model_vertex_texture_color(m,x+16,y-16,16,76*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y+16,16,44*u,44*v,global.color2,a)
    }
    d3d_model_vertex_texture_color(m,x+16,y-16,16,44*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,16,76*u,44*v,global.color2,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)

    if (!floored) {
        d3d_model_vertex_texture_color(m,x+16,y-16,0,44*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x+16,y-16,-16,44*u,76*v,global.color4,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,0,76*u,60*v,global.color3,a)
        d3d_model_vertex_texture_color(m,x-16,y+16,-16,76*u,76*v,global.color4,a)
    }
}

with (bollbutton) {
    d3d_model_vertex_texture_color(m,x-8,y-8,1,60*u,79*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+8,y-8,1,44*u,79*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-8,y+8,1,60*u,95*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-8,y+8,1,60*u,95*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+8,y-8,1,44*u,79*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+8,y+8,1,44*u,95*v,global.color1,a)
}

with (bollblockon) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,114*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,146*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,114*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,114*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,146*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,146*u,41*v,global.color1,a)
}

with (bollblockoff) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,114*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,146*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,114*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,114*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,146*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,146*u,41*v,global.color1,a)
}

with (bollcheck) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,149*u,43*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,181*u,43*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,149*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,149*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,181*u,43*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,181*u,76*v,global.color1,a)
}

with (bollbumper) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,184*u,44*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,216*u,44*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x,y,16,200*u,60*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,216*u,44*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,216*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x,y,16,200*u,60*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,216*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,184*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x,y,16,200*u,60*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,184*u,76*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y-16,0,184*u,44*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x,y,16,200*u,60*v,global.color1,a)
}

with (bollspring) {
    d3d_model_vertex_texture_color(m,x-16,y-16,0,184*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,216*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,184*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x-16,y+16,0,184*u,41*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y-16,0,216*u,9*v,global.color1,a)
    d3d_model_vertex_texture_color(m,x+16,y+16,0,216*u,41*v,global.color1,a)
}

d3d_model_primitive_end(m)

staticmodel=m
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mm,dX,dY,dZ,uX,uY,uZ,vX,vY,vZ,tFOV,tx,ty,tz,asp;

d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
draw_clear_alpha(0,0)

if (!result) {
    texture_set_interpolation(1)
    if (sureface_exists("moranboll")) draw_surface_stretched(surf,0,0,global.screenwidth,global.screenheight)
    texture_set_interpolation(0)

    asp=25/14

    //scronchified Yourself"s 3D-to-2D
    dX=xdb-camx dY=ydb-camy dZ=z+16-camz
    mm=max(0.0001,sqrt(dX*dX+dY*dY+dZ*dZ))
    dX/=mm dY/=mm dZ/=mm
    uX=0 uY=0 uZ=1
    mm=uX*dX+uY*dY+uZ*dZ
    uX-=mm*dX uY-=mm*dY uZ-=mm*dZ
    mm=sqrt(uX*uX+uY*uY+uZ*uZ)
    uX/=mm uY/=mm uZ/=mm
    tFOV=tan(60*pi/360)
    uX*=tFOV uY*=tFOV uZ*=tFOV
    vX=uY*dZ-dY*uZ vY=uZ*dX-dZ*uX vZ=uX*dY-dX*uY
    vX*=asp vY*=asp vZ*=asp
                    
    global.halign=1            
    global.valign=2
    global.tscale=2
    with (bollcheck) if (d<global.screenwidth) {
        tx=x-other.xdb ty=y-other.ydb tz=32-other.z    
        l=point_distance(0,0,tx,tz) d=point_direction(0,0,tx,tz)
        tx=lengthdir_x(l,d+other.topx*10) tz=lengthdir_y(l,d+other.topx*10)
        l=point_distance(0,0,ty,tz) d=point_direction(0,0,ty,tz)
        ty=lengthdir_x(l,d+other.topy*10) tz=lengthdir_y(l,d+other.topy*10)     
        with (other) {
            pX=tx+xdb-camx pY=ty+ydb-camy pZ=tz+z-camz
            mm=pX*dX+pY*dY+pZ*dZ
            if (mm>0) {
                pX/=mm pY/=mm pZ/=mm
                tx=(1+(pX*vX+pY*vY+pZ*vZ)/sqr(asp*tFOV))*200
                ty=(1-(pX*uX+pY*uY+pZ*uZ)/sqr(tFOV))*112     
                draw_systext(tx,ty,max(0,other.val-coins))
            }
        }
    }     
    global.halign=0
    global.valign=0
    global.tscale=1
    
    if (string(lemongrab.compat) == "1.9.1") live="#LIVES: "+string(global.shards+1) else live=""
    draw_systext(8,8,"COINS: "+string(coins)+"#TIMER: "+string(time)+live)
}

if fadeblack col1=$000000 else col1=$ffffff
if (alpha>0) rect(0,0,global.screenwidth,global.screenheight,col1,alpha)
if (alpha2>0) rect(0,0,global.screenwidth,global.screenheight,0,alpha2)
if (result) event_user(14)
if (alpha3>0) rect(0,0,global.screenwidth,global.screenheight,$ffffff,alpha3)

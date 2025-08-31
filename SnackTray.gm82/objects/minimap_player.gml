#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//It's kinda funny how This thing does acuallly run teh start define in charm, I wonder if someone will use that. Maybe for stuff like maxe or energy, who knows.
sprite_index=mask_index
xsc=1
ysc=1
hsp=0
vsp=0
global.respawn=0

grav = 0

name=""

time=-1
mem=0
carryid=noone
jump=0
super=0
dy=0
dix=0
jumpspd=0.5
ready=-1
weight=1
timeend=0
follow=id
last=id

reset_invincible()
is_intangible=1
is_coinexplosive=0
power_lv=0
global.finishmusic=0
hurt=0
dead=0
fall=0
flash=0
piped=0

water=0
frame=0
frspd=0
super=0

ending=""

expulsionbias=0
respawncamslide=0

safex=x
safey=y

camx=0
camy=0
ycam=0
camspd=4
looky=0
lookgy=0

mask_w=12
mask_h=12

size=0
energy=0
memsize=-1
sprite=""
oldspr=""
fallspr=""
shadow=0
alpha=1
sprite_angle=0
bumperpower=3
bumpercollision=1

input_clear()

if global.usecustomspawn{
    y=global.wmap_spawny
    x=global.wmap_spawnx
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if starting exit
input_get(global.input[p2])

input_keystates()
if !piped{
    nomovex=0
    nomovey=0
    v=down-up
    h=right-left
    if bkey spd=2 else spd=1
    if collision(h*spd,0){spd=1 if collision(h*spd,0) nomovex=1 }
    if collision(0,v*spd){spd=1 if collision(0,v*spd) nomovey=1 }
    if !nomovex
    x+=h*spd
    if !nomovey
    y+=v*spd

    if abut{

        with worldmap_tiled1 {memy=y y-=verybignumber}
         with worldmap_tiled2 {memy=y y-=verybignumber}
        with instance_nearest(x,y,worldmap_tile){
            if abs((other.x)-x)<16
            if abs((other.y)-y)<16
            event_user(1)

        }
        with worldmap_tiled1 y=memy
        with worldmap_tiled2 y=memy


    }
}
com_warping()
com_finishmove()
com_actions()
com_endactions()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if starting dy=1
else if right && !left dy=4
else if left && !right dy=6
else if up&&!down dy=5
else if down&&!up dy=3
else if waiting dy=2
else {dy=0}
if dy!=0 && dy!=2 {waiting=0 wait_timer=0} else {wait_timer+=1 if wait_timer>=240 waiting=1}

if starting{
    frame+=0.1
    if frame>3 frame=3
}else if waiting {
    if wait_timer>360 {frame=3  if wait_timer=420 wait_timer=280}
    else if wait_timer>280{ frame=1+ wait_timer mod 2  }
    else frame=0

} else{
    framesub+=1+(spd*dy!=0)
    if framesub>=30{
    frame+=1
    framesub=0
    }
    if frame=4 frame=0

}


if sprite_exists(sheet)
draw_sprite_part(sheet,0,10+floor(frame)*28,29+dy*32+size*224,27,31,floor(x-10),floor(y-24))
else draw_sprite_part(sheets[size],0,78,10,18,18,floor(x),floor(y))
if global.debug draw_self()

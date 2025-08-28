#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=5
xsc=1
ysc=1
image_xscale=4
image_yscale=2
grav = 0
gravity = 0

phase=-1
phasec=0

frspd=1

jumpspd=-0.17*sqrt(80/0.17)
ky=y

depth = 1000001

enemy2=1
sprite="chopper"

getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!jum) {
    gravity=0.085

    vspeed=jumpspd
    jum=1
    thingy=0
    if (inview()) && !position_meeting(x,y,waterblock) && !thingy2{
        if (lavamode) water_splash(0)
        thingy2=1
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>ky) {vspeed=0 y=ky gravity=0 jum=0 thingy2=0 alarm[0]=5}

if position_meeting(x,y,waterblock) && !thingy && vspeed>0
{
if (lavamode) water_splash(1)
thingy=1
}

vspeed=min(4,vspeed)

if (phase) {if (!place_meeting(x,y,phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.id=phase) exit

if (other.star){
    sound("enemykill")
    coll=other.id
    doscore_p(200)
    instance_create(x,y,smoke)
    instance_destroy()
}

with (other) {
    if (spinjump && vsp>0) {
        vsp=-3-ckey*1.5
        instance_create(x,y+14,kickpart)
        playsfx(name+"spinbounce")
        other.phase=id
        exit
    } else {
        if (flash || hurt || piped || invincible()) exit
    }
}

//if (other.power_lv<2) && !(other.jump) && !(other.ball) with (other) hurtplayer("enemy")
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

do {y+=16} until (position_meeting(x,y-32,waterblock) || y>region.ky)

if (y<=region.ky) lavamode=1
ky=y

jumpspd=-0.17*sqrt((y-ystart)/0.17)

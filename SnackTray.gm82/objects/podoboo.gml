#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=rchoose(192,256,320)
xsc=1
ysc=1
image_xscale=4
image_yscale=2

phase=-1
phasec=0

frspd=1

jumpspd=-0.17*sqrt(80/0.17)
ky=y

depth = 1000001
sprite="lavabubble"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible) {
    gravity=0.085

    vspeed=jumpspd
    visible=1
    if (inview()) {
        if (lavamode) lava_splash(0)
    }
    alarm[0]=rchoose(192,256,320)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>ky) {vspeed=0 y=ky gravity=0 visible=0 if (lavamode) lava_splash(1)}
vspeed=min(4,vspeed)

if (vspeed>0) sprite="lavabubbledown"
else sprite="lavabubble"

animated=0







if (phase) {if (!place_meeting(x,y,phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.id=phase) exit

if (other.star) {
    sound("enemykick")
    coll=other.id
    doscore_p(8000)
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

if (other.power_lv<2) with (other) hurtplayer("fire")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

do {y+=16} until (position_meeting(x,y,lavablock) || y>region.ky)

if (y<=region.ky) lavamode=1
ky=y

jumpspd=-0.17*sqrt((y-ystart)/0.17)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}

ssw_enemy(sprite)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=1
ysc=1

xoff=9
yoff=17

phase=-1
phasec=0

active=1
frspd=1
enemy2=1
ky=y
type=""
damage_player_on_contact=1

depth=1000001

sprite="urchin"
alarm[1]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stop=0
movdir=-movdir;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !real(flip)
movdir = 1;
else
movdir = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch (real(type)) {
    case 0: {
        if !place_meeting(x+1*movdir,y,collider) {
            x+=(1/(1+underwater()))*movdir

            stop=0
        }
        else  {
            if !(stop) {
                stop=1;
                alarm[0]=60;
            }
        }
    } break
    case 1: {
        if !place_meeting(x,y+1*movdir,collider) {
            y+=(1/(1+underwater()))*movdir

            stop=0
        }
        else  {
            if !(stop) {
                stop=1;
                alarm[0]=60;
            }
        }
    } break
    case 2: {
        if !place_meeting(1*wave_val(xstart+64,xstart-64,4*(1+underwater()), real(wave_offset)), y, collider) {
            x=wave_val(xstart+64,xstart-64,4*(1+underwater()), real(wave_offset))
        }
    } break
    case 3: {
        if !place_meeting(x, 1*wave_val(ystart+64,ystart-64,4*(1+underwater()), real(wave_offset)), collider) {
            y=wave_val(ystart+64,ystart-64,4*(1+underwater()), real(wave_offset))
        }
    } break



}


enemy2=1
enemy_spritechange()
enemy_animate()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.id=phase) exit

/*if (other.star) {
    sound("enemykick")
    coll=other.id
    doscore_p(200)
    instance_create(x,y,smoke)
    instance_destroy()
}*/

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

if (other.power_lv<2) with (other) hurtplayer("enemy")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

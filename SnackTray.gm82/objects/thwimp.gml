#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
phase=-1
phasec=0
wakehit=0
grav=0.25
xsc=1
ysc=1
hp=0
carry=0
turncount=0
trap=noone
redturn=0

jumptimer=60
jumpdir=1

enemy2=1
sprite="thwimp"
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(powner) powner.items-=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if collision(0,1)
jumptimer=approach_val(jumptimer,0,1)
else
jumptimer=60

if !(jumptimer) {
    hspeed=1.75*startdir
    vspeed=-6

    jumptimer=60
    startdir=-startdir
    xsc=-xsc
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///common enemy passive

animated=0
if object_index=lakitu exit
if (!inview()) active=0
else {
    if (wait) {
        //limit activation chains to 4 enemies
        test=wait
        repeat (3) {test=test.wait if (test=noone) break}
        if (wait.active || test!=noone) {wait=noone active=1}
    } else active=1
}

if (!active) {x-=hspeed y-=vspeed vspeed-=gravity np=nearestplayer() if (np) hspeed=abs(hspeed)*esign(np.x-x,sign(hspeed)) exit}

if (pitdeath()) {if (object_index=shell || object_index=bombshell) owner.enemyc+=1 instance_destroy()}
if (object_index!=bulletbill && object_index!=cheepfly) if (place_meeting(x,y+4,lavablock)) {instance_create(x,y,smoke) sound("enemykick") instance_destroy()}

if (phase) {if (!place_meeting(x,y,phase) || invincible(phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}

if (lock) {x-=hspeed y-=vspeed}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
if (active && !carry && !throwncolls) {
    if (wakehit) {wakehit-=1 if (wakehit=0) with (hitplayer) hurtplayer("enemy")}
    //if hsp!=0|| hspeed!=0 player_magnetslope()
    x+=hsp
    hsp=max(0,abs(hsp)-0.0625)*sign(hsp)
    calcmoving()
    if (vspeed<0) {
        coll=collision(0,vspeed)
        if (coll) {
            y=coll.bbox_bottom+(y-bbox_top)+1
            vspeed=1
        } else vspeed+=grav
    } else {
        //yground=easyground()
        if (collision(0,esign(vspeed,1))) {

            if !grounded{
                s=esign(vspeed,1)
                y+=vspeed
                while (collision(0,0)) {
                    y-=s
                }

                vspeed=0

                belt=collision(0,1)
                if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
                    x=x+belt.beltspd;

                if (hsp!=0) vspeed=-abs(hsp)
            }
            grounded=1
            hspeed=0
        } else if !collision(hspeed,1){
            grounded=0
            vspeed=min(3,vspeed+grav)
        }
    }
    turnaround()
    player_climbstep(coll,hspeed)
    if (turncount) turncount-=1
    else {
        oxsc=xsc
        if (!revive) if hspeed!=0 xsc=-esign(hspeed,-1)
        if (xsc!=oxsc) turncount=10
    }
}
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
    doscore_p(1000)
    kill_enemy(self.id,"kill")
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

if (other.power_lv<2) with (other) hurtplayer("spike")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
startdir=unreal(startdir,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy("thwimp")

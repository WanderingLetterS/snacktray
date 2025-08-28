#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if object_index=lakitu exit
x+=1
getregion(x)
phase=-1
phasec=0
wakehit=0
grav=0.25
xsc=-1
ysc=1
hp=0
carry=0
turncount=0
trap=noone
redturn=0
active=0
elspeed=0

if (object_index!=piranha) {
    wait=instance_position(x+24,y,enemy)
    if (wait) if (wait.object_index=piranha) wait=noone
}

initialy = y
initialx = x
active = false


enemy2=1
sprite="thwomp"
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
//"thwomp,thwompangry,thwompdown,thwompangryside,thwompside,"

//this variable will postpone all thwomp actions if set to any value above 0
if (delay<=0) {

sprite="thwomp"

switch sidethwomp{ //A bit weird to start caring about optimizing right now, but I'll do it anyway

    case "0":
    
    
    //I would've named it GOINNNUUUUUUUUUUUUUP but I decided to make it make sense intead of just be a meme

        xsc=1

        if (abs(nearestplayer().x-x)<32)
        {
            if !activeshake && thwomp_GOINNNDOWNNN=false activation_timer_thwomp=2

        }
        else
        {
        if (abs(nearestplayer().x-x)<30) && y=initialy
        sprite="thwompangry"
        }
    if notready {
    y = approach_val(y,initialy, 1)

    if y=initialy notready=0

    }
    else if activation_timer_thwomp>0 {
        sprite="thwompdown"
        activation_timer_thwomp-=1
        image_angle=random(10)-5
        if activation_timer_thwomp<=1{
        thwomp_GOINNNDOWNNN=true
        activation_timer_thwomp=0
        }
    }
    else if thwomp_GOINNNDOWNNN == true
    {
    image_angle=0
        sprite="thwompdown"
    if elspeed!=4
    elspeed+=0.2
        if !place_meeting(x,y+1,collider) && !place_meeting(x,y+1,x1F0)
        {
            y = approach_val(y,y+4, elspeed)
        }else {
        sound("enemythwomp")
        screenshake(x,4)
        thwomp_GOINNNDOWNNN=false notready=1
        shoot(x,y+16,smoke,3,-0.1)
        shoot(x,y+16,smoke,-3,-0.1)
        elspeed=0
        delay=60
        }

    }
    else if thwomp_GOINNNDOWNNN == false
    {
        y = approach_val(y,initialy, 1)
        sprite="thwomp"
    }
    break;

    case "2":sidethwompint=2 //goes to the right
    case "1"://This is the sideways thwomp (1 is for left)
       if sidethwompint=2
       sidegoing=1 else sidegoing=-1
        xsc=sidegoing

        if (abs(nearestplayer().y-y)<16)
        {
            if !activeshake && thwomp_GOINNNDOWNNN=false activation_timer_thwomp=2

        }
        else
        {
        if (abs(nearestplayer().y-y)<30)
        sprite="thwompangryside"
        }
    if notready {
    x = approach_val(x,initialx, 1)

    if x=initialx notready=0

    }
    else if activation_timer_thwomp>0 {
        sprite="thwompside"
        activation_timer_thwomp-=1
        image_angle=random(10)-5
        if activation_timer_thwomp<=1{
        thwomp_GOINNNDOWNNN=true
        activation_timer_thwomp=0
        }
    }
    else if thwomp_GOINNNDOWNNN == true
    {
    image_angle=0
        sprite="thwompside"
    if elspeed!=4
    elspeed+=0.2
        if !place_meeting(x+1*sidegoing,y,collider)
        {
            x = approach_val(x,x+4*sidegoing, elspeed)
        }else {
        sound("enemythwomp")
        thwomp_GOINNNDOWNNN=false notready=1
        shoot(x+16*sidegoing,y,smoke,-0.1*sidegoing,3)
        shoot(x+16*sidegoing,y,smoke,-0.1*sidegoing,-3)
        elspeed=0
        delay=60
        }
    }
    else if thwomp_GOINNNDOWNNN == false
    {
        x = approach_val(x,initialx, 1)
        sprite="thwomp"
    }
}
} else {delay-=1}
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

alarm[0]=2+(x mod 110)
xsc=1

up=0

loose=0
stop=0
watermode=0
waterlevel=32
red=0

sprite="piranha"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!loose) {
    with (player) if (name="kid") x-=verybignumber
    if (abs(x-instance_nearest(x,y,player).x)<32-red*24) alarm[0]=2
    else {
        open=1
        active=1
        alarm[1]=104
    }
    with (player) if (name="kid") x+=verybignumber
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!loose) {
    open=0
    alarm[0]=112
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animated=0
if (loose) if (!inview() || pitdeath()) instance_destroy()
if (phase) {if (!instance_place(x,y,phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (loose) {
    open=1
    active=1
    depth=2
    mask_index=spr_itemmask

    if (underwater()) vspeed=max(-1,vspeed-0.075)
    else {
        if (!carry && !stop) {
            vspeed=min(3,vspeed+0.15)
            if (collision(0,vspeed)) {if (vspeed>0) {speed=0 stop=1} else vspeed=abs(vspeed)}
            if (collision(hspeed,0)) {x-=hspeed hspeed*=-1}
        }
        if (stop) {
            player_nslopforce()
            if (coll) {vspeed=0}
            else vspeed=min(3,vspeed+0.15)
        }
        mask_index=spr_piranhamask
        calcmoving()
    }
    if (pitdeath()) instance_destroy()
} else {
    if (up) {
        if (open) y=min(ystart-1,y+0.5)
        else {y=max(ystart-24,y-0.5) if (y<ystart-20) active=0}
    } else {
        if (open) y=max(ystart+1,y-0.5)
        else {y=min(ystart+24,y+0.5) if (y>ystart+20) active=0}
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
carry=0
owner.carry=0
owner.carryid=noone
phase=owner

if (sign(owner.hsp)=owner.xsc) hspeed=owner.hsp*0.5+2*owner.xsc
else hspeed=2*owner.xsc
if (!owner.jump && owner.hsp=0) vspeed=1
else vspeed=-1
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
if (region.typebg="water") watermode=1
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (position_meeting(x,y-16,ground)) {up=1 y-=24 ysc=-1 image_yscale=-1}
else {
    if (!position_meeting(x,y+16,pipeblock) && !position_meeting(x+8,y+16,pipeblock)) loose=1
    else y+=24
}

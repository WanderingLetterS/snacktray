#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vsp=0
mycoll=instance_create(x,y,moving)
mycoll.mask_index=spr_16
mycoll.owner=id
phase=0
carryid=noone
getregion(x)
content=""
destroyonhit=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (phaser) y=-verybignumber
if (go=1) {if (position_meeting(x+8,y+24,collider)) go=-1}
else {if (position_meeting(x+8,y-8,collider)) go=1}
with (phaser) y=ystart

var iid;
iid=noone
if owner==noone ||!owner
if global.mplay<=1 owner=gamemanager.players[0]


com_itemboxitemspawn(owner,false,-1,content,1)

picked=0

event_user(3)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inview()) {alarm[2]=60 exit}

if (settings("randblock")) content=randomitem()

hit=0
mush=0
sound("itemrespawn")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var kek,yes,coll,dir,ohsp;
time=max(0,time-1)

if (carry) {
    mycoll.y=-verybignumber

    exit;
}else

{
    dir=sign(hsp)
    var watr, lava;

    watr=instance_place(x,y,waterblock)
    if (underwater()) {vsp=max(-1,vsp-0.2) if (watr) {y=max(watr.bbox_top+4,y)} else if y>=region.water {y=max(region.water+4,y)}}
    if (place_meeting(x,y,lavablock)) {vsp=max(1,vsp-0.04)}
    else vsp+=0.15

    yp=y
    y+=vsp
    x+=hsp
    mycoll.x=x-8
    mycoll.y=-verybignumber

    //cant believe i have to do this
    _Platform = instance_place(x, y + vsp, phaser);
    if (_Platform && bbox_bottom <= _Platform.bbox_top && phaser.dir==0) {
        if (vsp > 0) {
            while (!place_meeting(x, y + sign(vsp), _Platform)) {
               y += sign(vsp);
            }
            vsp = 0;
            if (vsp<-1) {
                with (instance_create(x-8,y+4,smoke)) {friction=0.01 hspeed=-2 vspeed=-1}
                with (instance_create(x+8,y+4,smoke)) {friction=0.01 hspeed=2 vspeed=-1}
                with (instance_place(x,y-8,hittable)) {notplayer=1
                    go=-1 insted=1 stonebump=1 event_user(0) stonebump=0 insted=0
                }
            }
            carry=0
        }
    }

    if (vsp<0) {
        coll=instance_place(x,y+vsp-1,collider)
        if (coll && y>coll.y && !(coll.object_index=phaser && coll.dir!=2)) {
            y=coll.bbox_bottom+9
            if (vsp<-1) {
                with (instance_create(x-8,y+4,smoke)) {friction=0.01 hspeed=-2 vspeed=-1}
                with (instance_create(x+8,y+4,smoke)) {friction=0.01 hspeed=2 vspeed=-1}
                with (instance_place(x,y-8,hittable)) {notplayer=1
                    go=-1 insted=1 stonebump=1 event_user(0) stonebump=0 insted=0
                }
            }
            vsp=0
            carry=0
        }
    }

    with (stone) mycoll.x-=verybignumber
    yg=easyground()-8
    with (stone) mycoll.x+=verybignumber
    if (y<yg) {
        y-=16
        coll=instance_place(x,y+18,stone)
        if (coll) yg=coll.y-16
        y+=16
    }

    if collision(0,1) {
        hsp=lerp(hsp,0,0.01)
        hspeed=lerp(hspeed,0,0.01)
    }

    if (y>=yg) {
        y=yg
        belt=collision(0,1)
        if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
        x=x+belt.beltspd;

        fhsp=x-xprevious
        pl=instance_place(x,y-1,player)
        if (pl) && !(pl.jump)
        pl.x+=fhsp

        if (vsp>1) {
            with (instance_create(x-8,y+4,smoke)) {friction=0.01 hspeed=-2 vspeed=-1}
            with (instance_create(x+8,y+4,smoke)) {friction=0.01 hspeed=2 vspeed=-1}
            global.coll=nearestplayer()
        }
        vsp=0
        carry=0
        if (!place_meeting(x,y,player)) phase=0

        dy=max(0,abs(dy)-2)*sign(dy)
        kek=999 yes=0
        with (hittable) if (dy!=0) if (instance_place(x,y-4,other.id)) {kek=min(kek,dy) yes=1}
        if (yes) dy=kek
    }
    if (instance_place(x,y+4,enemy))
    if (vsp>0) kill_enemy(instance_place(x,y+4,enemy),"stomp")

    //pushing
    if (hsp=0) {
        image_xscale=1.5
        with (player) if (place_meeting(x,y,other.id) && push=sign(other.x-x)) {
            other.y-=verybignumber
            coll=collision(push,0)
            other.y+=verybignumber
            if (!coll) {
                with (other) {image_xscale=1 coll=place_meeting(x+other.push,y,collider)}
                if (!coll) {other.x+=push if (global.dustframe) instance_create(other.x-4*push,other.y+8,smoke)}
            }
        }
        image_xscale=1
        with (player) if (place_meeting(x,y+4,other.id) && push) {
            with (other) {image_xscale=1 coll=place_meeting(x-other.push,y,collider)}
            if (!coll) {other.x-=push if (global.dustframe) instance_create(other.x+4*push,other.y+8,smoke)}
        }
        if (!phase) {mycoll.vsp=y-yp mycoll.y=y-8}
    }
    else {
        coll=collision(hsp,0)
        if (coll) {
            ohsp=hsp
            hsp=0
            x=floor(x-abs(ohsp)*dir)
            repeat (ceil(abs(ohsp))) {
                x+=dir
                if (collision(0,0)) {
                    x-=dir
                    break
                }
            }
        }
    }
    visible=1
} if (inview()) {visible=1} else visible=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (__gm82core_compiler_exists[event]) {
    code_destroy(event)
    code_destroyed=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (collision(0,0)) x=owner.x

carry=0
owner.carry=0
owner.carryid=noone
phase=owner

kicked=1
time=10

if (sign(owner.hsp)=owner.xsc) spd=max(3,abs(owner.hsp)+1)
else spd=3

vsp=1

if (owner.up) {vsp=-6 spd=abs(owner.hsp*0.75) hspeed=spd*esign(owner.hsp,owner.xsc) stop=1}
else if (owner.down) {stop=1 vsp=owner.vsp+2.25 x+=2*owner.xsc spd=abs(owner.hsp)+0.1 hspeed=spd*owner.xsc}
else {hspeed=spd*owner.xsc vsp=-1}

if collision(0,0) {x=owner.x y=owner.y}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=owner.carryoffx*owner.xsc
y+=owner.carryoffy
ssw_objects("iceblock")
x-=owner.carryoffx*owner.xsc
y-=owner.carryoffy
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!carry) ssw_objects("iceblock")

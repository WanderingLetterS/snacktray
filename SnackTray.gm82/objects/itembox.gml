#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
sprite="box"
mush=0
untouched=1
content=""
offset=0
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

nevermush=0
if other.mushroom_unsupported {nevermush=1 mush=0}


if (content="thunderitem" || (content="item" && alwaysthunder )) {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else {
        if other.tflower_unsupported {
            if other.fflower_unsupported{
                if nevermush{
                    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
                } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
            } else with (instance_create(x+8+offset,y+8+4*go,flower)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        }else  with (instance_create(x+8+offset,y+8+4*go,tflower)) {iid=id vspeed=0.25*other.go alarm[0]=48}
    }
}
if (content="wateritem" || (content="itemfeather" && alwayswater )) {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else{
        if other.wflower_unsupported {
            if other.feather_unsupported{
                if nevermush{
                    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
                } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
            } else with (instance_create(x+8+offset,y+8+4*go,feather)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        }else  {with (instance_create(x+8+offset,y+8+4*go,wflower)) {iid=id vspeed=1*other.go alarm[0]=1}}
    }
}

if (content="iceitem" || (content="item" && alwaysice )) {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else {
        if other.iflower_unsupported {
            if other.fflower_unsupported{
                if nevermush{
                    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
                } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
            } else with (instance_create(x+8+offset,y+8+4*go,flower)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        }else  {with (instance_create(x+8+offset,y+8+4*go,iflower)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    }
}
if (content="cloveritem" || (content="itemfeather" && alwaysclover )) {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else {
        if other.cflower_unsupported {
            if other.feather_unsupported{
                if nevermush{
                    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
                } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
            } else with (instance_create(x+8+offset,y+8+4*go,feather)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        }else  {with (instance_create(x+8+offset,y+8+4*go,cflower)) {iid=id vspeed=1*other.go alarm[0]=1}}
    }

}



if (content="item") {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else {
        if other.fflower_unsupported{
            if nevermush{
                with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
            } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        } else with (instance_create(x+8+offset,y+8+4*go,flower)) {iid=id vspeed=0.25*other.go alarm[0]=48}


    }
}
if (content="itemfeather") {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else {
        if other.feather_unsupported{
            if nevermush{
                with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
            } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        } else with (instance_create(x+8+offset,y+8+4*go,feather)) {iid=id vspeed=0.25*other.go alarm[0]=48}
    }
}
if (content="questionmush") {
    if (mush) {with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}}
    else if !other.questionmush_supported {
            if other.fflower_unsupported{
                if nevermush{
                    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
                } else with (instance_create(x+8+offset,y+8+4*go,mushroom)) {iid=id vspeed=0.25*other.go alarm[0]=48}
            } else with (instance_create(x+8+offset,y+8+4*go,flower)) {iid=id vspeed=0.25*other.go alarm[0]=48}
        }else  {with (instance_create(x+8+offset,y+8+4*go,questionmush)) {iid=id vspeed=1*other.go alarm[0]=1}}


}



if (content="mini") {
    with (instance_create(x+8+offset,y+8+4*go,mushmini)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="shard") {
    with (instance_create(x+8+offset,y+8+4*go,starshard)) vspeed=3.5*other.go
}
if (content="shield") {
    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
}
if (content="life") {
    with (instance_create(x+8+offset,y+8+4*go,lifemush)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="key") {
    with (instance_create(x+8+offset,y+8+4*go,keyitem)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="spring") {
    with (instance_create(x+offset,y+4*go,spring)) {
        vspeed=0.25*other.go
        bbb=1
        if (!other.go) aaa=1
        c=0
        alarm[0]=48
        owner=other.owner
    }
}
if (content="spreng") {
    with (instance_create(x+offset,y+4*go,spreng)) {
        vspeed=0.25*other.go
        c=0
        alarm[0]=48
        owner=other.owner
    }
}
if (content="poison") {
    with (instance_create(x+8+offset,y+8+4*go,mushpoison)) {iid=id vspeed=0.25*other.go alarm[0]=48 owner=other.owner}
}
if (content="vine") {
    with (instance_create(x+offset,y+4*go,sprong)) {
        vspeed=0.25*other.go alarm[0]=48
        target=other.target
        bbb=1
        if (!other.go) aaa=1
        c=0
    }
}
if (content="star") {
    with (instance_create(x+8+offset,y+8+4*go,starman)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}

if (content="pswitch") {
    with (instance_create(x+8+offset,y+8+4*go,pswitch)) {
        vspeed=0.25*other.go
        c=0
        alarm[0]=48
        iid=id
    }
}

if (picked && iid) {
    i=instance_create(x+8+offset,y+8,gravitymanager)
    i.vsp=go*4-1
    i.carry=iid
    i.phase=4
    i.drop=1
    iid.c=0
    iid.drop=0
    iid.speed=0
    iid.aaa=0
    iid.bbb=0
    iid.alarm[0]=-1
}

picked=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
done=1
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
event_inherited()
if object_index==bigitembox offset=16

if (!lock && !hit && (content="item" || content="poison" || content="itemfeather" || content="mini")) with (player) if (!dead && !piped && name="kid") with (other)
if (sign((other.x+other.hsp*abs(other.y-y)/6)-(x+8))!=sign(other.x-(x+8))) if (!collision_line(x+8,y+8,x+8,other.y,collider,0,1)) {
    owner=other.id
    picked=2
    untouched=0
    if ((content="item" || content="itemfeather" || content="mini") && global.mplay>1) alarm[1]=400
    go=esign(other.y-y,1)
    owner.blockc+=1
    hit=1
    upwardthrust()
    sprite="box"
    if (object_index == bigitembox) {
        with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2 fresh=1}
        with (instance_create(x+8+(offset*2),y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2 fresh=1}
        global.scor[owner.p2]+=200
        global.coins[owner.p2]+=2
        owner.coint+=2
        sprite="bigbox"
    }
    sound("itemappear")

    mush=!((x div 16) mod 2)
    alarm[0]=2

    tpos=1
    spendblock()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lock) exit

if (global.coll=noone) owner=instance_nearest(x,y,player)
else owner=global.coll
owner.typeblockhit=1
owner.blockcoll=id

with (owner){
charm_run("hitblocks")}
seeit=1
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (turing) event_user(4)
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bricked=funnytruefalse(bricked)
if (bricked) {
    sprite="brick"
    if (skindat("brickvar")) frame=rchoose(0,1,2,3)
    else anim=!skindat("bricd")
}

respawning=(content="item" && global.mplay>1)

if (settings("randblock") && string(target)="0") {
    content=randomitem()
    if (global.mplay>1) respawning=1
}

if ((content="life" || content="shard") && spentblock()) content=""

cc=16
if (content="") {
    content="coins"
    cc=1
}

if (content="none") {
    hit=1
}

if (funnytruefalse(invisible) && content!="bros") {
    instance_change(invisibox,0)
}

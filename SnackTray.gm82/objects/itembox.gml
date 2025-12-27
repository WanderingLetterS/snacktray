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

com_itemboxitemspawn(owner,mush,go,content,picked)

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

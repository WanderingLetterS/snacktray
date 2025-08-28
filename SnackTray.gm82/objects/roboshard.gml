#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
alarm[0]=256
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview()) instance_destroy()

global.coll=owner
with (invisibox) if (!hit) if (place_meeting(xstart,y,other.id)) {
    x=xstart untouched=0
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.id=owner || other.flash || other.hurt || other.piped || owner.flash || flag.passed[owner.p2] || flag.passed[othr.p2]) exit

if (other.power_lv<3) {
    instance_create(mean(x,other.x),mean(y,other.y),kickpart)
    with (other) fragplayer(other.owner)
}
#define Collision_spreng
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x-=hspeed
hspeed*=-1
xsc*=-1
sound("itemspring") other.shot=12
#define Collision_ground
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
instance_create(x,y,smoke)
#define Collision_hittable
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hitblock(other.id,owner,1,esign(vspeed,-1),0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("roboshard")

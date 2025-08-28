#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=-0.5
enemy2=1
xsc=1
redturn=1
revive=0
novanish=0
sprite="drybones"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if novanish instance_destroy()

if (revive) {
    sub="res"
    hspeed=0
    revive-=1
    if (!revive) {sprite="drybones" hspeed=0.5*-xsc}
}
else sub="bones"

if (hp<=-2) {
    sound("enemystomp")
    with (instance_create(x,y,drydead)) {xsc=other.xsc if other.vspeed!=0 {drop=1 vspeed=other.vspeed} powner=other.powner}
    if (powner) powner.items+=1
    novanish=1
}
else novanish=0
sprite="dry"+sub

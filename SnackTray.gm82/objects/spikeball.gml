#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=1
image_yscale=1

gravity=0.2
vspeed=-2

owner=noone

type=0

//sound("enemyhammerthrow")
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 i=instance_create(x+4,y+12,spikeballpart) i.hspeed=-1 i.vspeed=-1+2*go  i.ps=0 i.ps2=1
 i=instance_create(x+12,y+12,spikeballpart) i.hspeed=1 i.vspeed=-1+2*go  i.ps=1 i.ps2=1
 i=instance_create(x+4,y+4,spikeballpart) i.hspeed=-1 i.vspeed=-3+2*go i.ps=0 i.ps2=0
 i=instance_create(x+12,y+4,spikeballpart) i.hspeed=1 i.vspeed=-3+2*go i.ps=1 i.ps2=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
hspeed=-2*xsc
ready=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (pitdeath()) instance_destroy()

if !hasgrav
{
if vspeed > 0
d=1
if instance_place(x,y+5,owner) && d=1 && !ready
{
y-=1
gravity=0
vspeed=0
}
}

coll=collision(hspeed,-4)
        if (coll) {
            instance_destroy()
        }

pla=nearestplayer()

coll=instance_place(x+hspeed,y,hittable)
if (coll) {
hitblock(coll,pla,1,-1,0)
instance_destroy()
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hasgrav=1
{
    calcmoving()
    vspeed=min(3,vspeed)
    if (vspeed<0) {
        coll=collision(0,vspeed)
        if (coll) {
            y=coll.bbox_bottom+(y-bbox_top)+1
            vspeed=1
        } else vspeed=min(3,vspeed)
    } else {
        yground=easyground()
        if (bbox_bottom>=yground-1 && yground!=verybignumber) {
            vspeed=0
            y=floor(y)
            y=yground-(bbox_bottom-2-y)
        } else vspeed=min(3,vspeed)
    }
}


if (place_meeting(x-2,y+1,nslopl) || place_meeting(x-2,y+1,nslopl2) || place_meeting(x+2,y+1,nslopr) || place_meeting(x+2,y+1,nslopr2))
{
if hasgrav=0
hasgrav=1
}

if hasgrav
{
if place_meeting(x-2,y+1,nslopl2s) && hspeed!=2
hspeed+=0.01

if place_meeting(x+2,y+1,nslopr2s) && hspeed!=-2
hspeed-=0.01

if place_meeting(x-2,y+1,nslopls) && hspeed!=2
hspeed+=0.1

if place_meeting(x+2,y+1,nsloprs) && hspeed!=-2
hspeed-=0.1

if place_meeting(x-2,y+1,nslopl2) && hspeed!=2
hspeed+=0.01

if place_meeting(x+2,y+1,nslopr2) && hspeed!=-2
hspeed-=0.01

if place_meeting(x-2,y+1,nslopl) && hspeed!=2
hspeed+=0.1

if place_meeting(x+2,y+1,nslopr) && hspeed!=-2
hspeed-=0.1
}

if (place_meeting(x-2,y+1,nslopls) && hspeed < 0 || place_meeting(x-2,y+1,nslopl2s) && hspeed < 0 || place_meeting(x+2,y+1,nsloprs) && hspeed > 0 || place_meeting(x+2,y+1,nslopr2s) && hspeed > 0)
{
if hasgrav=0
hasgrav=1
}
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//@todo: refactor

if (owner!=noone && owner!=other && owner.object_index=player) {doscore_e(8000,other.id) with (other) {sound("enemykick") with (instance_create(x,y,genericdead)) {hspeed*=sign(x-other.x) type=2 biome=other.biome} instance_destroy()}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("spikeball")

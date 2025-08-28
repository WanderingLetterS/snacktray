#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=2
restimer=0
on=0
dir=0
shake=0
long="0"
getregion(x)
ky=region.ky+16
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=0
with (player) if (!jump) if (instance_place(x,y+4,other.id) && bbox_bottom<other.bbox_top+1) other.on+=weight

if (restimer) {
    restimer-=1
    if (restimer<=0) {
        y=ystart
        if long="1" instance_create(x+16,y+8,smoke)
        else instance_create(x+8,y+8,smoke)
        vsp=0
    }
}

dx=0
if (on>0 && timer && !fall) {
    timer-=on
    shake=(shake+1) mod 4
    if (shake>2) dx=1
    else dx=-1
    if (!timer) {
        fall=1
        on=0
    }
} else timer=32

if (fall) {
    vsp=min(2,vsp+0.1)
    y-=verybignumber
    coll=instance_place(x,y+verybignumber,collider)
    y+=verybignumber
    if (coll) if (!object_is_ancestor(coll.object_index,moving)) {
        instance_create(x+8,y+8,smoke)
        y+=verybignumber
        restimer=60*6
        fall=0
    }
    if (y>ky) {y+=verybignumber restimer=60*6 fall=0}
}

if long="1"
image_xscale=2

y+=vsp
//ystart=y //what the fuck? why would you do that
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xp=x x+=dx
frame=on>0 || fall
if long="1"
ssw_objects("donutlong")
else
ssw_objects("donut")
x=xp

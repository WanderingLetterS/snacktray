#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fuel=660
getimer=8
grav=0.1
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=1
if (!drop) {
    vspeed=0
    if (hspeed=0) hspeed=1
}
depth=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
getimer-=1

if (c) calcmoving()

if (c && !drop) {
    mask_index=spr_itemmask
    if (vspeed<0) {
        coll=collision(0,vspeed)
        if (coll) {
            y=coll.bbox_bottom+(y-bbox_top)+1
            vspeed=1
        } else vspeed=min(3,vspeed+grav)
    } else {
        if (collision(0,vspeed+1)) && vspeed>=0 {

            vspeed=-2.75

            s=esign(vspeed,1)
            while (collision(0,0)) {
                y-=s
            }

            belt=collision(0,1)
            if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
                x=x+belt.beltspd;
           hspeed=esign(hspeed,!drop)
        } else vspeed=min(3,vspeed+grav)
    }
    if (hspeed!=0) {
        coll=collision(hspeed,0)
        if (coll) hspeed=abs(hspeed)*sign(x-mean(coll.bbox_left,coll.bbox_right))
    }
    mask_index=spr_mask12x12
}
if (drop) {
    hspeed=0
    mask_index=spr_goombamask
    player_nslopforce()
    if (coll) {vspeed=0 hspeed=esign(hspeed,!drop)}
    else vspeed=min(3,vspeed+0.25)
    if (hspeed!=0) {
        coll=collision(hspeed,0)
        if (coll) hspeed=abs(hspeed)*sign(x-mean(coll.bbox_left,coll.bbox_right))
    }
}

if (!inview()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!getimer) if (give_item(other.id,"star")) {hit=1 instance_destroy()}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("star")

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drop=0
getimer=8
p2=-1
getregion(x)
xp=x
yp=y
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=1
if (!drop) {
    hspeed=(vspeed<0)
    vspeed=0
}
depth=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (c) calcmoving()
getimer-=1

if (!inview()) {x=xp y=yp}
else {
    xp=x yp=y
    if (drop) hspeed=0
    if (drop || c) {
        if (collision(0,vspeed+1)) && vspeed>=0 {


            s=esign(vspeed,1)
            y+=vspeed
            while (collision(0,0)) {
                y-=s
            }

            vspeed=0
            belt=collision(0,1)
            if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
                x=x+belt.beltspd;
           hspeed=esign(hspeed,!drop)
        }

        else vspeed=min(3,vspeed+0.25)
        if (hspeed!=0) {
            coll=collision(hspeed,0)
            if (coll && !player_climbstep(coll,hsp)) hspeed=abs(hspeed)*sign(x-mean(coll.bbox_left,coll.bbox_right))
        }
    }
}

if (pitdeath()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!getimer || other.name="kid") {visible=0 if (give_item(other.id,"mini")) instance_destroy() visible=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("mini")

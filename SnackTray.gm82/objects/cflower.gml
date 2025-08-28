#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lok=0
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
if (!drop) vspeed=0
depth=0
y=round(y/8)*8
c=1
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
        mask_index=spr_goombamask
        if (collision(0,vspeed+1)) && vspeed>=0 {

            hspeed=0
            hsp=0

            s=esign(vspeed,1)
            y+=vspeed
            while (collision(0,0)) {
                y-=s
            }

            vspeed=0
            belt=collision(0,1)
            if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
                x=x+belt.beltspd;
        }
        else vspeed=min(3,vspeed+0.25)
        mask_index=spr_mask12x12
    }
}

if (pitdeath()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!getimer || other.name="kid") {visible=0 if (give_item(other.id,"cflower")) instance_destroy() else if (give_item(other.id,"bfeather")) instance_destroy() visible=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("cflower")

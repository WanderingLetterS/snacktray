#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=12
breakflag=1
kek=16
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flag.passed[owner.p2] || flag.passed[other.p2] || owner.flash || other.flash) exit
with (other) if (invincible()) exit
event_inherited()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ff=0
if (owner.jet && !owner.piped) {x=owner.x+owner.xsc image_yscale=kek kek=max(8,kek-1) go=1 y=owner.y+12+kek}
else {
    kek=14
    if (owner.lookup && !owner.piped) {x=owner.x-owner.xsc*5 image_yscale=16 go=-1 y=owner.y-6}
    else y=-1000
}

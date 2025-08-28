#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
phase=0
g=0.15
drop=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(carry)) {instance_destroy() exit}

vsp=min(6,vsp+g)
y+=vsp
carry.y=y
x=carry.x
carry.dy=0

if (phase) phase-=1
else {
    carry.x-=1000
    coll=collision(0,vsp)
    if (coll) {
        if (vsp>0) {
            y=coll.bbox_top-7
            carry.y=y
            carry.c=1
            carry.drop=drop
            instance_destroy()
        }
        vsp=0
    }
    carry.x+=1000
}

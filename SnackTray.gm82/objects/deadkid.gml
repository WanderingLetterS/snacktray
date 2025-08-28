#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0
del=0
a=0

sprite="dead"
frame=0
frspd=0.2
alpha=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<=360;i+=10) if (!irandom(5)) repeat (4-3*(i>180)) {
    splat=skindat("kidsplat"+string(owner.p2)) || del
    o=instance_create(x,y,blood)
    o.direction=i
    o.owner=owner
    o.del=del
    o.splat=splat
    o.a=a
    if (water) {
        o.speed=random(2)
        o.gravity=0
        o.friction=0.01
        o.water=1
    }
}

if (!del) if (c<4) {
    o=instance_create(x,y,kidgib)
    o.type=c
    o.owner=owner
    if (water) {
        o.speed=random(3)
        o.gravity=0.1
        o.friction=0.01
    }

    with (o) {
        if (type=3) {
            w=16 h=16
            u=102 v=182
        } else {
            w=8 h=8
            u=92+9*type v=171
        }
    }
}

spriteswitch(1)

c+=1 if (c=20) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!del) spriteswitch(0)

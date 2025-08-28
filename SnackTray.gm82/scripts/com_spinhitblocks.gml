coll=instance_position(x-10*sign(hsp),y+22,hittable)
coll2=instance_position(x,y+22,hittable)

if (spindash) coll=coll2
else if (coll2) if (coll2.object_index!=brick) coll=coll2
if (coll) if (coll.hit) coll=0
if (coll=spinblacklist) coll=0
if (!coll)
    with (hittable)
        if (id!=other.spinblacklist && (object_index!=brick || other.spindash) && !hit)
            if (instance_place(x,y-4,other.id)) other.coll=id

if (coll) if (!coll.goinup || tempbrick) {
    i=coll.object_index
    hitblock(coll,id,0,1,0)
    if (i=brick) {spinblacklist=coll if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf}}
}

///com_dmgr_dmg_blocks()
coll=instance_place(x,y,collider)
if (coll) {
    if (object_is_ancestor(coll.object_index,hittable)) {
        if (coll.object_index=brick) brickc+=1 else brickc=4
        hitblock(coll,owner,0,esign(coll.y-owner.y),0)
        return 1
    }
}

return 0

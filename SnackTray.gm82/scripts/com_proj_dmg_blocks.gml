///com_proj_dmg_blocks(Destroy on hit.)
//this should make it easier so that in the near future we can do stuff like "this enemy is invincible to projectiles" like a certain beetle of buzzies i remember.

coll=instance_place(x,y,collider)
if (coll) {
    if (object_is_ancestor(coll.object_index,hittable)) {
     if (coll.object_index=brick) brickc+=1 else brickc=4
        hitblock(coll,owner,1,-1,0)

    }
    if (brickc=4) {sound("itemblockbump") instance_create(x,y,kickpart)  if argument[0] instance_destroy() else brickc=0  return 1}
}
return 0

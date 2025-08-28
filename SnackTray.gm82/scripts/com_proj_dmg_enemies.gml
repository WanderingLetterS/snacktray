///com_proj_dmg_enemies(Destroy on hit.)
//this should make it easier so that in the near future we can do stuff like "this enemy is invincible to projectiles" like a certain beetle of buzzies i remember.

coll=instance_place(x,y,enemy)
if (coll) {
    global.coll=owner.id
    enemydie(coll,2)
    if argument[0] instance_destroy()
    return 1
}
coll=instance_place(x,y,bowserboss)
if (coll) {
    if (!coll.flash) {
        coll.hp-=1
        coll.flash=64
        coll.owner=owner
        sound("enemybowserhurt")
        instance_create(x,y,kickpart)
        if argument[0] instance_destroy()
        return 2
    }
}
return 0

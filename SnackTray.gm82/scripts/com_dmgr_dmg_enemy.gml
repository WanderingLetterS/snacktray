///com_dmgr_dmg_enemy(performbounce)
performbounce=argument0
coll=instance_place(x,y,enemy)
if (coll) {
    global.coll=owner.id
    if coll.object_index=lavabubble || coll.object_index=boo {
        if performbounce
        coll.vsp=2
    } else if (coll.object_index!=bombenemy && coll.object_index!=drybones
        && coll.object_index!=boo && coll.object_index!=urchin) {
        enemyexplode(coll,2)

        if performbounce
        owner.vsp=-owner.vsp
        return 1
    }
}
return 0

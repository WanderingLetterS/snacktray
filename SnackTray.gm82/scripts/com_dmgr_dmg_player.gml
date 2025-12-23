///com_dmgr_dmg_player()
if global.gamemode=="coop" ||global.gamemode=="sscreencoop" exit
nah=0
coll=instance_place(x,y,player)
if (coll) {
    with coll {if (is_invincible(other.hittype))||(coll.cpu_partner && coll.cpu_myleader==id) ||(cpu_partner && coll.id==cpu_myleader.id )   other.nah=1}
    if (coll.id!=owner) if !nah if (!invincible(coll)) {
        if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { coll.hittype=hittype
        with (coll) {hurtplayer(hittype) return 1}
    }
    instance_create(x,y,kickpart)
    }
}


return 0

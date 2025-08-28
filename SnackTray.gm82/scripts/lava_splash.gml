if (argument[0]) {
    i=instance_create(x,y-12,splashparticle)
    i.type="lavain"
    i.hspeed=2
    i.side=-1
    i.friction=0.1
    i=instance_create(x,y-12,splashparticle)
    i.type="lavain"
    i.side=1
    i.hspeed=-2
    i.friction=0.1
} else {
    sound("enemyfire")
    i=instance_create(x,y-12,splashparticle)
    i.type="lavaout"
}

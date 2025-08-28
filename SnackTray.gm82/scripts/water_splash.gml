if ((argument[0])>-1) sound("itemsplash") else sound("playerwaterrun")

if (argument[0]) {
    i=instance_create(x,y,splashparticle)
    i.type="waterin"
    i.hspeed=2
    i.side=-1
    i.friction=0.1
    i=instance_create(x,y,splashparticle)
    i.type="waterin"
    i.side=1
    i.hspeed=-2
    i.friction=0.1
} else{
    i=instance_create(x,y,splashparticle)
    i.type="waterout"
}
with splashparticle {if (!no) {no=1 y+=8}}

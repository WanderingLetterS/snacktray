///shoot(x,y,obj,hsp,vsp):inst
//shoot player projectile
var i;

if (argument[2]) {
    i=instance_create(argument[0],argument[1],argument[2])

    if (argument_count>3) {
        i.hspeed=argument[3]
        i.vspeed=argument[4]
    }
    i.xsc=esign(i.hspeed,xsc)
    i.owner=id
    i.orig=id
    i.sheet=sheets[size*!global.singlesheet[p2]]
    return i
} else {
    i=instance_create(argument[0],argument[1],psmoke) //fuck it, psmoke0s the default shoot object now

    if (argument_count>3) {
        i.hspeed=argument[3]
        i.vspeed=argument[4]
    }
    i.xsc=esign(i.hspeed,xsc)
    i.owner=id
    i.orig=id
    i.sheet=sheets[size*!global.singlesheet[p2]]
    return i



}

return noone

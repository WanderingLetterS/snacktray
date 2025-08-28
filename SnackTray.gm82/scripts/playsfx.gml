///playsfx(name,loop,speed)
//plays a player skin sfx
var sfx,vol,inst,name;

name="sfx_"+argument[0]+string(p2)

with (globalmanager) {
    vol=min(1,settings("volbalance"))
    sfx=skindat(name)
    if (sfx) {
    stopsfx(skindat(name+"inst"))
    if (argument[1]) inst=FMODSoundLoop(sfx,0)
    else inst=FMODSoundPlay(sfx,0)
    if (argument_count=3) FMODInstanceSetPitch(inst,argument[2])
    else if (global.vapor) FMODInstanceSetPitch(inst,1)
    skindat(name+"inst",inst)
    return inst
    }
}
return 0

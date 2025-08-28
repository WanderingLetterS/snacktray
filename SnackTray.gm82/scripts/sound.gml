///sound(name,[loop,speed,volume])
//plays a world skin sound effect
var sfx,vol;

with (globalmanager) {
    vol=min(1,settings("volbalance"))
    name="snd_"+argument[0]
    sfx=skindat(name)
    if (sfx) {
        stopsfx(skindat(name+"inst"))
        if (argument_count>1) if (argument[1]) {inst=FMODSoundLoop(sfx,0) skindat(name+"inst",inst) return 1}
        inst=FMODSoundPlay(sfx,0)
        if (argument_count>=3) FMODInstanceSetPitch(inst,argument[2]) else if (global.vapor) FMODInstanceSetPitch(inst,1)
        if (argument_count>=4) FMODInstanceSetVolume(inst,argument[3]*vol)
        skindat(name+"inst",inst)
        return 1
    }
}
return 0

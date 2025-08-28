///mus_play(name,loops)
///mus_play(name,loops,slot)
//plays music using fmod
var strmhandle;

with (globalmanager) {
    if (skindat(argument[0]+"_musfade")) {mus_fade() return 0}

    if (handle!=-1) FMODInstanceStop(handle)
    handle=-1

    if (argument_count=3) strmhandle=skindat(argument[0]+" music"+string(argument[2])) //player skin
    if !strmhandle strmhandle=ds_map_find_value(mushandles,argument[0])

    if (strmhandle) {
        if (argument[1]) handle=FMODSoundLoop(strmhandle,0)
        else handle=FMODSoundPlay(strmhandle,0)
        mus_volume(1)
        if (global.vapor) FMODInstanceSetPitch(handle,1)
        return handle
    }
}
return 0

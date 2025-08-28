///FMODSoundPlay(soundid,paused)
//returns a sound instance on success
var i;

if (global.fuzzy) {
    i=external_call(global.dll_FMODSoundPlay,argument0,argument1)
    FMODInstanceSetPitch(i,random_range(0.7,0.8))
    return i
}

return external_call(global.dll_FMODSoundPlay,argument[0],argument[1])

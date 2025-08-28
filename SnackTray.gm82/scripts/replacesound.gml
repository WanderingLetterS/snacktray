///replacesound(sound,file)
//replace world sound effect and update mappings
var sfx,name;

if (current_time>global.loadtime+64) loadtext()

if (file_exists(filename_change_ext(argument[1],".txt"))) {
    name="snd_"+argument[0]
    sfx=skindat(name)
    if (sfx) {
        stopsfx(skindat(name+"inst"))
        FMODSoundFree(sfx)
    }
    skindat(name,0)
    skindat(name+"_filename","")
} else if (file_exists(argument[1])) {
    name="snd_"+argument[0]
    if (argument[1]=string(skindat(name+"_filename"))) return skindat(name)
    sfx=skindat(name)
    if (sfx) {
        stopsfx(skindat(name+"inst"))
        FMODSoundFree(sfx)
    }
    sfx=FMODSoundAdd(argument[1],0)
    FMODSoundSetGroup(sfx,2)
    skindat(name,sfx)
    skindat(name+"_filename",argument[1])
}

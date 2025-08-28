///replacesfx(slot,sfx,file,nukeprevious)
//replace sfx file and update mappings
var sfx,name,fn;

fn=argument[2]
nukeprevious=argument[3]

if (file_exists(filename_change_ext(argument[2],".txt"))) {
    name="sfx_"+argument[1]+string(argument[0])
    sfx=skindat(name)
    if (sfx) {
        stopsfx(skindat(name+"inst"))
        FMODSoundFree(sfx)
    }
    skindat(name,0)
    skindat(name+"_filename","")
    return 1
} else {
    if (file_exists(filename_change_ext(argument[2],".ogg"))) fn=filename_change_ext(argument[2],".ogg")
    else if (!file_exists(fn) && !nukeprevious) return 0

    name="sfx_"+argument[1]+string(argument[0])
    if (fn=string(skindat(name+"_filename"))) return skindat(name)
    sfx=skindat(name)
    if (sfx) {
        stopsfx(skindat(name+"inst"))
        FMODSoundFree(sfx)
    }
    if (!file_exists(fn)) {
        skindat(name,0)
        skindat(name+"_filename","")
        return 0
    }
    sfx=FMODSoundAdd(fn,0)
    FMODSoundSetGroup(sfx,2)
    skindat(name,sfx)
    skindat(name+"_filename",fn)
    return 1
}

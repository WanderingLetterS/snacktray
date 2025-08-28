///replacemusic(name, directory override)
//replaces music for world skins
var fname,find,song,replacesong;

song=string(argument[0])
name=string(argument[1])
replacesong=string(argument[2])
if replacesong == "" || replacesong == "0" replacesong = song
fname=""

if (string(argument[1])!="" && string(argument[1])!="0") {
    f=file_find_first(name+song+"*.*",0) while (song="under" && string_pos("bonus",f)) f=file_find_next()
    while (string_pos("fast",f) && !string_pos("fast",song)) f=file_find_next()
    if (f!="") fname=name+f
    file_find_close()
}
else if (global.musicskin) {
    name=skindir+global.mskins[global.musicskin+1,0]
    f=file_find_first(name+song+"*.*",0) while (song="under" && string_pos("bonus",f)) f=file_find_next()
    while (string_pos("fast",f) && !string_pos("fast",song)) f=file_find_next()
    if (f!="") fname=name+f
    file_find_close()
} else {
    if (global.worldskin2=0) name=global.wbase
    else name=skindir+global.wskins[global.worldskin2+1,0]
    f=file_find_first(name+"music\"+song+"*.*",0) while (song="under" && string_pos("bonus",f)) f=file_find_next()
    while (string_pos("fast",f) && !string_pos("fast",song)) f=file_find_next()
    if (f!="") fname=name+"music\"+f
    file_find_close()
}

if (fname="") return 0
if (fname=string(ds_map_find_value(mushandles,replacesong+"_filename"))) {
    if (string_pos("hurry",fname)) skindat("hurry",1)
    return 1
}

if (filename_ext(fname)=".txt") {
    var file;
    file = file_text_open_read(fname)
    newsong = file_text_read_string(file)
    file_text_close(file)
    if newsong!="" && newsong!=song && replacesong==song { //prevent skins from making giant snake chains or infinite loops
        return replacemusic(newsong,"",song)
    } else {
        find=filename_fixname(fname)
        if (string_pos("death",find)) skindat("death_musfade",1)
        return 0
    }
}

return replaceogg(replacesong,fname)

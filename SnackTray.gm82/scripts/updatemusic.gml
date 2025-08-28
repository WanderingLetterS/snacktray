var find,i;

with (globalmanager) {
    find=""
    if (!global.bundled) {
        if (global.musicskin) find=skindir+global.mskins[global.musicskin+1,0]
        else if (global.worldskin2) find=skindir+global.wskins[global.worldskin2+1,0]
        if (find!="") if (file_exists(find+"music.txt")) {
            replaceinfo(find+"music.txt")
            skindat("hurrytime",median(1,round(unreal(skindat("music hurry timer"),30)),100))
            skindat("deathmusic",funnytruefalse(skindat("music music continues after death")))
            skindat("nofast",!funnytruefalse(skindat("music fast music")))
            skindat("bossmusic",funnytruefalse(skindat("music boss music")))
            skindat("autofast",power(root12of2,median(0,unreal(skindat("music automatic fast music semitones"),0),12)))
        }
    }

    skindat("hurry",0)
    skindat("allmusic",0)
    skindat("allfast",0)
    skindat("death_musfade",0)
    for (i=0;i<=musc;i+=1) {
        if (global.exception = "") { //prevent music from being overwritten with the default while exceptions are active
            replacemusic(mload[i])
        } else {
            replacemusic(mload[i], global.exceptdir)
        }
    }

    if (replacemusic("all")) {
        skindat("allmusic",1)
        if (replacemusic("allfast")) skindat("allfast",1)
    }
}

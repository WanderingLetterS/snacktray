///playfast()
var song,autofast,supermusic,p;

if (skindat("nofast")) {mus_play(global.musicmem) exit}

autofast=skindat("autofast")
supermusic=0 with (player) if (super && playsupermusic) supermusic=1

song=global.musicmem
if (autofast>1) global.music=""

if (skindat("allmusic")) song="all"

songfast=song+"fast"
if (songfast="pipefast") songfast="dayfast"

if (gamemanager.drowning) exit

if (supermusic) {
    if (autofast>1) FMODInstanceSetPitch(globalmanager.handle,autofast)
} else {
    if (songfast!=global.music) {
        global.music=song
        global.musicmem=song
        if (song!="") {
            if (autofast>1) {
                mus_play(song,1)
                FMODInstanceSetPitch(globalmanager.handle,autofast)
                p=skindat("resume"+song)
                if (p!=0) FMODInstanceSetPosition(globalmanager.handle,p)
            } else {
                mus_play(songfast,1)
                p=skindat("resume"+song)
                if (p!=0) FMODInstanceSetPosition(globalmanager.handle,p)
            }
        } else mus_stop()
    } else if (autofast>1) FMODInstanceSetPitch(globalmanager.handle,autofast)
}

///replacehud(dir)
//apply hud skin
/*
var str,fn,f,mode,readc,readb;

fn=argument[0]+"hud.txt"

if (file_exists(fn)) {
    mode=0
    readc=""
    readb=""
    f=file_text_open_read(fn)
    do {
        str=file_text_read_string(f)
        file_text_readln(f)
        if (mode=0) {
            if (string_pos("offset x=",str)) skindat("hudoffx",unreal(string_delete(str,1,string_pos("=",str))))
            if (string_pos("offset y=",str)) skindat("hudoffy",unreal(string_delete(str,1,string_pos("=",str))))
            if (string_pos("classic-----------------------------------------",str)) mode=1
            if (string_pos("battle--------------------------",str)) mode=2
        } else if (mode=1) {
            if (string_pos("------------------------------------------------",str)) mode=0
            else readc+=str+"#"
        } else if (mode=2) {
            if (string_pos("--------------------------------",str)) mode=0
            else readb+=str+"#"
        }
    } until (file_text_eof(f))
    file_text_close(f)

    readc=locatehudlet(readc,"hud classic player","%ppppppp")
    readc=locatehudlet(readc,"hud classic score","%sssss")
    readc=locatehudlet(readc,"hud classic energyh","%>")
    readc=locatehudlet(readc,"hud classic energyv","%v")
    readc=locatehudlet(readc,"hud classic world","%-w")
    readc=locatehudlet(readc,"hud classic time","%tt")
    readc=locatehudlet(readc,"hud classic times","%:tt")
    readc=locatehudlet(readc,"hud classic coins","%c")
    readc=locatehudlet(readc,"hud classic lives","%l")
    readc=locatehudlet(readc,"hud classic emblem","%e")
    skinstr("hud classic text",readc)

    readb=locatehudlet(readb,"hud battle player","%ppppppp")
    readb=locatehudlet(readb,"hud battle score","%sssss")
    readb=locatehudlet(readb,"hud battle energyh","%>")
    readb=locatehudlet(readb,"hud battle energyv","%v")
    readb=locatehudlet(readb,"hud battle stages","%s/ss")
    readb=locatehudlet(readb,"hud battle world","%-w")
    readb=locatehudlet(readb,"hud battle time","%tt")
    readb=locatehudlet(readb,"hud battle times","%:tt")
    readb=locatehudlet(readb,"hud battle coins","%c")
    readb=locatehudlet(readb,"hud battle frags","%f")
    readb=locatehudlet(readb,"hud battle emblem","%e")
    skinstr("hud battle text",readb)

    return 1
} return 0

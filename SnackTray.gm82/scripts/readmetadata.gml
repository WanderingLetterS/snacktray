///readmetadata()
//reads a metadata block for information update between stages
if (global.playback) {
    do {read=readbyte(global.keylog) read2=readbyte(global.keylog) global.pos+=1} until ((read=$ff && read2=$ff) || global.pos>=global.length)

    show_debug_message("readmetadata: read reads "+string(read))
    show_debug_message("readmetadata: read2 read2s "+string(read2))
    if (global.pos>=global.length) {
        if (!global.movieskipping) moviecorrupt()
        else discardmovie()
        room_goto_safe(replays)
        return 0
    }
    global.movieskipping=0

    str=readstring(global.keylog)

    m=ds_map_create()
    if (!ds_map_read_safe(m,string_replace(string_replace(str,"|/meta|",""),"|meta|",""))) {moviecorrupt() room_goto_safe(replays) return 0}

    for (i=0;i<global.mplay;i+=1) {
        global.points[i]=ds_map_find_value(m,"p"+string(i))
        global.size[i]=ds_map_find_value(m,"i"+string(i))
        global.energy[i]=ds_map_find_value(m,"e"+string(i))
        global.shielded[i]=ds_map_find_value(m,"s"+string(i))
        global.pthist[global.stagecount,i]=global.points[i]
        META_TYPE=1
        entrypoint="meta"
        string_execute(global.charcode[global.option[i]])
    }
    global.rand=ds_map_find_value(m,"rn")
    show_debug_message("readmetadata: global.rand is set to "+string(global.rand))
    global.lifes=ds_map_find_value(m,"vd")
    global.nextlevel=ds_map_find_value(m,"go")
    show_debug_message("readmetadata: global.nextlevel is set to "+string(global.nextlevel))
    global.visualstagecount=ds_map_find_value(m,"sc")
    global.check=ds_map_find_value(m,"ck")
    global.tokens=ds_map_find_value(m,"tk")
    ds_map_read_safe(global.spendblocks,string_replace(string_replace(ds_map_find_value(m,"sb"),"|/blok|",""),"|blok|",""))
    ds_map_read_safe(global.tokenspend,string_replace(string_replace(ds_map_find_value(m,"st"),"|/tokn|",""),"|tokn|",""))

    ds_map_destroy(m)
}
return 1

///setlang()
//apply a language change based on settings

var fn,f,str,p,langf;

langf=settings("language")

ds_map_clear(global.strmap)
global.yeat=0
langdefault()

if (langf!="") {
    fn="mods\language\"+string(langf)
    if (file_exists(fn)) {
        for (f=file_text_open_read(fn);!file_text_eof(f);str=file_text_read_string(f)) {
            file_text_readln(f)
            p=string_pos("=",str)
            if (p) ds_map_replace(global.strmap,string_copy(str,1,p-1),string_delete(str,1,p))
        } file_text_close(f)

        //sprite font
        f=filename_change_ext(fn,".png")
        if (file_exists(f)) {
            if (global.sysfont!=-1 && global.sysfont!=spr_sysfont) sprite_delete(global.sysfont)
            global.sysfont=sprite_add(f,1,1,0,0,0)
        } else {
            if (global.sysfont!=-1 && global.sysfont!=0 && global.sysfont!=spr_sysfont) sprite_delete(global.sysfont)
            global.sysfont=spr_sysfont
        }
    } else {
        settings("language","")
    }
}
global.fontmap=global.fontmapbase+lang("charmap")

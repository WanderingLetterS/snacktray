var fn,f;

directory_create(global.workdir+"Mods\language")
fn="Mods\language\example.txt"

s=sureface("",144,144)
if (!sureface_set_target("")) exit

draw_clear_alpha($ff00ff,1)
draw_sprite(spr_sysfont,0,0,0)
surface_reset_target()
surface_save(s,"Mods\language\example.png")
sureface_free("")

if (file_exists(fn)) file_delete(fn)

//write utf8 BOM and header
clearbuffer()
writebyte($EF)
writebyte($BB)
writebyte($BF)
f=fileopen(fn,1)
filewrite(f)
fileclose(f)

f=file_text_open_append(fn)
file_text_write_string(f,gametitle+" example language file")
file_text_writeln(f)
file_text_writeln(f)

//write the strings down
global.yeat=1
global.yeatfile=f
langdefault()
global.yeat=0

file_text_close(f)
ping("Default language example regenerated.")

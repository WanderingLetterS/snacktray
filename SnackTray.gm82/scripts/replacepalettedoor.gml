///replacepalettedoor(slot,name)
var name,slot,dir,i,f,my_directory,str,section,p;
name=argument[1]
slot=argument[0]
i=0 repeat (4) {SPRAY[i]=-1 i+=1}

if global.charmod[charm_get_id(name)] dir=globalmanager.moddir+"character\"+name+"\"
else dir=global.pbase+name+"\"

my_directory=dir+name+"-palette.png"
if !file_exists(my_directory) return -2

if (file_exists(dir+"player.txt")) {
    f=file_text_open_read(dir+"player.txt")
    section=""
    do {
        str=file_text_read_string(f)
        file_text_readln(f)
        if (str!="") {
            if (string_pos("[",str) && string_pos("]",str) && !string_pos("=",str))
                section=string_replace(string_replace(str,"[",""),"]","")
            else {
                p=string_pos("=",str)
                if (section==name) {
                    if string_copy(str,1,p-1) == "use paletting" && !funnytruefalse(string_delete(str,1,p)) {file_text_close(f) return -2}

                    i=0 repeat (4) {if string_copy(str,1,p-1) == "defaultspray "+string(i) {SPRAY[i]=unreal(string_delete(str,1,p)) continue;} i+=1}
                    if (SPRAY[1]!=-1 && SPRAY[2]!=-1 && SPRAY[3]!=-1 && SPRAY[4]!=-1) break;

                }
            }
        }
    } until (file_text_eof(f))
    file_text_close(f)
    i=0 repeat (4) {if SPRAY[i]==-1 SPRAY[i]=0 i+=1}
} else return -2;

if (current_time>global.loadtime+64) loadtext()

global.doorpalettesprites[slot]=sprite_add(my_directory,1,1,0,0,0)

if !sprite_exists_0(global.doorpalettesprites[slot]) {ping(lang("error skin corrupt")+"#"+my_directory) return -2}


yeah=surface_create(sprite_get_width(global.doorpalettesprites[slot]),sprite_get_height(global.doorpalettesprites[slot]))
surface_set_target(yeah)
draw_sprite(global.doorpalettesprites[slot],0,0,0)

global.doorpalettesprites[slot+500]=sprite_create_from_surface(yeah,9,9,14,16,0,0,0,0)

surface_free(yeah)
surface_reset_target()

global.doorpalettes+=1
return slot

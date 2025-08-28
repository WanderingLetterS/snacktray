///charm_load(filename,modded)
var fn,state,script,c,f,str,name,protecc,i;

//this is /*"/**/ and it collects open strings and open comments
protecc="/*"+qt+"/**/"

if (current_time>global.loadtime+64) loadtext()

state=0
script=""
c=global.characters
movesetpage=0

name=filename_name(argument[0])

for (i=0;string(global.movelist[c,i])!="0";i+=1) global.movelist[c,i]=""
for (i=0;i<5;i+=1) global.pagespec[c,i]=-1
//for compatibility
global.pagespec[c,0]=0
global.damagercode[c]=""
global.projectilecode[c]=""
global.deathcode[c]=""
global.defaultspritelist[c]=""
global.soundlist[c]=""
global.charmod[c]=argument[1]
global.charicon[c,0]=spr_unknown
global.charlock[c]=spr_unknown
global.chariconr[c]=spr_chariconb
//global.chariconb[c]=spr_unknown
//global.chariconsp[c,0]=spr_missingsprays
global.charname[c]=name
global.charbio[c]=""
global.chargames[c]=""
global.chardata[c]="No data."
global.changecode[c]=""
global.rosterswap[c]=""
global.unlockdata[c]=""

fn=argument[0]+"\"+name+".gml"

if (!file_exists(fn) || !file_exists(filename_change_ext(fn,"-card.png")) || !file_exists(argument[0]+"\"+"player.txt")) exit

for ({f=file_text_open_read(fn) str="" opencount=0 closecount=0 closeline=0 blockcomment=0};!file_text_eof(f);file_text_readln(f)) {
    str = string_replace_all(file_text_read_string(f),chr(9)," ")
    if (string_replace_all(str," ","")=="") continue
    if (str="#" && state=4) str=""
    blockcomment = string_count("/*",script) - string_count("*/",script) - string_count(protecc,script)
    if (string_pos("#define",str)) {
        if ((string_pos("#define",str) < string_pos("//",str)) || !string_pos("//",str) && !blockcomment) {
            if (state=-1) script+=protecc+"return 0}"+lf
            if (string_pos("rosterorder",str)) state=1
            else if (string_pos("spritelist",str)) state=2
            else if (string_pos("soundlist",str)) state=3
            else if (string_pos("movelist",str)) state=4
            else if (string_pos("damager",str)) state=5
            else if (string_pos("projectile",str)) state=6
            else if (string_pos("description",str)) state=7
            else if (string_pos("death",str)) state=8
            else if (string_pos("customchange",str)) state=9
            else if (string_pos("rosterswap",str)) state=10
            else if (string_pos("unlock",str)) state=11
            else if (string_pos("lockvariable",str)) state=12
            else {
                state=-1
                script+="if (entrypoint="+qt+string_letters(string_replace(str,"#define",""))+qt+") {"+protecc+lf
            }
            continue       
        }
        
    }
    if (state=1) {global.rosterorder[c]=unreal(str,0) state=0}
    if (state=2) {global.defaultspritelist[c]=str state=0}
    if (state=3) {global.soundlist[c]=str state=0}
    if (state=4) {addmovelist(c,str)}
    if (state=5) {global.damagercode[c]+=str+lf}
    if (state=6) {global.projectilecode[c]+=str+lf}
    if (state=7) {global.chardata[c]=str state=0}
    if (state=8) {global.deathcode[c]+=str+lf}
    if (state=9) {global.changecode[c]+=str+lf}
    if (state=10) {global.rosterswap[c]+=str}
    if (state=11) {global.unlockdata[c]+=str+lf}
    if (state=12) {charm_lock(str,name) state=0}
    if (state=-1) script+=str+lf
} file_text_close(f)
if (state=-1) script+=protecc+" return 0}"+lf

if (script="") {error(lang("error charmload1")+fn+lang("error charm nocode")) exit}

global.charicon[c,0]=sprite_add(filename_change_ext(fn,"-card.png"),1,0,0,12,12)
if (global.charicon[c,0]) {
    if (sprite_get_width(global.charicon[c,0])<24 || sprite_get_height(global.charicon[c,0])<24) {
        error(lang("error icon dimensions")+filename_change_ext(fn,"-card.png"))
        sprite_delete(global.charicon[c,0])
        global.charicon[c,0]=spr_unknown
    }
} else global.charicon[c,0]=spr_unknown

global.charlock[c]=sprite_add(filename_change_ext(fn,"-lock.png"),1,0,0,12,12)
if (global.charlock[c]) {
    if (sprite_get_width(global.charlock[c])!=24 || sprite_get_height(global.charlock[c])!=24) {
        error(lang("error icon dimensions")+filename_change_ext(fn,"-lock.png"))
        sprite_delete(global.charlock[c])
        global.charlock[c]=spr_unknown
    }
} else global.charlock[c]=spr_unknown

/*global.chariconsp[c,0]=sprite_add(filename_change_ext(fn,"-sprays.png"),1,1,0,0,0)
if !(global.chariconsp[c,0]) {
    global.chariconsp[c,0]=spr_missingsprays
}*/

var extentiod;
global.chariconr[c]=sprite_add(filename_change_ext(fn,"-replay.png"),1,1,0,0,0)
extentiod="-replay"    //timed attack..
if !global.chariconr[c] {global.chariconr[c]=sprite_add(filename_change_ext(fn,"-timeattack.png"),1,1,0,0,0) extentiod="-timeattack"}
if (global.chariconr[c]) {
    /*if (sprite_get_width(global.chariconr[c])!=10 || sprite_get_height(global.chariconr[c])!=10) {
        error("replay icon not 10x10: "+filename_change_ext(fn,extentiod+".png"))
        sprite_delete(global.chariconr[c])
        global.chariconr[c]=spr_chariconb
    }*/
} else global.chariconr[c]=spr_chariconb

/*global.chariconb[c]=sprite_add(argument[0]+"\bio.png",1,1,0,0,0)
if (global.chariconb[c]) {
    if (sprite_get_width(global.chariconb[c]) mod 48!=0 || sprite_get_height(global.chariconb[c])!=48) {
        error(lang("error bio dimensions")+argument[0]+"\bio.png")
        sprite_delete(global.chariconb[c])
        global.chariconb[c]=spr_unknown
    }
} else global.chariconb[c]=spr_unknown*/

/*if (file_exists(argument[0]+"\bio.txt")) {
    f=file_text_open_read(argument[0]+"\bio.txt")
    if (f) {
        global.charbio[c]=file_text_read_string(f)
        file_text_readln(f)
        global.chargames[c]=file_text_read_string(f)
        file_text_close(f)
    }
}*/

error_occurred=0      
with (instance_create(0,0,compiler_dummy)) {
    entrypoint="null_test"
    execute_string(script)
    event="null_test"
    execute_string(global.projectilecode[c])
    owner=id
    execute_string(global.damagercode[c])
    execute_string(global.deathcode[c])
    execute_string(global.unlockdata[c]) //this technically should Not be here it doesn't use events but theres charms that use this to run game-start code so idc
    instance_destroy()
}
if (error_occurred) {
    file_delete(argument[0]+"\errors.txt")
    if (file_exists(argument[0]+"\errors.txt"))
        file_rename("game_errors.log",argument[0]+"\errors.txt")
    else {
        f=file_text_open_write(argument[0]+"\errors.txt")
        file_text_write_string(f,error_last)
        file_text_close(f)
    }
    error_occurred=0
    settings(name+" broken",1)
    if (!argument[1]) error(lang("error vanilla broken")+name,1)
} else {
    settings(name+" broken",0)
    global.charcode[c]=script 
}




global.characters+=1

global.notfirstreload=1

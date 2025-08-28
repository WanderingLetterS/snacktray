///indexskins()
//scan skin directories and find skins
var file,dir,type,f,str,i,list;

global.wbase=global.cache+"world\"
global.pbase=global.cache+"character\"
global.lbase=global.cache+"level\"

dir=global.cache+"character\"
i=0
for (file=file_find_first(dir+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(dir+file)) if (file!="." && file!="..") {list[i]=dir+file i+=1}
} file_find_close()

for (j=0;j<i;j+=1) charm_load(list[j],0)

global.charmstart=global.characters

dir=moddir+"character\"
i=0
for (file=file_find_first(dir+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(dir+file)) if (file!="." && file!="..") {list[i]=dir+file i+=1}
} file_find_close()

for (j=0;j<i;j+=1) charm_load(list[j],1)

//get rid of any write-delayed error logs
sleep(16)
file_delete("game_errors.log")

spr=sprite_add(global.wbase+"icon.png",1,0,0,0,0)
if (!spr) spr=spr_unknown

for (i=0;i<global.characters;i+=1) {global.pskins[0,i]=1 global.pskins[1,i]=global.pbase}
global.wskins[0,0]=1 global.wskins[1,0]=global.wbase global.wskins[1,1]=spr
global.mskins[0,0]=1 global.mskins[1,0]="" global.mskins[1,1]=-1
global.lskins[0,0]=1 global.lskins[1,0]=global.lbase global.lskins[1,1]=spr
global.wmskins[0]=sprite_add(global.wmbase0,0,0,0,0,0)

dir=skindir+"world\"

file=file_find_first(dir+"*",fa_directory)+"\"
while (file!="\") {
    if (file!=".\" && file!="..\") if (file_exists(dir+file+"world.txt")) {
        global.wskins[0,0]+=1
        global.wskins[global.wskins[0,0],0]="world\"+file
        spr=-1
        if (file_exists(dir+file+"\icon.png")) spr=sprite_add(dir+file+"\icon.png",1,0,0,0,0)
        if (spr) if (sprite_get_width(spr)>96 || sprite_get_height(spr)>48) {
            show_message(lang("error world icon size")+"#"+dir+file+"\icon.png")
            sprite_delete(spr)
            spr=-1
        }
        global.wskins[global.wskins[0,0],1]=spr
    }
    file=file_find_next()+"\"
}
file_find_close()

dir=skindir+"Music\"

file=file_find_first(dir+"*",fa_directory)+"\"
while (file!="\") {
    if (file!=".\" && file!="..\") if (file_exists(dir+file+"music.txt")) {
        global.mskins[0,0]+=1
        global.mskins[global.mskins[0,0],0]="music\"+file
        spr=-1
        if (file_exists(dir+file+"\icon.png")) spr=sprite_add(dir+file+"\icon.png",1,0,0,0,0)
        if (spr) if (sprite_get_width(spr)>96 || sprite_get_height(spr)>48) {
            show_message(lang("error world icon size")+"#"+dir+file+"\icon.png")
            sprite_delete(spr)
            spr=-1
        }
        global.mskins[global.mskins[0,0],1]=spr
    }
    file=file_find_next()+"\"
}
file_find_close()

dir=moddir+"Level\"

file=file_find_first(dir+"*",fa_directory)+"\"
while (file!="\") {
    if (file!=".\" && file!="..\" && directory_exists(dir+file)) {
        global.lskins[0,0]+=1
        global.lskins[global.lskins[0,0],0]="level\"+file
        spr=-1
        if (file_exists(dir+file+"\icon.png")) spr=sprite_add(dir+file+"\icon.png",1,0,0,0,0)

        if (spr) if (sprite_get_width(spr)>96 || sprite_get_height(spr)>48) {
            show_message(lang("error world icon size")+"#"+dir+file+"\icon.png")
            sprite_delete(spr)
            spr=-1
        }
        global.lskins[global.lskins[0,0],1]=spr
    }
    file=file_find_next()+"\"
}
file_find_close()


dir=skindir+"Player\"

file=file_find_first(dir+"*",fa_directory)+"\"
while (file!="\") {
    if (file!=".\" && file!="..\") {
        if (file_exists(dir+file+"player.txt")) {
            f=file_text_open_read(dir+file+"player.txt")
            type=-3
            while (!file_text_eof(f)) {
                str=file_text_read_string(f)
                file_text_readln(f)
                if (string_pos("[",str) && string_pos("]",str)) {
                    for (i=0;i<global.characters;i+=1) {
                        if (string_pos("["+global.charname[i]+"]",str)) {
                            if type>=0 { //Identical to below
                                global.pskins[0,type]+=1
                                global.pskins[global.pskins[0,type],type]="Player\"+file

                                global.charicon[type,global.pskins[0,type]]=sprite_add(dir+file+global.charname[type]+"-card.png",1,0,0,12,12)
                                if (global.charicon[type,global.pskins[0,type]]) {
                                    if (sprite_get_width(global.charicon[type,global.pskins[0,type]])!=24 || sprite_get_height(global.charicon[type,global.pskins[0,type]])!=24) {
                                        error(lang("error icon dimensions")+dir+file+global.charname[type]+"-card.png")
                                        sprite_delete(global.charicon[type,global.pskins[0,type]])
                                        global.charicon[type,global.pskins[0,type]]=spr_noskincard
                                    }
                                } else global.charicon[type,global.pskins[0,type]]=spr_noskincard

                                /*global.chariconsp[type,global.pskins[0,type]]=sprite_add(dir+file+global.charname[type]+"-sprays.png",1,1,0,0,0)
                                if !(global.chariconsp[type,global.pskins[0,type]]) {
                                    global.chariconsp[type,global.pskins[0,type]]=spr_noskincard
                                }*/
                                type=-3
                            }
                            type=i
                        }
                    }
                }
            }
            file_text_close(f)
            if type>=0 { //Identical to above

                global.pskins[0,type]+=1
                global.pskins[global.pskins[0,type],type]="Player\"+file

                global.charicon[type,global.pskins[0,type]]=sprite_add(dir+file+global.charname[type]+"-card.png",1,0,0,12,12)
                if (global.charicon[type,global.pskins[0,type]]) {
                    if (sprite_get_width(global.charicon[type,global.pskins[0,type]])!=24 || sprite_get_height(global.charicon[type,global.pskins[0,type]])!=24) {
                        error(lang("error icon dimensions")+dir+file+global.charname[type]+"-card.png")
                        sprite_delete(global.charicon[type,global.pskins[0,type]])
                        global.charicon[type,global.pskins[0,type]]=spr_noskincard
                    }
                } else global.charicon[type,global.pskins[0,type]]=spr_noskincard

                /*global.chariconsp[type,global.pskins[0,type]]=sprite_add(dir+file+global.charname[type]+"-sprays.png",1,1,0,0,0)
                if !(global.chariconsp[type,global.pskins[0,type]]) {
                    global.chariconsp[type,global.pskins[0,type]]=spr_noskincard
                }*/

            }
        }
    }
    file=file_find_next()+"\"
}
file_find_close()

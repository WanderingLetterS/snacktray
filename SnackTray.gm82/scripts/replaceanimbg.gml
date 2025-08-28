///replaceanimbg(name,directory,filename)
//replaces a stage background from files, updating properties from filename data
var f,str,p,t,s,fg,add,slot,par,blend,scroll,maxslot,cleanup,i,spr,name;

name=argument[0]+argument[2]

cleanup=1
f=file_find_first(argument[1]+argument[0]+"\background\"+argument[2]+"\*.png",0)
while (f!="") {
    if (cleanup) {
        //cleanup old layers
        for (i=0;i<=7;i+=1) {
            spr=skindat("tex_"+name+string(i))
            if (spr) sprite_delete(spr)
            skindat("tex_"+name+string(i),0)
            skindat("tex_"+name+string(i)+"_filename","")
        }
        cleanup=0
        maxslot=0
    }

    slot="0"

    par_x=0
    par_y=0

    noloop_x=0
    noloop_y=0

    clamp_x=0
    clamp_y=0

    offset_x=0
    offset_y=0

    scroll_x=0
    scroll_y=0

    regionedge_x=0
    regionedge_y=0

    intentedwidth=0
    intentedheight=0

    transparent=0

    blend=0
    foreground=0

    str=filename_change_ext(string_replace(filename_fixname(f),argument[0],""),"-")
    do {
        p=string_pos("-",str)
        s=string_copy(str,1,p-1)
        str=string_delete(str,1,p)

        if (string_copy(s,1,6)="Depth_") {slot=string_delete(s,1,6) maxslot=max(maxslot,unreal(slot,0)) }
        if (string_copy(s,1,11)="Parallax_X_") {par_x=unreal(string_delete(s,1,11),0)}
        if (string_copy(s,1,11)="Parallax_Y_") {par_y=unreal(string_delete(s,1,11),0)}

        if (s="Noloop_X") {noloop_x=1}
        if (s="Noloop_Y") {noloop_y=1}

        if (s="Clamp_X") {clamp_x=1}
        if (s="Clamp_Y") {clamp_y=1}

        if (string_copy(s,1,10)="Offset_X_m") {offset_x=-unreal(string_delete(s,1,10),0)}
        else if (string_copy(s,1,9)="Offset_X_") {offset_x=unreal(string_delete(s,1,9),0)}
        if (string_copy(s,1,10)="Offset_Y_m") {offset_y=-unreal(string_delete(s,1,10),0)}
        else if (string_copy(s,1,9)="Offset_Y_") {offset_y=unreal(string_delete(s,1,9),0)}

        if (string_copy(s,1,13)="Regionedge_X_") {regionedge_x=unreal(string_delete(s,1,13),0)}
        if (string_copy(s,1,13)="Regionedge_Y_") {regionedge_y=unreal(string_delete(s,1,13),0)}

        if (string_copy(s,1,10)="Scroll_X_m") {scroll_x=-unreal(string_delete(s,1,10),0)}
        else if (string_copy(s,1,9)="Scroll_X_") {scroll_x=unreal(string_delete(s,1,9),0)}
        if (string_copy(s,1,10)="Scroll_Y_m") {scroll_y=-unreal(string_delete(s,1,10),0)}
        else if (string_copy(s,1,9)="Scroll_Y_") {scroll_y=unreal(string_delete(s,1,9),0)}


        if (string_copy(s,1,18)="Designed_Region_X_") {intentedwidth=unreal(string_delete(s,1,18),0)}
        if (string_copy(s,1,18)="Designed_Region_Y_") {intentedheight=unreal(string_delete(s,1,18),0)}

         if (s="Transparent") {transparent=1}
         if (s="Foreground") {foreground=1}

        if (s="bm_add") {blend=1}
        if (s="bm_sub") {blend=2}


    } until str=""

    if (maxslot>7) {maxslot=7 slot="0"}
    if ani==0 ani=1
        spr=replacesheet(slot,name,argument[1]+argument[0]+"\background\"+argument[2]+"\"+f,0,0,transparent)

    skindat("ms_"+name,maxslot)
    skindat("bm_"+name+slot,blend)
    skindat("Parallax_X_"+name+slot,par_x)
    skindat("Parallax_Y_"+name+slot,par_y)

    skindat("Noloop_X_"+name+slot,noloop_x)
    skindat("Noloop_Y_"+name+slot,noloop_y)

    skindat("Clamp_X_"+name+slot,clamp_x)
    skindat("Clamp_Y_"+name+slot,clamp_y)

    skindat("Offset_X_"+name+slot,offset_x)
    skindat("Offset_Y_"+name+slot,offset_y)

    skindat("Regionedge_X_"+name+slot,regionedge_x)
    skindat("Regionedge_Y_"+name+slot,regionedge_y)

    skindat("Scroll_X_"+name+slot,scroll_x)
    skindat("Scroll_Y_"+name+slot,scroll_y)

    skindat("Transparent_"+name+slot,transparent)
    skindat("Foreground_"+name+slot,foreground)

    skindat("Intended_Width_"+name+slot,intentedwidth)
    skindat("Intended_Height_"+name+slot,intentedheight)


    skindat("texw_"+name+slot,sprite_get_width(spr))
    skindat("texh_"+name+slot,sprite_get_height(spr)-8*transparent)

    f=file_find_next()
}
file_find_close()

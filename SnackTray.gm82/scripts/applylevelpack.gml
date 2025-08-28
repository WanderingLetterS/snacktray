var dn,fn,i,path,map,showhidden,mike;
showhidden=argument[1]

with (stagepick) scroll=0

with (globalmanager) {
    path=argument[0]
    if (global.skinnedpath=path && global.hiddenshow==showhidden) exit
    global.skinnedpath=path
    global.hiddenshow=showhidden

    if (global.bundled || path=global.lbase) dn=path
    else dn=moddir+path

    i=0
    for (fn=file_find_first(dn+"*.lemon*",0);fn!="";fn=file_find_next()) { //yall aint ready
        i+=1
        global.levellist[i,0]=string_copy(fn,1,string_pos(".lemon",fn)-1)
        map=lemongetinfo(dn+fn)
        if (map=-1) {i-=1 continue}
        if (string_count("$locked",ds_map_find_value(map,"desc"))) {
            mike=global.lskins[global.levelskin+1,0]
            if mike==global.lbase mike=""
            if (!settings(global.levellist[i,0]+mike+" found")) {
                global.levellist[i,2] = 1 //unfound level
            } else global.levellist[i,2] = 2 //found level
        } else global.levellist[i,2] = 0 //0 = level not locked
        if (string_count("$hidden",ds_map_find_value(map,"desc")) && (!showhidden || (showhidden && global.levellist[i,2] == 1)) && global.levellist[i,2] != 2) {i-=1 continue}
        global.levellist[i,1]=string(ds_map_find_value(map,"name"))
        ds_map_destroy(map)
    }
    file_find_close()
    global.levellist[0,0]=i

    if (i=0) {
        show_message(lang("error no levels"))
        applylevelpack(global.lbase)
        exit
    }

    global.nextlevel=global.levellist[1,0]

    j=skindat("maxspecial")
    for (i=0;i<j;i+=1) global.moranplayed[i]=0

    i=0
    while (file_exists(dn+"special"+string(i+1)+".txt")) {replacespecial(i,dn+"special"+string(i+1)+".txt") i+=1}
    if (i>0) skindat("maxspecial",i)
}

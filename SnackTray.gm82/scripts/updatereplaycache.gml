var l,maps,sort,f,s,i,fn,str,head,m,movver,t,

if (global.replaycache=-1) {
    l=ds_list_create()
    maps=ds_list_create()
    sort=ds_priority_create()

    f=file_find_first(global.workdir+"replays\*.bmov",0)
    i=0
    while (f!="" && i<1000) {
        ds_list_add(l,"replays\"+f)
        f=file_find_next()
        i+=1
    }
    file_find_close()

    if (global.gamemaker) {
        f=file_find_first(global.workdir+"replays\testing\*.bmov",0)
        i=0
        while (f!="" && i<1000) {
            ds_list_add(l,"replays\testing\"+f)
            f=file_find_next()
            i+=1
        }
        file_find_close()
    }

    s=ds_list_size(l)
    for (i=0;i<s;i+=1) {
        fn=ds_list_find_value(l,i)

        if (!readmoviefile(fn)) continue

        head=readstring(global.keylog)

        m=ds_map_create()
        if (!ds_map_read_safe(m,string_replace(string_replace(head,"|/head|",""),"|head|",""))) {
            ds_map_destroy(m)
            continue
        }

        movver=ds_map_find_value(m,"vr")
        if (movver!=version) {
            ds_map_destroy(m)
            continue
        }

        ds_map_add(m,"fn",fn)
        ds_map_replace(m,"sc",string(ds_map_find_value(m,"sc"))+" Lv")

        t=(ds_map_find_value(m,"ln")/max(1,ds_map_find_value(m,"mp")))/60
        ds_map_add(m,"lt",format(floor(t/60),2)+":"+format(floor(t) mod 60,2))

        ds_priority_add(sort,m,ds_map_find_value(m,"dv"))
    }

    ds_list_destroy(l)
    str=""

    while (!ds_priority_empty(sort)) ds_list_add(maps,ds_priority_delete_max(sort))
    ds_priority_destroy(sort)

    global.replaycache=maps
}

clearbuffer(global.keylog)

return global.replaycache

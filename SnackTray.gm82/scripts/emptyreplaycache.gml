if (global.replaycache!=-1) {
    for (i=0;i<l;i+=1) {
        ds_map_destroy(ds_list_find_value(global.replaycache,i))
    }
    ds_list_destroy(global.replaycache)
    global.replaycache=-1
}

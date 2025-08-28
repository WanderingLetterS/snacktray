var i,name,t;

for (i=0;i<ds_list_size(global.surefacenames);i+=1) {
    name=ds_list_find_value(global.surefacenames,i)
    t=ds_map_find_value(global.surefaces,name+"_sf_t")-1
    ds_map_set(global.surefaces,name+"_sf_t",t)
    if (!t) {
        show_debug_message("sureface: timing out surface "+qt+name+qt)
        sureface_free(name)
    }
}

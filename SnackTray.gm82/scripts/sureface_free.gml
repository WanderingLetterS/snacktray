var name,p,s,mem;

name=argument[0]

p=ds_list_find_index(global.surefacenames,name)

if (p!=-1) {
    show_debug_message("sureface: destroyed surface "+qt+name+qt)

    s=ds_map_find_value(global.surefaces,name)

    if (surface_exists(s)) {
        surface_free(s)
        mem=(ds_map_find_value(global.surefaces,name+"_sf_w")*ds_map_find_value(global.surefaces,name+"_sf_h")*4)/1024
        ds_map_set(global.surefaces,"_sf_totmem",ds_map_find_value(global.surefaces,"_sf_totmem")-mem)
        show_debug_message("sureface: freed "+string(mem)+"KB of vram")
        show_debug_message("(total: "+string(ds_map_find_value(global.surefaces,"_sf_totmem"))+"KB)")
    }

    ds_map_delete(global.surefaces,name)
    ds_map_delete(global.surefaces,name+"_sf_w")
    ds_map_delete(global.surefaces,name+"_sf_h")
    ds_map_delete(global.surefaces,name+"_sf_t")
    ds_list_delete(global.surefacenames,p)
} else {
    show_debug_message("sureface: tried to destroy nonexisting surface "+qt+name+qt)
}

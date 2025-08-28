//returns surface id or -1
var p,s,name;

name=argument[0]

p=ds_list_find_index(global.surefacenames,name)

if (p=-1) return 0

s=ds_map_find_value(global.surefaces,name)

if (surface_exists(s)) {
    ds_map_set(global.surefaces,name+"_sf_t",60)
    return s
}

return -1

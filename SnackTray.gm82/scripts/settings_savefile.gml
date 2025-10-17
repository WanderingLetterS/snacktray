///settings_savefile(key)
///settings_savefile(key,value)
//settings registry. specifying a value writes to it.

var map;
map=global.setmap

key=string(global.curr_savefile)+"_"+argument[0]

if (argument_count=1) {
    if (ds_map_exists(map,key)) return ds_map_find_value(map,key)
    else return 0
} else {
    if (ds_map_exists(map,key)) ds_map_replace(map,key,argument[1])
    else ds_map_add(map,key,argument[1])
    global.settingschanged=1
}

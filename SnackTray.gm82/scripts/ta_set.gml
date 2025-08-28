///ta_set(key,value)
//identical to settings() but for time attack scores
var map;
map=global.timemap

if (argument_count=1) {
    if (ds_map_exists(map,argument[0])) return ds_map_find_value(map,argument[0])
    else return 0
} else {
    if (ds_map_exists(map,argument[0])) ds_map_replace(map,argument[0],argument[1])
    else ds_map_add(map,argument[0],argument[1])
    global.settingschanged=1
}

///skindat(key)
///skindat(key,value)
//skin data registry. passing a value writes to it.

var map;
map=globalmanager.skinmap

if (argument_count=1) {
    if (ds_map_exists(map,argument[0])) return ds_map_find_value(map,argument[0])
    else return 0
} else {
    if (ds_map_exists(map,argument[0])) ds_map_replace(map,argument[0],argument[1])
    else ds_map_add(map,argument[0],argument[1])
}

///playerskindat(slot,key)
///playerskindat(slot,key,value)
//skin data registry. passing a value writes to it.

var map;
map=globalmanager.playerskinmap[max(argument[0],0)]//Why would p2 be -1?  I wish I knew, but the game has a soul of its own. -  -S-

if (argument_count=2) {
    if (ds_map_exists(map,argument[1])) return ds_map_find_value(map,argument[1])
    else return 0
} else {
    if (ds_map_exists(map,argument[1])) ds_map_replace(map,argument[1],argument[2])
    else ds_map_add(map,argument[1],argument[2])
}

///ds_map_set(map,key,value)
//convenience for existing key replacement

if (ds_map_exists(argument[0],argument[1])) ds_map_replace(argument[0],argument[1],argument[2])
else ds_map_add(argument[0],argument[1],argument[2])

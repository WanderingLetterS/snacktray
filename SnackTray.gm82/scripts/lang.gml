///lang(key)
//get a language string for key

var r;
r=ds_map_find_value(global.strmap,argument[0])
if (!is_string(r)) return argument[0]
return r

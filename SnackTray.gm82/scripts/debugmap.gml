var str,key,val;

str=""
key=ds_map_find_first(argument[0])
repeat (ds_map_size(argument[0])) {
    val=ds_map_find_value(argument[0],key)
    if (is_string(val)) str+=string(key)+": "+qt+val+qt+lf
    else str+=string(key)+": "+string(val)+lf
    key=ds_map_find_next(argument[0],key)
}
clipboard_set_text(str)

show_message("map copied to clipboard")

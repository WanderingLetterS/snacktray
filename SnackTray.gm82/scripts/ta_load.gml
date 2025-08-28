///ta_load
//loads only time attack scores

var f,str,k,temp;

if (file_exists(global.savedir+"times.cfg")) {
    f=file_text_open_read(global.savedir+"times.cfg")
    str=file_text_read_string(f)
    file_text_close(f)

    temp=ds_map_create()

    if (!ds_map_read_safe(temp,str)) {ds_map_destroy(temp)}
    else {
        k=ds_map_find_first(temp)
        repeat (ds_map_size(temp)) {
            ta_set(k,ds_map_find_value(temp,k))
            k=ds_map_find_next(temp,k)
        }
        ds_map_destroy(temp)
    }
}

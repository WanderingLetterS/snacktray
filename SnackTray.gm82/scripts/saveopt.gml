///saveopt()
//saves settings
var f;

if (global.settingschanged) {
    settings("statmapL",ds_map_write(global.statmap))
    f=file_text_open_write(global.savefile)
    file_text_write_string(f,ds_map_write(global.setmap))
    file_text_close(f)
}

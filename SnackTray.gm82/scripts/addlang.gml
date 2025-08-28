if (global.yeat) {
    file_text_write_string(global.yeatfile,argument[1]+"="+argument[2])
    file_text_writeln(global.yeatfile)
} else ds_map_add(argument[0],argument[1],argument[2])

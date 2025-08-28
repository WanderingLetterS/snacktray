///ta_save()

f=file_text_open_write(global.savedir+"times.cfg")
file_text_write_string(f,ds_map_write(global.timemap))
file_text_close(f)

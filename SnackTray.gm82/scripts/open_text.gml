///open_text(filepath, type [0=read 1=write 2=append, default = read])
//safe version of file_text_open_*() for use in charms. returns -1 on failure to open a file, and -2 on antivirus detection.
//#HACKED!! by xX_SpikyThumbTacks442_Xx
    if type == 1 {
        file=file_text_open_write(argument[0])
    }
    else if type == 2 {
        file=file_text_open_append(argument[0])
    }
    else {
        file=file_text_open_read(argument[0])
    }

return file

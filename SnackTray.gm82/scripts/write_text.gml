///write_text(file id, string / real / line [default: string], string / value)
//safe version of file_text_write_string(), file_text_write_real(), and file_text_writeln() for use in charms. returns -2 on antivirus detection.
//#HACKED!! by xX_SpikyThumbTacks442_Xx
    if type == 1 {
        success = file_text_write_real(argument[0],argument[1])
    } else if type == 2 {
        success = file_text_writeln(argument[0])
    } else {
        success = file_text_write_string(argument[0],argument[1])
    }
return success

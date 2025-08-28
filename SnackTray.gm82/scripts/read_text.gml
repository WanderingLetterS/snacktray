///read_text(file id, string / real / line [default: string])
//safe version of file_text_read_string(), file_text_read_real(), and file_text_readln() for use in charms. returns detected keyword on antivirus detection.
//#HACKED!! by xX_SpikyThumbTacks442_Xx
if type == 1 {
    return file_text_read_real(argument[0])
} else if type == 2 {
    return file_text_readln(argument[0])
} else {
    return file_text_read_string(argument[0])
}

///replaceplayerinfo(slot,fname)
//updates the skindata structure from inilike file

var str,f,section,p;

if (file_exists(argument[1])) {

    f=file_text_open_read(argument[1])
    section=""
    do {
        str=file_text_read_string(f)

        file_text_readln(f)
        if (str!="" && str!=chr("\n")) {
            if (string_pos("[",str) && string_pos("]",str) && !string_pos("=",str))
                section=string_replace(string_replace(str,"[",""),"]","")
            else {
                p=string_pos("=",str)
                playerskindat(argument[0],section+" "+string_copy(str,1,p-1),string_delete(str,1,p))
            }
        }
    } until (file_text_eof(f))




    file_text_close(f)
    return 1
} return 0

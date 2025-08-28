var f,str,p,s,i;

if (file_exists(argument[1])) {
    f=file_text_open_read(argument[1])
    if (f) {
        str=""
        i=string(argument[0])
        skindat("specialtime"+i,30)
        skindat("specialchk1"+i,0)
        skindat("specialchk2"+i,0)
        skindat("specialchk3"+i,0)
        while (!file_text_eof(f)) {
            s=file_text_read_string(f)
            p=string_pos("=",s)
            if (p) {
                if (string_pos("1",string_copy(s,1,p-1))) skindat("specialchk1"+i,unreal(string_delete(s,1,p)))
                if (string_pos("2",string_copy(s,1,p-1))) skindat("specialchk2"+i,unreal(string_delete(s,1,p)))
                if (string_pos("3",string_copy(s,1,p-1))) skindat("specialchk3"+i,unreal(string_delete(s,1,p)))
                if (string_pos("time",string_copy(s,1,p-1))) skindat("specialtime"+i,unreal(string_delete(s,1,p)))
            } else str+=s+"|"
            file_text_readln(f)
        }
        file_text_close(f)
        skinstr("specialstr"+i,str)
    }
}

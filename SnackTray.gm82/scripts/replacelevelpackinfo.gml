///replacelevelpackinfo(fname)
//updates the levelpack into a bunch of global variables from a somewhat inilike file

var str,f,section,p,count;

if (file_exists(argument[0])) {
    f=file_text_open_read(argument[0])
    section=""
    do {
        str=file_text_read_string(f)
        file_text_readln(f)
        if (str!="") {
            if (string_pos("[",str) && string_pos("]",str) && !string_pos("=",str)){

                section=string_replace(string_replace(str,"[",""),"]","")
                if section!=""
                variable_global_array_set("levelpack_"+section,0,count) //Sets the amount of data inside the previous block.
                count=1 //1 because 0 holds the amount of data in there.
            }else {
                variable_global_array_set("levelpack_"+section,count,str)
                count+=1
            }
        }
    } until (file_text_eof(f))
    file_text_close(f)
    return 1
} return 0

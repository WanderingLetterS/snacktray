var f,fn;

with (specialectrl) {
    if (argument_count) fn=argument[0]
    else fn=get_save_filename("Text files|*.txt","special1.txt")

    if (fn!="") {
        specialebuild()

        fn=filename_change_ext(fn,".txt")

        f=file_text_open_write(fn)
        file_text_write_string(f,"time="+string(skindat("specialtime9999"))) file_text_writeln(f)
        file_text_write_string(f,"1="+string(skindat("specialchk19999"))) file_text_writeln(f)
        file_text_write_string(f,"2="+string(skindat("specialchk29999"))) file_text_writeln(f)
        file_text_write_string(f,"3="+string(skindat("specialchk39999"))) file_text_writeln(f)

        file_text_write_string(f,string_replace_all(skindat("specialstr9999"),"|",lf))
        file_text_close(f)

        specialehud.str="Saved file "+fn
        specialehud.alpha=8
    }
}

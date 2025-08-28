//tries to understand a color format
var h,i,p,str,dec;

str=string_upper(argument[0])

if (string_count(",",str)=2) {
    p=string_pos(",",str)
    i=unreal(string_copy(str,1,p-1),255)
    str=string_delete(str,1,p)
    p=string_pos(",",str)
    return make_color_rgb(i,unreal(string_copy(str,1,p-1),0),unreal(string_delete(str,1,p),255))
}
if (string_pos("$",str)) {
    dec=0
    h="0123456789ABCDEF"
    for (i=1;i<=string_length(str);i+=1) {
        p=string_pos(string_char_at(str,i),h)
        if (p) dec=dec<<4|(p-1)
    }
    return dec
}
if (string_pos("#",str)) {
    dec=0
    h="0123456789ABCDEF"
    for (i=1;i<=string_length(str);i+=1) {
        p=string_pos(string_char_at(str,i),h)
        if (p) dec=dec<<4|(p-1)
    }
    return make_color_rgb(color_get_blue(dec),color_get_green(dec),color_get_red(dec))
}

return $ff00ff

///wordwrap(str,len)
//adapted string_wordwrap from gmlscripts.com
var str,len,brk,out,i,j;

str=argument[0]
len=argument[1]
brk="#"

out=""
while (string_length(str)) {
    while (string_pos(brk,str)<=len+1) && (string_pos(brk,str)>0) {
        out+=string_copy(str,1,string_pos(brk,str)+1)
        str=string_delete(str,1,string_pos(brk,str)+1)
    }
    i=string_length(str)+1
    if (i>len+1) for (i=len+1;i>0;i-=1) if (string_char_at(str,i)=" ") break
    if (!i) {
        j=len
        i=j
    } else {
        j=i
        i-=1
    }
    out+=string_copy(str,1,i)+brk
    str=string_delete(str,1,j)
}
out=string_copy(out,1,string_length(out)-1)

return out

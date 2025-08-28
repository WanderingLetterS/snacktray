///unreal(str,default)
//safe real() for use in reading skins

var res,l,c,i,valid,dot,str;
str=string(argument[0])
res="" valid=0 dot=0 l=string_length(str)
for (i=1;i<=l;i+=1) {
    c=string_char_at(str,i)
    if (c="," || c=".") {res+="." if (dot) {valid=0 break} dot=1}
    else if (string_pos(c,"0123456789")) {res+=c valid=1}
    else if (res="" && c="-") res="-"
}
if (valid) return real(res)
return argument[1]

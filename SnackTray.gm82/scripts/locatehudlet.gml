///locatehudlet(string,name,term)
//searches string for location of term, then updates name key with hudlet position

var p,str,find,i,c,f;

str=argument[0]
find=argument[2]
p=string_pos(find,str)

if (p) {
    str=string_replace(str,find,string_repeat(" ",string_length(find)))
    c=0
    f=1
    for (i=1;i<p;i+=1) {
        if (string_char_at(str,i)="#") {c+=1 f=i+1}
    }
    skindat(argument[1],c*48+(p-f))
} else skindat(argument[1],-1)
return str

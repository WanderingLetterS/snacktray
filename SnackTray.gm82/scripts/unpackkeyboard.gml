//unpack keyboard mappings
var str,i,p;

str=settings("keyboard1")
for (i=0;i<12;i+=1) {
    p=string_pos("|",str)
    global.key[i,0]=real(string_copy(str,1,p-1))
    str=string_delete(str,1,p)
}
str=settings("keyboard2")
for (i=0;i<12;i+=1) {
    p=string_pos("|",str)
    global.key[i,1]=real(string_copy(str,1,p-1))
    str=string_delete(str,1,p)
}

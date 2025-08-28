///unpack_align(deity)
//updates off2x and off2y using data[0]
var p,i;

i=argument[0]
p=string_pos(",",i.data[0])

if (p) {
    i.off2x=unreal(string_copy(i.data[0],1,p-1),0)
    i.off2y=unreal(string_delete(i.data[0],1,p),0)
} else {
    i.off2x=unreal(i.data[0],0)
    i.off2y=0
}

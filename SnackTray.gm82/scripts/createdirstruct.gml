///createdirstruct(root,directory)
var fn;

root=argument[0] fn=argument[1]

for (p=string_pos("\",fn);p;p=string_pos("\",fn)) {
    root+=string_copy(fn,1,p-1)+"\"
    fn=string_delete(fn,1,p)
    if (!directory_exists(root)) directory_create(root)
}

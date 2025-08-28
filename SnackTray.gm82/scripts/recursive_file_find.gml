///recursive_file_find(ds_list,directory)
var fname,file,files;

files=0
for (fname=file_find_first(argument[1]+"*",fa_directory);fname!="";fname=file_find_next()) {
    if (fname=".") continue
    if (fname="..") continue
    file[files]=fname
    files+=1
}
file_find_close()

repeat (files) {
    files-=1
    fname=argument[1]+file[files]
    if (file_attributes(fname,fa_directory)) recursive_file_find(argument[0],fname+"\")
    else ds_list_add(argument[0],fname)
}

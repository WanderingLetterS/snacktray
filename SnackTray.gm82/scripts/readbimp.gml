///readbimp(bimp)
//modified

var key,f,fn,size,offset,i,files,outfn,f2,l,list;

key="fudge Yesterday at 5:44 PM: dude thats gay"

fn=argument[0]
if (!file_exists(fn)) return 0

if (current_time>global.loadtime+64) loadtext()

//extract footer
clearbuffer()
f=fileopen(fn,0)
size=filesize(f)
filesetpos(f,size-8)
fileread(f,8)
setpos(0)
l=readuint()
offset=readuint()
clearbuffer()
filesetpos(f,l)
fileread(f,size-l-4)
setpos(0)
bufferc4(key)

//read ToC
files[0]=readuint()
for (i=1;i<=files[0];i+=1) {
    files[i,0]=readstring()
    files[i,1]=readuint()
    files[i,2]=readuint()
}
clearbuffer()

//mémoire des dossiers
list=ds_list_create()
recursive_file_find(list,global.cache)

for (i=1;i<=files[0];i+=1) {
    if (current_time>global.loadtime+64) loadtext()

    outfn=global.cache+files[i,0]
    l=ds_list_find_index(list,outfn)
    if (l!=-1) ds_list_delete(list,l)

    if (file_exists(outfn)) {
        f2=fileopen(outfn,0)
        size=filesize(f2)
        if (size=files[i,1]) {
            fileread(f2,size)
            if (adler32()=files[i,2]) {
                fileclose(f2)
                clearbuffer()
                offset+=files[i,1]
                continue
            } else {fileclose(f2) file_delete(outfn)}
        } else {fileclose(f2) file_delete(outfn)}
        clearbuffer()
    }
    //extract file

    filesetpos(f,offset)
    fileread(f,files[i,1])
    bufferc4(key)
    fn=files[i,0]
    createdirstruct(global.cache,fn)
    out=fileopen(outfn,1)
    filewrite(out)
    fileclose(out)
    clearbuffer()
    offset+=files[i,1]
}
fileclose(f)

l=ds_list_size(list)
for (i=0;i<l;i+=1) file_delete(ds_list_find_value(list,i))
ds_list_destroy(list)

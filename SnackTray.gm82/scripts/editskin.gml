var i,str,fn;

str="Default Skin|-"
for (i=1;i<global.wskins[0,0];i+=1)
    str+="|"+string_replace(string_delete(global.wskins[1+i,0],1,string_pos("\",global.wskins[1+i,0])),"\","")

if !(settings("nolemonsound")) sound("lemoncontext")
i=show_contextmenu(str,-1)
if !(settings("nolemonsound")) sound("lemonselectitem")

if (i!=-1) {
    editmanager.bundled=0
    {
        global.worldskin=max(0,i)
        applyworldskin(global.wskins[global.worldskin+1,0])
        if (i=0) {
            if (directory_exists(filename_dir(global.lemonfilename)+"\baseasset")) replaceasset(globalmanager.wskin,filename_dir(global.lemonfilename))
            else replaceasset(globalmanager.wskin)
        }
    }

    if (i!=0) replaceasset(globalmanager.wskin)
    drawregion.update=1
    global.worldskin2=global.worldskin
}

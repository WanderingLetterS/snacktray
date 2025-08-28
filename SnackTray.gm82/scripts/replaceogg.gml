var strmhandle,find,p,bbb,length;

strmhandle=FMODSoundAdd(argument[1],2)
if (strmhandle!=0) {
    FMODSoundSetGroup(strmhandle,1)
    find=ds_map_find_value(globalmanager.mushandles,argument[0])
    if (find) FMODSoundFree(find)
    if (string_pos("hurry",argument[1])) skindat("hurry",1)
    ds_map_replace(globalmanager.mushandles,argument[0],strmhandle)
    ds_map_replace(globalmanager.mushandles,argument[0]+"_filename",argument[1])
    length=FMODSoundGetLength(strmhandle)
    p=string_pos("-l",argument[1])
    if (p) {
        bbb=string_delete(string_lower(argument[1]),1,p+1)
        p=string_pos("-",bbb)
        if (!p) p=string_pos(".ogg",bbb)
        bbb=string_copy(bbb,1,p-1)
        if (length!=0) FMODSoundSetLoopPoints(strmhandle,unreal(bbb,0)/length,1)
    }
    p=string_pos("-f",argument[1])
    if (p) {
        bbb=string_delete(string_lower(argument[1]),1,p+1)
        p=string_pos("-",bbb)
        if (!p) p=string_pos(".ogg",bbb)
        bbb=string_copy(bbb,1,p-1)
        skindat("resume"+argument[0],unreal(bbb,0)/length)
    } else skindat("resume"+argument[0],0)
    return 1
}
return 0

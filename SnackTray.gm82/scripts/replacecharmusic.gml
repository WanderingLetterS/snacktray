///replacecharmusic(name,slot,nukeprevious)
var find3,fname,f,strmhandle,old,p,l,ss,slot,nukeprevious;

slot=argument[1]
nukeprevious=argument[2]

ss=string(slot)
find3=charmusdir+"music\"
fname=find3+argument[0]+".ogg"
f=file_find_first(find3+argument[0]+"*.ogg",0)
if (f!="") fname=find3+f
file_find_close()
strmhandle=FMODSoundAdd(fname,2)
if (strmhandle!=0) {
    old=skindat(argument[0]+" music"+ss)
    if (old) FMODSoundFree(old)
    skindat(argument[0]+" music"+ss,strmhandle)
    FMODSoundSetGroup(strmhandle,1)
    p=string_pos("-l",fname)
    if (p) {
        l=string_pos(".ogg",string_lower(fname))
        length=FMODSoundGetLength(strmhandle)
        if (length!=0) FMODSoundSetLoopPoints(strmhandle,unreal(string_copy(fname,p+2,l-1),0)/length,1)
    }
    return 1
}
if (nukeprevious) {
    old=skindat(argument[0]+" music"+ss)
    if (old) FMODSoundFree(old)
    skindat(argument[0]+" music"+ss,0)
}
return 0

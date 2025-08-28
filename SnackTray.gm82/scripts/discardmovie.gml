clearbuffer(global.keylog)
global.pos=1
global.length=1
global.tasing=0
global.spd=60

settings("mirror",settings("mirrorbkp"))
settings("ratchet",settings("ratchetbkp"))
settings("randblock",settings("randblockbkp"))
settings("cog inflives",settings("inflivesbkp"))

i=0
repeat (4) {
    if global.option[i]==-1 continue; //i THINK this gets around mplay being 1
    entrypoint="discard"
    string_execute(global.charcode[global.option[i]])
    i+=1
}

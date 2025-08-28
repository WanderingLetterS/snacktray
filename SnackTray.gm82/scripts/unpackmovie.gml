///unpackmovie()
//reads movie data and unpacks it for use

var head,m,n,i,skin;

head=readstring(global.keylog)
m=ds_map_create()
if (!ds_map_read_safe(m,string_replace(string_replace(head,"|/head|",""),"|head|",""))) {moviecorrupt() return 0}

global.gamemode=ds_map_find_value(m,"gm")
global.mplay=ds_map_find_value(m,"mp")
global.moviestagecount=max(1,ds_map_find_value(m,"sc")) //nuclear fumble here why the hell did 2.0 stop saving the Stage Count that APPEARS ON THE SCREEN dude
global.length=ds_map_find_value(m,"ln")

for (i=0;i<global.mplay;i+=1) {
    n=ds_map_find_value(m,"n"+string(i))
    global.option[i]=charm_get_id(n)
    if (global.option[i]=-1) {
        discardmovie()
        error(lang("error movie charm")+string(n)+lang("error movie charm 2"))
        room_goto_safe(replays)
        return 0
    }
    global.myoption[i]=global.option[i]
    global.input[i]=ds_map_find_value(m,"i"+string(i))
    skin=string(ds_map_find_value(m,"s"+string(i)))
    if (directory_exists(globalmanager.skindir+skin)) {applyplayerskin(skin,i,"all",global.option[i]) global.playerskin[i]=-1}
    else applyplayerskin(global.pbase,i,"all",global.option[i])
    global.pal_1[i]=ds_map_find_value(m,"p1"+string(i))
    global.pal_2[i]=ds_map_find_value(m,"p2"+string(i))
    global.pal_3[i]=ds_map_find_value(m,"p3"+string(i))
    global.pal_4[i]=ds_map_find_value(m,"p4"+string(i))
}

for (i=0;i<9;i+=1) {
    settings("contestbkp"+string(i),settings("contest"+string(i)))
    settings("contest"+string(i),ds_map_find_value(m,"bc"+string(i)))
}
settings("mirrorbkp",settings("mirror"))
settings("ratchetbkp",settings("ratchet"))
settings("randblockbkp",settings("randblock"))
settings("inflivesbkp",settings("cog inflives"))

settings("mirror",ds_map_find_value(m,"cogmirror"))
settings("ratchet",ds_map_find_value(m,"cogratchet"))
settings("randblock",ds_map_find_value(m,"cograndblock"))
settings("cog inflives",ds_map_find_value(m,"coginflives"))

global.worldskin=0 global.worldskin2=0 global.musicskin=0 global.levelskin=0

skin=string(ds_map_find_value(m,"ws"))
if (directory_exists(globalmanager.skindir+skin)) {
    for (i=1;i<global.wskins[0,0];i+=1) if (global.wskins[1+i,0]=skin) global.worldskin=i
    global.worldskin2=global.worldskin
}

skin=string(ds_map_find_value(m,"ms"))
if (directory_exists(globalmanager.skindir+skin)) {
    for (i=1;i<global.mskins[0,0];i+=1) if (global.mskins[1+i,0]=skin) global.musicskin=i
}
updatemusic()

skin=string(ds_map_find_value(m,"ls"))
if (directory_exists(globalmanager.moddir+skin)) {
    for (i=1;i<global.lskins[0,0];i+=1) if (global.lskins[1+i,0]=skin) global.levelskin=i
    applylevelpack(skin)
} else applylevelpack(global.lbase)

roomviewshandler()

ds_map_destroy(m)

ta_load()

global.pos=1
return 1

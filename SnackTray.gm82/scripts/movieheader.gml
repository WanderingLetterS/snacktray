///movieheader()
//creates a movie header and returns it

var m,i,str,t;

m=ds_map_create()
t=date_current_datetime()

ds_map_add(m,"ts",0)
ds_map_add(m,"vr",version)
ds_map_add(m,"dt",formatdate(t))
ds_map_add(m,"dv",t)
ds_map_add(m,"gm",global.gamemode)
ds_map_add(m,"mp",global.mplay)
for (i=0;i<global.mplay;i+=1) {
    ds_map_add(m,"n"+string(i),global.charname[global.option[i]])
    ds_map_add(m,"i"+string(i),global.input[i])
    ds_map_add(m,"s"+string(i),global.pskins[1+global.playerskin[i],global.option[i]])

    ds_map_add(m,"p1"+string(i),global.pal_1[i])
    ds_map_add(m,"p2"+string(i),global.pal_2[i])
    ds_map_add(m,"p3"+string(i),global.pal_3[i])
    ds_map_add(m,"p4"+string(i),global.pal_4[i])
}
ds_map_add(m,"ws",global.wskins[1+global.worldskin,0])
ds_map_add(m,"ms",global.mskins[1+global.musicskin,0])
ds_map_add(m,"ls",global.lskins[1+global.levelskin,0])
ds_map_add(m,"ln",global.pos)
ds_map_add(m,"sc",max(1,global.visualstagecount))

for (i=0;i<9;i+=1) ds_map_add(m,"bc"+string(i),settings("contest"+string(i)))
ds_map_add(m,"cogmirror",settings("mirror"))
ds_map_add(m,"cogratchet",settings("ratchet"))
ds_map_add(m,"cograndblock",settings("randblock"))
ds_map_add(m,"coginflives",settings("cog inflives"))

str="|head|"+ds_map_write(m)+"|/head|"
ds_map_destroy(m)

return str

///menu_quickplaylazyload()
randomize()

global.stages=2
global.gamemode="classic"
global.quickplaying=1
global.worldskin=irandom(global.wskins[0,0]-1)
global.musicskin=irandom(global.mskins[0,0]-1)
global.levelskin=irandom(global.lskins[0,0]-1)

global.input[0]=global.memclicc
global.option[0]=getrandomchar()
global.playerskin[0]=irandom(global.pskins[0,global.option[0]]-1)

applylevelpack(global.lskins[1+global.levelskin,0])
applyplayerskin(global.pskins[1+global.playerskin[0],global.option[0]],0,"all",global.option[0])

global.pal_1[0]=(playerskindat(0,"defaultpal10")) //yknow why do all of the settings still have the slot at the end if every skin has a personal skin data map now
global.pal_2[0]=(playerskindat(0,"defaultpal20"))
global.pal_3[0]=(playerskindat(0,"defaultpal30"))
global.pal_4[0]=(playerskindat(0,"defaultpal40"))

var sprayloop, mydat;
sprayloop=2
repeat (3) {
    mydat = playerskindat(0,"reroutepal"+string(sprayloop)+"0")
    if mydat!=0 {
        variable_global_array_set("pal_"+string(sprayloop),0,variable_global_array_get("pal_"+string(mydat),0))
    }
    sprayloop+=1
}

game_start()

///game_start()
//tasks for preparation of a match
var i,j,t;

//global.rand=irandom(65535)
global.rand=0
global.spd=60
global.cheater=0
if global.tasing global.wastasing=1

ta_load()

global.groundbackyoffset=8

i=0
repeat (global.mplay) {
    if (global.option[i]=-1) {
        checkloop=0
        global.option[i]=getrandomchar()
        global.playerskin[i]=irandom(global.pskins[0,global.option[i]]-1)
        applyplayerskin(global.pskins[1+global.playerskin[i],global.option[i]],i,"all",global.option[i])

        global.pal_1[i]=(playerskindat(i,"defaultpal1"+string(i)))
        global.pal_2[i]=(playerskindat(i,"defaultpal2"+string(i)))
        global.pal_3[i]=(playerskindat(i,"defaultpal3"+string(i)))
        global.pal_4[i]=(playerskindat(i,"defaultpal4"+string(i)))

        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(i,"reroutepal"+string(sprayloop)+string(i))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),i,variable_global_array_get("pal_"+string(mydat),i))
            }
            sprayloop+=1
        }
    }
    global.myoption[i]=global.option[i]
    if string(global.currentlevel)!="worldmap" && string(global.currentlevel)!=""{
        stats("times "+global.charname[global.option[i]]+" was used",stats("times "+global.charname[global.option[i]]+" was used")+1)
        settings("save_"+string(global.saveslot)+" player "+string(i)+" option",global.option[i])
    }
    entrypoint="match"
    string_execute(global.charcode[global.option[i]])
    entrypoint=global.gamemode
    string_execute(global.charcode[global.option[i]])

    i+=1
}

if !global.playback global.actually_recording_goddamnit=1

if (global.gamemode="classic" && global.charname[global.option[0]]="kid") {
    global.lifes=0
    global.wanna=1
}
if (global.gamemode="classic" && global.charname[global.option[0]]="bubsy") {
    global.lifes=9
}

if (global.bundled) global.lifes=global.bundlelifes

global.savelifes=global.lifes

for (i=0;i<global.levellist[0];i+=1) global.randstage[i]=global.levellist[i+1,0]
if (global.stages=2) {
    //a durstenfeld shuffle
    for (i=global.levellist[0]-1;i>0;i-=1) {
        j=irandom(i)
        t=global.randstage[i]
        global.randstage[i]=global.randstage[j]
        global.randstage[j]=t
    }
    global.nextlevel=global.randstage[0]
}

for (i=0;i<global.biomes;i+=1) {
    global.biomesloaded[i]=0
    tylerbiomes[i]=0
}

if (!global.lemontest) {
    stats(string(global.mplay)+" player matches",stats(string(global.mplay)+" player matches")+1)
    if (!global.discordoverride)
        discord_update_presence("","Loading a level","boll-icon","dice-icon")
}

roomviewshandler()

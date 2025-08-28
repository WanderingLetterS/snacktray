if (file_exists(global.tasfile)) {
    if (global.reset_on_state_load) {
        if (global.myoption[p2] != -1 && global.myoption[p2] != global.option[p2]) {
            global.option[p2] = global.myoption[p2]
            savedopt=global.option[p2]
            applyplayerskin(global.pskins[1,savedopt],i,"all",savedopt)
            with player {
                if (name="super" || global.charname[other.savedopt]="kid" || global.charname[other.savedopt]="bowser") size=0
                if (super && global.charname[other.savedopt]!="super" && !string_count("$keepsuper",global.leveldesc)) {super=0 size=(size!=0)}
                /* Reset afterimages */ {
                    makeafterimages=0
                    boost=0
                    dash=0
                    maxe=0
                }
                dontdrawdefaulthud=0 //Restore default game HUD before switching

                if (global.gamemode == "classic") { //Handle switching to The Kid and back in Classic Mode.
                    if (global.charname[other.savedopt] == "kid" && !global.wanna) {
                        global.wanna = 1 //Switch to Kid's special mode because alot of his behaviour is hardcoded.
                    } else if (global.charname[other.savedopt] != "kid" && global.wanna) {
                        global.wanna = 0 //Disable I Wanna Mode
                        if (!gamemanager.tick) { //Restore game timer if a level switch happened since.
                            if (global.time >= 600) {
                                global.inftime = 1
                            } else {
                                global.inftime = 0
                                gamemanager.time = (global.time)
                                gamemanager.tick = (((global.time) * 60) + 60)
                            }
                        }
                    }
                    if (global.wanna) {
                        savetas() //Prevent Kid from just being able to reload a savestate into god knows where.
                    }
                }
                charm_init()
                charm_run("start")
            }
        }    
    }
    if (skindat("muspos")!=-1) {if (global.wanna) mus_pause(1) else FMODAllStop()}
    setpos(global.bufpos,global.keylog)
    settings("checkres",1)
    settings("mems",global.s)
    if (global.gamemode="timeattack") {settings("ta_death",settings("ta_death")+1)}
    game_load(global.tasfile)
}

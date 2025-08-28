#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
frame=0
open=0
fc=0
flash=0
t=id
spr=spr_invalidchar
name=""
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (spr != spr_recoverchar && spr != spr_invalidchar) sprite_delete(spr)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var p2,found;
p2=other.p2
open=0 sound("itemdoorclose")
if noswitch {
    noswitch = 0
    exit
}

global.enteredachardoor=1

savedopt=global.option[p2]

if global.myoption[p2] == -1 {
    global.myoption[p2]=savedopt
}


if (name == "reset") {
    if (global.myoption[p2] != -1 && global.myoption[p2] != global.option[p2]) {
        global.option[p2] = global.myoption[p2]
        savedopt=global.option[p2]
        defaultpal=0
        i=1
        repeat (4) {
            if (playerskindat(p2,"defaultpal"+string(i)+string(p2))==variable_global_array_get("pal_"+string(i),p2)) {
                defaultpal+=0.25
            }
            i+=1
        }

        applyplayerskin(global.pbase,p2,"all",savedopt)

        i=1
        if (floor(defaultpal) == 1) repeat (4) {
            variable_global_array_set("pal_"+string(i),p2,playerskindat(p2,"defaultpal"+string(i)+string(p2)))
            i+=1
        }

        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))

            }
            sprayloop+=1
        }

        with pid {
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
    } else {
        ping(lang("game already char"))
    }
} else {
    found=0
    for (j=0;j<global.characters;j+=1) {
        if (name=global.charname[j]) {
            global.option[p2]=j
            found=1
        }
    }
    if found!=1 {
        ping(lang("game where char"))
    } else if (savedopt==global.option[p2]) {
        ping(lang("game already char")) global.option[p2]=savedopt
    } else if (settings("lock "+global.charname[global.option[p2]])) {
        ping(lang("game locked char")) global.option[p2]=savedopt
    } else if (settings(global.charname[global.option[p2]]+" disabled") || settings(global.charname[global.option[p2]]+" broken")) {
        ping(lang("game no char")) global.option[p2]=savedopt
    } else {
        defaultpal=0
        i=1
        repeat (4) {
            if (playerskindat(p2,"defaultpal"+string(i)+string(p2))==variable_global_array_get("pal_"+string(i),p2)) {
                defaultpal+=0.25
            }
            i+=1
        }
            
        applyplayerskin(global.pbase,p2,"all",global.option[p2])
        
        i=1
        if (floor(defaultpal) == 1) repeat (4) {
            variable_global_array_set("pal_"+string(i),p2,playerskindat(p2,"defaultpal"+string(i)+string(p2)))
            i+=1
        }
        
        var sprayloop, mydat;
        sprayloop=2
        repeat (3) {
            mydat = playerskindat(p2,"reroutepal"+string(sprayloop)+string(p2))
            if mydat!=0 {
                variable_global_array_set("pal_"+string(sprayloop),p2,variable_global_array_get("pal_"+string(mydat),p2))
                
            }
            sprayloop+=1
        }
        
        with pid {
            if (name="super" || other.name="kid" || other.name=="bowser") size=0
            if (super && other.name!="super" && !string_count("$keepsuper",global.leveldesc)) {super=0 size=(size!=0)}
            /* Reset afterimages */ {
                makeafterimages=0
                boost=0
                dash=0
                maxe=0
            }
            dontdrawdefaulthud=0 //Restore default game HUD before switching
            
            if (global.gamemode == "classic") { //Handle switching to The Kid and back in Classic Mode.
                if (other.name == "kid" && !global.wanna) {
                    global.wanna = 1 //Switch to Kid's special mode because alot of his behaviour is hardcoded.
                } else if (other.name != "kid" && global.wanna) {
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
    savedopt=-1
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (open) frame=min(2,frame+0.125)
else frame=max(0,frame-0.125)

fc+=1 if (fc=8) {fc=0 flash=!flash}
if !sprite_exists(spr) spr=spr_invalidchar
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (spr != spr_recoverchar && spr != spr_invalidchar) sprite_delete(spr)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (name == "reset") {
    spr = spr_recoverchar
} else {
    if file_exists(global.moddata+"character\"+string(name)+"\"+string(name)+"-basic.png")
        spr=sprite_add(global.moddata+"character\"+string(name)+"\"+string(name)+"-basic.png",0,1,0,0,0)
    else if file_exists(global.workdir+"mods\character\"+string(name)+"\"+string(name)+"-basic.png")
        spr=sprite_add(global.workdir+"mods\character\"+string(name)+"\"+string(name)+"-basic.png",0,1,0,0,0)

    mydoorpalette=replacepalettedoor(global.doorpalettes,string(name))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_tile("chardoor")
if (spr == spr_recoverchar || spr == spr_invalidchar) {
    draw_sprite(spr,0,x-1,y-16)
} else if !frame && sprite_exists(spr) {
    if mydoorpalette!=-2
        scr_applyPaletteSegmented(global.shaderPaletteSwap,global.doorpalettesprites[mydoorpalette+500],SPRAY[1]+1,SPRAY[2]+1,SPRAY[3]+1,SPRAY[4]+1,0)
    draw_sprite_part(spr,0,78,10,18,18,x-1,y-16)
    shader_reset()
}

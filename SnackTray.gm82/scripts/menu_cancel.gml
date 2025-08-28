if (instance_exists(console)) {console.off=1 exit}
if (instance_exists(message)) {message.off=1 exit}

if (room=speciale) with (moranboll) {
    sound("systemreturn")
    dead=1
}

if (room=boot || room=titlescreen || room=title || room=lemon || room=speciale || room=bundlesel) exit

if (room=bundleroster) segafadeto(title,"systemreturn")
else if (room=change) {
    if (global.gamemode="battle") segafadeto(results,"systemreturn")
    else if (global.stagecount>0) segafadeto(scoring,"systemreturn")
    else segafadeto(titlescreen,"systemreturn")
} else if (room=game) {
        if (global.playback) {segafadeto(replays) with segafade {slow=1 forcefade=1}}
} else {
    if (room=scoring || room=finalscore) {
        if (global.gamemode="battle") segafadeto(results,"systemreturn")
        else segafadeto(titlescreen)
    }
    if (room=results) {
        if (global.playback) segafadeto(replays,"systemreturn")
        else segafadeto(titlescreen)
    }
    if (room=mainmenu) segafadeto(title,"systemreturn")
    if (room=options && !instance_exists(keyconfig)) {saveopt() segafadeto(mainmenu,"systemreturn")}
    if (room=replays || room=modloader || room=trophies || room=ta_results || room=ta_roster) segafadeto(mainmenu,"systemreturn")
    if (room=roster) {if (rosterctrl.cog) {sound("systemreturn") rosterctrl.cog=0} else if (global.bundled) segafadeto(title,"systemreturn") else segafadeto(mainmenu,"systemreturn")}
    if (room=stagesel) segafadeto(roster,"systemreturn")
    if (room=ta_menu) segafadeto(ta_roster,"systemreturn")
}

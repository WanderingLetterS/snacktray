mus_pause(0)
pause=0 plock=1
room_speed=global.spd
if pausespr!=spr_pausesprblank sprite_delete(pausespr) pausespr=-1
instance_activate_all()
activation_update()

if (!global.discordoverride) {
    if global.lemontest {discord_update_presence("Playing as "+playerskinstr(top,"name"+string((top))),"Testing Level ("+string(global.levelname)+")","boll-icon","lemon-icon")}
    else if global.movie=1 {discord_update_presence("Player is "+playerskinstr(top,"name"+string((top))),"Watching replay on ("+string(global.levelname)+")","boll-icon","movie-icon")}
    else if global.gamemode="timeattack" {discord_update_presence("Playing as "+playerskinstr(top,"name"+string((top))),"Playing Time Attack on ("+string(global.levelname)+")","boll-icon","timeattack-icon")}
    else {discord_update_presence("Playing as "+playerskinstr(top,"name"+string((top))),"In Game ("+string(global.levelname)+")","boll-icon","")}
}

with (moranboll) {
    instance_deactivate_all(1)
    instance_activate_object(globalmanager)
    instance_activate_object(gamemanager)
    instance_activate_object(bgmanager)
    instance_activate_object(credmode7)
    instance_activate_object(credctrl)
    instance_activate_object(lemongrab)
    instance_activate_object(runes)
    instance_activate_object(moranparent)
    instance_activate_object(green_demon)
    instance_activate_object(global.screen_manager)
}

external_call(global.dll_disablesave)
global.powersave=0
with (timecounter) sound("systemtimecount",1)
with (player) if (soundinst) FMODInstanceSetPause(soundinst,0)

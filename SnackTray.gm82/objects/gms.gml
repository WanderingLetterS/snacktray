#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (system_prestart()) event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dllinit39()
FMODInit()

//dont ask why im so in-depth about finding a damn boot sound every time i just want the game to work

readme_modding()
global.b8=FMODSoundAdd(working_directory+"\"+global.moddata+"media\bootsound.ogg") //Grab boot sound from data folder.

if (!global.b8) { //If that fails, grab boot sound from cache.
    global.b8=FMODSoundAdd(working_directory+"\save\cache\media\bootsound.ogg")
}

if (!global.b8) { //If that also fails, explode and die.
    show_message("Unexpected error.##The game will now close.")
    global.kill=1
    game_end()
}


FMODSoundPlay(global.b8,0)

instance_create(round(room_width/2),0,captain)

instance_create(0,0,globalmanager)

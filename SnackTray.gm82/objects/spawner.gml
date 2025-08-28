#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
game_stagestart()

if (global.mplay=2) if (playerskinstr(0,"name0")="Luigi" && playerskinstr(1,"name1")="Mario" && !settings("hm")) {
    settings("hm",1)
    FMODAllStop()
    splash_set_close_button(0)
    splash_set_cursor(0)
    splash_show_video(global.cache+"media\hm.wmv",0)
}

if instance_exists(runes) with (runes) instance_destroy()

instance_create(0,0,gamemanager)

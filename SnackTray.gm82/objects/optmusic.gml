#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over) {
    mm=settings("menumusic")
    if (mm!="") neweroptions.str=lang("tip optmusic2")+mm
    else neweroptions.str=lang("tip optmusic")
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("systemselect")

if (settings("menumusic")!="") {
    settings("menumusic","")
    menumusic()
} else {
    fn=get_open_filename("Digital Audio Files|*.ogg;*.wav;*.mp3;*.mp2;*.aif;*.aiff;*.flac;*.asf;*.wma|Sequenced Audio Files|*.mod;*.xm;*.it;*.s3m;*.mid","")
    if (file_exists(fn)) {
        FMODAllStop()
        if (replaceogg("options",fn)) {
            settings("menumusic",fn)
            menumusic()
        }
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over+2*(settings("menumusic")!=""),x,y)

over=0

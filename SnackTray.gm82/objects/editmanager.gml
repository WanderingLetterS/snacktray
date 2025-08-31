#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_number(editmanager)>1) instance_destroy()

instance_create(0,0,editcursor)
instance_create(x,y,drawregion)
instance_create(0,0,tooltiplayer)

if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","cog-icon")}

if !(settings("nolemonmusic")) {
    if (egg()) mus_play("_optionsc",1)
    else menumusic()
}

undocount=global.undocount
picked=-1

loadlemontabs(0)

winding=FMODSoundAdd(environment_get_variable("windir")+"\Media\Windows Ding.wav",0) //winding gaster

global.shards=0

autosave=""

autosave=global.savedir+"autosave.lemon"
if global.modded autosave=global.savedir+"autosave_"+global.addler+".lemon"

if (settings("edit autosave")) alarm[0]=3600

alarm[1]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///autosave
if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)) {
    alarm[0]=2
    exit
}

with (objcontainer) if (selected) {
    other.alarm[0]=2
    exit
}

with (watercontainer) if (selected) {
    other.alarm[0]=2
    exit
}

with (semicontainer) if (selected) {
    other.alarm[0]=2
    exit
}

with (backcontainer) if (selected) {
    other.alarm[0]=2
    exit
}

alarm[0]=3600

if (fake_autosave) {
    editfakesave(autosave)
    fake_autosave = 0
} else {
    editsave(autosave)
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lemontest) {
    lemonloader("test")
    if (bufferexists(global.lemonbuffer)) {
        freebuffer(global.lemonbuffer)
    }
    settings("mirror",settings("mirrormem"))
    settings("ratchet",settings("ratchetmem"))
    settings("randblock",settings("randblockmem"))
    global.bundled=0
    editloadregion(global.lemonregion)
    drawregion.viewx=global.lemonviewx
    drawregion.viewy=global.lemonviewy
    drawregion.unchanged=global.lemonchanged
    editzoom.level=global.lemonzoom
    editzoom.levelgo=global.lemonzoom
    global.lemontest=0

    with (drawregion) {
        //UPDATE_THE_DEITIES=1
        event_user(7)
    }
} else {
    draw_clear_alpha(0,1)
    applyworldskin(global.wskins[1,0])
    applyplayerskin(global.pbase,0,"all",0)
    editnew(2)
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
undocount=1
while (file_exists(global.tempdir+"undo"+string(undocount)+".gms")) {
    file_delete(global.tempdir+"undo"+string(undocount)+".gms")
    undocount+=1
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODSoundFree(winding)

if (global.lemontest) {
    global.undocount=undocount
}

if (!global.lemontest && !global.kill) {
    undocount=1
    global.undocount=0

    while (file_exists(global.tempdir+"undo"+string(undocount)+".gms")) {
        file_delete(global.tempdir+"undo"+string(undocount)+".gms")
        undocount+=1
    }
    game_reset()
    instance_activate_all()
    with (objcontainer) instance_destroy()
    with (watercontainer) instance_destroy()
    with (semicontainer) instance_destroy()
    with (backcontainer) instance_destroy()
    FMODAllStop()
}

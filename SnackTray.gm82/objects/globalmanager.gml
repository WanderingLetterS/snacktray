#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
appsurf=-1
dequanto=-1
gframe=0
frames=0
graphi=0
frame8=0
fastframe=0
framefire=0
frameitem=0
volkill=1
fadekill=0
errorstate=0
started=0
musfade=0
screenshot=0
handle=-1
updateeverything=0
lastlemonlskin="None"


with (globalmanager) {
    if (id!=other.id) other.dontstart=1
}
if dontstart {variablethatmakesglobalmanagernotcrashtheentiregamewhenitdestroysitselfsothatnewglobalmanagersthatshouldntbetheredontcrashthegamewhengettingridofthem=1 instance_destroy()} else system_start()


instance_create(0,0,obj_networkcontroller)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variablethatmakesglobalmanagernotcrashtheentiregamewhenitdestroysitselfsothatnewglobalmanagersthatshouldntbetheredontcrashthegamewhengettingridofthem {
    error("A second Global Manager object was created.##Please check your code for missing objects.")
    stats("managers cloned", stats("managers cloned")+1)
    exit
}

if (global.developer) show_message("Global Manager has been destroyed, the game will now crash.")
global.globalmanagerdiedlmfao=1
system_crash()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fix resolution after resize
viewhandler(1)
scheduled_clear=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///timed dll updates
var num,i,name;

alarm[2]=15

global.focus=(external_call(global.dll_foc)==global.winhandle)

//drag and drop detection
if (room==lemon || room==speciale) {
    num=external_call(global.dll_dragnum,global.winhandle)
    if (num) {
        for (i=0;i<num;i+=1) {
            name=external_call(global.dll_dragname,global.winhandle,i)
            if (file_exists(name)) {
                if (room==lemon) {
                    if (filename_ext(name)==".png") {
                        if (!drawregion.flooding) {
                            //load lemon file
                            editload(name)
                        }
                    }
                } else if (room==speciale) {
                    if (filename_ext(name)==".txt") {
                        if (!instance_exists(moranboll)) {
                            //load special stage
                            specialeload(name)
                        }
                    }
                }
            }
        }
        external_call(global.dll_dragclear)
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_activate_object(obj_networkcontroller)
instance_activate_object(obj_otherpc)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_activate_object(obj_networkcontroller)
instance_activate_object(obj_otherpc)
system_step()

instance_activate_object(obj_networkcontroller)
instance_activate_object(obj_otherpc)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
backcol=roomcolor()
if (window_get_color()!=backcol) window_set_color(backcol)

if (room=mainmenu && !settings("notice_first")) {settings("notice_first",1) if (!global.gamemaker) ping(lang("first"))}
if ((room=roster || room=ta_roster) && !settings("notice_roster")) {settings("notice_roster",1) if (!global.gamemaker) ping(roomtip())}
if (room=stagesel && !settings("notice_stage")) {settings("notice_stage",1) if (!global.gamemaker) ping(roomtip())}
if (room=ta_menu && !settings("notice_attack")) {settings("notice_attack",1) if (!global.gamemaker) ping(roomtip())}
if (instance_exists(gamemanager)) if (!global.playback && !settings("notice_ingame")) {settings("notice_ingame",1) if (!global.gamemaker) ping(roomtip())}

if (room=game) {external_call(global.dll_disablesave) global.powersave=0}
else if (!global.powersave) {global.powersave=1 external_call(global.dll_enablesave)}

if (room=lemon || room=speciale) external_call(global.dll_dragaccept,global.winhandle,1)

crash_detect=0
set_caption(gametitle)
windowhandler()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.lastroom=room
fixview=1
global.inputwait=4

if (room=lemon || room=speciale) {
    external_call(global.dll_dragaccept,global.winhandle,0)
    external_call(global.dll_dragclear)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)

screen_draw()

drawdebughud()

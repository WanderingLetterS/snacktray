#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=0
image_index=0
alarm[0]=2
sprite_index=spr_kooparedsmb3
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODAllStop()
with globalmanager {
    strmhandle=FMODSoundAdd(global.cache+"media\optionsold.ogg",1)
    FMODSoundSetGroup(strmhandle,1)
    FMODSoundLoop(strmhandle,0)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade
{
image_alpha += 0.05
}
if (!lok) {
    if (advance() || anykey()) {
        if (!clicc) {
            clicc=1
            lok=1
            FMODAllStop()
            segafadeto(bundlesel)
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

draw_sprite(spr_goombasmb3,global.greenmode,x,y)
draw_self()

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=max(FMODSoundGetLength(ds_map_find_value(globalmanager.mushandles,"gameover"))/16,180)
alarm[1]=120
savemovie()

go=0
lock=0

alpha=!skindat("gameoverfade")

mus_play("gameover",0)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
segafadeto(titlescreen)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lock) exit

alpha=min(1,alpha+0.02)

if (go) {
    if (keyboard_check(vk_enter) || gamemanager.deathplayer.akey) {
        segafadeto(titlescreen)
        lock=1
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(skindat("tex_gameover"),0,view_xview[0],view_yview[0],1,1,0,$ffffff,alpha)

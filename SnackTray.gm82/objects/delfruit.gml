#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mus_play("_reset")
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(x-player.x)<4 && !del && inview()) {
    del=1
    sound("systemdel")
    vspeed=6
    alarm[1]=200
}

delfr2+=0.1
if delfr2 >=1
{
delfr+=1
delfr2=0
}

if delfr >=2
{
delfr=0
delfr2=0
}

if (del) with (instance_place(x,y,player)) hurtplayer("delfruit")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_self()
ssw_objects("delfruit")

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.1
vspeed=-3
sprite_angle=0
c=4

frame=0
frspd=1
name="giana"
sprite="die"
alpha=1
rotate=0

alarm[1]=300
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
if (rotate) {
    c-=1
    if (!c) {c=4 sprite_angle-=16 xsc+=0.05*sign(xsc) ysc+=0.05}
}

spriteswitch(1)

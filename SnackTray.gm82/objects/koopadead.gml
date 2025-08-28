#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
alarm[0]=120
xsc=1
ysc=1
vspeed=-2
hspeed=1
gravity=0.15
frspd=1

flip=1
sprite="shelldead"
#define Alarm_0
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
vspeed=min(vspeed,3)
animated=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite=type+"dead"
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)

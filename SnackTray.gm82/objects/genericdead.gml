#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
xsc=1
ysc=1
frspd=1
if !nomove{
gravity=0.2}
type=""
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
if !nomove{
vspeed=min(vspeed,3)}
if nomove{
gravity=0}
if !onlyonce{
alarm[0]=timetodie
onlyonce=1
}
sprite=type

animated=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)

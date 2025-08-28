#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vsp=-2
frame=0
sprite="thwomp"
enemy2=true
xsc=1
ysc=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vsp+=0.2
if (vsp>6) {vsp=6}
y+=vsp
if !inview() instance_destroy()
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

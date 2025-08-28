#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

grav=0.1
hspeed=-0.5
xsc=1
type=0
sprite="paratroopa"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp<=-1) {hp=0 sprite="koopa" instance_change(koopa,0)}

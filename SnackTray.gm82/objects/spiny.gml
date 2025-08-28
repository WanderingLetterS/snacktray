#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

var near;

near=instance_nearest(x,y,player)

if (near) hspeed=0.5*esign(near.x-x,-1)
else hspeed=-0.5

type=-2

lakited=0

sprite="spiny"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if underwater() {instance_destroy()  water_splash(1) eg=instance_create(x,y,spinyeggwater) eg.ystart=y eg.vspeed=vspeed eg.hspeed=hspeed}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((!inview() && lakited) || pitdeath()) instance_destroy()
else event_inherited()

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=0
xsc=1
ysc=1
sprite="spinyegg"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !underwater() {instance_create(x,y-8,spinyegg) instance_destroy()}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trap) {
    my=y
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    ystart+=y-my
} else {
    s=(s+1) mod 360
    y=ystart+3+round(lengthdir_y(3,s))
    ystart+=vspeed
    hspeed*=0.99
    vspeed*=0.9
}
animated=0

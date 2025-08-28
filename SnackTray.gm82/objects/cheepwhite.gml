#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
osc=(myrand(1)>0.5)
xsc=1
active=1
sprite="greencheep"
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animated=0
if (!inview()) instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else {
    xsc=1
    x-=0.25 if (osc) {
    osco+=1 if (osco>200) y+=0.125 else y-=0.125 if (osco=400) osco=0
    }
    y=max(y,40)
}

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=0

xsc=1
type=1
enemy2=1
sprite="yelparatroopa"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp<=-1) {hp=0 hspeed=xsc*-0.75 paramode=1 sprite="yelkoopa" enemy2=1 instance_change(yelkoopa,0)}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
if (trap) {
    my=y
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    xstart+=x-my
} else {
    s=(s+1) mod 360
    x=xstart+50+round(lengthdir_x(50,s))
    ys=(ys+2.25) mod 360
    y=ystart+(50+round(lengthdir_y(50,ys)))/4
}

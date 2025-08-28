#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
gravity=0.037

hp=-2
sprite="cheepfly"
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
}

if (!inview()) instance_destroy()
animated=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=3+myrand(1.5)
p=instance_nearest(x,y,player)
direction=median(70,point_direction(x,y,mean(p.x+p.hsp*20,x),p.y-32),110)
if (!myrand(3)) direction=70+myrand(40)

xsc=esign(-hspeed,1)

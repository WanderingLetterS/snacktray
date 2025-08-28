#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
osc=(myrand(1)>0.8)
xsc=1
active=1
sprite="fishbones"
targeting=0
enemy2=1
image_xscale=2
hspeed=-0.5
fuckinggo=1
speed=0
turncount=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
targeting=2
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animated=0
if (!inview()) instance_destroy()

if fuckinggo=1
{
hspeed=-0.5
fuckinggo=0
}
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
    if targeting=0
    {
    if (osc) {
    osco+=1 if (osco>200) y+=0.125 else y-=0.125 if (osco=400) osco=0
    }
    }
    y=max(y,40)
}

tar=nearestplayer()
if distance_to_point(tar.x,tar.y) < 100 && targeting=0
if !(x > tar.x && xsc=-1 || x < tar.x && xsc=1)
{
if nearestplayer().x > x xsc=-1
if nearestplayer().x < x xsc=1
if  xsc=1
sprite_angle=point_direction(x,y,nearestplayer().x,nearestplayer().y)-180
else
sprite_angle=point_direction(x,y,nearestplayer().x,nearestplayer().y)
move_towards_point(nearestplayer().x,nearestplayer().y,speed)
speed=0
alarm[0]=50
sprite="fishbonesattack"
targeting=1
hspeed=0
}

if targeting=2
if gravity=0
if speed < 2 speed+=0.2

if place_meeting(x,y,collider) && targeting=2 || place_meeting(x,y+vspeed,collider) && vspeed > 0 && gravity!=0
{
enemydie(id)
}

image_angle=sprite_angle

if targeting=0
turnaround()

    if targeting=0
    {
    if (turncount) turncount-=1
    else {
        oxsc=xsc
        if (!revive) if hspeed!=0 xsc=-esign(hspeed,-1)
        if (xsc!=oxsc) turncount=10
    }
}

if !underwater()
{
if gravity=0
{
water_splash(1)
speed=4
gravity=0.1
}
}

if underwater() && vspeed > 0 && targeting=2 && gravity!=0
{
tunoffgravitybitch=1
hspeed=-0.5*xsc
water_splash(0)
targeting=0
}


if targeting=0
{
sprite_angle=0
}

if tunoffgravitybitch=1
if gravity!=0
gravity-=0.1

image_angle=sprite_angle

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
decaytimer = 600
if (nearestplayer().x>x) {xsc = -1} else {xsc = 1}
ysc=1

active=1

enemy2=1
sprite="bullseyebullet"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
enemy_animate()

if (!lone) && decaytimer > 0 {
    minx=verybignumber
    maxx=0

    for (i=0;i<global.mplay;i+=1) {
        maxx=max(maxx,view_xview[i]+view_wview[i]+48)
        minx=min(minx,view_xview[i]-48)
    }

    if (x<minx || x>maxx) instance_destroy()
    if (abs(x-xstart)>16) depth=0
}

if decaytimer > 0
{
decaytimer -= 1
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    if (lone) {
        if (inview()) {
            active=1
        }
    }
}
event_inherited()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
near=nearestplayer()

if decaytimer > 0 {
    dir = point_direction(x,y,near.x,near.y)
    if dir>180 && image_angle<90 {dir-=360}
    if image_angle<0 image_angle+=360
    image_angle=inch(image_angle,dir,4)
    direction = image_angle
    speed = 1.5
    sprite_angle=direction
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lone=1
depth=0
xsc=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//flip over
xsc=-1

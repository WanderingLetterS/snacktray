#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
phase=-1
phasec=0
wakehit=0
xsc=-1
ysc=1
hp=0
carry=0
turncount=0
active=1
orbit_speed = 5;
orbit_angle = 0;

x+=8
y+=8
sprite_index = spr_orbinaut
o = instance_create(x,y,orbispikyball)
o.orbit_offset = 0
o.orbit_source = id
o.throw = true
mychildren[0]=0;

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 90
o.orbit_source = id
o.throw = true
mychildren[1]=0;

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 180
o.orbit_source = id
o.throw = true
mychildren[2]=0;

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 270
o.orbit_source = id
o.throw = true
mychildren[3]=0;

hspeed = -0.25
gravity = 0
canthrow = false

alarm[0] = 60
enemy2=1
sprite = "blueorbinaut"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
canthrow = true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orbit_angle = wrap_val(orbit_angle,0,360)
orbit_angle += orbit_speed

if xsc == 1
{
    if (nearestplayer().x-x)>-256 && nearestplayer().x-x<0
    inrange = true;
    else
    inrange = false;
}
else
{
    if (nearestplayer().x-x)<256 && (nearestplayer().x-x)>0
    inrange = true;
    else
    inrange = false;
}

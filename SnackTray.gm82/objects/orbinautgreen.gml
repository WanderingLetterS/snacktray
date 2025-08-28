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
orbit_angle = 0;
orbit_speed = 5;

x+=8
y+=8

sprite_index = spr_orbinaut
o = instance_create(x,y,orbispikyball)
o.orbit_offset = 0
o.orbit_source = id
mychildren[0]=o

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 90
o.orbit_source = id
mychildren[1]=o

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 180
o.orbit_source = id
mychildren[2]=o

o = instance_create(x,y,orbispikyball)
o.orbit_offset = 270
o.orbit_source = id
mychildren[3]=o

hspeed = -0.25
gravity = 0
enemy2=1
sprite="greenorbinaut"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orbit_angle = wrap_val(orbit_angle,0,360)
orbit_angle += orbit_speed

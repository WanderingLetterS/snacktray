#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
orbit_length = 12
orbit_offset = 0
fr = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inview())
{
    instance_activate_object(orbit_source);
    visible = 1;
}
else visible = 0;
// ^ kind of just bruteforcing it lol

if !instance_exists(orbit_source) && inview()
{
instance_destroy();
}

//orbinaut optimization rework
if orbit_source.xsc == -1 {
x=(orbit_source.x + lengthdir_x(orbit_length, orbit_source.orbit_angle+orbit_offset))
y=(orbit_source.y + lengthdir_y(orbit_length, orbit_source.orbit_angle+orbit_offset))
}else {
x=(orbit_source.x + lengthdir_x(orbit_length, -(orbit_source.orbit_angle+orbit_offset) ))
y=(orbit_source.y + lengthdir_y(orbit_length, -(orbit_source.orbit_angle+orbit_offset) ))
}

if (phase) {if (!place_meeting(x,y,phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}

fr = wrap_val(fr,0,3)

fr=fr+0.2
frame=floor(fr)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.id=phase) || !(visible) exit
with (other) {
    if (flash || hurt || piped || super || invincible()) other.phase=id
    else hurtplayer("fire")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("otherfireball")

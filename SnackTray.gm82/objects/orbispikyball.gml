#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
orbit_speed = 5
orbit_length = 12
orbit_offset = 0
fr = 0
throw = false
gothrown = false
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
else {
    if (gothrown) {
        instance_destroy();
    }
    visible = 0;
}
// ^ kind of just bruteforcing it lol

if !instance_exists(orbit_source) && inview()
{
instance_destroy();
}

//orbinaut optimization rework
if !(gothrown)
{
if orbit_source.xsc == -1 {
    x=(orbit_source.x + lengthdir_x(orbit_length, orbit_source.orbit_angle+orbit_offset))
    y=(orbit_source.y + lengthdir_y(orbit_length, orbit_source.orbit_angle+orbit_offset))

    if wrap_val(round(orbit_source.orbit_angle-orbit_offset),0,360) >= 270 && (throw) && (orbit_source.canthrow == true) && (orbit_source.inrange == true)
    {
        hspeed = 1
        gothrown = true
        orbit_source.canthrow = false
        orbit_source.alarm[0] = 60
    }

}else {
    x=(orbit_source.x + lengthdir_x(orbit_length, -orbit_source.orbit_angle+orbit_offset))
    y=(orbit_source.y + lengthdir_y(orbit_length, -orbit_source.orbit_angle+orbit_offset))

    if wrap_val(round(orbit_source.orbit_angle-orbit_offset),0,360) <= 100 && wrap_val(round(orbit_source.orbit_angle-orbit_offset),0,360) >= 90 && (throw) && (orbit_source.canthrow == true) && (orbit_source.inrange == true)
    {
        hspeed = -1
        gothrown = true
        orbit_source.canthrow = false
        orbit_source.alarm[0] = 60
    }

}

}

fr = wrap_val(fr,0,3)

fr=fr+0.2
frame=floor(fr)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(visible) exit

if (other.flash || other.hurt || other.piped || other.id=phase) exit

with (other) {
    if (spinjump && vsp>0) {
        vsp=-3-ckey*1.5
        instance_create(x,y+14,kickpart)
        playsfx(name+"spinbounce")
        other.phase=id
        exit
    } else {
        if (flash || hurt || piped || invincible()) exit
    }
}

if (other.power_lv<2) && !(other.star) with (other) hurtplayer("spike")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("spikyball")

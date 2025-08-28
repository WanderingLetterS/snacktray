#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
orbit_length = 12
orbit_offset = 0
frame=4
frspd = 0
bump=0
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

if orbit_source.xsc == -1 {
x=(orbit_source.x + lengthdir_x(orbit_length, orbit_source.orbit_angle+orbit_offset))
y=(orbit_source.y + lengthdir_y(orbit_length, orbit_source.orbit_angle+orbit_offset))
}else {
x=(orbit_source.x + lengthdir_x(orbit_length, -orbit_source.orbit_angle+orbit_offset))
y=(orbit_source.y + lengthdir_y(orbit_length, -orbit_source.orbit_angle+orbit_offset))
}

if !bump
{
frspd = 0
frame=approach_val(frame,4,0.25)
}

if bump
{
bump=0
frame=0
frsp=0
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(visible) exit;

if other.bumpercollision
{
    with other
    {
        bumpdir=point_direction(x,y,other.x,other.y)
        hsp=lengthdir_x(-bumperpower*2,bumpdir)
        vsp=lengthdir_y(-bumperpower*2,bumpdir)
        if(name="kid")hyperspeed=lengthdir_x(-bumperpower*2,bumpdir)
        jump=1

        sprung=0
        crouch=0
        rise=0
        fall=0
        upper=0
        spindash=0
        lookup=0
        slide=0
        spindash=0
        spin=0
        bellyslide=0
        slidekick=0
        pound=0
        insted=0
        fly=0
        teleport=0
        canstopjump=0
        spin=0
    }
    sound("smallbumper")
    frame=0
    bump=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("bumperball")

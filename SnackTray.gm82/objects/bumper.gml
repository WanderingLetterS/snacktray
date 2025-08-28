#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
bump=0
y+=8
x+=8
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type="0"
{
mask_index=bumper_mask

if !bump
{

if frame!=1
frsp+=0.01
else
frsp+=0.5

if frsp=1
{
frsp=0
if frame!=1
frame+=1
else
frame=0
}

}

if bump
{

if elpp=0.5
if frame!=3
{
frame+=1
elpp=0
}
else
{
bump=0
frame=0
frsp=0
elpp=0
}



elpp+=0.1

}
}

if type="1"
{
mask_index=sonicbumper_mask

if !bump
{
frspd = 0
frame=0
}

if bump
{
bump+=1

if frame!=2
{
frame+=1
elpp=0
}
else
{
bump=0
frame=0
frsp=0
elpp=0
}
}
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.bumpercollision
{
with other
{
bumpdir=point_direction(x,y,other.x,other.y)
hsp=lengthdir_x(-bumperpower,bumpdir)
if(name="kid") hyperspeed=lengthdir_x(-bumperpower*3,bumpdir)
}

if type="1" {
    with other {
        vsp=lengthdir_y(-bumperpower,bumpdir)
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
    frame=1
}

if type="0" {
        with other {
        vsp=lengthdir_y(-bumperpower*1.5,bumpdir)
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
    sound("bigbumper")
    frame=2
}

bump=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.type="0"
ssw_objects("bumper")

if other.type="1"
ssw_objects("bumpersmall")

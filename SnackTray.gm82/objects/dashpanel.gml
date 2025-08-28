#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(instance_create(x,y,ground))image_xscale = 2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(saveplayerid)
{
    with(saveplayerid)
    {
    makeafterimages=0
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(other)
{
//hsp=sign(xsc)*maxspd*1.25
makeafterimages=1
boosted=1
boostvar=0.75
other.saveplayerid = id
gm8exspd=4*sign(hsp)
if name == "kid" hyperspeed=10*sign(hyperspeed)
}
alarm[0]=10
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("dashpanel")

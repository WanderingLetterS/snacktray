#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

active=1
enemy2=1
sprite="boo"

damage_player_on_contact=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
if !(nearestplayer().xsc=-1 && xsc=-1) || (nearestplayer().xsc=1 && xsc=1)
{
sprite="boo"
move_towards_point(nearestplayer().x,nearestplayer().y,speed)
speed=0.5
}
if (nearestplayer().xsc=-1 && xsc=-1) || (nearestplayer().xsc=1 && xsc=1)
{
sprite="booscared"
speed=0
}
}
event_inherited()

//poo
if nearestplayer().x > x xsc=-1
if nearestplayer().x < x xsc=1

if sprite="booscared"
{
speed=0
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=-0.25
brat=0
enemy2=1
sprite="crabmeat"
yoff=-3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
schuttimer+=0.1


if schuttimer=20{
    hspeed=0
    if inview()
    {
    with (instance_create(x,y-10,crabfireball)) {xsc=other.xsc hspeed=xsc}
    with (instance_create(x,y-10,crabfireball)) {xsc=-other.xsc hspeed=xsc}
    }
    sprite="crabmeatshoot"
} else if schuttimer=25{
    hspeed=0.25*xsc
    schuttimer=0
    sprite="crabmeat"
}
animated=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)

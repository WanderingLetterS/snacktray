#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
hspeed = -0.5
mode="0"
enemy2=1
sprite="bombstand"
ignitetimer = 120
x+=8

damage_player_on_contact = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mode == "1"
{
hspeed = 0
xsc = 1
if !ignite
{
sprite = "bombstand"
}
}

if mode == "0"
{
if !ignite
{
sprite = "bombwalk"
}
}

if (abs(nearestplayer().x-x)<64) && (abs(nearestplayer().y-y)<96)
{
ignite = 1
}

if (ignite)
{
if !(splay)
{
sound("enemybombfuseshort")
splay = 1
}
hspeed = 0
sprite = "bombignite"
ignitetimer = approach_val(ignitetimer,0,1)
}


if ignitetimer=0 event_user(4)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.id=phase) exit

if (other.star){
    sound("enemykill")
    coll=other.id
    doscore_p(2000)
    instance_create(x,y,smoke)
    instance_destroy()
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("enemyexplode")
i=instance_create(x+4,y+8,bombfireball) with(i){xsc=1 hspeed=-3 vspeed=-3}
i=instance_create(x+12,y+8,bombfireball) with(i){xsc=-1 hspeed=3 vspeed=-3}
i=instance_create(x+4,y+12,bombfireball) with(i){xsc=1 hspeed=-1.75 vspeed=-2.5}
i=instance_create(x+12,y+12,bombfireball) with(i){xsc=-1 hspeed=1.75 vspeed=-2.5}
i=instance_create(x+4,y+4,bombfireball) with(i){xsc=1 hspeed=-1 vspeed=-4.25}
i=instance_create(x+12,y+4,bombfireball) with(i){xsc=-1 hspeed=1 vspeed=-4.25}

enemydie(id)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
alarm[0]=48
xsc=1
ysc=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,collider) {alarm[0]=2 exit}

if (enem) {i=instance_create(x,y,content) i.active=1 i.hspeed=abs(i.hspeed)*-xsc if (content=shell) {i.lone=1 i.type=string(type)} if content=piranha loose=1 } else {


    i=instance_create(x,y,content)
    i.c=1
    i.alarm[0]=-1
    mygrav.carry=i

    if(content==mushroom || content=mushpoison || content=lifemush|| content=mushmini||content=starman) i.hspeed=-xsc
}
if content=sprong
i.target=target //used for sprongs and stuffs
i.powner=powner
instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !enem && !object && alarm[0]>1 && !mygrav alarm[0]=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (enem){
    enemy_spritechange()
    enemy_animate()
    ssw_enemy(sprite)}
else if object{
    ssw_objects(sprite)
} else
    ssw_items(sprite)

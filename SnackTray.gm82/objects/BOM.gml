#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30
getregion(x)
alarm[1]=6
sound("enemyexplode")
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame+=1
alarm[1]=6
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
owner=nearestplayer()
if frame >=5
visible=0

coll = instance_place(x,y,brick)
if (coll) {
with (coll)
{
sound("itemblockbreak")
instance_destroy();
 i=instance_create(x+4,y+12,part) with(i){type=(6*other.biggie) hspeed=-1 vspeed=-1+2*go}
 i=instance_create(x+12,y+12,part) with(i){type=(6*other.biggie) hspeed=1 vspeed=-1+2*go}
 i=instance_create(x+4,y+4,part) with(i){type=(6*other.biggie) hspeed=-1 vspeed=-3+2*go}
 i=instance_create(x+12,y+4,part) with(i){type=(6*other.biggie) hspeed=1 vspeed=-3+2*go}
 }
}

coll=instance_place(x,y,hittable)
if (coll) {
hitblock(coll,owner,1,-1,0)
}

collhb = instance_place(x,y,hardblock)
if (collhb) {
with (collhb)
{
instance_destroy();
 i=instance_create(x+4,y+12,part) with(i){type=4 hspeed=-1 vspeed=-1+2*go}
 i=instance_create(x+12,y+12,part) with(i){type=4 hspeed=1 vspeed=-1+2*go}
 i=instance_create(x+4,y+4,part) with(i){type=4 hspeed=-1 vspeed=-3+2*go}
 i=instance_create(x+12,y+4,part) with(i){type=4 hspeed=1 vspeed=-3+2*go}
 }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.flash || other.hurt || other.piped || other.star || owner.flash) exit
if (other.super) {
    with other{ knockplayer(id);}
    exit
}

with other hurtplayer("enemy")
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other)
enemydie(id)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part(global.enemysheet2[biome],0,194+47*frame,11,46,46,round(x-23),y-23)

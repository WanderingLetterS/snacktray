#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
owner.myhitbox=noone
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=parent override
*/
#define Collision_hittable
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hitblock(other.id,owner,2,esign((other.y+15)-y,1),0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.x+owner.hsp
y=owner.y+owner.vsp+4+4*!owner.size

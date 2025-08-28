#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=1
ysc=1
sprite="montydig"
enemy2=1
active=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y,montymole) {type="0" vspeed=-5 pop=1 sprite="montypop"}
i=instance_create(x-6,y+16,part) i.hspeed=-1 i.vspeed=-5
i=instance_create(x+6,y+16,part) i.hspeed=1 i.vspeed=-5
i=instance_create(x-2,y+14,part) i.hspeed=-1 i.vspeed=-6
i=instance_create(x+2,y+14,part) i.hspeed=1 i.vspeed=-6

if sprite="montydigup"
instance_destroy()
else
sprite="hole"

sound("itemblockbreak")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y+1,collider) || place_meeting(x,y+1,phaser)
sprite="montydigup"

if distance_to_object(player) < 70 && !active
{
active=1
visible=1
alarm[0]=100
}
animated=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enemy_spritechange()
enemy_animate()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
if active ssw_enemy()

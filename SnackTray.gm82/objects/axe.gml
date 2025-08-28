#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gibaxe()
#define Collision_robochain
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1)
#define Collision_shell
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var next,find;

mybridge=instance_nearest(x,y,bridgeblock)

next=mybridge
do {
    find=next
    with (find) next=instance_position(x+24,y+8,bridgeblock)
} until (!next)

mybridge=find
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit exit;

hit=1
sound("itemaxe")
if real(channelid) != 0 global.channel[real(channelid)] += 1
with (mybridge) event_user(0)
with (instance_nearest(x,y,axewall)) alarm[0]=30
y=-verybignumber
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("axe")

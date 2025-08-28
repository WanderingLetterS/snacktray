#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active=0;
channelid=0;
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(2);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
owner=global.coll
if (!insted) {
    if (owner.fly) owner.vsp=0
    else owner.vsp=1.5
}
if!(wait) {
    wait=13
    tpos=1
    event_user(4)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)// Prevent a negative value.
global.channel[real(channelid2)] = max(0,global.channel[real(channelid1)]-1)
global.channel[real(channelid3)] = max(0,global.channel[real(channelid2)]-1)
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
if real(channelid) {global.channel[real(channelid)] += 1}
if real(channelid2) {global.channel[real(channelid2)] += 1}
if real(channelid3) {global.channel[real(channelid3)] += 1}
alarm[0]=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

draw_background_part_ext(global.masterobjects[biome],344+(16*active),240,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)

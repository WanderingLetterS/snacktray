#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0;
channelid2 = 0;
channelid3 = 0;
masterchannel = 1;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)

if (global.channel[real(channelid3)]) {
    event_user(0)
}
else
{
    event_user(1)
}

if (global.channel[real(channelid)] || global.channel[real(channelid2)]) {
    event_user(2)
}
else
{
    event_user(3)
}


masterchannel=clamp(masterchannel,1,500)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1

global.channel[masterchannel] += 1
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0

global.channel[masterchannel] = max(0,global.channel[masterchannel]-1)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active2) exit;
active2=1

if (global.channel[real(channelid2)]) && !(global.channel[real(channelid)])
masterchannel += 1
if (global.channel[real(channelid)]) && !(global.channel[real(channelid2)])
masterchannel -= 1
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(active2) exit;
active2 = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if !inview() exit;

draw_background_part_ext(global.masterobjects[biome],312+(16*active),240,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)

draw_omitext(x+4,y+5,masterchannel)

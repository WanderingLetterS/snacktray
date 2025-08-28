#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0;
channelid = 0;
channelid2 = 0;
channelid3 = 0;
channelid4 = 0;
activeamount = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)

activeamount=sign(global.channel[real(channelid)])+sign(global.channel[real(channelid2)])+sign(global.channel[real(channelid3)])+sign(global.channel[real(channelid4)])

if (global.channel[real(channelid)]) || (global.channel[real(channelid2)]) || (global.channel[real(channelid3)]) || (global.channel[real(channelid4)])
active = 1
else
active = 0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

draw_background_part_ext(global.masterobjects[biome],184,320,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha);

if global.channel[real(channelid)]
draw_background_part_ext(global.masterobjects[biome],200,320,8,8,x,y,image_xscale,image_yscale,c_white,image_alpha); //top left

if global.channel[real(channelid2)]
draw_background_part_ext(global.masterobjects[biome],208,320,8,8,x+8,y,image_xscale,image_yscale,c_white,image_alpha); //top right

if global.channel[real(channelid3)]
draw_background_part_ext(global.masterobjects[biome],200,328,8,8,x,y+8,image_xscale,image_yscale,c_white,image_alpha); //bottom left

if global.channel[real(channelid4)]
draw_background_part_ext(global.masterobjects[biome],208,328,8,8,x+8,y+8,image_xscale,image_yscale,c_white,image_alpha); //bottom right

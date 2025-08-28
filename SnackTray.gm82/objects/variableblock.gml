#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0;
channelid2 = 0;
counterval = 0;
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

if (global.channel[real(channelid)] || global.channel[real(channelid2)]) {
    event_user(5)
}
else
{
    event_user(6)
}

if (global.channel[real(channelid3)]) {
    counterval=unreal(minvalue,0)
}

if !(unreal(mode,0))
counterval=wrap_val(counterval,unreal(minvalue,0),unreal(maxvalue,0))
else
counterval=clamp(counterval,unreal(minvalue,0),unreal(maxvalue,0))
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
if(!wait) {
    wait=13
    tpos=1
    event_user(4)
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("itemblockbump")
switch mode {
    case "0":
    case "1":
    counterval += 1 break;
    case "2": counterval = irandom_range(unreal(minvalue,0),unreal(maxvalue,0)) break;
}
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1
if (global.channel[real(channelid)]) && !(global.channel[real(channelid2)])
counterval += 1
if (global.channel[real(channelid2)]) && !(global.channel[real(channelid)])
counterval -= 1

if unreal(mode,0)=2
counterval = irandom_range(unreal(minvalue,0),unreal(maxvalue,0))
#define Other_16
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if !inview() exit;

if unreal(mode,0)!=2
draw_background_part_ext(global.masterobjects[biome],280,256,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)
else
draw_background_part_ext(global.masterobjects[biome],296,256,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)

for(i=1; i<string_length(string(counterval))+1; i+=1;) {
if string_length(string(counterval)) == 1
draw_background_part_ext(global.masterobjects[biome],312,256,6,12,x+1,y+dy+2,image_xscale,image_yscale,c_white,image_alpha)

//kill me
if (string_char_at(string(counterval),i)) = "0"
draw_background_part_ext(global.masterobjects[biome],312,256,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "1"
draw_background_part_ext(global.masterobjects[biome],318,256,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "2"
draw_background_part_ext(global.masterobjects[biome],324,256,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "3"
draw_background_part_ext(global.masterobjects[biome],330,256,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "4"
draw_background_part_ext(global.masterobjects[biome],336,256,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "5"
draw_background_part_ext(global.masterobjects[biome],312,268,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "6"
draw_background_part_ext(global.masterobjects[biome],318,268,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "7"
draw_background_part_ext(global.masterobjects[biome],324,268,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "8"
draw_background_part_ext(global.masterobjects[biome],330,268,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
else if (string_char_at(string(counterval),i)) = "9"
draw_background_part_ext(global.masterobjects[biome],336,268,6,12,x+9+(8*i)-(8*string_length(string(counterval))),y+dy+2,image_xscale,image_yscale,c_white,image_alpha)
}

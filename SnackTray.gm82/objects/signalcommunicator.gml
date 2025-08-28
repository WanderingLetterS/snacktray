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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blockbounce()
if (goinup) upwardthrust()
wait=max(0,wait-1)

//i should probably use a switch statement now that this is confirmed to work, but oh god im so scared it's gonna break
if real(logic) == 0{//OR
    if (real(channelid) && global.channel[real(channelid)]) || (real(channelid2) && global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else
    {
        if override event_user(4)
        else
        event_user(2)
    }
}
else if real(logic) == 1{//AND
    if (real(channelid) && global.channel[real(channelid)]) && (real(channelid2) && global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else
    {
        if override event_user(4)
        else
        event_user(2)
    }
}
else if real(logic) == 2{//NOR
    if (real(channelid2) && !global.channel[real(channelid)]) && (real(channelid2) && !global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else
    {
        if override event_user(4)
        else
        event_user(2)
    }
}
else if real(logic) == 3{//NAND
    if (real(channelid) && global.channel[real(channelid)]) ^^ (real(channelid2) && global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else if (real(channelid) && !global.channel[real(channelid)]) && (real(channelid2) && !global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else
    {
        if override event_user(4)
        else
        event_user(2)
    }
}
else if real(logic) == 4{//XOR
    if (real(channelid) && global.channel[real(channelid)]) ^^ (real(channelid2) && global.channel[real(channelid2)])
    {
        if override event_user(2)
        else
        event_user(4)
    }
    else
    {
        if override event_user(4)
        else
        event_user(2)
    }
}
else if real(logic) == 5{//XNOR
    if (real(channelid) && global.channel[real(channelid)]) ^^ (real(channelid2) && global.channel[real(channelid2)])
    {
        if override event_user(4)
        else
        event_user(2)
    }
    else
    {
        if override event_user(2)
        else
        event_user(4)
    }
}
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
    override = !override
    if !(active)
    {
        event_user(4)
    }else{
        event_user(2)
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[real(channelid3)] = max(0,global.channel[real(channelid3)]-1)// Prevent a negative value.
global.channel[real(channelid4)] = max(0,global.channel[real(channelid4)]-1)
global.channel[real(channelid5)] = max(0,global.channel[real(channelid5)]-1)
global.channel[real(channelid6)] = max(0,global.channel[real(channelid6)]-1)
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
if real(channelid3) {global.channel[real(channelid3)] += 1}
if real(channelid4) {global.channel[real(channelid4)] += 1}
if real(channelid5) {global.channel[real(channelid5)] += 1}
if real(channelid6) {global.channel[real(channelid6)] += 1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

if real(logic) == 0 {
draw_background_part_ext(global.masterobjects[biome],184+(16*active),240,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)
}
else
{
draw_background_part_ext(global.masterobjects[biome],184+(16*active),288,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)
draw_background_part_ext(global.masterobjects[biome],200+(16*real(logic)),288,16,16,x,y+dy,image_xscale,image_yscale,c_white,image_alpha)
}

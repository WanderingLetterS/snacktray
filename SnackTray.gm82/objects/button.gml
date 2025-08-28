#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
active=0;
channelid=0;
perma=0;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if real(channelid) != 0
{
    switch real(filter)
    {
    case 0:
        coll=instance_place(x,y,cork)
        if place_meeting(x,y,player) || (coll && !coll.carry) ||  place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Player & Object Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 1:
        if place_meeting(x,y,player) //Player Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 2:
        coll=instance_place(x,y,cork)
        if (coll && !coll.carry) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Object Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 3:
        if place_meeting(x,y,enemy) //Enemy Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    case 4:
        coll=instance_place(x,y,cork)
        if place_meeting(x,y,player) || (coll && !coll.carry) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) ||  place_meeting(x,y,enemy) //All Filter
        {
            event_user(0)
        }else{
            event_user(1)
        }
    break;
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
sound("itembutton")
active = 1
if real(channelid) != 0 global.channel[real(channelid)] += 1
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
if (real(perma)) exit;
active = 0
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
sound("itembutton")
active = 1
if real(channelid) != 0 global.channel[real(channelid)] += 1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

if !(real(invis))
{
switch(real(filter))
{
case 0: draw_background_part_ext(global.masterobjects[biome],216+(16*active),240,16,8,x,y+8,1,1,c_white,1) break;
case 1: draw_background_part_ext(global.masterobjects[biome],248+(16*active),240,16,8,x,y+8,1,1,c_white,1) break;
case 2: draw_background_part_ext(global.masterobjects[biome],280+(16*active),240,16,8,x,y+8,1,1,c_white,1) break;
case 3: draw_background_part_ext(global.masterobjects[biome],216+(16*active),248,16,8,x,y+8,1,1,c_white,1) break;
case 4: draw_background_part_ext(global.masterobjects[biome],248+(16*active),248,16,8,x,y+8,1,1,c_white,1) break;
}
}

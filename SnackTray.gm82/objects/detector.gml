#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index = spr_detectormask
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
        if place_meeting(x,y,player) || place_meeting(x,y,cork) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Player & Object Filter
            event_user(0)
        else
            event_user(1)
    break;
    case 1:
        if place_meeting(x,y,player) //Player Filter
            event_user(0)
        else
            event_user(1)
    break;
    case 2:
        if place_meeting(x,y,cork) || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) //Object Filter
            event_user(0)
        else
            event_user(1)
    break;
    case 3:
        if place_meeting(x,y,enemy) //Enemy Filter
            event_user(0)
        else
            event_user(1)
    break;
    case 0:
        if place_meeting(x,y,player) || place_meeting(x,y,cork)  || place_meeting(x,y,stone) || place_meeting(x,y,objectdummy) || place_meeting(x,y,enemy) //All Filter
            event_user(0)
        else
            event_user(1)
    break;
    }
}


image_yscale = real(height)/2
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

if (global.debug) draw_self()
grid_size = 8;
if !(real(invis))
{
    var dy;
    draw_background_part_ext(global.masterobjects[biome],200+(16*(real(filter)+1)),272,16,8,x,y,1,1,c_white,1); //Top Base
    for (dy = 1; dy < image_yscale/0.5; dy += 1) {
        draw_background_part_ext(global.masterobjects[biome],200+(16*(real(filter)+1)),280,16,8,x,y+(dy*grid_size),1,1,c_white,1); //Middle Laser
    }
}

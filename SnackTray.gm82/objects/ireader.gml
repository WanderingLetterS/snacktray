#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
channelid = 0
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Read States
p=string_pos(",",src)
srcx=unreal(string_copy(src,1,p-1),0)*16
srcy=unreal(string_delete(src,1,p),0)*16

reader=instance_position(x+srcx+8,y+srcy+8,ireader)
onscreen=instance_position(x+srcx+8,y+srcy+8,onoffscreen)
timer=instance_position(x+srcx+8,y+srcy+8,timerblock)
varblock=instance_position(x+srcx+8,y+srcy+8,variableblock)
display=instance_position(x+srcx+8,y+srcy+8,displayscreen)

if
((reader) && real(reader.active) == real(value)) || //Read other I-Reader's active state
((onscreen) && onscreen.counterval == real(value) ) || //Read On/off Timer & Counter displayed value.
((onscreen) && onscreen.active == real(value) && real(onscreen.type)!=1) || //Read Lantern's active state (binary)
((timer) && timer.timeleft == real(value)) || //Read timer's displayed time.
((varblock) && varblock.counterval == real(value)) || //Read Variable Block's value
((display) && display.activeamount == real(value)) // Read Display Screen's amount of active panels
    event_user(0)
else
    event_user(1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) exit;
active = 1
if real(channelid) != 0 global.channel[real(channelid)] += 1
if real(channelid2) != 0 global.channel[real(channelid2)] += 1
if real(channelid3) != 0 global.channel[real(channelid3)] += 1
if real(channelid4) != 0 global.channel[real(channelid4)] += 1
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)
global.channel[real(channelid2)] = max(0,global.channel[real(channelid2)]-1)
global.channel[real(channelid3)] = max(0,global.channel[real(channelid3)]-1)
global.channel[real(channelid4)] = max(0,global.channel[real(channelid4)]-1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

draw_background_part_ext(global.masterobjects[biome],184+(16*active),256,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
if (global.debug)
{
draw_sprite(spr_ireader,1,x+srcx,y+srcy)
draw_arrow(x+8,y+8,x+srcx+8,y+srcy+8,8)
draw_omitext(x,y+8,real(value),c_white,1)
}

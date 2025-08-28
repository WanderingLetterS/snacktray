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

//i hate this damn code
reader=instance_position(x+srcx+8,y+srcy+8,ireader)
onscreen=instance_position(x+srcx+8,y+srcy+8,onoffscreen)
timer=instance_position(x+srcx+8,y+srcy+8,timerblock)
varblock=instance_position(x+srcx+8,y+srcy+8,variableblock)
display=instance_position(x+srcx+8,y+srcy+8,displayscreen)

if (reader)
val1=reader.active
else if onscreen {
    if real(onscreen.type)!=2
    val1=onscreen.counterval
    else
    val1=onscreen.active
}
else if (timer)
val1=timer.timeleft
else if (varblock)
val1=varblock.counterval
else if (display)
val1=display.activeamount

p=string_pos(",",src2)
srcx2=unreal(string_copy(src2,1,p-1),0)*16
srcy2=unreal(string_delete(src2,1,p),0)*16

reader=instance_position(x+srcx2+8,y+srcy2+8,ireader)
onscreen=instance_position(x+srcx2+8,y+srcy2+8,onoffscreen)
timer=instance_position(x+srcx2+8,y+srcy2+8,timerblock)
varblock=instance_position(x+srcx2+8,y+srcy2+8,variableblock)
display=instance_position(x+srcx2+8,y+srcy2+8,displayscreen)

if (reader)
val2=reader.active
else if onscreen {
    if real(onscreen.type)!=2
    val2=onscreen.counterval
    else
    val2=onscreen.active
}
else if (timer)
val2=timer.timeleft
else if (varblock)
val2=varblock.counterval
else if (display)
val2=display.activeamount

switch (unreal(type,0)) {
case 0:
if val1 == val2
    event_user(0)
else
    event_user(1)
break;
case 1:
if val1 > val2
    event_user(0)
else
    event_user(1)
break;
case 2:
if val1 < val2
    event_user(0)
else
    event_user(1)
break;

}
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
active = 0
global.channel[real(channelid)] = max(0,global.channel[real(channelid)]-1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit;

draw_background_part_ext(global.masterobjects[biome],168-(16*active),288+(16*unreal(type,0)),16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)
if (global.debug)
{
draw_sprite(spr_ireader,1,x+srcx,y+srcy)
draw_arrow(x+8,y+8,x+srcx+8,y+srcy+8,8)
draw_omitext(x,y+8,real(value),c_white,1)
}

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index = spr_detectormask
image_speed = 0;
initialy = y
initialx = x
getregion(x)
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=((image_xscale*16)-16)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[real(channelid)])
{
    if active = -(real(inverted)) {
        if inview() sound("itemgateopen",0,real(speedam)/2)
    }

    if !(real(inverted))
        active = 1;
    else
        active = 0;
}
else
{
if active != (real(inverted)) {
    if inview() sound("itemgateclose",0,real(speedam)/2)
}

active = real(inverted);
}

if (active) {
x = approach_val(x,openx, real(speedam))
}
else {
x = approach_val(x,initialx, real(speedam))
}

openx = initialx+(real(width)*16)

image_xscale = real(width)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) {
draw_omitext(x,y,active)
draw_omitext(x,y+8,-(real(inverted)))
draw_self()
}
grid_size = 8;
if !(real(invis))
{
    var dy;
    //Top Base
    for (dx = 0; dx < image_xscale/0.5; dx += 1) {
        draw_background_part_ext(global.masterobjects[biome],328,288,8,16,x+(dx*grid_size),y,1,1,c_white,1); //Middle Laser
    }
    draw_background_part_ext(global.masterobjects[biome],320,288,8,16,x-8,y,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],336,288,8,16,x+(image_xscale*16),y,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],344,288,8,16,initialx+((image_xscale-1)*16)+8,y,1,1,c_white,1);
}

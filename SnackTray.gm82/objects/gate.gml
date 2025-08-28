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
y = approach_val(y,openy, real(speedam))
}
else {
y = approach_val(y,initialy, real(speedam))
}

openy = initialy-(real(height)*16)

image_yscale = real(height)
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
    for (dy = 0; dy < image_yscale/0.5; dy += 1) {
        draw_background_part_ext(global.masterobjects[biome],352,280,16,8,x,y+(dy*grid_size),1,1,c_white,1); //Middle Laser
    }
    draw_background_part_ext(global.masterobjects[biome],352,272,16,8,x,y-8,1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],352,288,16,8,x,y+(image_yscale*16),1,1,c_white,1);
    draw_background_part_ext(global.masterobjects[biome],352,264,16,8,x,initialy,1,1,c_white,1);
}

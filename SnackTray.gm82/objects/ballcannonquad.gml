#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x += 8;
y += 8;
image_speed = 0;
alarm[1] = 120;
alarm[0]=60;
instance_create(x,y,ground)
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch dir
{
case "0": {
if (nearestplayer().x>x-48 && nearestplayer().x<x+48){
instance_create(x+8,y+24,smoke) with(instance_create(x+8,y+24,cannonball)){dir = "down"}
instance_create(x+8,y-8,smoke) with(instance_create(x+8,y-8,cannonball)){dir = "up"}
}
else
{
instance_create(x-8,y+8,smoke) with(instance_create(x-8,y+8,cannonball)){dir = "left"}
instance_create(x+24,y+8,smoke) with(instance_create(x+24,y+8,cannonball)){dir = "right"}
}
} break;
case "1": {
if (nearestplayer().x<x+8) {
instance_create(x-6,y+22,smoke) with(instance_create(x-8,y+24,cannonball)){dir = "downleft"}
instance_create(x+22,y-6,smoke) with(instance_create(x+24,y-8,cannonball)){dir = "upright"}
} else {
instance_create(x-6,y-6,smoke) with(instance_create(x-8,y-8,cannonball)){dir = "upleft"}
instance_create(x+22,y+22,smoke) with(instance_create(x+24,y+24,cannonball)){dir = "downright"}
}
} break;
}
sound("enemycannon")
alarm[0]=120
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch dir
{
case "0": {dir = "1"} break;
case "1": {dir = "0"} break;
}

alarm[1] = 120;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview() || flag.trig) alarm[0]=60+(xc*y mod 60) alarm[1]=120+(xc*y mod 60)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch dir
{
case "0": draw_background_part_ext(global.masterobjects[biome],376,16,32,32,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //normal
case "1": draw_background_part_ext(global.masterobjects[biome],376,56,32,32,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //diagonal
}

draw_background_part_ext(global.masterobjects[biome],416,16,32,48,x-8,y-24,image_xscale,image_yscale,c_white,image_alpha) break; //draw the support sprite

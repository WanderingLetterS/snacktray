#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x += 8;
y += 8;
image_speed = 0;
alarm[0]=120;
instance_create(x-8,y-8,ground)
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
insb = instance_create(x,y,cannonball)

switch dir
{
case "0": {instance_create(x,y-8,smoke) with(insb){dir = "up"}} break;
case "1": {instance_create(x,y+8,smoke) with(insb){dir = "down"}} break;
case "2": {instance_create(x-8,y+1,smoke) with(insb){dir = "left"}} break;
case "3": {instance_create(x+8,y+1,smoke) with(insb){dir = "right"}} break;
case "4": {instance_create(x-8,y-8,smoke) with(insb){dir = "upleft"}} break;
case "5": {instance_create(x+8,y-8,smoke) with(insb){dir = "upright"}} break;
case "6": {instance_create(x-8,y+8,smoke) with(insb){dir = "downleft"}} break;
case "7": {instance_create(x+8,y+8,smoke) with(insb){dir = "downright"}} break;
}
sound("enemycannon")
alarm[0]=120
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview() || flag.trig) alarm[0]=60+(xc*y mod 60)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch dir
{
case "0": draw_background_part_ext(global.masterobjects[biome],336,16,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //up
case "1": draw_background_part_ext(global.masterobjects[biome],336,48,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //down
case "2": draw_background_part_ext(global.masterobjects[biome],320,32,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break;//left
case "3": draw_background_part_ext(global.masterobjects[biome],352,32,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break;  //right
case "4": draw_background_part_ext(global.masterobjects[biome],320,16,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //upleft
case "5": draw_background_part_ext(global.masterobjects[biome],352,16,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break;  //upright
case "6": draw_background_part_ext(global.masterobjects[biome],320,48,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //downleft
case "7": draw_background_part_ext(global.masterobjects[biome],352,48,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break;  //downright
}

switch standdir
{
case "0": draw_background_part_ext(global.masterobjects[biome],352,64,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //down
case "1": draw_background_part_ext(global.masterobjects[biome],352,80,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //up
case "2": draw_background_part_ext(global.masterobjects[biome],336,72,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //left
case "3": draw_background_part_ext(global.masterobjects[biome],320,72,16,16,x-8,y-8,image_xscale,image_yscale,c_white,image_alpha) break; //right
}

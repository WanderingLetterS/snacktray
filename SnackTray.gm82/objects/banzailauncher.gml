#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
alarm[0]=240;
getregion(x)
xscale=1
yscale=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
insb = instance_create(x+32,y+32,banzaibill)
sound("enemycannon")
xscale=1.33
yscale=1.33
alarm[0]=240
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview() || abs(instance_nearest(xc,y,player).x-xc)<24 || flag.trig) alarm[0]=60+(xc*y mod 60)

xscale=lerp(xscale,1,0.05)
yscale=lerp(yscale,1,0.05)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterobjects[biome],456,16,64,64,x-(32*xscale)+32,y-(32*yscale)+32,xscale,yscale,c_white,1);
draw_background_part_ext(global.masterobjects[biome],520,16,64,64,x,y+16,1,1,c_white,1);

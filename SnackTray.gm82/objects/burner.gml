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
insb = instance_create(x-8,y-8,burnerfire)

switch dir
{
case "0":  with(insb){dir = 0} break;
case "1":  with(insb){dir = 2} break;
case "2":  with(insb){dir = 3} break;
case "3":  with(insb){dir = 1} break;
}
sound("enemycannon")
alarm[0]=240
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

switch dir
{
case "0":  tile_dyn(global.masterobjects[biome],168,72,16,16,x-8,y-8,1000000) break;
case "1":  tile_dyn(global.masterobjects[biome],200,72,16,16,x-8,y-8,1000000) break;
case "2":  tile_dyn(global.masterobjects[biome],184,72,16,16,x-8,y-8,1000000) break;
case "3":  tile_dyn(global.masterobjects[biome],216,72,16,16,x-8,y-8,1000000) break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Hi

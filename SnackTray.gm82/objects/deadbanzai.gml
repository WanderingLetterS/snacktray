#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
vsp=0
xsc=0
time=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x+32,y+32,bigBOM) {visible=0 alarm[2]=1}
sound("enemybigexplode")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=1;
if (time mod 7 == 0 && frame < 2) {frame+=1}
draw_sprite_part_ext(global.enemysheet2[biome],0,429+(74*frame),8,74,74,round(x+32)+35*-xsc,round(y)-5,xsc,1,$ffffff,1)

if (vspeed!=0) {vsp+=vspeed vspeed=0}
vsp+=0.2
if (vsp>3) {vsp=3}
y+=vsp;

if (place_meeting(x,y,ground)||place_meeting(x,y,slopy)) {instance_destroy()}

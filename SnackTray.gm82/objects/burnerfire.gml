#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=60
rising=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

dying=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x=xstart && y=ystart //only happens on the first frame lmao

switch(dir){
    case 0: y=ystart-48  image_yscale=3 break//up
    case 1: x=xstart+16 image_xscale=3 break//right
    case 2: y=ystart+16 image_yscale=3 break//udown
    case 3: x=xstart-48 image_xscale=3 break//left
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if playermade exit
if !rising && !(dying&&frame>=5){
    with other hurtplayer("fire")
}
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !playermade exit

if other.object_index!=podoboo {doscore_e(8000,other.id) with (other) {sound("enemykick") with (instance_create(x,y,genericdead)) {hspeed*=sign(x-other.x) type=2 biome=other.biome} instance_destroy()}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if rising {frame+=0.1
if frame>=2 rising=0}
else if dying {frame+=0.1 if frame>=7 instance_destroy()}
else {frame=modulo(frame+0.2,2,5) if frame>=5 frame=2}


switch dir
{
case 0:  draw_background_part(global.masterobjects[biome],168+floor(frame)*16,24,16,48,x,y) break;
case 1:  draw_background_general(global.masterobjects[biome],168+floor(frame)*16,24,16,48,x+48,y+16,1,-1,90,c_white,c_white,c_white,c_white,1) break;
case 2:  draw_background_general(global.masterobjects[biome],168+floor(frame)*16,24,16,48,x,y+48,1,-1,0,c_white,c_white,c_white,c_white,1) break;
case 3:  draw_background_general(global.masterobjects[biome],168+floor(frame)*16,24,16,48,x,y+16,1,1,90,c_white,c_white,c_white,c_white,1) break;
}

if global.debug draw_self()

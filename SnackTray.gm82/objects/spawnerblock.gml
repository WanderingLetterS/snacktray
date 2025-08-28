#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0;
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (real(channelid) && global.channel[real(channelid)])
{
    event_user(2)
}
else
{
    event_user(4)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if active exit;
active = 1
var i;
if real(object) == 0 {i=instance_create(x+8,y+8,staticdummy)}
else if real(object) == 1 {i=instance_create(x,y+8,objectdummy)}
else if real(object) == 2 {i=instance_create(x+8,y+8,enemydummy)}
else if real(object) == 3 {i=instance_create(x,y,colliderdummy)}
else if real(object) == 4 {i=instance_create(x,y,hazarddummy)}
else if real(object) == 5 {i=instance_create(x+8,y+8,cork)}
else if real(object) == 6 {i=instance_create(x,y,stone)}
with(i) {
    createcode=other.ccode
    if object_index!=cork
    event_user(0);
    else event_user(2);
}
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !active exit;
active = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !real(invis) {draw_background_part_ext(global.masterobjects[biome],368,256,16,16,x,y,image_xscale,image_yscale,c_white,image_alpha)}

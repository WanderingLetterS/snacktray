#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=random_range(2,4)
direction=random_range(45,135)
gravity=0.4
fade=0
a=1

image_xscale=3
image_yscale=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot-=hspeed*8

if (fade) {
    a=max(0,a-0.02)
    if (a=0) instance_destroy()
}
#define Collision_collider
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,lavablock)) {
    instance_create(x,y,smoke)
    instance_destroy()
} else if (vspeed>0 && vspeed<1) {
    y=yprevious
    speed=0
} else {
    if (place_meeting(xprevious+hspeed,yprevious,other.id)) hspeed*=-0.7
    else hspeed*=0.7
    if (place_meeting(xprevious,yprevious+vspeed,other.id)) vspeed*=-0.5
    x=xprevious
    y=yprevious
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_z(rot)
d3d_transform_add_translation(round(x),round(y),0)
draw_sprite_part_ext(sheet,0,u,v,w,h,-w/2,-h/2,1,1,$ffffff,a)
d3d_transform_set_identity()

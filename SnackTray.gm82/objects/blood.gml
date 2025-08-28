#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=random(7)
gravity=random_range(0.1,0.3)
u=choose(86,93)
v=choose(185,192)
b=irandom(3)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (water) {
    if (!underwater()) vspeed=abs(vspeed)*0.5
    if (speed=0 && !splat) instance_destroy()
}
#define Collision_axe
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (point_distance(x,y,other.x,other.y)<8) event_user(0)
#define Collision_flag
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_collider
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,lavablock)) {
    instance_create(x,y,smoke)
}
else if (splat) {
    i=instance_create(x,y,bloodstuck)
    i.stuck=other.id
    i.owner=owner
    i.stuckx=x-other.x
    i.stucky=y-other.y
    i.u=u
    i.v=v
    i.del=del
    i.b=b
    i.alarm[0]=a*32
}

instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (del) draw_sprite(spr_blood,b,x,y)
else {
    //this was inlined for speed
    draw_sprite_part(sheet,0,u,v,6,6,round(x-3),round(y-3))
}

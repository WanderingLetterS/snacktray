#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=max(0,speed*0.96-0.2)

if underwater() instance_change(streambubble,0)

if place_meeting(x,y,collider) || place_meeting(x,y,player) || (speed==0) {
    instance_destroy();
}
#define Collision_collider
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part(spr,0,208+25*floor(fr),283,24,24,floor(x-12),floor(y-12))

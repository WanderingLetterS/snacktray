#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=12
image_yscale=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!owner.bounce) instance_destroy()
#define Collision_hittable
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.x+owner.hsp
y=owner.y+owner.vsp+4+4*!owner.size

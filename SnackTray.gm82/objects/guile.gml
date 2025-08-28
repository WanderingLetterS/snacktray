#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!egg()) instance_destroy()
fading=0
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var m;

if (!fading) {
    m=0
    with (player) m=max(m,x)
    if (m>x-50) {
        fading=1
        image_speed=0.5
        vspeed=-4
        hspeed=1
        gravity=0.1
    }
}



if (fading=2) image_alpha-=0.05
if (image_alpha<0) instance_destroy()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
fading=2

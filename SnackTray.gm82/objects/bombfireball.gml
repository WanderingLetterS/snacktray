#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2

gravity=0.1

owner=noone

type=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (pitdeath()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) exit

if (other.glide && sign(hspeed)!=other.xsc) {hspeed=sign(other.xsc) owner=other.id}

if (owner!=other.id) with (other) if (!invincible()) hurtplayer("enemy")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) if !(global.bgscroll mod 5<3) exit

ssw_effects("bombfireball")

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2

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

if (owner!=other.id) with (other) if (!invincible()) hurtplayer("fire")
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//@todo: refactor

if (owner!=noone && owner!=other && owner.object_index=player) {doscore_e(8000,other.id) with (other) {sound("enemykick") with (instance_create(x,y,genericdead)) {hspeed*=sign(x-other.x) type=2 biome=other.biome} instance_destroy()}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) if !(global.bgscroll mod 5<3) exit

ssw_effects("firebroball")

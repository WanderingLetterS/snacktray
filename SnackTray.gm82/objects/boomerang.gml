#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2

vspeed=-3

gox=owner.target.x
goy=owner.target.y
owner=noone
returning=0
type=0

sound("enemyhammerthrow")
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if owner!=noone owner.hasboomerang=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if (pitdeath()||!inview()) instance_destroy()

if !gox gox=xstart+(-100*owner.xsc)
if !goy goy=y
if !returning motion_add(point_direction(x+hspeed,y+vspeed,gox,goy),0.2)
else if returning=1 motion_add(point_direction(x+hspeed,y+vspeed,owner.x,owner.y),0.2)
else if returning=2 gravity=-0.2
if speed>3 speed=3
if abs(x-gox)<20 && abs(y-goy)<16  &&!returning returning=1
if abs(x-xstart)<16 && abs(y-ystart)<16 && returning=1 returning=2
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) exit

if (other.glide && sign(hspeed)!=other.xsc) {hspeed=sign(other.xsc) owner=other.id}

if (other.id!=owner) with (other) if (!invincible()) hurtplayer("boomerang")

if (returning && other.id=owner) {instance_destroy() owner.hasboomerang=1}
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//@todo: refactor
if owner.object_index!=player exit
if (owner!=noone && owner!=other) {doscore_e(8000,other.id) with (other) {sound("enemykick") with (instance_create(x,y,genericdead)) {hspeed*=sign(x-other.x) type=2 biome=other.biome} instance_destroy()}}
#define Collision_boomerangbro
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (returning && other.id=owner) {instance_destroy() owner.hasboomerang=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) if !(global.bgscroll mod 5<3) exit

ssw_effects("boomerang")

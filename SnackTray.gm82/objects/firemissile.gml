#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=2

xsc=1

hspeed=-1.25

owner=noone

frc=0 frame=0

getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=inch(y,ygo,1)

var kil,bil;
kil=view_xview[0]
bil=view_xview[0]+400

for (i=1;i<global.mplay;i+=1) {kil=min(kil,view_xview[i]) bil=max(bil,view_xview[i]+400)}

if (x<kil-48 || x>bil+48) instance_destroy()

frc+=1 if (frc=4) {frc=0 frame=!frame}
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
if (owner!=noone && owner!=other && owner.object_index=player) {doscore_e(8000,other.id) with (other) {sound("enemykick") with (instance_create(x,y,genericdead)) {hspeed*=sign(x-other.x) type=2 biome=other.biome} instance_destroy()}}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) if !(global.bgscroll mod 5<3) exit

ssw_effects("firemissile")

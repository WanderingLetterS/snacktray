#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=1
ysc=1
getregion(x)

hspeed=-1.25

owner=noone

frc=0 frame=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() instance_destroy()

frc+=1 if (frc=4) {frc=0 frame=!frame}

if collision(0,0) {
    if !(ver)
    instance_create(x+8,y+4,fmissileexplosion)
    else
    instance_create(x+4,y-8,fmissileexplosion)
    instance_destroy();
}
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
if (owner!=noone && owner!=other && owner.object_index=player) {
    doscore_e(100,other.id)
    with (other) {
        sound("enemykick")
        with (instance_create(x,y,genericdead)) {
            hspeed*=sign(x-other.x) type=2 biome=other.biome
        }
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) draw_self()

ssw_effects("firemissilesmall")

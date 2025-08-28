#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((owner.hang && owner.vsp>1) || owner.braking) {hspeed*=-1 x-=8*xsc}
image_xscale=3
image_yscale=3
frame_sub=0
frame=0
brickc=0
seqcount=2
kek=8
vspeed=3
exploding=0
exploframe=0
visible=1

sound("enemyhammerthrow")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

calcmoving()
if exploding=0{
    vspeed=min(2.75,vspeed+0.35)
    xsc=esign(hspeed,1)

    frame_sub=!frame_sub
    if frame_sub frame+=1
    if (frame>=3) frame=0

    if (!inview()) instance_destroy()

    coll=instance_place(x,y,collider)
    if (coll) {
        if (coll.object_index=lavablock) {instance_destroy() exit}
        if (y<coll.y+4 && !instance_place(x,y-8,collider)) {vspeed=-2.75 y-=2 exit}
        if coll.object_index=phaser exit
        exploding=1
        sound("itemblockbump")
    }

}
else if exploding=1
{
    exploframe+=0.5
    if (exploframe>=3) {visible=0 instance_destroy()}
    hspeed=0
    vspeed=0
}

if (pitdeath()) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) exit

if (other.glide && sign(hspeed)!=other.xsc) {hspeed=sign(other.xsc) owner=other.id}

if (owner!=other.id) with (other) if (!invincible()) {hurtplayer("fire") exploding=1}
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) exit

if (other.glide && sign(hspeed)!=other.xsc) {hspeed=sign(other.xsc) owner=other.id}

if (owner!=other.id) with (other) if (!invincible()) {hurtplayer("fire") exploding=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.panic) if !(global.bgscroll mod 5<3) exit
if !exploding
ssw_effects("fireball")
else
ssw_effects("firexplosion")

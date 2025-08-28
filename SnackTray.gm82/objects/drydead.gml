#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
alarm[0]=240
sound("enemybones")
enemy2=1
sprite="drybonesdead"
active=1
ysc=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(x,y,drybones)) {xsc=other.xsc unfresh=1 revive=60}
alarm[1]=2
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animated=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (drop) {
    mask_index=spr_itemmask
    calcmoving()
    if (!inview()) vspeed=0
    else {
        hspeed=0
        player_nslopforce()
        if (coll) {
            vspeed=0
        } else vspeed=min(3,vspeed+0.25)
    }
    mask_index=spr_mask12x12
    if (mycoll) {mycoll.x=x-8 mycoll.y=y-8}
    if (pitdeath()) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-3
xsc=1
ysc=1
frspd=1
sound("enemyspinythrow")
sprite="spinyegg"
ti=vspeed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if underwater() && vspeed > 0 {instance_destroy() water_splash(1) eg=instance_create(x,y+8,spinyeggwater) eg.hspeed=hspeed eg.vspeed=vspeed}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animated=0
if (pitdeath()) instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else {
    if (collision(hspeed,0)) hspeed*=-1

    player_nslopforce()
    if (coll) {
        with (instance_create(x,y,spiny)) lakited=1
        instance_destroy()
    } else vspeed=min(3,vspeed+0.125)
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

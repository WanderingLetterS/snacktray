#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
xsc=1
done=0
mode=0

jumpy=skindat("toadjump")
sheet=skindat("tex_retainer")

modef=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!mode) {
    alarm[0]=60
    vspeed=-2
    frame=4
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (collision(hspeed,0)) hspeed*=-0.5
vspeed=min(4,vspeed+0.1)
if (collision(0,vspeed)) {hspeed=round(abs(hspeed)-1)*sign(hspeed) vspeed=-abs(hspeed) y=round(y/8)*8 if (mode) {modef=median(1,modef+0.1,2) vspeed=0}}

if (speed=0 && !done) {done=1 alarm[0]=60}

xsc=esign(hspeed,xsc)

if (done && !jumpy) frame=modulo(frame+0.0625,4,8)
else {
    if (vspeed<0) frame=min(1+done*4,frame+0.0625)
    else frame=min(3+done*4,frame+0.0625)
}
#define Collision_retainee
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xp=x
x+=esign(x-other.x,choose(-1,1))
if (collision(0,0)) x=xp
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mode) draw_sprite(spr_asnura,modef,x,y)
else ssw_effects("toad")

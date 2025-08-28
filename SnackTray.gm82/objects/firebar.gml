#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
dir=1
length=6

phase=-1
phasec=0
cookie=0

chop=skindat("chopbar")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview()) {active=0 image_angle=0}
else active=1

if (cookie) image_angle+=dir*2.25
else        image_angle+=dir*1.875

if (cookie) {
    prevx2=prevx
    prevy2=prevy
    prevx=x
    prevy=y
    x=xstart+lengthdir_x(length*8,image_angle)
    y=ystart+lengthdir_y(length*8,image_angle)
}

if (phase) {if (!place_meeting(x,y,phase)) {phasec+=1 if (phasec>=10) {phase=-1 phasec=0}} else phasec=0}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.id=phase) exit
with (other) {
    if (flash || hurt || piped || super || invincible()) other.phase=id
    else hurtplayer("fire")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (chop) angle=round(image_angle/11.25)*11.25
    else angle=image_angle
    if (cookie) {ssw_effects("cookie")

    }
    else ssw_effects("firebar")
    if (global.debug) draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,$ffffff,1)
}

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=8
vsp=0
mycoll=instance_create(x,y,moving)
mycoll.mask_index=spr_16
frame=0
frspd=1

phase=0
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var kek,yes;
if doonce=0 {x+=8 doonce=1}
if (inview()) {
    if (underwater()) vsp=median(-2,vsp+0.05,2)
    else vsp+=0.15

    yp=y
    y+=vsp
    mycoll.x=x-8
    mycoll.y=-verybignumber

    if (vsp<0) {
        coll=instance_place(x,y+vsp,collider)
        if (coll && y>coll.y) {
            y=coll.bbox_bottom+8
            vsp=0
        }
    }

    with (muncher) mycoll.x-=verybignumber
    yg=easyground()-8
    with (muncher) mycoll.x+=verybignumber
    if (y<yg) {
        y-=16
        coll=instance_place(x,y+18,muncher)
        if (coll) yg=coll.y-16
        y+=16
    }

    if (y>=yg) {
        y=yg
        belt=collision(0,1)
        if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
        x=x+belt.beltspd;
        vsp=0
        if (!place_meeting(x,y,player)) phase=0

        dy=max(0,abs(dy)-2)*sign(dy)
        kek=999 yes=0
        with (hittable) if (dy!=0) if (place_meeting(x,y-4,other.id)) {kek=min(kek,dy) yes=1}
        if (yes) dy=kek
    }

    if (vsp>0) kill_enemy(instance_place(x,y+4,enemy),"kill")

    if (!phase) {mycoll.vsp=y-yp mycoll.y=y-8}
    visible=1
} else visible=0

frspd=0.5
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !place_meeting(x,y+1,muncher) && !place_meeting(x,y+1,bigmuncher)
{
instance_create(x,y,smoke)
with(mycoll) instance_destroy();
instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.debug) draw_self()
draw_sprite_part_ext(global.enemysheet2[biome],0,558+(16*global.frame),106,16,16,round(x)+8-16,round(y)-8,1,1,$ffffff,1)

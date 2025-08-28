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

phase=0
getregion(x)
if string(global.createcode) != "" && string(global.createcode) != "0"
    string_execute(global.createcode)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (__gm82core_compiler_exists[event]) {
    code_destroy(event)
    code_destroyed=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var kek,yes;
if doonce=0 {x+=8 doonce=1}
if (inview()) {
    lava=instance_place(x,y,lavablock)

    if (underwater()) vsp=median(-2,vsp+0.05,2)
    else if (lava) {vsp=max(-1,vsp*0.75-0.08) y=max(lava.bbox_top-4,y)}
    else vsp+=0.15

    yp=y
    y+=vsp
    mycoll.x=x-8
    mycoll.y=-verybignumber

    if (vsp<0) {
        coll=instance_place(x,y+vsp,collider)
        if (coll && y>coll.y) {
            y=coll.bbox_bottom+8
            if (vsp<-1) {
                with (instance_create(x-8,y+4,smoke)) {friction=0.1 hspeed=-2 vspeed=-1}
                with (instance_create(x+8,y+4,smoke)) {friction=0.1 hspeed=2 vspeed=-1}
                with (instance_place(x,y-8,hittable)) {
                    go=-1 insted=1 stonebump=1 event_user(0) stonebump=0 insted=0
                }
            }
            vsp=0
        }
    }

    with (stone) mycoll.x-=verybignumber
    yg=easyground()-8
    with (stone) mycoll.x+=verybignumber
    if (y<yg) {
        y-=16
        coll=instance_place(x,y+18,stone)
        if (coll) yg=coll.y-16
        y+=16
    }

    if (y>=yg) {
        y=yg
        belt=collision(0,1)
            if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
            x=x+belt.beltspd;
        if (vsp>1) {
            with (instance_create(x-8,y+4,smoke)) {friction=0.1 hspeed=-2 vspeed=-1}
            with (instance_create(x+8,y+4,smoke)) {friction=0.1 hspeed=2 vspeed=-1}
            global.coll=nearestplayer()
            with (instance_place(x,y+8,hittable)) {
                go=1 insted=1 stonebump=1 event_user(0) stonebump=0 insted=0
            }
        }
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
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (__gm82core_compiler_exists[event]) {
    code_destroy(event)
    code_destroyed=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event=code_compile(createcode)
if !code_destroyed && __gm82core_compiler_exists[event]
code_execute(event)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("stone")

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (nearestplayer().x>x) {hspeed=1 xsc=-1} else {hspeed=-1 xsc=1}

active=1
enemy2=1
smoke_gen = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
if (!lone) {
    minx=verybignumber
    maxx=0

    for (i=0;i<global.mplay;i+=1) {
        maxx=max(maxx,view_xview[i]+view_wview[i]+48)
        minx=min(minx,view_xview[i]-48)
    }

    if (x<minx || x>maxx) instance_destroy()
    if (abs(x-xstart)>16) depth=0
}

//Smoke

smoke_gen += 1
if (xsc = -1) {
    smoke_offset = 6
} else {
    smoke_offset = other.sprite_width - 6
}
if (smoke_gen >= 6) {
    repeat(2) {
        with (instance_create(x+26*xsc,y+irandom_range(-24,24),smoke)) {
            speed=(1.15 + (irandom_range(-15,15) / 10))*other.xsc
            friction=0.0215
            gravity=-0.0125+random_range(-0.0080,0.0080)
            depth=other.depth+1
        }
    }
    smoke_gen = 0
}

image_xscale=xsc
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    if (lone) {
        if (inview()) {
            if ((nearestplayer()).x>x) {hspeed=1 xsc=-1}
            else {hspeed=-1 xsc=1}
            active=1
        }
    }
}
event_inherited()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Object Interactions
owner=nearestplayer()

coll = instance_place(x,y,brick)
if (coll) {
with (coll)
{
sound("itemblockbreak")
instance_destroy();
 i=instance_create(x+4,y+12,part) with(i){type=(6*other.biggie) hspeed=-1 vspeed=-1+2*go}
 i=instance_create(x+12,y+12,part) with(i){type=(6*other.biggie) hspeed=1 vspeed=-1+2*go}
 i=instance_create(x+4,y+4,part) with(i){type=(6*other.biggie) hspeed=-1 vspeed=-3+2*go}
 i=instance_create(x+12,y+4,part) with(i){type=(6*other.biggie) hspeed=1 vspeed=-3+2*go}
 }
}

collhit = instance_place(x,y,hittable)
if (collhit) {
hitblock(collhit,owner,1,-1,0)
}

collhb = instance_place(x,y,hardblock)
if (collhb) {
with (collhb)
{
sound("itemblockbreak")
instance_destroy();
 i=instance_create(x+4,y+12,part) with(i){type=4 hspeed=-1 vspeed=-1+2*go}
 i=instance_create(x+12,y+12,part) with(i){type=4 hspeed=1 vspeed=-1+2*go}
 i=instance_create(x+4,y+4,part) with(i){type=4 hspeed=-1 vspeed=-3+2*go}
 i=instance_create(x+12,y+4,part) with(i){type=4 hspeed=1 vspeed=-3+2*go}
 }
}

coll = place_meeting(x,y,collider) && !place_meeting(x,y,banzailauncher) && !collhit && !collhb
if (coll) {
instance_create(x,y,bigBOM)
sound("enemybigexplode")
instance_destroy()
}
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other)
enemydie(id,object_index==banzaibill)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lone=1
depth=0
hspeed=-1
xsc=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part_ext(global.enemysheet2[biome],0,429,8,74,74,round(x)+36*-xsc,round(y)-5-32,xsc,1,$ffffff,1)

if global.debug draw_self()
if (global.debug) rect(bbox_left,bbox_top,bbox_right-bbox_left+1,bbox_bottom-bbox_top+1,$ffffff,0.5)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
open=0
f=0
frame=0

image_speed=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=100
open=1
sound("itemspike")
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
open=0
sound("itemspike")
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2]=60
open=!open
if (inview()) sound("itemspike")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (open) f=min(1,f+0.125)
else f=max(0,f-0.125)

if (dir=0 || dir=2) x=xstart-(16-16*f)*(1-dir)

if (dir=1 || dir=3) y=ystart-(16-16*f)*(dir-2)

frame=(frame+0.1) mod 3

if (trap) {
    mask_index=spr_16
    if (place_meeting(xstart,ystart,player) && !alarm[0]) alarm[0]=32
}

if (x!=xprevious || y!=yprevious) tile_set_position(tile,x,y)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=unreal(trap)
getregion(x)

trap=0
if (type=0 || type=2) {open=1 f=1}
if (type=1) trap=1
if (type=2 || type=3) alarm[2]=60
if (type=4) {open=1 f=1}

mask_index=spr_16

if (flip="5") {dir=4}
else if (flip="4") {
    h=place_meeting(x+8,y,collider)-place_meeting(x-8,y,collider)
    v=place_meeting(x,y+8,collider)-place_meeting(x,y-8,collider)
    if ((h=0 && v=0) || (h!=0 && v!=0)) dir=4
    else dir=point_direction(0,0,-h,-v)/90
} else {
    dir=unreal(flip,4)
}

mask_index=spr_maskspike

image_index=dir
if (dir=4) {trap=0 type=0 alarm[2]=-1 open=1 f=1}

if (dir=0) {frx=1 fry=9}
if (dir=1) {frx=0 fry=9}
if (dir=2) {frx=3 fry=9}
if (dir=3) {frx=2 fry=9}
if (dir=4) {frx=0 fry=10}

if (tile) tile_delete(tile)
if (type=0) tile_bake(global.masterobjects[biome],frx*16+8,fry*16+8,16,16,x,y,depth)
else tile=tile_dyn(global.masterobjects[biome],frx*16+8,fry*16+8,16,16,x,y,depth)

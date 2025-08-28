#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0

image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=(frame+0.1) mod 4
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flip="4") {
    h=place_meeting(x+8,y,collider)-place_meeting(x-8,y,collider)
    v=place_meeting(x,y+8,collider)-place_meeting(x,y-8,collider)
    if ((h=0 && v=0) || (h!=0 && v!=0)) {
        if (v=-1) dir=3 else dir=1
    } else dir=point_direction(0,0,-h,-v)/90
} else {
    dir=unreal(flip,1)
}

if (dir=0) {frx=1 fry=8}
if (dir=1) {frx=0 fry=8}
if (dir=2) {frx=2 fry=8}
if (dir=3) {frx=3 fry=8}

tile_bake(global.masterobjects[biome],frx*16+8,fry*16+8,16,16,x,y,depth)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,munchercoll)

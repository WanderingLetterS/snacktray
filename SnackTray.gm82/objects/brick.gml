#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=-1
getregion(x)
content=""
stonebump=0
stoned=""
cracked=0
biggie=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (tile) tile_delete(tile)
tile=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (biggie && (image_xscale!=2 || image_yscale!=2)) {image_xscale=2 image_yscale=2}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lock && tile) tile_set_position(tile,x,y+dy)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lock) exit

if (global.coll=noone) owner=instance_nearest(x,y,player)
else owner=global.coll
owner.typeblockhit=0
owner.blockcoll=id
with (owner){
charm_run("hitblocks")}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (turing) if (mode=3) if (position_meeting(x+srcx+8,y+srcy+8,other.id)) {insted=1 go=-1 mode3flag=1 event_user(0) insted=0}
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///brick sprite optimization

if (stoned="2") {
    instance_create(x+8,y+8,stone)
    instance_destroy()
    exit
}


if string(crackedstart) ="1" {
cracked=1
i=instance_create(x,y,crackedbrick)
i.owner=id
i.biome=biome
i.imcrack=1
i.go=go
i.tpos=1
i.biggie=biggie}

getregion(x)

if (skindat("brickvar")) frx=rchoose(0,1,2,3)
else frx=0

if (tile) tile_delete(tile)
tile=tile_dyn(global.master[biome],0,0,16,16,x,y,2)
//tile=tile_dyn(global.master[biome],152+frx*16,264,16,16,x,y,2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/

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
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (tile) tile_delete(tile)
tile=-1
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
owner.blockc+=1
upwardthrust()
global.scor[owner.p2]+=10
sound("itemblockbreak")
if (skindat("bricd")) {
    i=instance_create(x,y,bricd)
    i.biome=biome
    i.depth=depth
}
i=instance_create(x+4,y+12,part) with(i){type=5 hspeed=-1 vspeed=-1+2*go}
i=instance_create(x+12,y+12,part) with(i){type=5 hspeed=1 vspeed=-1+2*go}
i=instance_create(x+4,y+4,part) with(i){type=5 hspeed=-1 vspeed=-3+2*go}
i=instance_create(x+12,y+4,part) with(i){type=5 hspeed=1 vspeed=-3+2*go}
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mytile=-1
getregion(x)
content="mushroom"
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
if (mytile) tile_delete(mytile)
mytile=-1
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
if (lock && mytile) tile_set_position(mytile,x,y+dy)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x+8,y+8,smoke)
s=(nearestplayer().xsc)
com_itemboxitemspawn(nearestplayer(),false,-1,string(content),true)

i=instance_create(x+4,y+12,part) with(i){type=3 hspeed=-1 vspeed=-1+2*go}
i=instance_create(x+12,y+12,part) with(i){type=3 hspeed=1 vspeed=-1+2*go}
i=instance_create(x+4,y+4,part) with(i){type=3 hspeed=-1 vspeed=-3+2*go}
i=instance_create(x+12,y+4,part) with(i){type=3 hspeed=1 vspeed=-3+2*go}

sound("itemcratebreak")

instance_destroy();
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

if (mytile) tile_delete(mytile)
mytile=tile_dyn(global.master[biome],296,184,16,16,x,y,2)

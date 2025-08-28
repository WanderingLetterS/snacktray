#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 mask_index=spr_mask1x1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=99
do {
    coll=instance_place(x,y+99,object_index)
    with (coll) instance_destroy()
} until (!coll)
y+=99

if (x<0 || y<0 || x>lemongrab.w[drawregion.region]-1 || y>lemongrab.h[drawregion.region]-1) instance_destroy()

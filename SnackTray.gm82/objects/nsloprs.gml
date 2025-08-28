#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=1
nslop=1
f=-1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savemask=mask_index
mask_index=sprite_index
getregion(x)
c2=place_meeting(x,y+24,groundsemi)||guaranteedc2
if c2 superc2=(place_meeting(x,y+24+16,groundsemi))
mask_index=savemask
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterterrain[biome],240,192,16,48,x,y-16,1,1,$FFFFFF,1)

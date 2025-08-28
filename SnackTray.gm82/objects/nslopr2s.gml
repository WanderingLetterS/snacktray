#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
s=1
f=-0.5
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

getregion(x)
c2=place_meeting(x,y+16,groundsemi)||guaranteedc2
if c2 superc2=(position_meeting(x,y+1+16,groundsemi))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterterrain[biome],272,208,16,32,x,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],288,192,16,48,x+16,y-16,1,1,$FFFFFF,1)

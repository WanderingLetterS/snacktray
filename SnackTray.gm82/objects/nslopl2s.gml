#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
f=0.5
s=1
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
draw_background_part_ext(global.masterterrain[biome],320,208,16,32,x+16,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],304,192,16,48,x,y-16,1,1,$FFFFFF,1)

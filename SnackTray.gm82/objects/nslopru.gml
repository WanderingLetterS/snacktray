#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
instance_create(x,y,uslopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c8=position_meeting(x+8,y-8,groundblock)||guaranteedc8
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if inview() && !position_meeting(x+8,y-8,collider)&&!position_meeting(x+8,y-8,groundblock) && inview() && !guaranteedc2 c8=0 //this should only ever happen with cracked ground

draw_background_part_ext(global.masterterrain[biome],240,80-16*!!c8,16,32+16*!!c8,x,y-16*!!c8,1,1,$FFFFFF,1)

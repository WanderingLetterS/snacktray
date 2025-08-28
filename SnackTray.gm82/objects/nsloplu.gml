#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
u=1
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

if inview() && !position_meeting(x+8,y-8,collider)&&!position_meeting(x+8,y-8,groundblock) && inview() && !guaranteedc8 c8=0 //this should only ever happen with cracked ground


if global.terrainsheettype[biome]==1{ //minimum
    tile_bake(sheet,136,8,16,16,x-8,y-8,999998)
exit
} else if global.terrainsheettype[biome]==2{ //small
    tile_bake(sheet,136,8+(16*!c2),16,32-(16*!c2),x-8,y-8+(-8*c2),999998)
exit
} else if global.terrainsheettype[biome]==3{ //medium/3x3
    tile_bake(sheet,72,32+(8*!c2),16,24-(8*!c2),x-8,y-8+(-8*c2),999998)
exit
}


draw_background_part_ext(global.masterterrain[biome],256,80-16*!!c8,16,32+16*!!c8,x,y-16*!!c8,1,1,$FFFFFF,1)

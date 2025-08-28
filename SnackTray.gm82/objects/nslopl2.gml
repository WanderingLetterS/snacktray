#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nslop=1
l=1
f=0.5
instance_create(x,y,slopeground)
instance_create(x+16,y,slopeground)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c2=position_meeting(x,y+24,groundblock)||guaranteedc2
if c2 superc2=(position_meeting(x,y+24+16,groundblock))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if !position_meeting(x+8,y+24,collider) && inview()&& !guaranteedc2 c2=0 //this should only ever happen with cracked ground

if global.terrainsheettype[biome]==1{ //minimum
    tile_bake(sheet,88,8,32,16,x-8,y-8,999998)
exit
} else if global.terrainsheettype[biome]==2{ //small
    tile_bake(sheet,88,8,32,32-(16*!c2),x-8,y-8,999998)
exit
} else if global.terrainsheettype[biome]==3{ //medium/3x3
    tile_bake(sheet,120,8,32,24-(8*!c2),x-8,y-8,999998)
exit
}



if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],304,48,32,16,x,y+16,1,1,$FFFFFF,1)
else if c2 && !superc2 draw_background_part_ext(global.masterterrain[biome],432,56,32,24,x,y+16,1,1,$FFFFFF,1)

draw_background_part_ext(global.masterterrain[biome],320,32,16,16,x+16,y,1,1,$FFFFFF,1)
draw_background_part_ext(global.masterterrain[biome],304,16,16,32,x,y-16,1,1,$FFFFFF,1)

//if c2 && superc2 draw_background_part_ext(global.masterterrain[biome],416,80,16,16,x+16,y+16,1,1,$FFFFFF,1)

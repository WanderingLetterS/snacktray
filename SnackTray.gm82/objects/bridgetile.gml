#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

instance_create(x,y,phaser)
side=0
if (!position_meeting(x-8,y,bridgetile)) side=-1
if (!position_meeting(x+24,y,bridgetile)) side+=1

tile_bake(global.master[biome],104+16*side,216,16,16,x,y-16,1000001)
tile_bake(global.master[biome],104+16*side,232,16,16,x,y,999999)

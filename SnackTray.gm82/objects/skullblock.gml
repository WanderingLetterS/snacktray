#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mytile!=0 {
    tile_delete(mytile)
}

if (!spentblock() || global.gamemode="battle") {
    tile_bake(global.masterobjects[biome],72,416,16,16,x,y,2)
} else {
    tile_bake(global.master[biome],88,416,16,16,x,y-1,2)
    y=-verybignumber
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=ystart
spendblock()
y=-verybignumber

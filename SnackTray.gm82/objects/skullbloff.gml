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
    tile_bake(global.master[biome],296,264,16,16,x,y,2)
    y=-verybignumber
} else tile_bake(global.master[biome],280,264,16,16,x,y,2)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=ystart
spendblock()
y=-verybignumber

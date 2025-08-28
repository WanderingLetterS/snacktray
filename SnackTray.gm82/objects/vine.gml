#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

c8=position_meeting(x,y-12,groundblock) || position_meeting(x,y-12,slopeground) || position_meeting(x,y-12,vine)
c2=position_meeting(x,y+16,groundblock) || position_meeting(x,y+16,groundsemi) || position_meeting(x,y+8,vine) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sheet;
sheet=global.master[biome]

if (c8 && c2) || (!c8 && !c2) {/*middle fill*/ tile_bake(sheet,312,56,16,16,x-8,y-8,999998)}
else if (!c8 && c2) {/*top*/ tile_bake(sheet,296,72,16,16,x-8,y-8,999998)}
else if (c8 && !c2) {/*bottom*/ tile_bake(sheet,312,72,16,16,x-8,y-8,999998)}

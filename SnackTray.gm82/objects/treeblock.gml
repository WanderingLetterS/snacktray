#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,ground)

left=!position_meeting(x-8,y+8,treeblock)
right=!position_meeting(x+24,y+8,treeblock)

side=0
if (!position_meeting(x-24,y+8,treeblock)) side=-1
if (!position_meeting(x+40,y+8,treeblock)) {if (side=-1) side=2 else side=1}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
sheet=global.master[biome]

depth=assetdepth+4-y/7168

if (left && right) {
    tile_bake(sheet,88,152,8,16,x,y,999999)
    tile_bake(sheet,120,152,8,16,x+8,y,999999)
}
else if (left) tile_bake(sheet,88,152,16,16,x,y,999999)
else if (right) tile_bake(sheet,120,152,16,16,x,y,999999)
else {
    tile_bake(sheet,104,152,16,16,x,y,999999)
    y+=16
    tile_bake(sheet,104+16*side,168,16,16,x,y,assetdepth+2)
    zohn=noone
    while (y<region.ky && !zohn) {
        y+=16
        if !position_meeting(x,y,treewall) {
            i=instance_create(x,y,treewall)
            i.side=side
            i.depth=depth
            i.biome=biome
        }
        zohn=instance_position(x+8,y+24,autotiler)
        if (zohn.object_index != groundblock && zohn.object_index != crackedblock && zohn.object_index != treeblock) {
            zohn=noone
        }
    }
    tile_bake(sheet,104+16*side,184,16,16,x,y,depth+2)
}
y=ystart

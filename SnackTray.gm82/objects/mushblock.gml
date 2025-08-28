#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!position_meeting(x-8,y+8,mushblock)) {
    getregion(x)
    sheet=global.master[biome]
    i=instance_create(x,y,phaser)
    if (!position_meeting(x+24,y+8,mushblock)) {
        //1x1 mushroom without bottom
        tile_bake(sheet,88,8,8,16,x,y,999997)
        tile_bake(sheet,128,8,8,16,x+8,y,999997)
    } else {
        tile_bake(sheet,88,8,16,16,x,y,999997)
        while (position_meeting(x+40,y+8,mushblock)) {
            x+=16
            tile_bake(sheet,104,8,16,16,x,y,999997)
        }
        x+=16
        tile_bake(sheet,120,8,16,16,x,y,999997)
        x+=16
        i.image_xscale=(x-xstart)/16
        x=mean(x,xstart)-8
        if (i.image_xscale=2) {
            //2x1 mushroom with bottom
            tile_bake(sheet,88,24,16,16,x-8,y+16,assetdepth+2)
            tile_bake(sheet,120,24,16,16,x+8,y+16,assetdepth+2)
        } else {
            //larger sizes with stem
            getregion(x)
            tile_bake(sheet,88,24,48,16,x-16,y+16,assetdepth+2)
            y+=16
            while (stopit=0 && y<region.ky) {
                tile_bake(sheet,104,40,16,16,x,y+16,assetdepth+2)
                y+=16
                if place_meeting(x,y,ground) stopit=1 //if you find ground then this is the last one
            }
        }
    }
    x=xstart y=ystart
}

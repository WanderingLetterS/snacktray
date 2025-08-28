#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!position_meeting(x-8,y+8,mushblock2)) {
    getregion(x)
    sheet=global.master[biome]
    i=instance_create(x,y,phaser)
    if (!position_meeting(x+24,y+8,mushblock2)) {
        //1x1 mushroom without bottom
        tile_bake(sheet,88,8+48,8,16,x,y,999997)
        tile_bake(sheet,128,8+48,8,16,x+8,y,999997)
    } else {
        tile_bake(sheet,88,8+48,16,16,x,y,999997)
        while (position_meeting(x+40,y+8,mushblock2)) {
            x+=16
            tile_bake(sheet,104,8+48,16,16,x,y,999997)
        }
        x+=16
        tile_bake(sheet,120,8+48,16,16,x,y,999997)
        x+=16
        i.image_xscale=(x-xstart)/16
        x=mean(x,xstart)-8
        if (i.image_xscale=2) {
            //2x1 mushroom with bottom
            tile_bake(sheet,88,24+48,16,16,x-8,y+16,assetdepth+2)
            tile_bake(sheet,120,24+48,16,16,x+8,y+16,assetdepth+2)
        } else {
            //larger sizes with stem
            getregion(x)
            tile_bake(sheet,88,24+48,48,16,x-16,y+16,assetdepth+2)
            y+=16
            while (stopit=0 && y<region.ky) {
                if place_meeting(x,y,ground) stopit=1 //if you find ground then this is the last one
                tile_bake(sheet,104,48+40,16,16,x,y+16,assetdepth+2)
                y+=16
            }
        }
    }
    x=xstart y=ystart
}

#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

if (object_index=signpost) {


    i=instance_create(x+8,y-16,flag)
    i.ystart-=122
    i.issign=1
    i.no1up=1

} else {
    maxplayery=y
    instance_create(x,y,ground)
    tile_bake(global.master[biome],248,312,32,16,x-8,y,1000000)
    repeat (9) {
        y-=16
        tile_bake(global.master[biome],248,296,32,16,x-8,y,1000000)
    }
    y+=16//changes to how the thing is drawn caused this to happen
    tile_bake(global.master[biome],248,280,32,16,x-8,y-32,1000000-2)

    i=instance_create(x+8,y-16,flag)
    i.maxplayery=maxplayery-16
    i.maxdrawflagy=i.y+8
}

y=ystart
repeat (10) {
    x-=16
    if (!position_meeting(x+8,y+24,ground)) break
}

i.levelendid=global.levelendcount
i.nextlevel=nextlevel
endstagex=x+16
global.levelendcount+=1

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=1
width=4
height=4
image_speed = 0;
getregion(x)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

sheet=global.master[biome]
terraintile=1
by=1
width=unreal(width)
height=unreal(height)
color=unreal(color)

repeat (height) {
    i+=1
    by=!by
    if i=1 offy=8+80*color
    else if i=height offy=56+80*color
    else offy=24+80*color+(by*16)
    if i=1 && i=height offy=72+80*color
    j=0
    repeat (width){
        j+=1
        if j=1 offx=8
        else if j=width offx=56
        else offx=24+(bx*16)
        if j=1 && j=width offx=72
        var t;
        tile_add(sheet,offx,offy,16,16,x+((j-1)*16),y+((i-1)*16),assetdepth+3)
    }
}
i=instance_create(x,y,phaser)
i.image_xscale=width
instance_destroy()

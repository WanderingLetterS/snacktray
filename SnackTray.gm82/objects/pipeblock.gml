#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xgo=x
nextlevel=""
name=""
content=""
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

sheet=global.master[biome]

if (funnytruefalse(jet)) {
    i=instance_create(x-16,y-48,jetstream)
    i.dir=90
    i.strength=0.5
    i.image_xscale=2
    i.image_yscale=3
    i.natural=true
    if (region.typebg="water") i.water=1
    t=0
    cann=1
}
if (content!="") {
    i=instance_create(x,y+4,pipeitemspawner)
    i.content=content
    i.maxitem=maxitem
    i.vsp=-0.25
    i.cann=1
    with (i) event_user(0)
}

if (!position_meeting(x+8,y-8,downpipe)) {
    with (instance_create(x-16,y,ground)) image_xscale=2
    tile_bake(sheet,168,8,32,16,x-16,y,1000000)
} else y-=16
while (!position_meeting(x-8,y+24,collider) && !position_meeting(x+8,y+24,collider) && !position_meeting(x-8,y+24,pipetiler) && !position_meeting(x+8,y+24,pipetiler) && y<region.ky) {
    y+=16
    i=instance_create(x-16,y,pipetiler) i.type="l" i.biome=biome
    i=instance_create(x,y,pipetiler) i.type="r" i.biome=biome
}

coll=instance_position(x+8,y+24,barrier)
if (!coll) coll=instance_position(x+8,y+24,brick)

if (coll) {
    if (coll.object_index=barrier || coll.object_index=brick || coll.object_index=phaser) {
        if (coll.object_index=barrier) {
            y+=16
            i=instance_create(x-16,y,pipetiler) i.type="l" i.biome=biome
            i=instance_create(x,y,pipetiler) i.type="r" i.biome=biome
            y+=16
            with (coll) instance_destroy()
            tile_bake(sheet,232,72,32,16,x-16,y,1000000)
        } else {
            y+=16
            tile_bake(sheet,232,72,32,32,x-16,y,1000000)
        }
        with (brick) y-=verybignumber
        while (!position_meeting(x-8,y+24,collider) && !position_meeting(x+8,y+24,collider) && y<region.ky) {
            y+=16
            tile_bake(sheet,232,88,32,16,x-16,y,1000001)
        }
        with (brick) y+=verybignumber
        tile_bake(sheet,232,88,32,8,x-16,y,1000001)
    } else tile_bake(sheet,168,24,32,8,x-16,y,1000001)
} else tile_bake(sheet,168,24,32,8,x-16,y,1000001)

y=ystart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (string(name)!="0" || string(target)!="0") draw_omitext(x,y,string(name)+"#"+string(target))

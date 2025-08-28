#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xgo=x
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
    i=instance_create(x-16,y+16,jetstream)
    i.dir=270
    i.strength=0.5
    i.image_xscale=2
    i.image_yscale=3
    i.natural=true
    if (region.typebg="water") i.water=1
    t=0
    cann=1
}
if (content!="") {
    i=instance_create(x,y+12,pipeitemspawner)
    i.content=content
    i.maxitem=maxitem
    i.vsp=0.25
    with (i) event_user(0)
}

if (!position_meeting(x+8,y+24,pipeblock)) {
    with (instance_create(x-16,y,ground)) image_xscale=2
    tile_bake(sheet,168,120,32,16,x-16,y,1000000)
} else y+=16

while (!position_meeting(x-8,y-8,collider) && !position_meeting(x+8,y-8,collider) && !position_meeting(x-8,y-8,pipetiler) && !position_meeting(x+8,y-8,pipetiler) && y>=0) {
    y-=16
    i=instance_create(x-16,y,pipetiler) i.type="lu" i.biome=biome
    i=instance_create(x,y,pipetiler) i.type="ru" i.biome=biome
}

if (y<=0) {
    with (instance_create(x-16,y,barrier)) {
        image_xscale=2
        image_yscale=32
        y-=16*31
    }
} else {
    coll=instance_position(x+8,y-8,barrier)
    if (!coll) coll=instance_position(x+8,y-8,brick)

    if (coll) {
        if (coll.object_index=barrier || coll.object_index=brick || coll.object_index=phaser) {
            if (coll.object_index=barrier) {
                y-=16
                i=instance_create(x-16,y,pipetiler) i.type="lu" i.biome=biome
                i=instance_create(x,y,pipetiler) i.type="ru" i.biome=biome
                y-=16
                with (coll) instance_destroy()
                tile_bake(sheet,232,24,32,16,x-16,y,1000000)
            } else {
                y-=32
                tile_bake(sheet,232,8,32,32,x-16,y,1000000)
            }
            with (brick) y-=verybignumber
            while (!position_meeting(x-8,y-8,collider) && !position_meeting(x+8,y-8,collider) && y>0) {
                y-=16
                tile_bake(sheet,232,8,32,16,x-16,y,1000001)
            }
            with (brick) y+=verybignumber
            tile_bake(sheet,232,16,32,8,x-16,y+8,1000001)
        } else tile_bake(sheet,168,112,32,8,x-16,y+8,1000001)
    } else tile_bake(sheet,168,112,32,8,x-16,y+8,1000001)
}

y=ystart

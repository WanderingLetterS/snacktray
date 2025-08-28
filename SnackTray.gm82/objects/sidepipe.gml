#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
    i=instance_create(x-48,y,jetstream)
    i.dir=180
    i.strength=0.5
    i.image_xscale=3
    i.image_yscale=2
    i.natural=true
    if (region.typebg="water") i.water=1
    t=0
    cann=1
}
if (content!="") {
    i=instance_create(x+4,y+16,pipeitemspawner)
    i.content=content
    i.maxitem=maxitem
    i.hsp=-0.25
    with (i) event_user(0)
}

i=instance_create(x,y,ground)
i.image_yscale=2

tile_bake(sheet,136,40,16,32,x,y,1000000)
var ye; ye=0
while !(position_meeting(x+24,y+8,collider) || x>region.x || ye) {
    x+=16
    if (position_meeting(x+8,y+8,theothersidepipe)) {ye=1 break}
    with (instance_position(x+8,y+8,pipetiler)) {type="1" ye=1}
    with (instance_position(x+8,y+24,pipetiler)) {type="4" ye=1}
    if (ye) {
        with (instance_position(x+24,y+8,pipetiler)) if (type="r" || type="ru") type="2"
        with (instance_position(x+24,y+24,pipetiler)) if (type="r" || type="ru") type="3"
    } else tile_bake(sheet,152,40,16,32,x,y,1000000)
}
if (ye) x-=16
else tile_bake(sheet,152,40,8,32,x+16,y,1000000)
i.image_xscale=(x-xstart)/16+1

x=xstart

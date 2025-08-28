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
    i=instance_create(x+16,y,jetstream)
    i.dir=0
    i.strength=0.5
    i.image_xscale=3
    i.image_yscale=2
    i.natural=true
    if (region.typebg="water") i.water=1
    t=0
    cann=1
}
if (content!="") {
    i=instance_create(x+12,y+16,pipeitemspawner)
    i.content=content
    i.maxitem=maxitem
    i.hsp=0.25
    with (i) event_user(0)
}

tile_bake(sheet,216,72,16,32,x,y,1000000)
var ye; ye=0
while !(position_meeting(x-8,y+8,collider) || x<region.lefthand || ye) {
    x-=16
    if (position_meeting(x+8,y+8,sidepipe)) {ye=1 break}
    with (instance_position(x+8,y+8,pipetiler)) {type="2u" ye=1}
    with (instance_position(x+8,y+24,pipetiler)) {type="3u" ye=1}
    if (ye) {
        with (instance_position(x-8,y+8,pipetiler)) if (type="l" || type="lu")type="1u"
        with (instance_position(x-8,y+24,pipetiler)) if (type="l" || type="lu")type="4u"
    } else tile_bake(sheet,200,72,16,32,x,y,1000000)
}
if (ye) x+=16
else tile_bake(sheet,200,72,8,32,x-8,y,1000000)

i=instance_create(x,y,ground)
i.image_yscale=2
i.image_xscale=(xstart-x)/16+1

x=xstart

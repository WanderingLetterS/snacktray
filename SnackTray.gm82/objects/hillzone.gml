#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

if (region) {
    state=modulo(round(x)+round(y),0,5)
    x+=8 y+=8
    while (x>region.lefthand && instance_position(x-8,y+24,collider)) x-=16
    x+=32
    do {
        if (state=0) {
            if (checkgroundblocks(x,5) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="widetree" bim="0"}
            if (!checkgroundblocks(x,11)) break x+=11*16 state=1
        } else if (state=1) {
            if (checkgroundblocks(x,5) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="shrub3" bim="0" offset="8,0"}
            if (!checkgroundblocks(x,5)) break x+=5*16 state=2
        } else if (state=2) {
            if (checkgroundblocks(x,3) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="mushroom" bim="0"}
            if (!checkgroundblocks(x,7)) break x+=7*16 state=3
        } else if (state=3) {
            if (checkgroundblocks(x,3) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="shrub" bim="0"}
            if (!checkgroundblocks(x,18)) break x+=18*16 state=4
        } else if (state=4) {
            if (checkgroundblocks(x,4) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="shrub2" bim="0"}
            if (!checkgroundblocks(x,7)) break x+=7*16 state=0
        }
    } until (x>region.x)
}

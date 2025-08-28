#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

if (region) {
    state=modulo(round(x)+round(y),0,13)
    y+=8 x+=8
    while (x>region.lefthand && instance_position(x-8,y+24,collider)) x-=16
    x+=32
    do {
        if (state=0) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="smalltree" bim="0"}
            if (!checkgroundblocks(x,2)) break x+=2*16 state=1
        } else if (state=1) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="tree" bim="0"}
            if (!checkgroundblocks(x,7)) break x+=7*16 state=2
        } else if (state=2) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="fencel" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=3
        } else if (state=3) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="fence" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=4
        } else if (state=4) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="fence" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=5
        } else if (state=5) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="fence2r" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=6
        } else if (state=6) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="tree" bim="0"}
            if (!checkgroundblocks(x,4)) break x+=4*16 state=7
        } else if (state=7) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="smalltree" bim="0"}
            if (!checkgroundblocks(x,2)) break x+=2*16 state=8
        } else if (state=8) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="smalltree" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=9
        } else if (state=9) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="rock3" bim="0"}
            if (!checkgroundblocks(x,14)) break x+=14*16 state=10
        } else if (state=10) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="rock1" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=11
        } else if (state=11) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="smalltree" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=12
        } else if (state=12) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="rock" bim="0"}
            if (!checkgroundblocks(x,1)) break x+=1*16 state=13
        } else if (state=13) {
            if (checkgroundblocks(x,1) && !instance_position(x,y,collider)) with instance_create(x,y,anchor) {name="tree" bim="0"}
            if (!checkgroundblocks(x,2)) break x+=2*16 state=0
        }
    } until (x>region.x)
}

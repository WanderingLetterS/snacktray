#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
owner=global.coll
if (!insted) {
    if (owner.fly) owner.vsp=0
    else owner.vsp=1.5
}
if(!wait) {
    wait=13
    tpos=1
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(type="end") {
    global.nextlevel=text
    game_stageend()
}
if(type="char") {
    with(player) {
        name=text
    }
}
if(type="block") {
    coll=instance_position(x+8,y-8,genblock)
    if(coll) {
        with(coll) {
            instance_destroy()
        }
    } else {
    instance_create(x,y-16,genblock)
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_function,0,x,y+dy)//temp

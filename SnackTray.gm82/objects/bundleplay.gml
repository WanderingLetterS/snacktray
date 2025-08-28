#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
no=!global.bundles[0,0]
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!no) {
    bundlectrl.go=1
    global.bundled=1
    if (skindat("bundleplayer")) segafadeto(bundleroster,"systemgo")
    else segafadeto(roster,"systemgo")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (no) {
    draw_sprite_ext(sprite_index,0,x,y,1,1,0,$ffffff,0.5)
    draw_sprite_ext(sprite_index,2,x,y,1,1,0,$ffffff,0.5)
} else {
    draw_sprite(sprite_index,!!over,x,y)
    draw_sprite(sprite_index,2,x,y)
}

over=0

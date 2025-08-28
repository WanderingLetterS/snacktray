#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str=lang("bundle screen")

with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}

go=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!go) game_reset()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.halign=1
draw_systext(x,y,str)
global.halign=0

draw_sprite(spr_border,0,0,0)

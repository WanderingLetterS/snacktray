#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top=fh*floor((bgmanager.animcarl*myass2) mod myass1)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_exists(sprite_index) sprite_delete(sprite_index)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_part(spr,0,0,top,w,fh,x+dx-hw,y+dy-fh)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,replaybomb)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bomb) f=min(1,f+0.05)
else f=max(0,f-0.05)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!replayctrl.selgo) {
    bomb=!bomb
    if (bomb) sound("systemselect")
    else sound("systemreturn")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,!!over,x,y,1,1,0,$ffffff,1-replaybox.f)

if (f>0) draw_sprite_ext(sprite_index,7,x,y,1,1,0,$ffffff,1-replaybox.f)
else draw_sprite_ext(sprite_index,4,x,y,1,1,0,$ffffff,1-replaybox.f)

over=0

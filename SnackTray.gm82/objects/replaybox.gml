#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spr=-1
f=0
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (replayctrl.selgo) f=min(1,f+0.05)
else f=max(0,f-0.05)

x=cosine(xstart,69,f)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (spr!=-1) draw_sprite_ext(spr,0,x+1,y+1,1,1,0,$ffffff,f)

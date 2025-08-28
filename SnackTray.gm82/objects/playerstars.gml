#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=-1
getregion(x)

x1=irandom_range(-4,4)
x2=irandom_range(-4,4)
y1=irandom_range(-4,4)
y2=irandom_range(-4,4)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
fr+=1

if (fr>5) frame=1
if (fr>8) frame=2
if (fr>11) frame=3
if (fr>14) frame=4
if (fr>20) {instance_destroy() visible=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
colt=playerskindat(myp,"bollcoltop"+string(myp))

if view_current=setview{
draw_sprite_part_ext(global.effectssheet[biome],0,8+25*floor(frame),283,24,24,view_xview[view_current]+floor(x-12)+x1,view_yview[view_current]+floor(y-10)+y1,1,1,$ffffff,gamemanager.hud_alpha[view_current])


draw_sprite_part_ext(global.effectssheet[biome],0,8+25*floor(frame),308,24,24,view_xview[view_current]+floor(x-12)+x2,view_yview[view_current]+floor(y-6)+y2,1,1,colt,gamemanager.hud_alpha[view_current])


}

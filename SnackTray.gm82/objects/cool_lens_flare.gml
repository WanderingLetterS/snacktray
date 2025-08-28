#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=0
s=0.3
f1=0
f2=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a-=4
s=(0.5+0.3*sin(a/80))*f1*f2
f1=min(1,f1+0.05)
f2=max(0,f2-0.01)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,s,s,a,$ffffff,f2)
draw_sprite_ext(sprite_index,1,x,y,s*32,s,a,$ffffff,f2)
draw_sprite_ext(sprite_index,2,x,y,s,s*32,a,$ffffff,f2)
draw_set_blend_mode(0)

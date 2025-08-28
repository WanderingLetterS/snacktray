#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
repeat (2) draw_ellipse_color(x-40,y+24,x+40,y+48,$ffffff,0,0)
draw_set_blend_mode(0)

ax=sqrt(abs(genericcursor.x-x))/8*sign(genericcursor.x-x)
ay=sqrt(abs(genericcursor.y-y))/8*sign(genericcursor.y-y)

l=sprite_get_width(biosctrl.sprite)/48
for (i=0;i<l;i+=1) draw_sprite_part_ext(biosctrl.sprite,0,i*48,0,48,48,x-24*3+ax*(i-1),y-24*3+ay*(i-1),3,3,$ffffff,1)

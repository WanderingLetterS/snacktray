#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)

x=irandom(400)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x<-20) event_user(0)

image_yscale = ((room_height+64)-y)/112
image_xscale = image_yscale
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=choose(1,0)
image_speed=0

x=420
y=104+irandom(112)

with (introslide) if (id!=other.id && y=other.y && x>other.x-40) other.y=max(104,(other.y+16) mod 164)
depth=(-(y-104)/112)+52

if (!introctrl.classic) image_blend=merge_color($ffff80,$808040,1-(y-104)/110)

hspeed=-(1+(y-104)/17.5)/2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,floor(x),y,abs(image_xscale),abs(image_yscale),0,c_white,1)

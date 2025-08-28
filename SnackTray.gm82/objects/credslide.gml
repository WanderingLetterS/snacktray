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
if (x>420) event_user(0)

x+=hspeed*(credctrl.spd-1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=choose(2,3)
image_speed=0

x=-20
y=104+irandom(14)*4

with (introslide) if (id!=other.id && y=other.y && x<other.x+40) other.y=max(104,(other.y+16) mod 164)
depth=99-(y-104)

image_blend=merge_color($4080,0,(y-104)/110)

hspeed=(1+(y-104)/17.5)*0.35
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,floor(x),y,1,1,0,image_blend,1)

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dy=224
h=1

alpha=0

off=0
candismiss=0
alarm[0]=30
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
candismiss=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str=wordwrap(str,view_wview[0]/8-2)
global.tcalc=1
draw_systext(0,0,str)
global.tcalc=0
h=maxy+15
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (off) {dy=min(224,dy+4) if (dy=224) instance_destroy()}
else dy=max(224-h,dy-4)

if (h!=1) alpha=0.5*((224-dy)/h)

if ((advance() || mouse_check_button_pressed(mb_left)) && candismiss) off=1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=lemon) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[view_current]
y=view_yview[view_current]+dy
w=view_wview[view_current]

with (gamemanager) if (pause) {other.x=0 other.y=other.dy}

rect(x-1,view_yview[view_current]-1,w+2,view_hview[view_current]+2,0,alpha)
draw_set_color(0)
draw_rectangle(x,y,x+w,y+h,0)
draw_set_color($ffffff)
draw_rectangle(x,y,x+w-1,y+h-1,1)
draw_systext(x+8,y+8,str)

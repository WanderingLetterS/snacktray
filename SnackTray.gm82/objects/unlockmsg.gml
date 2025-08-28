#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dy=224
h=48

open=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
open=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (open) dy=max(224-h,dy-4)
else dy=min(dy+4,224)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=titlescreen || room=mainmenu) {open=1 alarm[1]=175}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=titlescreen || room=mainmenu) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=lemon || room!=speciale) {
x=view_xview[view_current]+64
y=view_yview[view_current]+dy
w=view_wview[view_current]-128

with (gamemanager) if (pause) {other.x=0 other.y=other.dy}

draw_set_color(0)
draw_rectangle(x,y,x+w,y+h,0)
draw_set_color($ffffff)
draw_rectangle(x,y,x+w,y+h-1,1)
global.halign=1
global.valign=1
draw_systext(x+(w-64)/2,y+h/2,str)
global.halign=0
global.valign=0
draw_sprite(spr_rostercard,0,x+w-48,y+24)
draw_sprite(global.charicon[p2,0],0,x+w-48,y+24)
} else {
x=verybignumber
y=verybignumber
}

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
str=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=max(0,alpha-0.05)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(view_xview[0],view_yview[0],view_wview[0],50,0,0.5)
rect(view_xview[0],view_yview[0]+view_hview[0]-120,view_wview[0],120,0,0.5)

global.tscale=2
global.halign=1
global.valign=2
draw_systext(view_xview[0]+512,view_yview[0]+580-16,wordwrap(str,45),$ffffff,alpha)
global.tscale=1
global.halign=0
global.valign=0

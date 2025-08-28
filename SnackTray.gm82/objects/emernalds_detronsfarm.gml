#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=0
a=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=min(500,f*1.05+8)

if (f=500) instance_destroy()

a=(xstart+51.42*color) mod 360
if (a<180) depth=2
else depth=-1

x=xstart+lengthdir_x(f,a)
y=ystart+lengthdir_y(f,a)*0.5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("macguffin")

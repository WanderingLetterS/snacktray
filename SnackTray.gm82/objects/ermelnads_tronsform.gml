#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=0
a=0
b=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=min(1,f+0.03)

if (f=1) instance_destroy()

b+=16
a=(b+xstart+51.42*color) mod 360
if (a<180) depth=5
else depth=-5

l=32*sin(f*2.9)

x=xstart+lengthdir_x(l,a)
y=ystart+lengthdir_y(l,a)*min(1,f*1.5)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_effects("macguffin")

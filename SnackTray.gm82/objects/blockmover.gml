#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=hsp
y+=vsp
k.x=x
k.y=y
k.xstart=x
k.ystart=y
k.speed=0
c+=1
if (k.object_index=tiler) with (k) event_user(4)
if (c=16) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/

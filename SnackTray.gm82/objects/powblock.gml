#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
xsc=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=1
instance_create(nearestplayer().view_xview[view_current]-8,nearestplayer().view_yview[view_current]+16,powhitbox)
if powphase>=3 instance_destroy()
else powphase+=1
screenshake(y,10)
image_yscale-=powphase*0.1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if powphase>=3 instance_destroy()

if pxsc!=0
pxsc-=0.2
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_tile("powblock")

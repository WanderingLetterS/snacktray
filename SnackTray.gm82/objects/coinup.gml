#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30
vspeed=-3.5
gravity=0.2

getregion(x)
sound("itemcoin")
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
instance_create(x,y,glitter)
if (fresh) with (instance_create(x,y,scoreeffect)) {value=0 p2=other.p2} //don't show the 100 score effect if you did not gain 100 score
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=min(2,vspeed)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

ssw_items("coinup")

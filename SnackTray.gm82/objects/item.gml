#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (powner) powner.items-=1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed!=0) if (place_meeting(x,y+4,lavablock)) {instance_create(x,y,smoke) sound("enemykick") instance_destroy()}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=hsp
if (sign(hsp)=1) hsp=max(0,hsp-0.0625) else hsp=min(0,hsp+0.0625)

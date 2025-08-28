#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=0
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr+=1

if (fr>5) frame=1
if (fr>8) frame=2
if (fr>11) frame=3
if (fr>14) frame=4
if (fr>20) {instance_destroy() visible=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_weffects("glitter")

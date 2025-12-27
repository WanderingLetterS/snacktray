#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
col=0
a=0
b=0
p2=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (b) {
    a=max(0,a-0.05)
    if (a=0) instance_destroy()
} else {
    a=min(1,a+0.05)
    if (a=1) b=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (view_current=p2) rect(view_xview[p2],view_yview[p2],global.screenwidth,global.screenheight,0,a)

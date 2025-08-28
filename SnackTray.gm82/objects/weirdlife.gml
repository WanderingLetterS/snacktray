#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0
soundstop("item1up")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (c= 0) sound("item1up",0,0.89089)
if (c= 8) sound("item1up",0)
if (c=16) sound("item1up",0,0.89089)
if (c=24) sound("item1up",0,0.79370)
if (c=32) sound("item1up",0,0.74915)
if (c=40) sound("item1up",0,0.70710)
if (c=48) sound("item1up",0,0.74915)
if (c=56) {sound("item1up",0) instance_destroy()}

c+=1

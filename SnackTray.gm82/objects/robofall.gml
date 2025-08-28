#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
breakflag=1
alarm[0]=12
image_xscale=24
image_yscale=8
alarm[1]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x-6,y,part) i.hspeed=-1 i.vspeed=-5
i=instance_create(x+6,y,part) i.hspeed=1 i.vspeed=-5
i=instance_create(x-12,y,part) i.hspeed=-1.5 i.vspeed=-3
i=instance_create(x+12,y,part) i.hspeed=1.5 i.vspeed=-3

i=instance_create(x,y,psmoke) i.sheet=sheet i.vspeed=-0.5
i=instance_create(x-8,y+4,psmoke) i.sheet=sheet i.hspeed=-2 i.vspeed=-1
i=instance_create(x+8,y+4,psmoke) i.sheet=sheet i.hspeed=2 i.vspeed=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.x+owner.hsp

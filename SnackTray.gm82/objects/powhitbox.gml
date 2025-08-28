#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=400+16
image_yscale=224+16
alarm[0]=15
owner=nearestplayer()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll=instance_place(x,y,enemy)
if coll {
global.coll=owner.id
enemydie(coll,2)
}

coll=instance_place(x,y,muncher)
if coll {
with coll {
event_user(0)
}
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=owner.view_xview[view_current]-8
y=owner.view_yview[view_current]+16

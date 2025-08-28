#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=-0.5
xsc=1
type=0
sprite="redkoopa"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp<=-2) {
    sound("enemystomp")
    with (instance_create(x,y,shell)) {type="red" powner=other.powner}
    if (powner) powner.items+=1
    instance_destroy()
}

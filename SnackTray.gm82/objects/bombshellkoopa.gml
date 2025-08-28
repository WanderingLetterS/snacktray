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
sprite="bombshellkoopa"
enemy2=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp<=-2) {
    sound("enemystomp")
    sound("enemybombfuseshort")
    with (instance_create(x,y,bombshell)) powner=other.powner
    if (powner) powner.items+=1
    instance_destroy()
}

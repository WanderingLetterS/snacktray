#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(moranboll) seen=1
if seen && !instance_exists(moranboll) {
    FMODAllStop()
    room_restart()
    instance_destroy()
}

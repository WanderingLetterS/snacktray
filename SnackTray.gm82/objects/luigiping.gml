#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (owner) {
    playsfx("luigiping")
    stunlock(id,other.id)
    screenshake(x,8)
}
alarm[1]=8
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (owner) {
    with (instance_create(x,y,fballexplosion)) {owner=other.id hspeed=-4}
    with (instance_create(x,y,fballexplosion)) {owner=other.id hspeed=4}
    with (instance_create(x,y,fballexplosion)) {owner=other.id vspeed=-4}
    with (instance_create(x,y,fballexplosion)) {owner=other.id vspeed=4}
}
instance_destroy()

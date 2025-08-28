#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    o=instance_create(x,y,cardfollow)
    if (!cfollower) {cfollower=o last=o}
    else {o.cfollower=cfollower cfollower.cfollow=o cfollower=o}
    o.cfollow=id
    o.owner=id
    o.x+=(10*-xsc)
}

sound("itemkey")
instance_create(x,y,glitter)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("card")

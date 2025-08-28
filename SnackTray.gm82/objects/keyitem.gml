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
    o=instance_create(x,y,keyfollow)
    if (!follower) {follower=o last=o}
    else {o.follower=follower follower.follow=o follower=o}
    o.follow=id
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
ssw_items("key")

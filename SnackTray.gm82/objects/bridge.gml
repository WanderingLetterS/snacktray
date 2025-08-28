#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
o=instance_create(x,y,bridgeblock)

if (position_meeting(x+24,y-8,collider)) o.type="chain"

repeat (25) {
    if (position_meeting(x-8,y+8,collider) || position_meeting(x-8,y+8,bridge)) break
    x-=16
    o=instance_create(x,y,bridgeblock)
}

if (position_meeting(x-8,y-8,collider)) o.type="chainleft"

instance_destroy()

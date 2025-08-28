#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
k=0
frame=0
trigger=0
getregion(x)
x-=8 y-=8 //im sorry it was just really bothering me we have align tool for a reason
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger!="0"){
    visible=0
    if abs(nearestplayer().x-x)<8 && trigger="1" {with (crystaltap) active=0
        if (region.water!=y-4) {
            //if (!active) instance_create(mean(x,other.x),mean(y,other.y),kickpart)
            active=1
            if (region.water=verybignumber) region.water=region.ky
        }
    }
    if abs(nearestplayer().y-y)<8 && trigger="2" {with (crystaltap) active=0
        if (region.water!=y-4) {
            //if (!active) instance_create(mean(x,other.x),mean(y,other.y),kickpart)
            active=1
            if (region.water=verybignumber) region.water=region.ky
        }
    }
}

if (active) {
    region.water=inch(region.water,y-4,1)
    k-=1
    if (!k) {k=4 frame=(frame+1) mod 4}
    if (region.water==y-4) active=0
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (crystaltap) active=0
if (region.water!=y-4) {
    //if (!active) instance_create(mean(x,other.x),mean(y,other.y),kickpart)
    active=1
    if (region.water=verybignumber) region.water=region.ky
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("tap")

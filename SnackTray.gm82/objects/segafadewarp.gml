#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wid=0
w=1
h=1
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wid=unreal(wid,0)
image_xscale=unreal(w,1)
image_yscale=unreal(h,1)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.imma_de_warpin exit

var pwarp,terget;
tmp=other.id
other.imma_de_warpin=1
other.overwritecam=1

instance_activate_object(segafadedest)

with segafadedest {
    if (wid==other.wid) {
        other.terget=id
    }
}

with instance_create(x,y,warpfader) {
    owner=other.tmp
    targx=other.terget.x+8
    targy=other.terget.y
}

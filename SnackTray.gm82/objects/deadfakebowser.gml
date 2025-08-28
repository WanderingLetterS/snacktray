#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=-1
ysc=-1
gravity=0.075
frame=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_meeting(x,y+4,bridgeblock) || kil) gravity=0.075

counter+=1 if (counter=4) {counter=0 frame=!frame}
#define Collision_collider
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!kil) {
    vspeed=0 gravity=0
    y=other.y-18
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_boss()

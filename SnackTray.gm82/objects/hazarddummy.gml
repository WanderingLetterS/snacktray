#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
createcode=""
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (__gm82core_compiler_exists[event]) {
    code_destroy(event)
    code_destroyed=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,player)
with (instance_place(x,y,player)) hurtplayer("spike")
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (__gm82core_compiler_exists[event]) {
    code_destroy(event)
    code_destroyed=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event=code_compile(createcode)
if !code_destroyed && __gm82core_compiler_exists[event]
code_execute(event)

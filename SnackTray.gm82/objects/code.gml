#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
image_speed=0
event=-1
text=""
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
fn=""
if (go) || (global.channel[real(channelid)]) { //There used to be an always type check here, but string check slow so always just sets itself to go now.
    if !code_destroyed && __gm82core_compiler_exists[event]
    code_execute(event)
    if (run=="loop") && (!go) {
        go=1
        image_index=0
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemontest visible=1
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
if run!="draw" && !global.lemontest {visible=0}

event=code_compile(text)

if run="always"
go=1

if (run="auto") {
    if !code_destroyed && __gm82core_compiler_exists[event]
    code_execute(event)
} else if run="always" {
    code_execute(event)
    go=1
} else image_index=1

channelid=unreal(channelid,0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (run="draw") {
    if !code_destroyed && __gm82core_compiler_exists[event]
    code_execute(event)
}

if run!="draw" && global.lemontest draw_self()

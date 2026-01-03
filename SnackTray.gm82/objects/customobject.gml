#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1

IMNOTDONEYET=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

IMNOTDONEYET=0
if string(mytype)=""||string(mytype)="0" {instance_destroy() exit}

if !variable_global_get("cobject_code_"+mytype) {
        if !file_exists(globalmanager.moddir+"object\"+mytype+"\object.gml") {instance_destroy() exit}
        else {
            variable_global_set("cobject_code_"+mytype,code_compile(file_text_read_all(globalmanager.moddir+"object\"+mytype+"\object.gml")))
            my_code=variable_global_get("cobject_code_"+mytype)
        }
} else {
    my_code=variable_global_get("cobject_code_"+mytype)

}
//.. is it really this simple? Uhh... wow.

global.cobjectentrypoint="create"
code_execute(my_code)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if IMNOTDONEYET||(my_code==0) exit
global.cobjectentrypoint="step"
code_execute(my_code)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if IMNOTDONEYET||(my_code==0) exit
global.cobjectentrypoint="draw"
code_execute(my_code)

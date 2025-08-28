#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=6+(instance_number(badcode) * 2)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//message
sound("systemcodeblockfail")
show_message('"'+string(text)+'" is not allowed to be used in code blocks.#This code will not be run until it is removed.')
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lemontest) draw_self()

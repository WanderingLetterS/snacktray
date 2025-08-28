#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//hi this was an old object meant to be used for cutscenes n shit, allowing to player to instantly change the players's sprite upon activation. it kinda got scrapped because codeblocks could do it better.
channelid=0;
setspr=""
global.sspr=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[real(channelid)]){
    global.sspr = setspr
    with(player){spriteswitch(0)}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.lemontest draw_self()

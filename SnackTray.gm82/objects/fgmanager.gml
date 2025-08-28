#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//turn off with gamemanager variable
if (gamemanager.fgfxdisable) visible=0 else visible=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///foreground and fg asset
if !settings("removeassets")
with (bgmanager){event_user(0)}

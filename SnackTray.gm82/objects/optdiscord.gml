#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
settings('discord',!settings('discord'))

if settings('discord'){
discord_init_dll() discord_init_app("984471357758783498")}
else {discord_free_app() external_free("sbdrpc.dll")}
sound('systemselect')
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over+2*settings('discord'),x,y)

over=0

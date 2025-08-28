#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over) {
    mmlegends.str=lang("cog menu")
    mmlegends.yeah=""
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!rosterctrl.cog) sound("systemselect") rosterctrl.cog=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)
draw_omitext(x-12,y-8,"SETTINGS")
over=0

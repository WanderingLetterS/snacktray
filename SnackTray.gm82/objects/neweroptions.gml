#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(200,112,genericcursor)) {
    image_blend=playercol(0,0)
    special=1
}
if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","cog-icon")}

global.quietyou=0

str=""
global.creditsroll=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.halign=1
global.valign=1
draw_systext(x,y,string_replace_all(wordwrap(str,20),"#","##")) str=""
global.halign=0
global.valign=0

draw_sprite(spr_border,0,0,0)

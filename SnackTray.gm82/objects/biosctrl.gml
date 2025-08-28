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


if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","sonic-icon")}

maxtrophies=global.characters
trophy=0
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite=global.chariconb[trophy]
applyplayerskin(global.pbase,0,"less",trophy)
name=playerskinstr(0,global.charname[trophy]+" name")
text=global.charbio[trophy]
games=global.chargames[trophy]

text=wordwrap(text,18)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.tscale=2
global.halign=1
global.valign=1
draw_systext(84,189,format(trophy+1,2)+"/"+format(maxtrophies,2))
global.tscale=1
global.halign=0
global.valign=0

draw_sprite(spr_border,0,0,0)

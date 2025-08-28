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

if (global.lastroom==ta_results)
    game_reset()
else if (global.lastroom!=roster && global.lastroom!=ta_roster && global.lastroom!=options && global.lastroom!=trophies && global.lastroom!=modloader && global.lastroom!=replays) {
    game_reset()
    if (egg()) mus_play("_optionsc",1)
    else if (egg()) mus_play("_optionsmf",1)
    else menumusic()
}

global.quietyou=0
global.bundled=0
global.creditsroll=0
global.gamemode="classic"

lock=0

joy_detect()
if (global.discordoverride<2) {discord_update_presence("","In Menu","boll-icon","")}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_border,0,0,0)

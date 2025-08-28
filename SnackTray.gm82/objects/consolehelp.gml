#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=0.05
dying=0

help[0] = "- GENERAL -
HELP: Show this popup.
CRASH: Crash the game.
VAPORWAVE: Enable bollwave.
FAST: Unlock the game's framerate and show current fps.
FPS: Show current fps.
SHOWBUTTONS: Show player inputs.
RESET: Restart the current stage if currently in one.
CAMLOCK: Locks the game's camera."

help[1] = "-  CHEAT  -
DEBUG: Enable debug features.
RUN: Execute GML code.
LIVES [lives]: Set the player's lives.
4126: Recieve all 7 Chaos Emeralds.
6214: Use battle mode Super Sonic behaviour.
TIME: Set the current stage's time.
LOWGRAV: Enable lower gravity.
HIGHGRAV: Enable higher gravity."

help[2] = "- MODDING -
CHARMRELOAD: Reloads all loaded charms.
SINGLERELOAD: Reloads player 1's current charm.
CHANGECHARM: Changes player 1's character.
SKINRELOAD: Reloads all players' skins.
SKINNEXT [player]: Sets the player's skin to the next one.
SKINPREV [player]: Sets the player's skin to the previous one.
RELOADWORLD: Reloads the current world skin.
RELOADLEVEL: Reloads the current level skin.
MAKELANG: Generates an example file for language mods.
MAKEMOD: Opens the download page for Gamemaker 8.2."

breaks="

"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
input_get(0)
input_keystates()
if xbut {page=(page+1) mod 3 if page==2 breaks="" else breaks="

"}
if ybut dying=1
a = min((a - (dying * 0.025) + (!dying * 0.05)), 1)
if a<=0 instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if view_current exit

draw_rect(8+view_xview[0],8+view_yview[0],256,112 ,c_black,min(1,a)-0.275)
draw_omitext(10+view_xview[0],18+view_yview[0],"Commands:

"+help[page]+breaks+"

    Change Page: [${c=#b4bcc6}X$|]                        Close Help: [${c=#a970ff}Y$|]",c_white,min(1,a),1,1)

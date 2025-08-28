#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gm=2
if (global.gamemode="coop") gm=1
if (global.gamemode="battle") gm=0
slide=0
//pick=1
point=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pcount=-1
with (rosterbox) if (ready) other.pcount+=1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
point=-1

if (gm=0) {
    if (!pcount) global.gamemode="classic"
    else global.gamemode="battle" //co-op is the only reasonable gamemode i can think of from the unused 5 so it gets to stay in the gm81 :) (still unused though)
    //are you sure about that?
}
if (gm=1) {
    if (!pcount) global.gamemode="classic"
    else global.gamemode="coop"
    //dont know who left that "are you sure about that?" comment but uh no im not LOL
}
if (gm=2) {
    if (!pcount) global.gamemode="classic"
    else global.gamemode="sscreencoop"
    //that was a fun read, people should start signing their comments  -  -S-
}

visible=pcount
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gm=(gm+1) mod 3
sound("systemselect")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i,col;

draw_self()

col=$FFFFFF
if global.gamemode=="battle" col=$4B4BFF
else if global.gamemode=="coop" col=$4BFF4B
else if global.gamemode=="sscreencoop" col=$4BFF4B
else if global.gamemode=="timeattack" col=$FF3860

global.halign=1
draw_systext(x,y,lang("gamemode "+global.gamemode),col,1)
global.halign=0

#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (j=0;j<9;j+=1) settings("contestbkp"+string(j),settings("contest"+string(j)))
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (rosterctrl.cog) {
    sound("systemreturn")
    rosterctrl.cog=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_button24,!!over,x,y)
draw_sprite(spr_button24,6,x,y)
over=0

global.halign=1
draw_systext(200,8,lang("cog menu"))
global.halign=0

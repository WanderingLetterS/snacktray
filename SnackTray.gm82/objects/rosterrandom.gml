#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
selflash=max(0,selflash-1)
if (selflash) flash=((selflash mod 8)>3)
else flash=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
colore=c_white if over && !flash colore=$A000
draw_sprite_ext(spr_rostercard,7,x,y,1,1,1,colore,1)

if (over) {mmlegends.yeah="" mmlegends.str=lang("roster random")}

over=0

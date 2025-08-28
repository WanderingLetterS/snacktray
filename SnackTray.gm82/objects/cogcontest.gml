#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
k="contest"+string(i)

settings(k,!settings(k))

check=0
for (j=0;j<9;j+=1) if (settings("contest"+string(j))) {check=1 break}

if (!check) settings(k,1) else sound("systemselect")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=settings("contest"+string(i))*2+over
draw_self()
over=0
global.valign=1
draw_systext(x+24,y,lang("score "+string(i)))
global.valign=0

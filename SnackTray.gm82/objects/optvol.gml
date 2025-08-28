#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("volbalance")=0) pl=-1
else pl=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over) neweroptions.str=lang("tip "+object_get_name(object_index))
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bal=median(0,round((over.x-x)/8)/8+0.5,1)

if (settings("volbalance")!=bal) {settings("volbalance",bal) sound("systemselect") volumehandler()}
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
draw_sprite(spr_optbox,!!over,x,y)
v=settings("volbalance")
global.halign=1
global.valign=1
draw_systext(x,y,"≥ "+string_repeat(chr(5),v*8)+chr(4)+string_repeat(chr(5),8-v*8)+" "+chr(2)) //≥ = low volume
global.halign=0
global.valign=0
over=0

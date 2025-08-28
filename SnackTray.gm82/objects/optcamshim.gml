#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("camshimmie")=1) pl=-1
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
shim=1-median(0,round(((over.y-52)-y)/8)/8+0.5,1)
if (shim<1 && pl=-1) pl=1

if (settings("camshimmie")!=shim) {settings("camshimmie",shim) sound("systemselect") volumehandler()}
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
draw_sprite(spr_camshimmie,!!over,x,y)
v=settings("camshimmie")
global.halign=1
global.valign=1
global.tscale=global.tscale*2
draw_systext(x+5,y+20+v*80 ,"-")
global.tscale=global.tscale/2
global.halign=0
global.valign=0
over=0

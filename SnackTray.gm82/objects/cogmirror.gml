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
settings("mirror",!settings("mirror"))
sound("systemselect")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=settings("mirror")*2+over
draw_self()
over=0
global.valign=1
draw_systext(x+24,y,lang("cog mirror"))
global.valign=0

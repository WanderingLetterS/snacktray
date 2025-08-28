#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if (global.stagecount || global.mplay=1) {
    no=1
}

hold=0 c=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hold=0
with (genericcursor) if (pf2=other.id && akey) other.hold=id

if (hold) c+=1
else c=0

if (c>20) if (!(c mod 4)) with (hold) with (other) event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (no) exit
sound("systemselect")
settings("playstages",modulo(settings("playstages")+sign(other.x-(x+44)),1,33))
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (no) exit
sound("systemselect")
settings("playstages",modulo(settings("playstages")+sign(other.x-(x+44))*4,1,33))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (no) {image_alpha=0.5 image_index=0}
draw_self()
image_index=0
draw_sprite_ext(sprite_index,3,x,y,1,1,0,$ffffff,image_alpha)

global.halign=1
if (global.mplay=1) draw_systext(x+44,y+4,string(global.levellist[0,0]),$ffffff,image_alpha)
else draw_systext(x+44,y+4,string(settings("playstages")),$ffffff,image_alpha)
global.halign=0

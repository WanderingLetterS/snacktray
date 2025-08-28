#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
obj=editobjfind(ground)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=hotbar.x+16+37-15-390+37*(i mod 20)
y=hotbar.y+85+37*(i div 20)+1
#define Collision_editcursor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hotbar.str=lemonobjname(lemongrab.objlist[obj,0])
hotbar.alpha2=1

hotbar.str2=wordwrap(lemonobjdesc(lemongrab.objlist[obj,0]),32)
hotbar.alpha3=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hotbar.obj[1]=obj
hotbar.picked[1]=0
if !(settings("nolemonsound")) sound("lemonclick")
lemonhotbarfamily()

hotbar.cur+=editcursor.shift
if (editcursor.tool!=0 && editcursor.tool!=2) editcursor.tool=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_sprite_ext(spr_editpal,lemongrab.objlist[obj,25],x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editpal,lemongrab.objlist[obj,25],x-1,y-1)

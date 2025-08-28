#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
no=0
yeah=0

if (global.stagecount) no=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
yeah=global.stages
if (over && !no) yeah=min(2,floor((over.x-(x-1))/30))
over=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over && !no) {
    if (over.y>=y+20) {sound("systemselect") global.stages=min(2,floor((over.x-(x-1))/30))}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,global.stages,x,y,1,1,0,$ffffff,1-0.5*no)

global.halign=1
draw_systext(x+44,y+4,lang("stage mode "+string(yeah)),$ffffff,1-0.5*no)
global.halign=0

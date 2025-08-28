#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=0
slow=0
go=0
v=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {sleep(750 + irandom_range(-200,200))
    instance_create(0,0,moranboll)
instance_create(x,y,cccharctrl) instance_destroy()}

if (slow)                v+=(0.06+(v<0.5)*0.06)*0.05
else if (room=titlescreen)     v+=(0.06+(v<0.5)*0.06)*0.3
else                     v+=(0.06+(v<0.5)*0.06)*0.6
if (v>1) {v=1 go=1}
else if (!linked) mus_volume(1-v)
if global.greenmode collar=$ff80ff else collar=$80ffff
color=merge_color(merge_color(0,collar,min(1,v*2)),$ffffff,max(0,(v-0.5)*2))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5)  //intel graphics performing unnecessary alpha test
draw_set_blend_mode(bm_add)
rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1)
draw_set_blend_mode(0)

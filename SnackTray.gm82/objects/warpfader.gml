#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
targx=0
targy=0
color=0
go=0
owner=noone
sound("systemfaderoom")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpey) with owner {overwritecam=0 player_camera(1) stagemusic(id) imma_de_warpin=0}
if (go) {reverse=1 go=0 v=0.9999999 with owner {x=other.targx y=other.targy} warpey=1}
else {
    if !reverse {v+=(0.06+(v<0.5)*0.06)*1.05}
    else {v-=(0.06+(v<0.5)*0.06)*1.05}
}
if (v>1 && !reverse) {v=1 go=1} else if (v<0 && reverse) instance_destroy()

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

#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=$ffffff
v=0
if (room=change && skindat("nofade")) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v+=(0.06+(v<0.5)*0.06)*0.6
if (v>1) instance_destroy()
if global.greenmode collar=$ff80ff else collar=$80ffff
color=merge_color(merge_color(0,collar,min(1,(1-v)*2)),$ffffff,max(0,((1-v)-0.5)*2))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fadetables("msbg",global.lastroom,room)) {
    with (runes) event_user(1)
} else {
    draw_set_blend_mode(bm_subtract)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5) //intel graphics performing unnecessary alpha test
    draw_set_blend_mode(bm_add)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1)
    draw_set_blend_mode(0)
}

if (fadetables("border",global.lastroom,room)) {
    draw_sprite(spr_border,0,0,view_yview[0])
    with (mmicon) if (image_index=5 || image_index=7) event_perform(ev_draw,0)
    with (rosteroptions) event_perform(ev_draw,0)
    with (rosterrandom) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,view_yview[0],1,1,0,$ffffff,1-v)
    with (mmicon) if (image_index=1) event_perform(ev_draw,0)
}

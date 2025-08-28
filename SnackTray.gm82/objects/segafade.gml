#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
goto=room_next(room)
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
if (go) {if (!linked) {mus_stop() mus_volume(1)} room_goto_safe(goto)}

linked=(fadetables("music",room,goto) || (skindat("deathmusic") && room=game) && !forcefade)
if (slow)                v+=(0.06+(v<0.5)*0.06)*(0.05 * (6 * (global.playback||room==credroll||room==finaldemorm)))
else if (room=titlescreen)     v+=(0.06+(v<0.5)*0.06)*0.3
else if (object_index==pausefade)     v+=(0.06+(v<0.5)*0.06)*0.45 //slightly slower so the coin sound plays in full. Lol.
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
if (fadetables("msbg",room,goto) && !forcefade) {
    with (runes) if (!fade) event_user(0)
    with (runes) if (fade) event_user(0)
} else {
    draw_set_blend_mode(bm_subtract)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5)  //intel graphics performing unnecessary alpha test
    draw_set_blend_mode(bm_add)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1)
    draw_set_blend_mode(0)
}

if (fadetables("border",room,goto) && !forcefade) {
    draw_sprite(spr_border,0,0,view_yview[0])
    with (mmicon) if (image_index=5 || image_index=7) event_perform(ev_draw,0)
    with (rosteroptions) event_perform(ev_draw,0)
    with (rosterrandom) event_perform(ev_draw,0)
    if (goto=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,view_yview[0],1,1,0,$ffffff,v)
    if (goto!=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
}

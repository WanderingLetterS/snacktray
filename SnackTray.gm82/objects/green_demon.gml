#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !persistent && instance_exists(BETA) {
    global.halign=1
    draw_systext(200,208,"the green build")
    global.halign=0
    global.green_demon_mode = 1
}

if global.green_demon_mode {
    draw_set_blend_mode(bm_subtract)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,$FF00FF,1) //intel graphics performing unnecessary alpha test
    draw_set_blend_mode(bm_add)
    rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,$003B00,1)
    draw_set_blend_mode(0)
}
#define KeyPress_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check(ord("G")) && persistent {
    global.green_demon_mode=keyboard_check(vk_shift)
}

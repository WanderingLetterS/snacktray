#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=cosine(xstart,xstart+23,replaybox.f)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (replayctrl) if (cur!=-1) {
    if !show_question("Are you sure?##This will delete the selected replay.") {sound("systemreturn") exit;}
    m=ds_list_find_value(maps,cur+page)
    file_delete(ds_map_find_value(m,"fn"))
    ds_map_destroy(m)
    ds_list_delete(maps,cur+page)
    l-=1
    cur=-1
    page=min(page,max(0,l-5))
    sound("systemreturn")
    selgo=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (replayctrl.cur=-1) over=0

draw_sprite_ext(sprite_index,!!over,x,y,1,1,0,$ffffff,1-(replayctrl.cur=-1)*0.5)

draw_sprite_ext(sprite_index,5,x,y,1,1,0,$ffffff,1-(replayctrl.cur=-1)*0.5)

over=0

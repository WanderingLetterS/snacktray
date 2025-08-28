#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=cosine(xstart,xstart+28,replaybomber.f)

visible=(replaybomber.bomb || x>xstart)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (replaybomber.f=1) {
    replaybomber.bomb=0
    if !show_question("Are you really sure?##This will delete ALL of your replays.") {sound("systemreturn") exit;}
    with (replayctrl) {
        for (i=0;i<l;i+=1) {
            m=ds_list_find_value(maps,i)
            file_delete(ds_map_find_value(m,"fn"))
            ds_map_destroy(m)
        }
        ds_list_clear(maps)
        l=0
        cur=-1
        page=0
        sound("systemreturn")
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)

draw_sprite(sprite_index,4,x,y)

over=0

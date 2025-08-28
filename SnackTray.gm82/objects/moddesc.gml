#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    if (settings(global.charname[modctrl.cur+global.charmstart]+" broken"))
        desc=lang("mod broken")
    else
        desc=global.chardata[modctrl.cur+global.charmstart]

    str=wordwrap(desc,15)
    if (string_count("#",str)>7) {
        cut=str
        str=""
        repeat (7) {
            p=string_pos("#",cut)
            str+=string_copy(cut,1,p)
            cut=string_delete(cut,1,p)
        }
        str+="...(Read more)"
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) ping(desc)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    draw_sprite(sprite_index,!!over,x,y)
    draw_systext(x+4,y+4,str)
}
over=0

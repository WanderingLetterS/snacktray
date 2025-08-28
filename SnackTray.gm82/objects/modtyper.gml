#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (modctrl.cur!=-1) {
    n=string_copy(playerskinstr(0,global.charname[modctrl.cur+global.charmstart]+" name"),1,8)
    p=string_pos(" ",n)
    if (p) n=string_copy(n,1,p-1)
    global.tscale=2
    draw_systext(x,y,n)
    global.tscale=1
}

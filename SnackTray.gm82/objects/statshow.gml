#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
go=0
curpage=0

x=floor((400-(sprite_width-78))/2)
y=floor((224-sprite_height)/2)

var k,c,v,map;

map=global.statmap

maxpage=0
str[maxpage]=""
str2[maxpage]=""
c[maxpage]=0
k=ds_map_find_first(map)
repeat (ds_map_size(map)) {
    v=ds_map_find_value(map,k)
    if (c[maxpage]>51) {
        maxpage+=1
        str[maxpage]=""
        str2[maxpage]=""
        c[maxpage]=0
    }
    if (c[maxpage]>25) {
        if (is_string(v)) str2[maxpage]+=string(k)+": "+qt+v+qt+lf
        else str2[maxpage]+=string(k)+": "+string(v)+lf
    } else {
        if (is_string(v)) str[maxpage]+=string(k)+": "+qt+v+qt+lf
        else str[maxpage]+=string(k)+": "+string(v)+lf
    }
    c[maxpage]+=1
    k=ds_map_find_next(map,k)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    alpha=max(0,alpha-0.05)
    if (alpha=0) instance_destroy()
} else alpha=min(1,alpha+0.05)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(0,0,400,224,0,alpha*0.5)

draw_sprite_ext(spr_replayboxbig,!!maxpage,x,y,1,1,0,$ffffff,alpha)
if (curpage>maxpage)
    curpage=0

if (maxpage) {
    global.halign=1
    draw_systext(x+275,y+122,lang("stats page"),$ffffff,alpha)
    draw_systext(x+275,y+130,string(curpage+1)+"/"+string(maxpage+1),$ffffff,alpha)
    draw_systext(x+275,y+142,replacebuttonnames("([c])"),$ffffff,alpha)
    global.halign=0
}


draw_omitext(x+3,y+3,str[curpage],$ffffff,alpha)
draw_omitext(x + ((sprite_width - 78) / 2),y+3,str2[curpage],$ffffff,alpha)

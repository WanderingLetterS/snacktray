#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str=""
align=0
col=$ffffff

maxx=x maxy=y
active=0
getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    visible=0
    for (i=0;i<global.mplay;i+=1)
        if (
            x<view_xview[i]+view_wview[i]+8 && x+maxx>view_xview[i]-8 &&
            y<view_yview[i]+232             && y+maxy>view_yview[i]-8
        ) visible=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
align=unreal(alignment)
col=unreal(color)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.halign=align
draw_skintext(x,y,str,col)
global.halign=0
active=1

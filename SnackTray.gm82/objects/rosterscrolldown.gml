#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((rosterctrl.page+1)=rosterctrl.maxpage) exit
with (rosterctrl) {
    sound("systemselect")
    page=min(maxpage-1,page+1)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bld;
draw_sprite(sprite_index,!!over && (rosterctrl.page+1)!=rosterctrl.maxpage,x,y)
if ((rosterctrl.page+1)=rosterctrl.maxpage) bld=$666666
else bld=$ffffff
draw_sprite_ext(spr_button24,9,x,y,1,1,0,bld,1)
over=0

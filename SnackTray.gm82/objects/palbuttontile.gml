#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
line=0
tile="start"
frn=1
frame=0
height=1
width=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=hotbar.x+16+37-15-390+37*(i mod 20)
y=hotbar.y+85+37*(i div 20)+1
#define Collision_editcursor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hotbar.str=lemonobjname(lemongrab.objlist[obj,0])
hotbar.alpha2=1

hotbar.str2=wordwrap(lemonobjdesc(lemongrab.objlist[obj,0]),32)
hotbar.alpha3=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hotbar.obj[hotbar.cur]=obj
hotbar.picked[hotbar.cur]=1
hotbar.off_x[hotbar.cur]=off_x
hotbar.line[hotbar.cur]=line
hotbar.data[hotbar.cur,0]=tile
sound("systemselect")
//lemonhotbarfamily()

hotbar.cur+=editcursor.shift
if (editcursor.tool!=0 && editcursor.tool!=2) editcursor.tool=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

frame+=frs
if (frame>=frn) {frame=frame-frn if (frl<frn) frame+=frl}
frame=modulo(precise(frame),0,frn)




draw_set_alpha(0.5)
draw_set_color(c_black)
wm_i=0 wm_j=0


for (wm_i=0;wm_i<width;wm_i+=1){
    for (wm_j=0;wm_j<height;wm_j+=1){
        draw_background_part(global.minimapsheet[biome],8+floor(frame)*17+off_x*17++(17 *(off_x*(width-1 +height-1)+wm_j +(wm_i*width))),71+line*17,16,16,x-(8*(width-1))+(16 *wm_i)+8,y+(8*(height-1))-(16 *wm_j)+8)
    }
}
draw_set_color(c_white)
draw_set_alpha(1)
wm_i=0 wm_j=0
for (wm_i=0;wm_i<width;wm_i+=1){
    for (wm_j=0;wm_j<height;wm_j+=1){
        draw_background_part(global.minimapsheet[biome],8+floor(frame)*17+off_x*17+(17 *(off_x*(width-1 +height-1)+wm_j +(wm_i*width))),71+line*17,16,16,x-(8*(width-1))+(16 *wm_i)+7,y+(8*(height-1))-(16 *wm_j)+7)
    }
}

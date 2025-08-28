#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
zoom=4
levelgo=1
level=1
center=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (over && editcursor.leftp) {grab=1}
if (grab) {
    zoom=floor(median(0,editcursor.x-x-5,80)/16)
    if (!editcursor.left) grab=0
    center=1
    event_user(0)
}

h=keyboard_check_pressed(vk_pagedown)-keyboard_check_pressed(vk_pageup)
if (editcursor.ctrl && editcursor.scrw!=0) h=editcursor.scrw
if (h!=0) {
    zoom=median(0,zoom-h,5)
    center=0
    event_user(0)
}

ol=level
level=inch(level,levelgo,0.1)
xd=inch(xd,xdgo,4)
if (level!=ol) {
    if (!center) {
        offx=(editcursor.x-(drawregion.width/2))
        offy=(editcursor.y-(drawregion.height/2))
        drawregion.viewx+=offx/ol-offx/level
        drawregion.viewy+=offy/ol-offy/level
    }
    with (drawregion) {
        dont_update_eities=1
        event_user(7)
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xdgo=zoom*16
if (zoom=0) levelgo=0.0625
if (zoom=1) levelgo=0.125
if (zoom=2) levelgo=0.25
if (zoom=3) levelgo=0.5
if (zoom=4) levelgo=1
if (zoom=5) levelgo=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(spr_editorzoomshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorzoom,!!over,x,y)
draw_sprite(spr_editorbutton,2,x+xd,y)
draw_sprite_ext(spr_editoricons,4,x+xd+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,4,x+xd+7,y+7)

if (over) drawtooltip((bbox_left+bbox_right)/2,97,"Zoom: "+string(round(levelgo*100))+"%",1)

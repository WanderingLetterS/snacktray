#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

xoff=hotbar.x-x
yoff=hotbar.y-y
yraise=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=hotbar.x-xoff
y=hotbar.y-yoff

if keyboard_check_pressed(ord(editmanager.tabshortcut[n])) && !(editcursor.ctrl) && !(editcursor.shift) {
    loadlemontabs(n)
    if !(settings("nolemonsound")) sound("lemonclick")
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
loadlemontabs(n)
if !(settings("nolemonsound")) sound("lemonclick")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
so = t + (i*6);

if (editmanager.tab==n) {
    yraise=approach_val(yraise,-8,1)
} else {
    yraise=approach_val(yraise,0,1)
}

yy=y+yraise

draw_sprite_ext(spr_editortabshadow,0,x,yy,1,1,0,c_black,0.5)
draw_sprite(spr_editortab,!!over || (editmanager.tab==n),x,yy)
draw_sprite_ext(spr_editortabs,n,x+13,yy+13,1,1,0,c_black,0.5)
draw_sprite(spr_editortabs,n,x+12,yy+12)
draw_systext(x+26,yy+8,editmanager.tabnames[n])
draw_omitext(x+sprite_width-12,yy+9,editmanager.tabshortcut[n])

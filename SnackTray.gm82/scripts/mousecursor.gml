///mousecursor(init)
//allows the mouse to control the keyboard cursor

var mx,my;
mx=round(window_mouse_get_x()/global.s)
my=round(window_mouse_get_y()/global.s)
if mx!=x||my!=y{if mybox { visible=1 } }
if (canmouse) if (mx<-1 || my<-1 || mx>global.screenwidth || my>global.screenheight) exit

if (argument[0]) {
    x=view_xview[0]+median(0,mx,view_wview[0])
    y=view_yview[0]+median(0,my,view_hview[0])
    memx=mx
    memy=my
    memvy=view_yview[0]
    canmouse=1

} else {
    if (mx!=memx || my!=memy || view_yview[0]!=memvy) {
        x=view_xview[0]+median(0,mx,view_wview[0])
        y=view_yview[0]+median(0,my,view_hview[0])
        memx=mx
        memy=my
        memvy=view_yview[0]
    }
    if (!instance_exists(message) && !instance_exists(console)) {
        if (mouse_check_button(mb_left)) {akey=1 global.clicc=0}
        if (mouse_check_button(mb_right)) {bkey=1 global.clicc=0}
        if (mouse_wheel_down()) {wdown=1 if (held) held.lok=0} else wdown=0
        if (mouse_wheel_up()) {wup=1 if (held) held.lok=0} else wup=0
    }
}

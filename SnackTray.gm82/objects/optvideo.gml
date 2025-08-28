#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
opt=median(0,floor((over.x-x)/32)+2,3)

memf=settings("fullscreen")
memz=settings("zoom")

if (opt=3) settings("fullscreen",1)
else {
    settings("fullscreen",0)
    settings("zoom",opt+1)
}

if (settings("zoom")!=memz || settings("fullscreen")!=memf) {
    sound("systemselect")
    windowhandler()
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("fullscreen")) image_index=3
else image_index=settings("zoom")-1
draw_self()

over=0

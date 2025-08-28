#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (nearestplayer().x>x) {hspeed=2 xsc=-1} else {hspeed=-2 xsc=1}

active=1

sprite="bullet"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
if (!lone) {
    minx=verybignumber
    maxx=0

    for (i=0;i<global.mplay;i+=1) {
        maxx=max(maxx,view_xview[i]+view_wview[i]+48)
        minx=min(minx,view_xview[i]-48)
    }

    if (x<minx || x>maxx) instance_destroy()
    if (abs(x-xstart)>16) depth=0
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    if (lone) {
        if (inview()) {
            active=1
        }
    }
}
event_inherited()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lone=1
depth=0
hspeed=-2
xsc=1

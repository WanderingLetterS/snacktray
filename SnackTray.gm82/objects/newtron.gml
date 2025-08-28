#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()


active=1
visible=0
enemy2=1
sprite="newtron"
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible){
    nearplr=nearestplayer()
    if (point_distance(x,y,nearplr.x,nearplr.y)<100) {
        xsc=sign(x-nearplr.x)
        popin=1
        visible=1
        sprite="newtrontrans"
    }
}


if (visible) {
    if (popin){
        popin+=1
        if (popin=41) popin=0
    }
    else if (fired>60) {
        if (sprite="newtronshoot") {
            xsc=sign(x-nearplr.x)
            sprite="newtrongo"
        }
        hspeed=median(0,abs(hspeed)+0.1,3)*-xsc
        if (!inview()) instance_destroy()
    }
    else {
        if (!fired) {with (instance_create(x,y-10,newtronfireball)) xsc=other.xsc}
        fired+=1
        sprite="newtronshoot"
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

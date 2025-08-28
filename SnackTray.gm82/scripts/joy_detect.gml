///joy_detect()
//redetects joysticks, adding cursors for them if needed

var mem,i;

globalmanager.slok=1

mem=global.joynum

global.joynum=min(external_call(globalmanager.joyFind),8)
global.ignorejoy=1

for (i=0;i<global.joynum;i+=1) {
    joyname=joy_get(i,3,0)
    if (string(settings("joymaps "+joyname))="0") {
        if (string_pos("xbox",string_lower(joyname)))
            profile="axis 1 -|axis 1 +|axis 0 -|axis 0 +|button 0|button 2|button 1|button 7|"
        else if (string_pos("wireless controller",string_lower(joyname)))
            profile="hat 0|hat 180|hat 270|hat 90|button 1|button 0|button 2|button 9|"
        else
            profile="axis 1 -|axis 1 +|axis 0 -|axis 0 +|button 1|button 0|button 2|button 3|"
        settings("joymaps "+joyname,profile)
    }
}

if (room=roster || room=ta_roster) {
    if (global.joynum<mem) {
        with (rostercursor) if (p2-(JOY-1)>=global.joynum) {instance_destroy() if (mybox) with (mybox) shiftdown(p2)}
    }
    if (global.joynum>mem) {
        for (i=mem;i<global.joynum;i+=1) with (instance_create(200,420,rostercursor)) {
            p2=JOY+i image_blend=playercol(p2) with (rosterbox) if (global.input[p2]=other.p2) other.mybox=id
        }
    }
}

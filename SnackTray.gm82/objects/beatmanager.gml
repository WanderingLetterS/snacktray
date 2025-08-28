#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Execute a piece of dode.
//did i get ya?
obpm = bpm
getregion(view_xview[p2]+view_wview[0]/2)
bpm=region.bpm
bpb=region.bpb

if obpm != bpm event_user(0)

bps=bpm/60.00000000
songpos+=bps
beatcount+=bps

curbeat = floor(songpos/60)
beatin=0

while (beatcount > 60) {
    beatin=1
    beatcount -= 60
    //if (global.lemontest && (instance_exists(beepblockon) || instance_exists(beepblockoff)))
        //sound("systemselect") //lemon test beat (happens even if beep blocks arent on screen, but not if there arent any)
    blinked=0
    if curbeat mod bpb != 0 {
        //do this before activating every beep block to minimize how many times to skip the rest of them (lol)
        with beepblockon {if (other.beep>=start_beep-1 && !other.blinked) {sound("itembeepblockblink") other.blinked=1}}
        with beepblockoff {if (other.beep>=start_beep-1 && !other.blinked) {sound("itembeepblockblink") other.blinked=1}}
    }
    instance_activate_object(beepblockon)
    instance_activate_object(beepblockoff)

    with beepblockon {if other.beep>=start_beep-1 frame=1 alarm[1]=4}
    with beepblockoff {if other.beep>=start_beep-1 frame=1 alarm[1]=4}
}

beep = (curbeat mod bpb)

if (beep < prevbeep-1) {
    blinked=0
    with beepblockon {if (!other.blinked) {sound("itembeepblockchange") other.blinked=1}}
    with beepblockoff {if (!other.blinked) {sound("itembeepblockchange") other.blinked=1}}

    instance_activate_object(beepblockon)
    instance_activate_object(beepblockoff)

    with beepblockon {alarm[0]=1}
    with beepblockoff {alarm[0]=1}

    if (global.lemontest && (instance_exists(beepblockon) || instance_exists(beepblockoff)))
        sound("systemin") //lemon test beep (happens even if beep blocks arent on screen, but not if there arent any)
}

prevbeep = beep
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
songpos=0
curbeat=0
beatcount=0
beep=0
prevbeep=0
beatin=0

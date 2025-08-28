#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=12
image_yscale=6
seqcount=2
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner.fly && !owner.piped && !owner.water) {
    x=owner.x+owner.hsp
    y=owner.y-1+owner.vsp
    if (owner.size) {
        image_xscale=12
        image_yscale=6
    } else {
        image_xscale=8
        image_yscale=2
    }
} else event_user(1)

///under_spriteswitch(step)
//sprite manager for player characters
//if step is true, animation is executed, otherwise it draws
var mem,step,i;

step=argument[0]



if (step) {
    var under_oframe,under_osid;
    under_oframe=under_frame
    under_osid=under_sid

    //reset frame on sprite change
    if (under_sprite!=under_oldspr && !keepframebetween) under_frame=0
        //find sprite position in list
    if ((under_sprite!=under_oldspr) || (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3))|| object_index==charmdeath ) {
        under_sid=0

        //From sprite(string) which expects default sprite list, into sid(int) which expects custom sprite list
        //we can go sprite(default) ->sprite(custom) -> sid(custom)
        //or sprite(default)-> sid(default) ->sid(custom)
        //We go bottom route for this one folks.

        //this requires a sprite(custom)
        /*
        i=0
        repeat (global.animdat[p2,0]) {
            if (string(global.animdat[p2,16+128*i])==sprite) {sid=i break}
            i+=1
        }*/

        //This one though correctly requires sprite(default).
        i=0
        repeat (string_count(",",global.defaultspritelist[global.option[p2]])+1){
            if (global.animname[p2,i]==under_sprite) {under_sid=global.reroutedanims[p2,i] break;}
            i+=1
        }
    }

    if (under_sprite!=under_oldspr && (under_osid==under_sid)) { //Don't reset the animation if the anim we rerouted to is the same sprite as the anim we just switched from
        under_frame=under_oframe
    }
}

if (object_index=player||object_index=charmdeath||is_spriteswitcher) {
    ssw_undercore(step)
} else ssw_undercore(step)

///spriteswitch(step)
//sprite manager for player characters
//if step is true, animation is executed, otherwise it draws
var mem,step,i;

step=argument[0]

if (object_index=player ) {
    if (step==1) {
        oldspr=sprite
        over_oldspr=over_sprite
        under_oldspr=under_sprite
        if (flash && global.bgscroll mod 5<3) exit

        if using_triangleblock {jump=0 hsp=triangleblock_speed} //Trick the code into thinking we're not jumping to use our run animations
        if (!piped && !codeblock_stopsprmanager && !global.legacy_skin[p2]) charm_run("sprmanager")
        if using_triangleblock {jump=1}
        if ((depth=0 || depth=1) && p2=gamemanager.plrsort) depth=!depth
    }


    mem=size
    if (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3)) size=oldsize
    sheet=sheets[size]
} else {
    if (step==1) { //CONGRATULATIONS!!! YOU WIN A FREE iPHONE 5
        oldspr=sprite
        over_oldspr=over_sprite
        under_oldspr=under_sprite
    }
    oldspr=string(oldspr)
    over_oldspr=string(over_oldspr)
    under_oldspr=string(under_oldspr)
    sheet=sheets[size]
}

if (global.tpose) {sprite="stand" frame=0}



if (step) {
    var oframe,osid;
    oframe=frame
    osid=sid

    //reset frame on sprite change
    if (sprite!=oldspr && !keepframebetween) frame=0
        //find sprite position in list
    if ((sprite!=oldspr) || (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3))|| object_index==charmdeath ) {
        sid=0

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
            if (global.animname[p2,i]==sprite) {sid=global.reroutedanims[p2,i] break;}
            i+=1
        }
    }

    if (sprite!=oldspr && (osid==sid)) { //Don't reset the animation if the anim we rerouted to is the same sprite as the anim we just switched from
        frame=oframe
    }
}

if (object_index=player||object_index=charmdeath||is_spriteswitcher) {
    ssw_core(step)
    if (!super) if (((hurt || fall=6) && hk<4) || (grow && gk mod 6<3)) size=mem
} else ssw_core(step)

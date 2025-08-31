//player input reading and button state controls
var p,d;

if (finish && !dead) {
    //player automation for ending cutscene

    up=0
    down=0
    left=0
    right=0
    flash=0

    if (piped && move_lock) exit

    if (ending="block") {
        if (!jump && hsp=0) {
            player_stop()
            piped=1
            move_lock=1

            if resetframeonce=0{
            resetframeonce=1
            frame=0}
            posed=1
            pose=1
            if (viclength) {
                set_sprite("pose")
            }
            playsfx(name+"win")
        }
    }
    if (ending="flag") {
        if (skindat("walkin")) {
            p=noone
            d=400
            with (castledoor) if (abs(x-other.x)<d) {p=id d=abs(x-other.x)}
            if (p) {
                right=(x<p.x-4)
                left=(x>p.x+4)
                if (abs(x-p.x)<=4 && !jump) {
                    player_stop()
                    piped=1
                    move_lock=1
                    if resetframeonce=0{
                    resetframeonce=1
                    frame=0}
                    posed=1
                    pose=1
                    if (viclength) {
                        set_sprite("pose")
                        alarm[6]=viclength
                    } else alarm[6]=1
                    playsfx(name+"win")
                }
            }
        }
        if (!p) {
            //walkoff
            if (!posed) {
                if (viclength) {
                    if (!jump) {
                        player_stop()
                        piped=1
                        move_lock=1
                        posed=1
                        if resetframeonce=0{
                        resetframeonce=1
                        frame=0}
                        pose=1
                        set_sprite("pose")
                        alarm[0]=viclength
                        playsfx(name+"win")
                    }
                } else posed=1
            } else {
                if (x>region.x+16) {
                    input_clear()
                } else charm_run("endofstage")
            }
        }
    }
    if (ending="retainer") {
        var mymove; mymove=esign(x-(myretainer.x - 36),1)
        piped=0
        if (abs(x-(myretainer.x - 36))>2) {
            if mymove == -1 right=1 else left=1
            if speedcheck && abs(speedcheck)<1.5 && abs(hsp)>1.5{ //cap speed to max speed / 3.5 to make sure the player doesn't run past where they're supposed to go
                hsp=abs(1.5)*sign(hsp)
            } else {
                if braking hsp=max((abs(hsp)-0.0375),0)*sign(hsp) //stupid idiot giana takes 7 years to brake
            }
            if (speedcheck == 0 || speedcheck>hsp) speedcheck=hsp
        } else if hsp=0 && !jump && (!myretainer.princess && myretainer.hide>32 || myretainer.hide>132) && sprite!="pose" {
            pose=1
            if resetframeonce=0 {
            resetframeonce=1
            frame=0}
            xsc=esign(myretainer.x-x,1)

            set_sprite("pose")
            playsfx(name+"win")
            swaggedout=1

            piped=1
            move_lock=1 //rely on this one for the non-guaranteed lock because alot of charms dont have move_lock How it feels to add features and not use them
        }
        else if hsp=0 {
            xsc=esign(myretainer.x-x,1)
            piped=1
        }
    }
    if (!posed) {
        akey=(push*!akey || (jump && akey) || place_meeting(x+16,y,enemy) || !collision(16,8))
        if (carry && carryid) bkey=!bkey
        else bkey=0
        ckey=0
    }

} else if (global.playback) {
    decodemovie()
} else {
    if (!auto) input_get(global.input[p2])
    encodemovie()
}

input_keystates()

if (!ready) {input_clear() ready+=1}

loose=1
h=right-left


//This is not a good place to put these but oh well
if (using_grindblock) {com_grindblock() di=0 exit}
//if (using_skateboard) {com_skateboard() di=0 exit}

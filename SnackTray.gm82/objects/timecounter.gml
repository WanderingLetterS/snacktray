#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
myflag=noone
myretainer=noone
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (endgame) {
    counting+=1
    if (counting=8) {
        counting=0
        if (global.lifes>0 && !settings("cog inflives")) {
            global.lifes-=1
            global.scor[myretainer.p2]+=10000
            sound("systemtimecount")
        } else {
            sound("systemregister",0,1-(0.115 * myretainer.ackbar))
            mus_play("princess",0,myretainer.p2)
            instance_destroy()
        }
    }
} else {
    var counting; counting=0
    if (global.inf_time!=1) for (i=0;i<global.mplay;i+=1) {
        o=gamemanager.players[i]
        if (o.finish && o.tick) {
            if (o.tick>=120) {
                o.tick-=120
                counted[i]+=2
                global.scor[i]+=20
            } else {
                counted[i]+=floor(o.tick/60)
                global.scor[i]+=10*floor(o.tick/60)
                o.tick=0
            }

            if (counted[i]>=120) {
                counted[i]-=120
                o.itemc+=1
                if (global.mplay=1 && !settings("cog inflives")) {sound("item1up") global.lifes+=1}
            }
            counting=1
        }
    }
    if (!counting) {
        soundstop("systemtimecount")
        with (myretainer) if (princess) {other.endgame=1 exit}

        sound("systemregister",0,1-(0.0625 * myretainer.ackbar))
        with (myflag) {
            countscore=0
            alarm[1]=32
            fwcount=0
            with (instance_nearest(x,y,castledoor)) (instance_create(x,y-56,flaggy)).visible=1
        }
        with (myretainer) alarm[7]=240
        instance_destroy()
    }
}

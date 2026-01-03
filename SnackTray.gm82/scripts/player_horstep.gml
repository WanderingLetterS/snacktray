//player_horstep
//horizontal stepping for accurate collision
var s,calc;
calc=hsp/*+di*/+hyperspeed+gm8exspd

x+=calc
s=sign(calc)



if (s!=0) {
    coll=collision(0,0)
    if (coll) {
        if (coll.object_index != phaser || coll.dir == !s) //if the phaser isnt facing you just don't hit it? lol?
            if (!player_climbstep(coll,s))
                com_hitwall(s)
                coll=collision(s,0)
                if (coll) {
                    dix=0
                    dio=0
                    x=floor(x-abs(calc)*s)
                    repeat (ceil(abs(calc))) {
                        x+=s
                        if (collision(0,0)) {
                            x-=s
                            break
                        }
                    }
                }   
    }
    
}
if !jump player_magnetslope(calc)
global.calc[p2]=calc

//player_horstep
//horizontal stepping for accurate collision
var s,calc;
calc=hsp/*+di*/+hyperspeed+gm8exspd

x+=calc
s=sign(calc)



if (s!=0) {
    coll=collision(calc,0)
    if (coll) if (!player_climbstep(coll,calc)) {
        com_hitwall(calc)
        coll=collision(calc,0)
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

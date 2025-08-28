//Clover Flower's wallrun
if (clover_climb) {
    	fall=0
    if down clover_climb=0
    if clover_climb=1 {clover_climb=2 if vsp>-3 vsp=-3}
        hsp=0 xsc=clover_sideclimb tempkill=1
    	vsp-=0.1 //a small nerf to gravity.
    if vsp>1 clover_climb=0
    if abut { vsp=-4 hsp=-2*xsc  clover_climb=0 airdash=0}
    if !collision(4*xsc,0) clover_climb=0
    	
    if clover_climb==0 {sprite_angle=0 airdash=0}
}

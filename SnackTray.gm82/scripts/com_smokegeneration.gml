//smoke generation
if (global.dustframe) {
    if (braking || fall=3) {
        i=shoot(x,y+10) i.depth=depth+2
    }
    if (vsp<-5-2*!sprung) {
        i=shoot(x,y+8) i.vspeed=-1
    }
    if (vsp>7) {
        speedwagon+=1
        if (speedwagon>60) {i=shoot(x,y) i.vspeed=-1}
    } else speedwagon=0
    if (abs(hsp)>4 && boostvar>=0.75 && !jump) {
		shoot(x-12*xsc,y+12)
	}
}

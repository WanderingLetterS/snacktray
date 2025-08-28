//stop spinning
    if (abs(hsp)<0.2 && spin) {
            spinc+=1 if (spinc=8) {
            mask_temp(12,24)
            if (collision(0,0) && size!=5) {
                xsc=esign(h,xsc)
                hsp=xsc
                spinc=0
                spin=1
            } else {
                spinc=0
                spin=0
                hsp=0
                soundstop(name+"spin")
                crouch=down
            }
            mask_reset()
        }
    }

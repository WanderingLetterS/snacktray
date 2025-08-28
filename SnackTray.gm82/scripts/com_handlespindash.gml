if (spindash) {
    spindash=max(1,spindash-0.025)
    if (!crouch) && !(jump) {
        if (spindash>3) boost=3
        spin=1
        hsp=xsc*6*(0.75+0.075*median(0,spindash,2))
        spindash=0

            soundstop(name+"spindash")
            playsfx(name+"release")

    }
    if (hsp!=0) && !(jump) spindash=0
}

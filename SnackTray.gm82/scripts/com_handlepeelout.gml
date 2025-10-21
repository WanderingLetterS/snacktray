///com_handlepeelout()
if (peelout && !up) {
    peelready=0
    peelsound=0 soundstop(name+"peelcharge")
    if (peelout>45) {
        proj_type="psmok"
        i=shoot(x,y)
        i.depth=depth+2
        i.xsc=xsc
        if peelout>60 peelout=60
        if size==2 firedash=28
        playsfx(name+"peelrelease")
        hsp=sign(xsc)*maxspd*1.25

        energy=4
        hyperspeed=(peelout/45)*sign(hsp)
        peelout=0
    }
    else if (peelout<45) {
        playsfx(name+"peelrelease")
        hsp=sign(xsc)*peelout*0.1
        peelout=0
    }
    else peelout=0
} else if !akey{
    if (peelout && up) peelout+=1

}

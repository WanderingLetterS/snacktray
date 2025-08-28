///ssw_tile(name)
//This handles sprite switching for the items that are on the master sheet

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr8,fr88, xsc,ysc,w,h, plat;

fr=global.frame
ffr4=global.fastframe4
fr8=global.frame8
fr88=global.frame88

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1 plat=0 alpha=1
switch (argument[0]) {

    case "box": {
        if (content="bros") {frx=20 fry=13 break}
        if (hit) frx=18-goinup
        else frx=12+fr
        fry=10
    break}

    case "brick": {if (anim) frx=12+fr else frx=12+frame fry=11  if (hit) {frx=18-goinup fry=10} break}
    case "bricd": {frx=12+frame fry=11 break}
    case "cracked": if !biggie {frx=17 fry=11 break} else {frx=13 fry=17 w=2 h=2 break}

    case "flipblock": {frx=12 fry=12 break}
    case "flipblockflip": {frx=12+frame fry=12 break}

    case "noteblock": {frx=12+fr  fry=13+isred break}
    case "shiftblock": {if go frx=14 else if hit||content="" frx=15 else frx=9+fr fry=15 break}
    case "hardblock": {frx=0 fry=20 break}//used exclusively for hidden shiftblocks btw

    case "talkbox": {frx=20+frame fry=10 break}
    case "powblock": {frx=20+1*powphase fry=11 xsc=xsc+pxsc ysc=1-pxsc*0.3 frox=pxsc*4 break}

    case "bigbox": {
        w=3
        if (hit) {frx=5 fry=16-goinup}
        else {frx=2 fry=15+fr}
        //fry=15
    break}


    case "platform": {frx=20 fry=0 w=3 frox=24 break}
    case "shortplat": {frx=20 fry=2 w=2 frox=24 break}


    case "bridge": {frx=9 fry=8 break}
    case "bridgeparticle": {frx=8+xpart fry=9 w=0.25 frox=0 froy=0 break}
    case "chain": {frx=10 fry=8 h=2 froy=16 break}
    case "chainleft": {frx=8 fry=8 h=2 froy=16 break}
    case "axewall": {frx=11 fry=8 break}

    case "flag": {frx=26+fr*2 fry=0 w=2 h=1.5 break}
    case "door": {
        if !(oneway) {
            frx=14+floor(frame)*2
            if ((key && frame=0) || (isp && !global.ptime))
            frx=12

            fry=6+2*isP
            w=2
            h=2
            frox=8
            froy=16
        } else {
            frx=22+floor(frame)*2

            fry=8
            w=2
            h=2
            frox=8
            froy=16
        }
    break}
    case "chardoor": {
        frx=20+floor(frame)*2

        fry=6
        w=2
        h=2
        frox=8
        froy=16
    break}

}

if plat=0 draw_background_part_ext(global.master[biome],frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc)+notex,floor(y-froy*ysc)+notey+dy,xsc,ysc,$ffffff,alpha)
if (plat!=0) draw_background_part_ext(global.master[biome],(frx+2)*16+8,fry*16+8,16,16,floor(x-frox*xsc+plat*16*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)

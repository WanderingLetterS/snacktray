///ssw_objects(name)
//This handles sprite switching for the items that are on the master sheet

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr8,fr88, xsc,ysc,w,h, plat;

fr=global.frame
ffr4=global.fastframe4
fr8=global.frame8
fr88=global.frame88

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1 plat=0
switch (argument[0]) {

    ////////////========SPRINGS=========/////////////
    //RED SPRINGS
    case "terrainspring": {
        switch (real(dir)) { //i rewrote this so i guess im chillin, also diagonal springs are fucking dead LMAO
            case (0): {frx=1+frame fry=0} break; //up
            case (1): {frx=1+frame fry=3} break; //down
            case (2): {frx=0 fry=0+frame} break; //left
            case (3): {frx=5 fry=0+frame} break; //right
        }
    break
    }
    case "spring": {frx=1+frame fry=1 h=2 froy=16  break}
    case "spreng": {frx=6 fry=frame w=2 frox=8  break}

    //GREEN SPRINGS
    case "terrainsprong": {
        switch (real(dir)) { //i rewrote this so i guess im chillin, also diagonal springs are fucking dead LMAO
            case (0): {frx=1+frame fry=0+4} break; //up
            case (1): {frx=1+frame fry=3+4} break; //down
            case (2): {frx=0 fry=0+frame+4} break; //left
            case (3): {frx=5 fry=0+frame+4} break; //right
        }
    break
    }
    case "sprong": {frx=1+frame fry=1+4 h=2 froy=16  break}
    case "sprung": {frx=6 fry=frame+4 w=2 frox=8  break}

    //FLIPPER SPRINGS or however it's called
    case "flipperspring": frx=6 fry=8+frame+2*facer w=2 break;


    ////////////========SPIKES=========/////////////
    case "sonicspike": {
        if (dir=0) {frx=5 fry=8+floor(frame)}
        if (dir=1) {frx=1+floor(frame) fry=17.5}
        if (dir=2) {frx=0 fry=8+floor(frame)}
        if (dir=3) {frx=1+floor(frame) fry=11}
        if (dir=4) {frx=1+floor(frame) fry=8}
    break}
    //Intangible spike:
    
    //BIG FUCKING SPIKE COLLUMN
    
    //GRINDER TYPE BEAT
    



    case "cork": {frx=27 fry=20 frox=8 froy=8 break}
    case "stone": {frx=28 fry=20 frox=8 froy=8 break}
    
    case "delfruit": {frx=24.5+delfr*1.5 fry=0 w=1.5 h=1.5 frox=12 froy=12 break}
    case "pswitch": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=22+fr fry=20 frox=0 froy=0 break}
    case "pswitchhit": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=26 fry=20 frox=0 froy=0 break}
    
    case "bumper": {frx=17+3*frame fry=2 w=3 h=3 frox=24 froy=24 break}
    case "bumpersmall": {frx=20+1.5*frame fry=0 w=1.5 h=1.5 frox=12 froy=12 break}
    case "bumperball": {frx=14+(1*round(floor(frame)/2)) fry=9 froy=8 frox=8 break}
    
    case "conveyorbeltcenter": {frx=20+(frame) fry=25.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltleft": {frx=20+(frame) fry=26.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltright": {frx=20+(frame) fry=27.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    //left is in the right corner and right is in the left corner, which i did not know at first lol  - -S-
    
    
    case "cardreaderup": {frx=8 fry=6 w=2 h=2 frox=16 froy=16 break}
    case "cardreaderdown": {frx=8 fry=8 w=2 h=2 frox=16 froy=16 break}
    
    case "tap": {frx=2+other.frame fry=19 break}
    case "axe": {frx=18+fr fry=20 break}
    case "pollflower": {frx=29+frame*5 fry=9 w=5 h=2.5 froy=24 break}
    case "pollen": {frx=29+fr*2.5 fry=11.5 w=2.5 h=2.5 frox=17 froy=16 break}
    
    case "signalblock": {frx=34+(1*active)  fry=24.5 break}

    case "grinder": {frx=0 fry=12+2*fr w=2 h=2 froy=8 frox=8 break}
    case "dashpanel": {frx=8 fry=0+(1.5*fr) w=2 h=1.5 froy=8 break}

    
    
    
    

    case "beepblockon": {amion="on" frx=13+frame fry=13+blue w=1 h=1 break}
    case "beepblockoff": {frx=15+frame fry=13+blue w=1 h=1 break}
    
    

    case "onblock": {frx=5 fry=26.5+blue break}
    case "offblock": {frx=6 fry=26.5+blue break}
    case "onspike": {frx=7+fr fry=26.5+blue break}
    case "offspike": {frx=11 fry=26.5+blue break}
    case "onswitch": {frx=4 fry=26.5+gamemanager.onblockstate break}
    case "pblock": {frx=2 fry=26.5 frox=8 froy=8 break}
    case "pblockoff": {frx=3 fry=26.5 frox=8 froy=8 break}
    
    case "donut": {frx=0+frame fry=26.5 break}
    case "donutlong": {frx=0+frame*2 fry=27.5 w=2 break}
    case "cardreaderup": {frx=8 fry=6 w=2 h=2 frox=16 froy=16 break}
    case "cardreaderdown": {frx=8 fry=8 w=2 h=2 frox=16 froy=16 break}
    
    case "goalblock": {frx=25+frame fry=8 break}
    case "finishstar": {frx=25+global.fastframe4 fry=7 break}

    case "warpbox": {frx=7-key+frame fry=25.5 frox=8 froy=8 if oncooldown alpha=0.5  break}
    
    case "ziptrack": {frx=14+((2*floor(x/16))+frame) mod 5 fry=25.5+spd xsc=xdir break}
    case "ziptrackr": {frx=19 fry=25.5+spd w=0.5  break}
    case "ziptrackl": {frx=19.5 fry=25.5+spd w=0.5 frox=-8 break}
}


if plat=0 draw_background_part_ext(global.masterobjects[biome],frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc)+notex,floor(y-froy*ysc)+dy+notey,xsc,ysc,$ffffff,1)
if (plat!=0) draw_background_part_ext(global.masterobjects[biome],(frx+2)*16+8,fry*16+8,16,16,floor(x-frox*xsc+plat*16*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)

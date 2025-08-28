///ssw_shield(name)
//This handles sprite switching for the shields

var frx,fry,xsc;

switch (argument[0]) {
    case "shield": {xsc=1 frx=floor((global.bgscroll*0.125*shieldanimspeed) mod 4) fry=2 break}
    case "shield_back": {xsc=1 frx=floor((global.bgscroll*0.125*shieldanimspeed) mod 4) fry=3 break}
    case "star": {xsc=1 frx=floor((global.bgscroll*0.125*shieldanimspeed) mod 4) fry=0 if (global.bgscroll mod 5>2) exit break}
    case "star_back": {xsc=1 frx=floor((global.bgscroll*0.125*shieldanimspeed) mod 4) fry=1 if (global.bgscroll mod 5>2) exit break}
}

draw_sprite_part_ext(sheetshields,0,frx*50+9,fry*50+9,49,49,floor(x-24*xsc),floor(y+offshield-24+dy+((jump && !fall) || spin)*4+32-abs(32-diggity))+smallshield*(size=0),xsc,1,$ffffff,1)

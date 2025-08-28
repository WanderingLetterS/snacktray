///ssw_boss()

fry=0
if (panic) {
    frx=min(5,floor(step)+4)-4
    fry=2
} else if (fbb>16) {
    frx=max(0,floor((step-3)/2))
    fry=1
} else frx=((step-2) div 0.5)
draw_sprite_part_ext(sheet,0,frx*60+8,fry*60+128,59,59,floor(x-30*xsc),floor(y-35+dy),xsc,1,$ffffff,1)

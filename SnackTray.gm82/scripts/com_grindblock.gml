///com_grindblock()
if grind_cooldown {using_grindblock=0 exit}


if !(using_grindblock){
    if (y>my_ziptrack.y){
        y=my_ziptrack.bbox_bottom+8
       grind_hanging=1
    }else{
        grind_hanging=0
        y=my_ziptrack.bbox_top-8
    }

    using_grindblock=1
    spin=0
    fly=0
    fall=0

}

if (grind_hanging){
    y=(my_ziptrack.bbox_bottom)+12
    if up grind_hanging=0
}
if !(grind_hanging){
    y=(my_ziptrack.bbox_top)-12
    if down {grind_cooldown=15 vsp=3}
}

my_ziptrack=instance_place(x,y+16-(32*grind_hanging),ziptrack)
if !my_ziptrack{
    using_grindblock=0
    fall=1
} else{
    if (my_ziptrack.spd==0)
        hsp=my_ziptrack.xdir*(4+(h==my_ziptrack.xdir))
    else if (my_ziptrack.spd==1)
        hsp=my_ziptrack.xdir*(6+(h==my_ziptrack.xdir))
    else if (my_ziptrack.spd==2)
        hsp=my_ziptrack.xdir*(2+(h==my_ziptrack.xdir))
    xsc=my_ziptrack.xdir

    if abut{
        jump=1
        fall=0
        canstopjump=1
        vsp=-5
        grind_cooldown=25
    }else vsp=0
}

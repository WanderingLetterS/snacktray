
var spd;
spd=argument[0]
smokedepth=p2
if argument_count==2 {
    smokedepth=argument[1]

}

spindust+=0.5
if spindust mod 1 {

i=shoot(x-xsc*3,bbox_bottom+1+dy) i.hspeed=spd i.vspeed=random(1)-0.5
i.gravity=-0.1
i.image_xscale=0.25
i.image_yscale=0.25
i.depth=smokedepth-1

i=shoot(x,bbox_bottom+dy) i.hspeed=spd i.vspeed=random(1)-0.5
i.gravity=-0.15
i.image_xscale=0.25
i.image_yscale=0.25
i.depth=smokedepth+1
}
spindust=wrap_val(spindust,0,7)

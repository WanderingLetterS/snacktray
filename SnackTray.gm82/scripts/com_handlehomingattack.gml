if (jump && (fall!=10||homingattack)) {
	coll=instance_nearest(x,y,enemy)
	if coll{
		if sign(x-coll.x)==-xsc{
			if abs(y-coll.y)<128 && abs(x-coll.x)<128 && y<(coll.y+32){

				homingenemy=coll.id

			} else homingenemy=0
		} else homingenemy=0
	}
	if !collision_line(x,y,coll.x,coll.y,homingenemy,1,1) homingenemy=0
	if !homingenemy homingattack=0
}else homingattack=0



makeafterimages=0
if ( homingattack) {
    homingtimer+=0.1
    makeafterimages=1
    airdash=0
    if homingtimer>=1.1 {homingattack=0 airdash=0}
    if homingtarget && !(homingtarget.x<=0) && instance_exists(homingtarget){
    hsp=0
    vsp=-3

    x=homingstartx*(1-homingtimer)+homingtarget.x*(homingtimer)
    y=(homingstarty*(1-homingtimer)+homingtarget.y*(homingtimer))-abs(sin(homingtimer*4))*16

    } else {homingtarget=0 airdash=0}
    if !jump {homingattack=0 airdash=0}
    fall=0
}

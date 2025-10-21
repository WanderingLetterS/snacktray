if bouncewindup {vsp=-1 bouncewindup-=1

	if !bouncewindup{
		playsfx(name+"trick")
		vsp=10
		while !collision(0,0) && !dead && inview(){
			y+=vsp

		}
		i=shoot(x,y)
		i.hspeed=-2
		i=shoot(x,y)
		i.hspeed=2
		y-=10
		bouncetrick=1
		sproinged=1
		vsp=-6
		jump=1
		//change jump angle in steep slopes
		vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/1.5)
		vm=point_distance(0,0,hsp,vsp)
		hsp=lengthdir_x(vm,vd)
		vsp=lengthdir_y(vm,vd)

	}

}

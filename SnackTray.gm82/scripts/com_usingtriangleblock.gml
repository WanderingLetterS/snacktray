///com_usingtriangleblock() Handles Triangleblock climbing.

hsp=0

if triangleblock_cling!=0{
    if !collision(triangleblock_cling*triangleblock_speed,-1)||(directionheld!=h){
        if collision(triangleblock_cling*triangleblock_speed,0)&&(directionheld=h){
            x+=triangleblock_cling*triangleblock_speed //Slope magnetism.

        } else{
            triangleblock_cling=0
            triangleblock_upsidedown=0
            vsp=-triangleblock_speed

            hsp=0
            sprite_angle=0
            using_triangleblock=0
        }
    }

    if using_triangleblock {


        hsp=triangleblock_speed //For sprmanager to not need changes.
        vsp=-triangleblock_speed
        dy=-3
        if triangleblock_cling=1{

            {
                coll=collision(triangleblock_cling*hsp,0)

                if !coll x+=abs(hsp)*1
                if coll.nslop{
                    if sign(coll.f)==-triangleblock_cling{
                        x-=abs(hsp)*(1/coll.f) //reversed because f does it the other way around...

                    }
                }

            }
            while collision(0,0) x-=1
            sprite_angle=90
        }else {

            {
                coll=collision(triangleblock_cling*hsp,0)

                if !coll x-=abs(hsp)*1
                if coll.nslop{
                    if sign(coll.f)==-triangleblock_cling{
                        x-=abs(hsp)*(1/coll.f)

                    }
                }

            }
            while collision(0,0) x+=1
            sprite_angle=270
        }

        if triangleblock_upsidedown {vsp*=-1
            if triangleblock_cling=1{
                sprite_angle=270
            }else {
                sprite_angle=90
            }
        }
    }
}

h=0//prevents hitting a wall and losing all our speed.

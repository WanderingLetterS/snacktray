//com_endactions

if jesus jesus_mercy=30
else jesus_mercy=max(jesus_mercy-1,0)
splashtimer=max(splashtimer-1,0)
xp=mean(xp,x) yp=mean(yp,y)
energy=median(0,energy,maxe)
updatecarry()
if sign(gm8exspd)!=sign(hsp) gm8exspd=0
if pollenated && global.dustframe {instance_create(x,y,pollen)}
if global.frame8flip if ((super || boost || dash || makeafterimages) && !dotkid) with (instance_create(x,y,afterimage)) event_user(0)


if abs(hsp)>=3{
    trianglecoll=collision(0,1)
    if trianglecoll.object_index=triangleblock{
        if real(trianglecoll.dir) == 0
        triangleblock_cling=1 //-1 for when we're going left
        else if real(trianglecoll.dir) == 1 triangleblock_cling=-1
        
        if ((triangleblock_cling=1 && hsp>0 && h=1)   || (triangleblock_cling=-1 && hsp<0 && h=-1)   ){ //only mount if we're facing the correct direction.
            if collision(triangleblock_cling*abs(hsp),-abs(hsp)).nslop=0{ //only mount when we have a wall in front of us.
                if triangleblock_cling=1
                if bbox_right> (trianglecoll.bbox_left+8){ //only mount when we are on the right side of the triangleblock
                    triangleblock_speed=abs(hsp)
                    using_triangleblock=1

                    triangleblock_upsidedown=0
                    directionheld=h
                    jump=1
                }
                else
                if triangleblock_cling=-1
                if bbox_left< (trianglecoll.bbox_right-8){ //only mount when we are on the left side of the triangleblock
                    triangleblock_speed=abs(hsp)
                    using_triangleblock=1

                    triangleblock_upsidedown=0
                    directionheld=h
                    jump=1
                }
            }
        }
    }
}

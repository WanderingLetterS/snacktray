///calcmoving()
//processes moving platforms around the caller

var omask,coll,kek,yes,l,r,t,b,x2,y2;

mymoving=noone

if (object_index=player) {
    oxsc=image_xscale
    oysc=image_yscale
    oy=y

    /*image_xscale+=4
    image_yscale+=4*/
    mask=mask_index
    /*mask_index=spr_findmoving*/
    coll=instance_place(x,y+5,moving)

    if coll{
        coll.y-=verybignumber   //remove the moving from the equation...
        if place_meeting(x,y+coll.vsp,ground){  //and make sure we aren't grabbing something that's in the ground
            coll.y+=verybignumber//Put it back
            coll=noone //Unregister the moving platform
        } else coll.y+=verybignumber //Put it back when the check fails too!

        if coll.vsp<=0 if !place_meeting(x,y,coll){//If the platform is going up we don't want to catch something that's actually far below us!
            coll=noone
        }

    }

    belt=collision(0,1)
    if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
    x=x+belt.beltspd;

    mask_index=mask
    mask_reset()
    image_xscale=oxsc
    image_yscale=oysc
    y=oy

    if (coll && !climb && (jump || !place_meeting(x,y+10,coll)))
        if (!place_meeting(x-coll.hsp*2,y-coll.vsp*2,coll)) coll=noone
    if (coll) if (coll.vsp!=0 || (bbox_top<=coll.bbox_bottom)) {
        mymoving=coll
        avgmovingh=(avgmovingh*4+coll.hsp)/5
        x+=coll.hsp
        y+=coll.vsp
        coll.y-=verybignumber
        coll2=collision(0,0)
        coll.y+=verybignumber
        /*if (coll2) {
            x-=coll.hsp
            y-=coll.vsp
            if (climb) climb=0
            l=bbox_left r=bbox_right t=bbox_top b=bbox_bottom
            x2=x y2=y
            omask=mask_index
            mask_index=spr_mask2x2
            x=(l+r)/2
            y=(t+b)/2
            image_xscale=(r-l)/3
            image_yscale=(b-t)/3
            if (place_meeting(x,y,coll)) {x=xprevious y=yprevious hurtplayer("crush")}
            x=x2 y=y2
            mask_index=omask
            image_xscale=oxsc
            image_yscale=oysc
            y=oy
        }*/
    }
    if (!mymoving) avgmovingh=0
} else {
    image_xscale+=0.5
    coll=instance_place(x,y+8,moving)
    image_xscale-=0.5
    if (coll) {
        x+=coll.hsp
        y+=coll.vsp
        if (object_is_ancestor(object_index,enemy) && object_index!=lakitu) {
            coll.y-=verybignumber
            coll2=collision(0,0)
            coll.y+=verybignumber
            if (coll2) {
                x-=coll.hsp
                y-=coll.vsp
                l=bbox_left r=bbox_right t=bbox_top b=bbox_bottom
                x2=x y2=y
                omask=mask_index
                mask_index=spr_mask2x2
                x=(l+r)/2
                y=(t+b)/2
                image_xscale=(r-l)/3
                image_yscale=(b-t)/3
                if (place_meeting(x,y,coll)) {global.coll=nearestplayer() enemydie(id)}
                x=x2 y=y2
                mask_index=omask
                image_xscale=1
                image_yscale=1
            }
        }
    }
}
with (noteblock) if !shifty if (instance_place(x,y-4,other.id)) {
        if !hit && !shifty{
        other.jump=1

        myplayer=other.id
        go=4
        other.vsp=-2-(other.akey*3)-(content="vine")*2

        hit=1

        }
}
dy=0


    kek=999 yes=0
    with (hittable) if (dy!=0) if (instance_place(x,y-4,other.id) || (other.climb && (instance_place(x-4,y,other.id) || instance_place(x+4,y,other.id)))) {kek=min(kek,dy) yes=1}
    if (yes) dy=kek

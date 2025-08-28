///player_nslopforce() Calculates slope forces and changes momentum of the player.
/*

if (object_index!=player) {xof=hspeed xsp=hspeed ysp=vspeed}
else {xof=0 xsp=hsp ysp=vsp if (!jump) xsp=0}

with (slopy) if (sol || ysp-xsp*f>=-0.5) if (place_meeting(x,y,other.id)) with (other) {
    ye=1
    yg=min(yg,gety(other.id,bbox_left+xof),gety(other.id,bbox_right+xof))
    //if the player's corner is within the slopey part, add slope factor
    if (yg<=ygo && ((other.f>0 && bbox_left>=other.bbox_left) || (other.f<0 && bbox_right<=other.bbox_right)))
        slobal=median(-other.f,slobal+other.f,other.f)
}

*/


//Create slobal
coll=collision(0,1)
if coll{
    if coll.nslop{
        if ((coll.f>0 && bbox_left>=coll.bbox_left) || (coll.f<0 && bbox_right<=coll.bbox_right) || coll.s=1) {
            
            slobal=median(-coll.f,slobal+coll.f,coll.f)
        
        } else slobal=0 // i dont know a better way to do this so uhhhhhh
    }else slobal=0
} else slobal=0
//This applies the  momentum itself
if (object_index=player) {
    if (!jump) {
        if ((abs(slobal)>0.3 && h=sign(slobal)) || spin) {
            hsp+=slobal/33
            hyperspeed=median(-3,hyperspeed+slobal/30,3)
            if (spin) gm8exspd+=slobal/24
        }
        if (slipnslide || spin) hsp+=slobal/24
        
    } else slobal=0
}

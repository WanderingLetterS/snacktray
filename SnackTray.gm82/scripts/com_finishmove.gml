if (!dead) {


    tempkill=0
    y=max(y,view_yview[p2]-448)

    //screen boundaries
    if !imma_de_warpin {
        with (flag) if (passed[other.p2]) camwalll=1
        if (gamemanager.ratchet) camwalll=1
        if (camwalll) {if (x<view_xview[p2]+7  ) {x=view_xview[p2]+7   hsp=0}}
        if (camwallr) {if (x>view_xview[p2]+393) {x=view_xview[p2]+393 hsp=0}}
        if (camwallt) {if (y<view_yview[p2]+8  ) {y=view_yview[p2]+8   vsp=1.5 sound("itemblockbump") stopsfx(jumpsnd)}}
    }

    //slide out from walls
    coll=collision(0,0)
    if (coll) expulsion()
    else {
        //safe spot calculatiom
        expulsionbias=0
        nx=floor(x/16)*16+8
        if (nx!=safedx) {
            safedx=nx
            ny=floor(y/16)*16+2
            if (collision_line(nx,ny,nx,region.ky,ground,0,0) || collision_line(nx,ny,nx,region.ky,phaser,0,0)) repeat ((region.ky-y)/16+1) {
                ny+=16
                if (place_meeting(nx,ny,ground) || place_meeting(nx,ny,phaser)) if (!place_meeting(nx,ny-16,collider) && !place_meeting(nx,ny-16,camblock) && (!place_meeting(nx,ny-16,grateblock) && object_index=player)) {safex=nx safey=ny-16 break}
            }
        }
    }
    if (jump) slobal=0
    else fallspd=frspd
} else sprite_angle=0

com_hitboxupdate()

///com_hitwall(hsp)
//invoked when a player hits a wall
var notecoll, hitsign, coll;
hitside=argument[0]
hitsign=sign(hitside)

coll=instance_place(x+hitside,y,sonicspike)
if (coll && ((coll.dir == 0 && hitsign == -1) || (coll.dir == 2 && hitsign == 1))) && !is_intangible && !is_invincible("spike") {
    with (munchercoll) y=-verybignumber
    coll2=collision(hitside,0)
    with (munchercoll) y=ystart
    if (!coll2) {
        x-=hsp
        xsc=sign(hitside)
        if (hurtplayer("spike")) exit
    }
}

if (place_meeting(x+hitside,y,muncher)) {
    x-=hsp
    xsc=sign(hitside)
    if  !is_intangible&&!is_invincible("muncher") if hurtplayer("muncher") exit
}

if (place_meeting(x+hitside,y,bigmuncher)) {
    x-=hsp
    xsc=sign(hitside)
    if  !is_intangible&&!is_invincible("muncher") if hurtplayer("muncher") exit
}

if break_crackedground==1||break_crackedground==3{//2 is for vertical only
    crack=instance_place(x+hitside,y,crackedground)
    if (crack) {//CRRRACKKKKKKKKK
        with crack event_user(0)
        exit
    }

}

com_piping()
gm8exspd=0
charm_run("hitwall")

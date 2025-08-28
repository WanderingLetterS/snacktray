//controls what happens in the moment the player lands on the ground

//we set jump to 0 before calling easyground so that the slope code updates slobal
jump=0
//nslopforce is the thing to replace easyground's wacky ass in terms of slope momentum calculation
player_nslopforce()
//yground=easyground()
//if (yground!=verybignumber) {yground-=14  y=yground }

//slope landing momentum
var tang,dir,spd,noted;
tang=point_direction(0,0,1,slobal)
dir=point_direction(0,0,hsp,vsp)
spd=point_distance(0,0,hsp,vsp)
hsp=lengthdir_x(spd,dir-tang)

//process things that cancel landing actions
var yea;
yea=0  
if (!is_invincible("fire")) if (place_meeting(x,y,lavablock)) yea=hurtplayer("lava")

coll=instance_place(x,y+1,sonicspike)
if (coll && (coll.dir==1 || coll.dir==4)) && !is_intangible && !is_invincible("spike") {
    with (munchercoll) y=-verybignumber
    coll2=collision(0,1)
    with (munchercoll) y=ystart
    if (!coll2) yea=hurtplayer("spike")
}

if (place_meeting(x,y+1,muncher) &&!is_intangible&&!is_invincible("muncher")) {
    yea=hurtplayer("muncher")
}
if (place_meeting(x,y+1,bigmuncher) &&!is_intangible&&!is_invincible("muncher")) {
    yea=hurtplayer("muncher")
}

with (jetstream) if (dir=90) if (place_meeting(x,y,other.id)) yea=1
if (yea) {jump=1 if vsp>0 vsp=0 exit}

if (object_is_ancestor(coll.object_index,moving)) {
    avgmovingh=coll.hsp
    hsp-=coll.hsp
}

if break_crackedground==2||break_crackedground==3{//1 is for vertical only
    crack=instance_place(x,y+1,crackedground)
    if (crack) {//CRRRACKKKKKKKKK
        jump=1
        with crack event_user(0)
        exit
    }
    
}

sprung=0
pollenated=0
fall=0 
scorelok1=0
scorelok4=0

charm_run("landing")

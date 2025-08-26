#define spritelist
stand,wait,lookup,pose,crouch,crawl,knock,dead,walk,run,brake,jump,bonk,fall,slide,swim,paddle,firetime,fire,greentime,greenmissile,misfire,spin,pound,punch,sjprecover,standcarry,crouchcarry,walkcarry,jumpcarry,bonkcarry,fallcarry,throw,sjpheadstuck,climbing,flagslide,piping,pipingup


#define soundlist
skid,swim,pound,stomp,smalljump,flip,slide,kick,fireball,wallkick,smallwallkick,missile,misfire,ping,punch


#define movelist
Luigi
#
[dir]+[c]: Green Missile
[down]: Groundpound
[down] + [a]: Roll
Jump out of a Groundpound to reach higher places
<big>
Luigi [mush]
#
[dir]+[c]: Green Missile
[up]+[c]: Super Jump Punch
[down]: Groundpound
[down] + [a]: Roll
Jump out of a Groundpound to reach higher places
<fire>
Luigi [flwr]
#
[dir]+[c]: Green Missile
[up]+[c]: Super Jump Punch
[b]: Thunderhand (hold)
[down]: Groundpound
[down] + [a]: Roll
Jump out of a Groundpound to reach higher places
<feather>
Luigi [fthr]
#
[a]: Scuttle
[dir]+[c]: Green Missile
[up]+[c]: Super Jump Punch
[down]: Groundpound
[down] + [a]: Roll
Jump out of a Groundpound to reach higher places

#define rosterorder
9

#define hud
if !dontdrawhud {
	drawdefaulthud()
}

#define effectsbehind
with (carryid) event_user(1)

#define effectsfront
if (timing_misfire) {
    draw_sprite_part_ext(sheets[size],0,227+(timing_proj!=0)*40,46,39,39,round(x-20),round(y-19.5+dy),1,1,$ffffff,alpha)
	draw_sprite_part_ext(sheets[size],0,64,46,39,39,round(x-20)+(ceil(timing_count))+(-2),round(y-19.5+dy),1,1,$ffffff,alpha)
}

#define grabbedflagpole
grabbedflagpole=1
hsp=0
vsp=0

#define start
mask_set(12,12)


#define stop
if (skidding) {soundstop(name+"skid") skidding=0}
star=0
grow=0
hurt=0
boost=0
greenmissile=0
timing_misfire=0
timing_proj=0
sjprecover=0
punch=0
push=0
pound=0

#define itemget
if (type="jumprefresh") {punch=0
mc=0
insted=0
flutter=0
}
if (type="mushroom") {
if ((!piped && !hurt && !(global.mplay>1 && flash))) {
coll=other.id
if (p2!=other.p2) {
itemc+=1
doscore_p(1000,1)
}
playgrowsfx("")
if (skidding) {soundstop(name+"skid") skidding=0}
if (size=0 || size=5) grow=1
tired=0
oldsize=size
size=max(size,1)
if size=5 size=1
itemget=1
}   
}
if (type="fflower") {
if ((!piped && !hurt && !(global.mplay>1 && flash))) {
coll=other.id
if (p2!=other.p2) {
itemc+=1
doscore_p(1000,1)
}
playgrowsfx("2")
if (skidding) {soundstop(name+"skid") skidding=0}
if (!super && size!=2) grow=1
tired=0
oldsize=size
size=2
}
itemget=1
}  

if (type="bfeather") {
if (!piped && !hurt && !(global.mplay>1 && flash)) {
coll=other.id
if (p2!=other.p2) {
itemc+=1
doscore_p(1000,1)
}
playgrowsfx("3")
if (skidding) {soundstop(name+"skid") skidding=0}
if (!super && size!=3) grow=1
oldsize=size
size=3
itemget=1
}                
}
if (type="mini") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
    coll=other.id
    if (p2!=other.p2) {
    itemc+=1
    doscore_p(1000,1)
    }
        playgrowsfx("4")
        if (skidding) {soundstop(name+"skid") skidding=0}
        if (!super && size!=5) grow=1
        tired=0
        oldsize=size
        size=5
    }
    itemget=1
}      
if (type="star") {
if ((!piped && !hurt && !(global.mplay>1 && flash))) {
coll=other.id
doscore_p(1000)
sound("itemstar")
itemc+=1
tired=0
if (!super) {
star=1
alarm[2]+=other.fuel+2
alarm[3]=-1
kek=0 with (player) if (super) other.kek=1
if (!kek) {
mus_play("starman",1)
global.music="star"
}                      
}
if (skindat("growsfx3"+string(p2))) playsfx("growsfx3") 
else playgrowsfx("3")
itemget=1
}            
}
if (type="1up") {
    sound("item1up")
    itemc+=1
global.lifes+=1
deaths=max(0,deaths-1)

itemget=1
}
if (type="shield") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        sound("itemshield")
        shielded=1
        itemget=1
    }   
}
if (type="poison") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
        coll=other.id
         if !invincible() hurtplayer("enemy")
        itemget=1
    }   
}
if (type="coin") {


sound("itemcoin")
if (other.fresh) global.scor[p2]+=100
global.coins[p2]+=1
coint+=1
if (name="robo") energy+=1
hit=1

itemget=1

}

if (type="ring") {
    sound("itemring")
    if (other.fresh) global.scor[p2]+=100
    global.rings[p2]+=1
    if (name="robo") energy+=1
    hit=1
    itemget=1
}

#define endofstage
right=1
grabflagpole=0
akey=(push || (jump && akey) || !collision(16,8))

#define projectile
if (event="create") {
if ((owner.hang && owner.vsp>1) || owner.braking) {hspeed*=-1 x-=8*xsc}
image_xscale=3
image_yscale=3
frame_sub=0
frame=0
brickc=0
seqcount=2
kek=8
vspeed=0
hspeed=owner.xsc*4
exploding=0
exploframe=0
visible=1
playsfx("luigifireball")
}

if (event="step") {
calcmoving()
if exploding=0{
	vspeed=0
	y=ystart+abs((kek mod 24) - 12)-4
	kek+=abs(hspeed)/3
	xsc=esign(hspeed,1)

	frame_sub=!frame_sub
	if frame_sub frame+=1
	if (frame>=3) frame=0

	if (!inview()) instance_destroy()

	coll=instance_place(x,y,collider)
	if (coll) {
		if (coll.object_index=lavablock) {instance_destroy() exit}
			if coll.object_index=phaser exit
			exploding=1
			sound("itemblockbump")
	}

	image_xscale=5
	image_yscale=5
	coll=instance_place(x,y,bowserboss)
	if (coll) {
		if (!coll.flash) {
			coll.hp-=1
			coll.flash=64
			coll.owner=owner
			sound("enemybowserhurt")
			instance_create(x,y,kickpart)
			instance_destroy()
		}
	}

	coll=instance_place(x,y,enemy)
	if coll {
		if (coll.object_index!=beetle && coll.object_index!=bulletbill) {
			yes=1
			if (coll.object_index=shell) if (coll.type="beetle") yes=0
			if (yes) {
				global.coll=owner.id  
				instance_create(x,y,kickpart)  
				enemydie(coll,2)
			}
		}
		exploding=1
	}
	image_xscale=3
	image_yscale=3



	coll=instance_place(x,y,player)
	if (coll) {
		if (coll.id!=owner) if (!invincible(coll)) {    
			if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
			if (coll.name="knux" && coll.glide && sign(hspeed)=-sign(coll.hsp) && object_index!=powah_wave) {hspeed=abs(coll.hsp+1)*esign(coll.hsp,1) owner=coll.id with (owner) playsfx("knuxreflect") exit}                                                                   
			if (coll.name="robo" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) exploding=1 exit}
			with(coll) fragplayer(other.owner)
			}
			exploding=1
		}
	}
}
else if exploding=1
{
exploframe+=0.5
if (exploframe>=3) {visible=0 instance_destroy()}
hspeed=0
vspeed=0
}
}
if (event="draw") {
if exploding=0
{
draw_sprite_part_ext(sheet,0,10+17*frame,104,16,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
} else
{
draw_sprite_part_ext(sheet,0,10+17*floor(exploframe/1.333333333),87,16,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
}
}


#define sprmanager
frspd=1

if (grabflagpole) {sprite="flagslide"}
else if (bonk) {sprite="bonk"}
else if (throw) {sprite="throw"}
else if (fired) {sprite="fire" frspd=0 frame=1-round(fired/9)}
else if (punch) {if (vsp<=0 || punch<10) {sprite="punch" frspd=0.1} else sprite="sjprecover"}
else if (greenmissile) {
	if misfire=0 {sprite="greenmissile" frspd=median(0.25,0.5,0.15+abs(hsp/8))}
	else {sprite="misfire" frspd=median(0.25,0.5,0.15+abs(hsp/8))}
}
else if (hurt) {sprite="knock"}
else if (pound) {sprite="pound"}
else if spin=1 {sprite="spin" frspd=spinmoment/45}
else if (slipnslide) {sprite="slide"}
else if (sjpcrouch) {sprite="sjpheadstuck"} //DOOR STUCK! DOOR STUCK!
else if (crouch) {if (left||right) {sprite="crawl"} else sprite="crouch" }
else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(abs(hsp)+(vsp))}
	else if (fall=6) {sprite="knock"}
	else if timing_misfire {sprite="greentime"}
	else if (flutter) {sprite="run"}
	else if (pound) {sprite="pound"}
	else if (water) {sprite="swim" if (swim) sprite="paddle"}
	else if (bonk) {sprite="bonk"}
	else if (float) {sprite="superfloat" if float>11 frame=floor(float/3) frspd=0}
	else {sprite="jump" if (vsp>0) sprite="fall"}
} else {
	if (braking) {sprite="brake" xsc=-brakedir}
	else if (hsp=0) {
	if timing_proj {sprite="firetime"}
	else if timing_misfire {sprite="greentime"}
	else if fired!=0 {sprite="fire"}
	else if (lookup) {sprite="lookup"}
	else if (waittime>maxwait &&!carry) {sprite="wait"}
	else if (posed) {sprite="pose"}
	else {sprite="stand"}
	} else {
		if (abs(hsp)>3 && !carry) {sprite="run"}
		else {
			sprite="walk"
			frspd=median(0.5,1,0.3+abs(hsp/4))
		}
	}
}
if (carry) sprite=sprite+"carry"

#define grabflagpole
grabflagpole=1
hsp=0
vsp=0

#define controls
com_inputstack()

tempbrick=0
carryoffsetx=10
carryoffsety=5

if (rise!=0 || watrlock || hurt || piped) {
di=0
h=0
exit
}

if (up) com_piping()
oup=up

lookup=0
if (up && hsp=0 && !jump && !carry && !throw) lookup=1

if (
rise!=0 || slipnslide ||
greenmissile ||
spinmoment
) h=0

if (h!=0 && !wallkick) {
    loose=0
    coll=noone
    if (h=sign(hsp) || hsp=0) coll=collision(h,0)
    if (coll) if (object_is_ancestor(coll.object_index,moving)) coll=place_meeting(x+h,y+coll.vsp+sign(coll.vsp),coll)
    if (coll) if (player_climbstep(coll)) coll=noone
    if (x<=minx && left) coll=1
    if (coll) {
        com_hitwall(h)
        if (!jump) {
            push=h
            xsc=h
            braking=0
        }
    } else {
        if (!jump) {
            if (sign(hsp)!=h) {
                if (abs(hsp)>2 && !carry) {
                    braking=1
                    skidding=1
                    playsfx("luigiskid",1)
                    brakedir=h
                }
                hsp+=(0.33-0.175*!water+0.04*(abs(hsp)<1))*wf*h
                if (abs(hsp)<0.5 || carry) xsc=h
            } else {
                hsp+=(0.06+0.06*(abs(hsp)<1))*wf*h
                xsc=h
                braking=0
            }
        } else {
            if (water) {if (h!=sign(hsp)) hsp+=0.1*h else hsp+=0.0375*h}
            else if (greenmissile)
            hsp=xsc*(2+(missilemisfire*4))
            else if (longjump) hsp+=0.04*wf*h
            else if (size==5) hsp+=0.085*wf*h
            else hsp+=0.1*wf*h
            if (!hang && !wallkick && !twist && !longjump) xsc=h
        }
    }
}

if (push!=h) push=0

com_di()

if ((abut || jumpbufferdo) && !springin) {
    if (!jump || water && !(timing_misfire) ||fall=69 ) {
        if (water) {if (!pound) {vsp=-1.5-up*0.75 swim=24 crouch=0 playsfx("luigiswim")}}
        else {
            if (!crouch) {
                if (size==0 || size==5) jumpsnd=playsfx("luigismalljump",0,1+(size==5)/3)
                else jumpsnd=playsfx("luigijump")
                vsp=-(5.5+min(1,abs(hsp)/8)+!!poundjump)
                if (water) vsp=-sqrt(sqr(vsp)*wf+2)
                else if (spinmoment) {
                    vsp+=1
                    hsp=maxspd*xsc
                    longjump=1
                    spinmoment=0
                    crouch=0
                }
            }
        }
        if (poundjump) {springsmoke(x,y+8) crouch=0}
        
        jump=1-crouch
        onvine=0
        fall=0
        braking=0
        spin=0
        canstopjump=1-crouch
        
        if (mymoving) hsp+=avgmovingh
        if (!star||crouch) fall=1
        else crouch=0
        if (rise && !down) crouch=0
        jumpspd=min(1,0.5+abs(hsp)/5)
        if (crouch=1 && spin=0)
        {
            playsfx("luigiflip",0,1+(size==5)/3)
            spinmoment=45
        }
    } else {
        if (!insted && !flutter && size=3) {
          insted=1
      fall=0
      flutter=1
    }
    jumpbuffer=4*!jumpbufferdo
    }
}
jumpbufferdo=0
springin=0

if (akey) {
if (jumpbuffer) jumpbuffer-=1
if (flutter){
    vsp-=0.3
flutter+=1
if vsp<-2 vsp=-2
if flutter>50 flutter=0
}

} else {
flutter=0
jumpbuffer=0
if (canstopjump=1 && jump && vsp<-2 && !sprung && !water && !punch ) {
vsp*=0.6
}
canstopjump=0
}

if (bbut) {
if (size=2 && count_projectiles()<2 && !crouch && !punch && !longjump) {
fire_projectile(x,y)
fired=16
}
}

if (bkey) {
if (!jump) run=1.5
} else {
if (carry) {
updatecarry()
if (!down) {throw=16 instance_create(carryid.x,carryid.y,kickpart) sound("enemykick")}
with (carryid) event_user(0)
carryid=noone
carry=0
}   
}

if (cbut) {
if (spinmoment) {
hsp=sign(xsc)*maxspd
hyperspeed=3*sign(hsp)
jump=1
spinmoment=0
crouch=1
canstopjump=0
vsp=-2.5
playsfx("luigismalljump",0,1+(size==5)/3)
} else if (up && (size && size!=5) && !carry && punch=0 && !timing_proj && !timing_misfire) {
punch=1
hsp=0 vsp=0
playsfx("luigipunch")

} else if !carry && (!size || size==5)  && !crouch && (left||right||timing_misfire) && timing_proj=0 && !greenmissile && !punch && (cooldownmoment<1 && timingmisfire=0){
timing_misfire=0
jump=1
timing_count=0
{
if jump vsp=-2 else vsp=-0.5 hsp=xsc*maxspd
hyperspeed=1*sign(hsp)
greenmissile=45
cooldownmoment=80
spinmoment=0
longjump=0

missilemisfire=0
playsfx("luigimissile")

}
}
}

if (ckey) {
if (!carry &&(!!size || size==5)  && !crouch && (left||right||timing_misfire) && !greenmissile && !punch && (cooldownmoment<1))
{
timing_misfire=1
hsp=hsp*0.99
timing_count+=0.5
if timing_count>30 {timing_count=0}
if (timing_count<19 && timing_count>13) {misfire=1 } else {misfire=0 }
} 
}else if (timing_misfire) {
timing_misfire=0
jump=1
timing_count=0
if misfire=1 {
vsp=-0.75 hsp=xsc*5
greenmissile=60
cooldownmoment=100
spinmoment=0
longjump=0
missilemisfire=1
playsfx("luigimisfire")
}
else {
if jump vsp=-2 else vsp=-0.5 hsp=xsc*maxspd
hyperspeed=1*sign(hsp)
greenmissile=45
cooldownmoment=80
spinmoment=0
longjump=0

missilemisfire=0
playsfx("luigimissile")

}
}

if (down && !up) {
if (jump) {
if (fall!=6 && !pound && !carry && !poundlok && !timing_proj && !punch && !timing_misfire && fall!=69) {
pound=1
greenmissile=0
misfire=0
punch=0
longjump=0
if (water) seqcount=1
playsfx("luigipound")
}
}
else if (!braking && !timing_proj && !timing_misfire) {
if (slobal!=0) {
slipnslide=1
} else {
if (!crouch) {
crouch=1
}
}
}
poundlok=1
com_piping()
} else {
if (pound=-1) pound=0
if (!jump) crouch=0
poundlok=0
}

if (size==5) mask_set(9,8)
else if (size=0 || crouch || spinmoment || pound) mask_set(12,12)
else if (jump) mask_set(12,26)
else mask_set(12,24)


#define movement
if (piped) exit

if ((loose && !jump) || (crouch && !jump)) {
if (braking) xsc=brakedir
braking=0
frick=0.06
if (slipnslide) frick=0.01
hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

maxspd=(1.5+runvar+longjump+water+(size==5)*0.55+slipnslide)*wf
if ((abs(hsp)>maxspd)&&(!greenmissile)) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

if (pound) {
vsp=min(6,vsp)
} else vsp=min(7+downpiped,vsp)

///movement
//hi moster here dont uncomment the yground or easyground stuff because its required for the cool new slope system to work
//for anyone porting a charm from unfinished build or below to this build, delete or comment all of the commented code and add player_nslopforce()
calcmoving()

if (!dead && !grabflagpole) {
vine_climbing()
if fall!=69
player_horstep()
player_nslopforce()
//yground=easyground()
//if (yground!=verybignumber) yground-=14
if (jump && fall!=69) {
if (pound>0) {
hsp=0
if (pound<14) vsp=0
else if (pound>=14 && pound<15) vsp=6*wf
else if (water) {vsp-=0.1*wf if (vsp<1.5) pound=0}
else vsp+=0.375*wf
} else if (vsp<-2){
vsp+=0.15*wf
} 
else if (water) vsp=min(1.5,vsp+0.04)
else if (greenmissile && misfire) {vsp=min(1.5,vsp+0.01) hsp=xsc*(3+2*missilemisfire)}
else if fall!=69 {
vsp=min(4,vsp+0.15)
if size==5 && vsp>-0.45 vsp-=0.105
} vine_climbing() 

if (run && !bkey && abs(hsp)<1) run=0
if (skidding) {soundstop("luigiskid") skidding=0}
braking=0

braking=max(0,braking-1)
if (!fall && !spinjump) fall=1
if (pound=-1) pound=0
if (sprung && !fall) fall=1
if (fall=12) {vsp=6*wf hsp=0}
push=0 spin=0
rise=0 risec=0
coyote=0
player_vertstep()
}
if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3
if (!jump) {
bonk=0
//if (yground!=verybignumber) { y=yground while collision(0,0) && !collision(0,-8) {y-=1 } }
if (finish && ending="retainer" && !jump) coyote=0
if (!collision(0,4) /*&& (y<yground-2)*/) {
coyote+=1
if (down || !run) {y+=1 coyote=3}
if (coyote=3) {
jump=1
fall=1
if (crouch) vsp=1.5
}
} else coyote=0
if (jumpbuffer=-1) {
jumpbuffer=0
//jump buffering
if (rise=0 && !down) {
jumpbufferdo=1
if (insta) insted=1
}
}
}
}
com_finishmove()


#define actions
com_warping()
com_actions()

if greenmissile && !misfire{
    sprite_angle=(point_direction(0,0,hsp,vsp)) 
if sprite_angle<240 
if sprite_angle>90 sprite_angle-=180



} else sprite_angle=0


weight=0.5+0.5*!!size
bartype=1

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1 ) is_intangible=1

power_lv=0
if (spin) power_lv=1
if ((!poundcancel && pound)||greenmissile) power_lv=3
if (star || misfire || (punch && punch<11)) power_lv=5
if (super) power_lv+=1

//Special interactions
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=!pound //make sure to set for 0 for the mario bros when pounding
pvp_ignore=pound //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

//Brick collision
if (size=0 || size==5) cracking_power="bump"
else cracking_power="break"



if (piped) {
updatecarry()
exit
}

//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

if (!jump) {
vsp=0
if (!star) seqcount=0
if (push=0 && hsp!=0 && braking) {
if (!skidding) {skidding=1 playsfx("luigiskid",1)}
} else if (skidding) {soundstop("luigiskid") skidding=0}
}

if (underwater()) {
if (!water) {
if (abs(vsp)>2) sound("itemsplash")
watrlock=10 spinjump=0 fall=1 longjump=0
vsp=min(1,vsp/2)
jumpspd=1
}
water=1 wf=0.45 run=0
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
} else {
if (water) {
water=0
if (vsp<-1) vsp=min(vsp*2,-4)
else {vsp=1 y+=1 water=underwater() y-=1}
}
wf=1
}

//smoke generation
if (global.dustframe) {
if (slipnslide) {
i=shoot(x,y+10,psmoke) i.depth=depth+2
}
if (vsp<-5-2*!sprung) {
shoot(x,y+8,psmoke,0,-1)
}
if (vsp>7) {
speedwagon+=1
if (speedwagon>60) shoot(x,y,psmoke,0,1)
} else speedwagon=0
if greenmissile{
shoot(x,y+8,psmoke,0,-1)
}
}
//Character specific
twist=max(0,twist-1)
runvar=inch(runvar,run,0.05)
stomplok=max(0,stomplok-1)
wallkick=max(0,wallkick-1)
watrlock=max(0,watrlock-1)
throw=max(0,throw-1)
swim=max(0,swim-1)
poundjump=max(0,poundjump-1)
wsk=(wsk+0.1) mod 4

if (spinmoment) {spin=1 spinframe=min(7,spinframe+1) spinmoment-=1 hsp=xsc*spinmoment/12 if abs(hsp)>maxspd hyperspeed=sign(hsp)*(abs(hsp)-maxspd)}
else {spinframe=0 spin=0}


if (pound) {
crouch=1
hang=0
if (pound<15) pound+=1
else if (up || (water && vsp>5)) {pound=0 fall=0 insted=1 crouch=0 canstopjump=1}
else fall=4
} else poundcancel=0

if greenmissile{
greenmissile-=1
canpipejump=1
} else canpipejump=0

if (!jump && run && !bkey) run=0
if (fall=6 && sign(hsp)=xsc) fall=1
if (rise!=0) {crouch=1 sjpcrouch=!jump hsp=0 xsc=rise risec+=1 if (risec=10) {risec=0 rise=0 sjpcrouch=0 crouch=down}}
else if (jump) sjpcrouch=0
sprung=0
if (slipnslide) {
crouch=1
if ((slobal=0 && (hsp=0 || ((left || right) && !down))) || jump) {slipnslide=0 crouch=0}
}
jumpspd=min(jumpspd,100)

if hurt{timing_proj=0 timing_misfire=0 greenmissile=0}
if cooldownmoment>0{
cooldownmoment-=1}

if (punch!=0) {
canpipejump=1
        if (punch<0) {depth=999999 sjpcrouch=1 punch-=1 if (punch<=-10) {punch=0 depth=0 rise=xsc}}
        else if (punch>=10) {sjpcrouch=0 if (vsp>0) {punch=11 boost=0} if hsp>=1 hsp=1 if hsp<=-1 hsp=-1}
        else {punch+=1 sjpcrouch=0 if (punch=10) {y-=1 jump=1 vsp=-6 hsp=0 boost=1 shoot(x-8,y+4,psmoke,-2,-1) shoot(x+8,y+4,psmoke,2,-1)}}
    } else {if (depth=999999) depth=0 canpipejump=0}
if (rise!=0) {crouch=1 xsc=rise risec+=1 if (risec=10 || jump) {risec=0 rise=0 crouch=down}}
if (punch>=0 && depth>2) depth=0


//WHO IS CLIMBING MY SHIT.
if (up && !down && !onvine) {
    onvine=instance_place(x,y,vine)
    if (onvine) fall=69 //nice
}
if (onvine) pound=0
if (fall=69) {
    rightvine=instance_place(x+8,y,vine)
    leftvine=instance_place(x-8,y,vine)
    if (rightvine=noone) rightvine=0
    if (leftvine=noone) leftvine=0
    
    downvine=instance_place(x,y+8,vine)
    upvine=instance_place(x,y-8,vine)
    if (upvine=noone) rightvine=0
    if (downvine=noone) leftvine=0
    
    if (!rightvine && abs(x-onvine.x)>mask_h/2 && x>(onvine.x)) {
        x=onvine.x+mask_h/2
    } else if (rightvine && abs(x-onvine.x)>mask_h/2 && x>(onvine.x)) onvine=rightvine

    if (!leftvine && abs(x-onvine.x)>mask_h/2 && x<(onvine.x)) {
        x=onvine.x-mask_h/2
    } else if (leftvine && abs(x-onvine.x)>mask_h/2 && x<(onvine.x)) onvine=leftvine
    //Imagine adding separation just so that it doesn't look bad

    if !downvine && abs(y-onvine.y)>mask_v/2 && y>(onvine.y) {
        fall=0
        onvine=0
    } else if downvine && abs(y-onvine.y)>mask_v/2 && y>(onvine.y) onvine=downvine
    
    if (!upvine && abs(y-onvine.y)>mask_v/2 && y<(onvine.y)) {
        fall=0
        vsp=-2
        onvine=0
    } else if (upvine && abs(y-onvine.y)>mask_v/2 && y<(onvine.y)) onvine=upvine
    
    if (onvine.movingnation) {
        x+=onvine.hsp
        y+=onvine.vsp
    }
}

jeezus=(((boost && vsp<4)||(size==5 && !down && abs(hsp)>2.8)) && !water)
if jeezus==1 {
    if !plat plat=instance_create(0,0,ground)
    plat.x=x-6
    plat.y=y-80
    plat.image_yscale=0.3
    with instance_place(x,y+4,waterblock) other.plat.y=y
    if plat.y=y-80 {
        if plat with plat instance_destroy() plat=0
    }
    else if instance_place(x,y+4,plat) && splashtime<=0 {splashtime=9 water_splash(-1)}
    splashtime-=1
} else {splashtime=0 plat.x=verybignumber plat.y=verybignumber if plat with plat instance_destroy() plat=0}

if (punch) vertvspstop=1 else if (vertvspstop) vertvspstop=0

com_endactions()

#define enemycoll
if (hurt || piped || (intangible() && !diggity)) exit

coll=noone extracheck=id inst=0
if (insta) {extracheck=myhitbox inst=1}


with (pswitch) if (phase!=other.id && !lock && !carry) {
    mask_index=spr_cratemask
    if (instance_place(x,y-other.vsp-16*!!other.diggity,other.id) || instance_place(x,y,extracheck)) other.coll=id
    mask_index=spr_mask16x16
}
with (enemy) if (phase!=other.id && !lock && !carry)
    if (instance_place(x,y-other.vsp-16*!!other.diggity,other.id) || instance_place(x,y,extracheck)) other.coll=id

if (coll) {
    calcfall=fall
    if (fall=5 || fall=12) calcfall=0
    global.coll=id
    type=coll.object_index
    
    seqcount=max(1,seqcount)

    
    if (super || greenmissile) {
        if (water) seqcount=1
        enemyexplode(coll)
        exit
    }

    
    if (slipnslide && type!=spinyegg && type!=bulletbill) {
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        enemydie(coll)                
        exit
    }
    
    if (coll.object_index=lakitu) if (coll.flee) exit
    
    if (star  
    || (spin && type!=spinyegg && type!=beetle && type!=shell)
    || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
        if size==5 && !spin && !star {if vsp<=0 {hurtplayer("enemy") exit} else playsfx(name+"smalljump",0,3.6) vsp=-3-((ckey && spin) || (akey && star))*1.5 canstopjump=akey if !pound exit else pound=0}
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        if (type=hammerbro) seqcount=max(5,seqcount)
        enemydie(coll)                
        exit
    }
    
    if (spindash || inst || glide || diggity || firedash) {if (diggity=32) exit enemyexplode(coll) if (glide) vsp=-2 exit}
    
    if (spinjump) {
        if (fall) {if (y>coll.y && type!=shell) hurtplayer("enemy")}
        else if (type=spinyegg || type=spiny || type=piranha) {
            instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
            playsfx(name+"spinbounce",0,1+(size==5)/3)
            vsp=-3-akey*1.5
            canstopjump=akey
            pound=0
            coll.phase=id
        } else if size==5 {vsp=-3-ckey*1.5 playsfx(name+"spinbounce",0,1+(size==5)/3) canstopjump=akey exit} else enemyexplode(coll)
        exit
    }
    
    if (type=piranha || coll.damage_player_on_contact)  {
        hurtplayer("enemy")
        exit
    }
    
    if (spin) {
        if (type=shell) {if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-ckey*1.5 canstopjump=akey exit} else if (coll.type!="beetle") {enemydie(coll) exit}}
        else if (type=beetle) {if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-ckey*1.5 canstopjump=akey exit} else {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}}
        else if (type=spinyegg) {hurtplayer("enemy") exit}
        else {if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-ckey*1.5 canstopjump=akey exit} else enemydie(coll) exit}
    }
                     
    if (type=spiny) {
        if (!fall && vsp<0) enemyexplode(coll)
        else hurtplayer("enemy") exit
    }
    if (type=spinyegg) {
        if (punch && punch<=10) enemydie(coll) else hurtplayer("enemy") exit
    }                
            
    if (type=shell && !coll.time) {          
        if (coll.type="spiny" && (coll.vspeed-vsp)*coll.ysc<0) {
            hurtplayer("enemy") exit
        } else if (!coll.kicked || (coll.stop && (coll.owner=id || coll.vspeed>=0))) {
            if (bkey && !carry && !punch) {
                coll.carry=id coll.owner=id coll.alarm[1]=600 coll.alarm[2]=-1 carryid=coll
                carry=1
            } else { 
                if (coll.stop && !coll.kicked && size!=5) doscore_p(8000)
                else if size!=5 {seqcount=max(seqcount,2+scorelok1) doscore_p()}
                if (jump) {
                    if (vsp>0) {
                        vsp=-3-akey*1.5
                        canstopjump=akey
                        if size==5 playsfx(name+"smalljump",0,3.6)
                        if (fall=12) fall=5
                    }
                }
                if size!=5 {
                    kicksound(0)
                    instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
                    with (coll) {spd=max(3,abs(other.hsp)+1) hspeed=spd*esign(x-other.x,other.xsc) owner=other.id kicked=1 stop=0 phase=owner}
                }
            }
            exit
        } else {
            if (coll.kicked && !coll.stop && sign(hsp)=sign(coll.hspeed) && abs(hsp)>abs(coll.hspeed)) {
                kicksound(0)
                instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
                coll.spd=max(3,abs(hsp)+1)
                coll.owner=id
                coll.phase=id
                exit
            } else if (coll.kicked && (!coll.stop || (coll.owner!=id && coll.vspeed<0)) && (vsp<0 || !jump)) {hurtplayer("enemy") exit}
            else {
                if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey if fall=12 fall=5 exit}
                with (coll) {hspeed=0 owner=noone phase=other.id stop=0 kicked=0 time=15}
                vsp=-3-akey*1.5 canstopjump=akey sound("enemystomp") doscore_p() if (name="giana") {twirl=0 insted=1} if (fall=12) fall=5 exit
            }
        }                    
    }
    
    if (type=blooper) {
        if (jump && (!calcfall || !water) && vsp>0) {if (calcfall) enemystomp(coll,5) else enemyexplode(coll)}
        else hurtplayer("enemy") exit
    }
    
    if (type=cheepred || type=cheepwhite) {
        if (jump && !calcfall) {enemyexplode(coll) exit}
        else {hurtplayer("enemy") exit}
    }
    
    if (jump) {
        if (type=koopa || type=beetle || object_is_ancestor(type,koopa)) {
            if (vsp<0) {
                if (calcfall) hurtplayer("enemy")
                else if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey exit}
                else enemyexplode(coll) exit
            }
        } else {
            if (!calcfall && size!=5) {enemyexplode(coll) exit}
            if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey if fall=12 fall=5 exit}
            if (vsp<0) {hurtplayer("enemy") exit}
        }
        
        if (type=bulletbill)
        {
        if (coll.vspeed<0 && coll.y>y+8) {if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey exit} else {jump=1 fall=1 dive=0 vsp=-0.5 enemydie(coll) exit}}
        }
        
        if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
        if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
        if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
        if (type=hammerbro) seqcount=max(5,seqcount)
        if (fall=12) fall=5                        
        if size==5 {if vsp<=0 {hurtplayer("enemy") exit} else playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey exit}
        enemystomp(coll) exit      
    } else if (coll.vspeed<0 && coll.y>y+8) {if size==5 {playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey exit} else {jump=1 fall=1 vsp=-0.5 enemystomp(coll) exit}}
    //"boll team watching me paste this same line 12 times like an idiot:"
    
    hurtplayer("enemy")   
} 

#define hurt
if ((invincible() && (hurt || flash)) || intangible())

pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
onvine=0
energy=0
braking=0
sprung=0
diggity=0
grow=0
greenmissile=0
timing_proj=0 
timing_misfire=0 
spinmoment=0
longjump=0
gk=0
fk=0
punch=0
bounce=0
twirl=0
oldsize=size
jumpbuffer=0
hyperspeed=0
hp=0
star=0
if (super) stopsuper()   

if (((!size || size==5) || ohgoditslava || name="kid") && !shielded && global.rings[p2]=0) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    rise=0
    slide=0
    sprung=0
    fall=0
    pound=0  
    braking=0
    boost=0
    upper=0
    hyperspeed=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")
    starhit=0
        fired=0
        if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size>=3 size=2 size-=1}
        flash=1
        jump=1
        fall=6
        hsp=xsc*-2*wf vsp=-3*wf
    
}

//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || (owner.size=0 || owner.size=5) && (insted!=1 || greenmissile) && !owner.tempkill && (biggie || cracked=0)) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else if (stonebump || owner.size && owner.size!=5 && (insted!=1 || greenmissile) && !owner.tempkill && cracked=0 && biggie) { //break spiner
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
    if (!stonebump){
    owner.vsp=1.5
    cracked=1
    i=instance_create(x,y,crackedbrick)
    i.owner=id
    i.biome=biome
    i.imcrack=1
    i.go=go
    i.tpos=1
    i.biggie=biggie
    }
}   
else { 
    if (!greenmissile && !punch && !insted) {owner.vsp=1.5}
    owner.blockc+=1
upwardthrust()
    global.scor[owner.p2]+=10
    sound("itemblockbreak")
    hit=1
    if (skindat("bricd")) {
        i=instance_create(x,y,bricd)
        i.biome=biome
        i.depth=depth
    }
    if (stoned="1") with (instance_create(x,y+8,stone)) phase=1
    i=instance_create(x+4,y+12+(16*biggie),part) i.hspeed=-1 i.vspeed=-1+2*go
    i=instance_create(x+12+(16*biggie),y+12+(16*biggie),part) i.hspeed=1 i.vspeed=-1+2*go 
    i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
    i=instance_create(x+12+(16*biggie),y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    
    with (turing) event_user(4)
    instance_destroy()
  }
 }
} else if typeblockhit=1{
hititembox()
}

#define hitwall
//hit blocks sideways
skiphsp=0
if (greenmissile||spinmoment||longjump) {
    global.coll=id
    with (hittable) if (instance_place(x-other.hitside,y,other.id)) {
        go=-1
        insted=1
        event_user(0)
        insted=0
    }
    coll=collision(hitside,0)
	sound("itemblockbump")
	if !misfire && !spinmoment && !longjump {
		greenmissile=0
		if (!jump)
		jump=1
		bonk=1
		vsp=-2
		hsp=sign(xsc)*-4
		sprite="bonk"
		instance_create(x+8*s,y+6,kickpart)
	}
	else if misfire{
	vsp=-4
	misfire=0
	greenmissile=0
	instance_create(x+8*s,y+6,kickpart)
	} 

}


if (spinmoment || longjump) {
    spinmoment=0
    longjump=0
    instance_create(x+8*sign(hsp),y,kickpart)
    jump=1
    bonk=1
    vsp=-2
    hsp=sign(xsc)*-2
    sprite="bonk"
    skiphsp=1
}

if (coll=noone) exit

if (hurt) {hurt=0 fall=6 flash=1 fk=0}

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12 && !down) {y=coll.y-14 coll=noone exit}
}
if (!skiphsp) hsp=0
hyperspeed=0            


#define landing
braking=0
shock=0
spinjump=0
longjump=0
insted=0
if greenmissile &&!misfire greenmissile=0
if (downpiped) {
shoot(x-8,y+4,psmoke,-2,-1)
shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}

if (punch) punch=-1

playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1

hang=0   
kicked=0

if (pound) {
com_piping()
with (itembox) if (instance_place(x,y-max(4,other.vsp),other.id)) {
go=1    
event_user(0)
picked=0
other.stoppounding=!hit
other.jump=1
other.vsp=-0.1
} 
if (stoppounding=1 && !down) {stoppounding=0}
if stoppounding=0 {pound=0} 

    
    if (!poundcancel && !piped) {
        playsfx(name+"stomp")         
        shoot(x-8,y+4,psmoke,-2,-1)
        shoot(x+8,y+4,psmoke,2,-1)    
poundjump=16
    }
}

if egg() {if (global.mplay=1 && piped=1 && alarm[2]=-1 && star=0 && depth=-11) set_sprite("spin")}

#define death
if (event="create"){

alarm0=30
alarm1=300
sprite="dead"
frspd=0.1
size=0
spindash=0
alpha=1


name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
water=owner.water


} 
else if (event="step"){
alarm0=max(0,alarm0-1)
alarm1=max(0,alarm1-1)
if (alarm0=0 && didonce=0) {
    vspeed=-3.5 gravity=0.1 didonce=1
}

if alarm1=0 instance_destroy()
} else if (event="draw"){

}

#define enterpipe
if (type="side") {
if (greenmissile&&misfire) { greenmissile=0 set_sprite("misfire") hspeed=5*sign(xsc) alarm[6]=6 fastpipe=1}
if (carry) {crouch=1 set_sprite("crouch")}
}
if (type="up") {
if (punch) {fastpipe=1 set_sprite("punch")}
}
if (type="down") {
if (pound) {set_sprite("pound") frame=frame_number(sprite) vspeed=5 alarm[6]=6 fastpipe=1}
punch=0
}

if (skidding) {soundstop("luigiskid") skidding=0}
braking=0
crouch=0
push=0
pound=0
longjump=0

#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}

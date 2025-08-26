#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,brake,jump,bonk,fall,fly,wall,pound,slide,standcarry,crouchcarry,walkcarry,jumpcarry,bonkcarry,fallcarry,throw,spin,pound,swim,paddle,twirl,fire,flutter


#define soundlist
skid,swim,pound,stomp,flip,spin,slide,kick,fireball,aim,flutter,flutterend,spit,throw,


#define movelist
Yoshi
#
[a]: Flutterjump (air)
[down]: Groundpound
[up]: Cancel Groundpound
[up]+[c]: Spinjump (ground)
[dir]: Roll (ground)
Jump out of a Groundpound to reach higher places

#define rosterorder
5


#define effectsbehind
with (carryid) event_user(1)

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
push=0
pound=0


#define itemget
if (type="jumprefresh") {
	spinjump=0
	mc=0
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
			if (size=0) grow=1
			tired=0
			oldsize=size
			size=max(size,1)
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
			if (!super && size<2) grow=1
			tired=0
			oldsize=size
			size=2
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
			stats("coins collected",stats("coins collected")+1)
			coint+=1
			if (name="robo") energy+=1
			hit=1
		
		itemget=1
	
}

#define endofstage
right=1
akey=(push || (jump && akey) || !collision(16,8))


#define damager
y=-1000
image_xscale=8

breakflag=owner.size
hittype="enemy"
if (owner.diggity && owner.diggity>32 && (owner.diggity<36 || !owner.size)) {x=owner.x y=owner.y+8 image_yscale=10 image_xscale=12}
else if (owner.diggity && owner.diggity<8) {x=owner.x y=owner.y+22 image_yscale=3 image_xscale=12}
else if (owner.glide || owner.slide) {x=owner.x+10*cos(pi*(owner.ggf*-0.5+0.5))+owner.hsp y=owner.y+8+8*sin(pi*(owner.ggf*0.5+0.5)) image_yscale=6+min(1,owner.size)*2}
else if (owner.upper || ((owner.fall=11 || owner.diggity>32) && owner.size)) {x=owner.x+owner.xsc*10+owner.hsp y=owner.y+4-min((owner.upper*2)+10*(owner.fall=11)-!!owner.diggity*(16-min(32,(owner.diggity-32)*2)),20) image_yscale=10 hittype="gut"}
else if (owner.fired) {x=owner.x+owner.xsc*12+owner.hsp y=owner.y image_yscale=10}
coll=instance_place(x,y,collider)
	if (coll) {
		if (object_is_ancestor(coll.object_index,hittable)) {
			if (coll.object_index=brick) brickc+=1 else brickc=4
			hitblock(coll,owner,0,esign(coll.y-owner.y),0)
			}    
		}

	coll=instance_place(x,y,enemy)
	if (coll) {                    
		global.coll=owner.id
		enemydie(coll,2)
	}

	coll=instance_place(x,y,player)
	if (coll) {
		if (coll.id!=owner) if (!invincible(coll)) {    
			if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { coll.hittype=hittype
				with (coll) hurtplayer(hittype)
			}
			instance_create(x,y,kickpart) 
		}
	}




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
	vspeed=3
	hspeed=owner.xsc*4
	exploding=0
	exploframe=0
	visible=1
	playsfx("mariofireball")
}
	
if (event="step") {
	calcmoving()
	if exploding=0{
	vspeed=min(2.75,vspeed+0.35)
	xsc=esign(hspeed,1)
	
	frame_sub=!frame_sub
	if frame_sub frame+=1
	if (frame>=3) frame=0

	if (!inview()) instance_destroy()
	
	coll=instance_place(x,y,collider)
	if (coll) {
	if (coll.object_index=lavablock) {instance_destroy() exit}
	if (y<coll.y+4 && !instance_place(x,y-8,collider)) {vspeed=-2.75 y-=2 exit}
    exploding=1
    sound("itemblockbump")
	}
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
if (fired) {sprite="fire"}
else if (hurt) {sprite="knock"}
else if (throw) {sprite="throw"}
else if (pound) {sprite="pound"}
else if (slipnslide) {sprite="slide"}
else if (crouch) {sprite="crouch"}
else if (flutter) {sprite="flutter"}
else if (jump) {
	if (fall=6) {sprite="knock"}
	else if (spinjump) {sprite="twirl"}
	else if (double) {sprite="spin" frspd=0.4}
	else if (water) {sprite="swim" if (swim) sprite="paddle"}
	else if (bonk) {sprite="bonk"}
	else {sprite="jump" if (vsp>0) sprite="fall" if (jumpspd=99) sprite="fly"}
} else {
	
	if (crouch) {sprite="crouch" frspd=0}
	else if (braking) {sprite="brake" xsc=-brakedir}
	else if (hsp=0) {
		if (lookup) {sprite="lookup"}
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

#define controls
com_inputstack()

tempbrick=0

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
	rise!=0 ||
	(crouch && !jump) ||
	(poundcancel || pound || spin)
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
		if (!jump && !crouch) {
			push=h
			xsc=h
			braking=0
		}
		if (!pound && !water && fall!=6 && !crouch && h=xsc && kicked!=h && !carry) if (knuxcanclimb(collision(8*h,0))) {
			if (jump) hang=0
			if (vsp>1) crouch=0
			xsc=h
		}
	} else {
		if (!jump) {
			if (sign(hsp)!=h) {
				if (abs(hsp)>2 && !carry) {
					braking=1
					skidding=1
					playsfx("marioskid",1)
					brakedir=h
				}
				hsp+=(0.33-0.175*!water+0.04*(abs(hsp)<1))*wf*h
				if (abs(hsp)<0.5 || carry && !spin) xsc=h
			} else {
				hsp+=(0.06+0.06*(abs(hsp)<1))*wf*h
				xsc=h

				braking=0
			}
		} else {
			if (water) {if (h!=sign(hsp)) hsp+=0.1*h else hsp+=0.0375*h}
			else if (dropkick) hsp+=0.05*wf*h
			else hsp+=0.12*wf*h
			if (!hang && !wallkick && !twist && !spin) xsc=h
		}
	}
}

if (push!=h) push=0

com_di()

if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||vinegrab) { //jump
        if (hsp==0 && crouch && push==0 && size &&!vinegrab) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
        } else {
            jumpsnd=playsfx(name+"jump")
			vinegrab=0
            vsp=-5.2-0.2*super

            if (water) vsp=-sqrt(sqr(vsp)*wf+2)

            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/2)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)
			
			sprite_angle=0
			
            jump=1
            fall=0
            braking=0
            spin=0
            canstopjump=1
            if (mymoving) hsp+=avgmovingh
            crouch=0
            if (spin && !star) seqcount=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps
      if (!insted && !flutter && !pound) {
	      insted=1
		  fall=0
		  
		  vsp=0
		  flutter=1
		}
		jumpbuffer=4*!jumpbufferdo
	}
}
 jumpbufferdo=0
springin=0

if (akey) {

	if (flutter){
	    vsp-=0.3
		flutter+=1
		if vsp<-2 vsp=-2
		if flutter>50 flutter=0
	}
	
    if (jumpbuffer) jumpbuffer-=1
	
	
} else {jumpbuffer=0 flutter=0}

if (!akey) {
    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp*=0.5
    }
    canstopjump=0
}

if (bbut) {
	if (size=2 && count_projectiles()<2 && !crouch) {
		fire_projectile(x+8*xsc,y+2)
		fired=8
	}
   
	{   
		  if (size && !lick && !myhitbox && !swallow) {
            if (hold && !flutter) {
                spit=20
                if (size=2) {
                    playsfx('yoshifireball')
                    o=instance_create(x,y,yoshifire)
                    o.owner=id
                    o.hspeed=hsp+2*xsc
                    o.xsc=xsc                       
                } else {
                    //spit enemies using an yoshispit gravitymanager based on tails bombs
                    (instance_create(x,y,object400)).hspeed=2*xsc
                }
                hold=0
            } else if (up) {
                if (size && !aim && !swallow && !myhitbox) {
                    if (!follower) {throw=16 throwside=esign(right-left,xsc) playsfx('yoshithrow')}
                    else if (!throw) {
                        aim=1
                        hold=follower
                        if (hold=last) last=id
                        follower=0
                        with (hold.follower) {owner.follower=id follow=owner}
                        aimdir=90
                    }
                }  
            } else if (!hold && !spit && !flutter && !throw && !aim) {
                playsfx('damagerue')
                lick=1
                myhitbox=instance_create(x,y+6,damager)
                myhitbox.owner=id
                myhitbox.xsc=esign(right-left,xsc)
            }
        }
	}	
}

if (bkey) {
	if (carry) {
		updatecarry()
		if (!down) {throw=16 instance_create(carryid.x,carryid.y,kickpart) sound("enemykick")}
		with (carryid) event_user(0)
		carryid=noone
		carry=0
	}
}

if (cbut) {
	if (!jump && !carry) {
		jump=0
		fall=1
		spinjump=0
		jumpspd=0
		vsp=-(4.2+min(1,abs(hsp)/8))
	}
}

if (ckey) {
	if (spinjump && vsp>0) spinjump=1
} else {
	if (spinjump=1 && vsp<-2) {
		vsp*=0.6
		spinjump=2
	}
}


//crouching
if (down && !up) {
if (jump) {
		if (fall!=6 && !pound && !carry && !poundlok && !timing_proj && !timing_misfire) {
			pound=1
			greenmissile=0
			misfire=0
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

if (size=0 || crouch || pound) mask_set(12,12)
else if (jump) mask_set(12,26)
else mask_set(12,24)


#define movement
if (piped) exit

if ((loose && !jump) || (crouch && !jump)) {
	if (braking) xsc=brakedir
	braking=0
	frick=0.06
	if (slipnslide) frick=0.03
	hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

maxspd=(3+water+slipnslide+!!spin)*wf
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

if (pound) {
	vsp=min(6,vsp)
} else vsp=min(7+downpiped,vsp)

calcmoving()

if (!dead) {
	player_horstep()
	yground=easyground()
	if (yground!=verybignumber) yground-=14
    if (jump) {
		if (pound>0) {
			hsp=0
			if (pound<14) vsp=0
			else if (pound>=14 && pound<15) vsp=6*wf
			else if (water) {vsp-=0.1*wf if (vsp<1.5) pound=0}
			else vsp+=0.375*wf
		} else if (vsp<-2) vsp+=0.15
		else if (water) vsp=min(1.5,vsp+0.04)
		else if (twist>5) vsp=min(1,vsp+0.1)
		else vsp=min(4,vsp+0.25)
		if (hang>0 && vsp>1 && !spinjump && !water) vsp=1.5
		if (skidding) {soundstop("marioskid") skidding=0}
		braking=0

		braking=max(0,braking-1)
		if (!fall && !spinjump) fall=1
		if (pound=-1) pound=0
		if (sprung && !fall) fall=1
		if (fall=12) {vsp=6*wf hsp=0}
		push=0
		rise=0 risec=0
		coyote=0
		player_vertstep()		
	}
	if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
	else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3
	if (!jump) {
		if (yground!=verybignumber) { y=yground while collision(0,0) {y-=1 } }
		if (finish && ending="retainer" && !jump) coyote=0
		if (!collision(0,4) && (y<yground-2)) {
			coyote+=1
			if (down || !run) {y+=1 coyote=3}
			if (coyote=3) {
				jump=1
				fall=1
				if (crouch) vsp=1.5
				if (spin) {vsp=-1.5 dropkick=1}
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

weight=0.5+0.5*!!size
bartype=1

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1 || flash) is_intangible=1

power_lv=0
if (spin || dropkick) power_lv=1
if (spinjump) power_lv=1
if (!poundcancel && pound) power_lv=3
if (star) power_lv=5
if (super) power_lv+=1

if (piped) {
	updatecarry()
	exit
}

//Special interactions
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=!pound //make sure to set for 0 for the mario bros when pounding
pvp_ignore=pound //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

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
		if (!skidding) {skidding=1 playsfx("marioskid",1)}
	} else if (skidding) {soundstop("marioskid") skidding=0}
	if (abs(hsp)<0.2 && spin) { //stop spinning
		spinc+=1 if (spinc=8) {
			spinc=0
			spin=0    
			hsp=0
			soundstop(name+"spin")
			crouch=down            
		}
	}
}

if (underwater()) {
	if (!water) {
		if (abs(vsp)>2) sound("itemsplash")
		watrlock=10 spinjump=0 fall=1 hang=0
		vsp=min(1,vsp/2)
		jumpspd=1
		dropkick=0
	}
	water=1 wf=0.45 eoll=0 dropkick=0 run=0
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
	if (spin) {
		i=shoot(x,y+10,psmoke) i.depth=depth+2
	}
	if (vsp<-5-2*!sprung) {
		shoot(x,y+8,psmoke,0,-1)
	}
	if (vsp>7) {
		speedwagon+=1
		if (speedwagon>60) shoot(x,y,psmoke,0,1)
	} else speedwagon=0
}

maxe=6
twist=max(0,twist-1)
stomplok=max(0,stomplok-1)
wallkick=max(0,wallkick-1)
watrlock=max(0,watrlock-1)
throw=max(0,throw-1)
hang=max(0,hang-1)
swim=max(0,swim-1)
poundjump=max(0,poundjump-1)
wsk=(wsk+0.1) mod 4
if (spin) spinframe+=1
else spinframe=0
if (spinframe>9) spinframe=9-9*jump

if (!collpos(xsc*16,0) || !jump) hang=0
if (pound) {
	crouch=1
	hang=0
	if (pound<15) pound+=1
	else if (up || (water && vsp>5)) {pound=0 fall=0 insted=1 crouch=0 canstopjump=1}
	else fall=4
} else poundcancel=0
if (fall=6 && sign(hsp)=xsc) fall=1
if (rise!=0) {crouch=1 hsp=0 xsc=rise risec+=1 if (risec=10) {risec=0 rise=0 crouch=down}}
sprung=0
if (slipnslide) {
	crouch=1
	if ((slobal=0 && (hsp=0 || ((left || right) && !down))) || jump) {slipnslide=0 crouch=0}
}
if (energy!=maxe || sign(hsp)=xsc) jumpspd=min(jumpspd,100)

if (abs(hsp)>=3 && !jump) {
	if (mcs>8) {energy+=1 mcs=0}
} else if (energy!=maxe || !jump) if (mcs>30) {energy-=1 mcs=0}

if (dropkick) xsc=esign(hsp,xsc)
if (spinjump) {
	fall=(vsp<0)
	spinball+=1 if (spinball=16) {spinball=0
		if (count_projectiles()<2 && !poundcancel && size=2 && !pound && !carry) {
			ballspin=!ballspin
			i=fire_projectile(x+8*ballspin,y+2)		
			fired=8
			i.hspeed=-4+8*ballspin
		}
	}
}

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
    
    if (super) {
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
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        if (type=hammerbro) seqcount=max(5,seqcount)
        enemydie(coll)                
        exit
    }
    
    if (spinjump) {
        if (fall) {if (y>coll.y && type!=shell) hurtplayer("enemy")}
        else if (type=spinyegg || type=spiny || type=piranha) {
            instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
            sound("enemystomp")
            vsp=-3-akey*1.5
            canstopjump=akey
            pound=0
            coll.phase=id
        } else enemyexplode(coll)
        exit
    }
    
    if (type=piranha) {
        hurtplayer("enemy")
        exit
    }
    
    if (spin) {
        if (type=shell) {if (coll.type!="beetle") {enemydie(coll) exit}}
        else if (type=beetle) {hsp=0 jump=1 jumpspd=0.5 dropkick=1 spin=0 enemystomp(coll) exit}
        else if (type=spinyegg) {hurtplayer("enemy") exit}
        else {enemydie(coll) exit}
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
            if (bkey && !carry && !spin && !dropkick) {
                coll.carry=id coll.owner=id coll.alarm[1]=600 coll.alarm[2]=-1 carryid=coll
                carry=1
            } else { 
                if (coll.stop && !coll.kicked) doscore_p(8000)
                else {seqcount=max(seqcount,2+scorelok1) doscore_p()}
                if (jump) {
                    if (vsp>0) {
                        vsp=-3-akey*1.5
                        canstopjump=akey
                        if (fall=12) fall=5
                    }
                }
                kicksound(0)
                instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
                with (coll) {spd=max(3,abs(other.hsp)+1) hspeed=spd*esign(x-other.x,other.xsc) owner=other.id kicked=1 stop=0 phase=owner}
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
                with (coll) {hspeed=0 owner=noone phase=other.id stop=0 kicked=0 time=15}
                vsp=-3-akey*1.5 canstopjump=akey sound("enemystomp") doscore_p() if (fall=12) fall=5 exit
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
                else enemyexplode(coll) exit
            }
        } else {
            if (!calcfall) {enemyexplode(coll) exit}
            if (vsp<0) {hurtplayer("enemy") exit}
        }
        
        if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
        if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
        if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
        if (type=hammerbro) seqcount=max(5,seqcount)
        if (fall=12) fall=5                        
        enemystomp(coll) exit      
    } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 enemystomp(coll) exit}
    
    hurtplayer("enemy")   
}    

#define hurt




pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}

energy=0
braking=0
sprung=0
diggity=0
grow=0
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


if ((!size || ohgoditslava || name="kid") && !shielded) {
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
    playsfx(name+"damage")

    starhit=0

        fired=0
        if (shielded) {shielded=0} else {size-=1}
        flash=1
        jump=1
        fall=6
        hsp=xsc*-2*wf vsp=-3*wf

}

//Block hitting
#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || owner.size=0 && insted!=1 && !owner.tempkill && cracked=0) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else { 
    if (!insted) {owner.vsp=1.5}
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
    i=instance_create(x+4,y+12,part) i.hspeed=-1 i.vspeed=-1+2*go
    i=instance_create(x+12,y+12,part) i.hspeed=1 i.vspeed=-1+2*go 
    i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
    i=instance_create(x+12,y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    
    with (turing) event_user(4)
    instance_destroy()
  }
 }
} else if typeblockhit=1{
	with (blockcoll){
	
if (!insted) {
	owner.vsp=1.5             
}
if (!wait || owner.tempbrick) {
    if (object_index!=turing) sound("itemblockbump")
    wait=13
    if (!hit) {
        picked=owner.is_coinexplosive || other.is_coinexplosive
        x=xstart
        if (object_index=invisibox) {
            with (player) if (instance_place(x,y,other.id)) y+=other.bbox_bottom-bbox_top
        }
        untouched=0
        if (respawning) alarm[2]=400
        upwardthrust()
        if (object_index=goalblock) {
            event_user(4)
        } else if (object_index=turing) {
            if (mode=0) turingblock()
        } else if (content!="bros") {
            if (object_index=talkbox) {
                if (string_pos("sfx",text)) {
                    sound(string_delete(text,1,4))
                } else {
                    if (!open) {
                        with (talkbox) open=0
                        open=1
                        cur=0
                        sound("itemmessage")
                    } else {
                        if (trans) cur+=1
                        if (cur+1>=pages) open=0
                        else {sf=0 trans=1}
                    }
                }
            } else if (content="coins") {
                if (picked) {
                    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
                    if (go=1) if (instance_position(x+8,y+24,collider)) {
                        go=-1
                        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
                    }
                    i=cc
                    if (done || picked=2) i=1
                    cc-=i
                    picked=0
                    repeat (i) with (instance_create(x+8,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    global.scor[owner.p2]+=100           
                    with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    global.coins[owner.p2]+=1
                    owner.coint+=1
                    cc-=1  
                }
                if (done || cc=0) {
                    owner.blockc+=1
                    sprite="box"
                    hit=1       
                }
                if (alarm[1]=-1) alarm[1]=256
                tpos=0
            } else {
                owner.blockc+=1
                hit=1
                sprite="box"
                sound("itemappear")
                mush=!owner.size
                alarm[0]=18-picked*8
            } 
        }
        tpos=1
        spendblock()
    }
}


	}
}

#define hitwall
if greenmissile{com_piping()}

if (object_is_ancestor(coll.object_index,hittable)) {
    if (dropkick)|| (spin && abs(hsp)>0.5){
        s=vsp
        global.coll=id
        with (coll) {
			go=1
            event_user(0)
        }
        if (coll.object_index=brick && coll.hit || !instance_exists(coll)) coll=noone

        if ((dropkick || spin) && instance_exists(coll)) {instance_create(x+8*s,y+6,kickpart) x-=hsp dropkick=-1 hsp=-2*argument[0] vsp=-2*spin jump=(jump || spin) spin=0 crouch=1 coll=noone}
    }
}



if (hurt) {hurt=0 fall=6 flash=1 fk=0}

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}

hsp=0
hyperspeed=0         




#define landing
hang=0   
kicked=0
braking=0
double=0
insted=0
if spin{spin=0}

spinjump=0

if (downpiped) {
    shoot(x-8,y+4,psmoke,-2,-1)
	shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}
           
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
 
#define death
if (event="create"){
alarmmp=60
alarm0=30
alarm1=300
sprite="dead"
frspd=1
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
alarmmp=max(0,alarmmp-1)
if alphadecay &&!alarmmp alpha-=0.1
if alarm1=0 instance_destroy()
} else if (event="draw"){

}

#define enterpipe
if (type="door") {
	set_sprite("stand")
}
if (type="side") {
	if (carry) {crouch=1 set_sprite("crouch")}
}
if (type="down") {
	if (pound) {set_sprite("pound") frame=frame_number(sprite) vspeed=5 alarm[6]=6 fastpipe=1}
}

if (skidding) {soundstop("marioskid") skidding=0}
braking=0
crouch=0
push=0
pound=0

#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}   
#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,brake,crawl,jump,bonk,fall,pound,poundland,swim,paddle,standcarry,lookupcarry,crouchcarry,walkcarry,jumpcarry,bonkcarry,fallcarry,throw,bash,bashjump,bashhit,sliding,rolling,fire,climbing,flagslide,piping,pipingup

#define soundlist
bash,bashkill,hit,carry,fire,flipover,jet,pound,roll,throw

#define movelist
Wario
#
[b]: Shoulder Bash
[down]: Groundpound (air) / roll (slope)
Walk into flipped enemies to carry them
<fire>
Dragon Wario [flwr]
#
[b]: Mach Bash (Hold)
[down]+[b]: Fire Breath
[down]: Groundpound (air) / Roll (slope)
Walk into flipped enemies to carry them
<feather>
Eagle Wario [fthr]
#
[b]: Shoulder Bash / Glide Bash (air)
[down]: Groundpound (air) / Roll (slope)
Walk into flipped enemies to carry them


#define rosterorder
2


#define effectsbehind
with (carryid) event_user(1)

#define effectsfront
if (bash) {
    if (bashefx=3) bashefx=0
    bashefx=min(3,bashefx+0.4)
    draw_sprite_part_ext(sheets[size],0,97+(48*floor(bashefx)),46,47,47,round(x-23.5*xsc),round(y-23.5+dy),xsc,1,$ffffff,1)
}
else bashefx=0

#define grabbedflagpole
grabbedflagpole=1
hsp=0
vsp=0

#define start
mask_set(12,12)
if global.mplay>1 coop_carryable=1

#define stop
if (skidding) {soundstop(name+"skid") skidding=0}
star=0
grow=0
hurt=0
push=0
pound=0


#define itemget
if (type="jumprefresh") {	spinjump=0
	mc=0
}
if (type="mushroom") {
	if ((!piped && !hurt )) {
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
	if ((!piped && !hurt )) {
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
	if ((!piped && !hurt )) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("3")
		if (skidding) {soundstop(name+"skid") skidding=0}
			if (!super && size!=3) grow=1
			tired=0
			oldsize=size
			size=3
		}
		itemget=1
	}   	
if (type="star") {
	if ((!piped && !hurt )) {
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
    if ((!piped && !hurt )) {
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
    if ((!piped && !hurt )) {
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

#define grabflagpole
grabflagpole=1
hsp=0
vsp=0



#define endofstage
right=1
akey=(push || (jump && akey) || !collision(16,8))

#define damager
y=-1000
image_xscale=6

breakflag=owner.size
hittype="enemy"
if (owner.bash) {x=owner.x+owner.hsp+4*owner.xsc y=owner.y+2+6*!owner.size image_yscale=11-5.5*!owner.size hittype="pvp"}
coll=instance_place(x,y,hittable)
if (coll && owner.size) {
    if (coll.object_index=brick || coll.object_index=crackedbrick) {
        brickc+=1
        hitblock(coll,owner,!!owner.size,esign(coll.y-owner.y),!!owner.size)
        with (owner) {
            if (bash && !size) {
                x-=hsp 
                hsp=(-0.4-jump)*xsc
                vsp=-2 
                jump=1 
                bash=0
                stunlok=20
                stunsprite="bashhit"
                exit
            } else if pound jump=0
        }
    }
}
coll=instance_place(x,y,player)
if (coll!=owner && owner.coop_toggle) {
    {
    with (owner) {
            if (bash) {
				other.coll.hsp=hsp
				other.coll.hyperspeed=hsp
				if !size{
					x-=hsp 
					hsp=(-0.4-jump)*xsc
					vsp=-2 
					jump=1 
					bash=0
					stunlok=20
					stunsprite="bashhit"
					
					exit
				}
            }
        }
    }
}

coll=instance_place(x,y,enemy)
if (coll) {
    with (owner) {
        coll=other.coll
        if (coll.object_index=spiny || coll.object_index=spinyegg) {hurtplayer("enemy") exit}
        
        global.coll=id
        instance_create(mean(other.x,coll.x),mean(other.y,coll.y),kickpart)
        
        if (object_get_parent(coll.object_index)=koopa || coll.object_index=koopa || coll.object_index=beetle) {
            enemyc+=1
            doscore_p()
            with (instance_create(coll.x,coll.y,shell)) {
                if (other.coll.object_index=redkoopa || other.coll.object_index=redhover) type="red"
                else if (other.coll.object_index=beetle) type="beetle"
                spd=5
                hspeed=spd*esign(x-other.x,other.xsc)
                owner=other.id
                kicked=1
                stop=0
                phase=owner
                if (powner) powner.items+=1
                powner=other.powner
            }
            with (coll) instance_destroy()
            kicksound(0)
        } else {
            //for loops are too much work
            //this is for launching of dead bodies
            deadnumber[0,0]=genericdead
            deadnumber[1,0]=goombadead
            deadnumber[2,0]=koopadead
            deadnumber[3,0]=fishdead
            
            deadnumber[0,1]=instance_number(genericdead)
            deadnumber[1,1]=instance_number(goombadead)
            deadnumber[2,1]=instance_number(koopadead)
            deadnumber[3,1]=instance_number(fishdead)
            
            enemydie(coll)
            
            deadnumber[0,2]=instance_number(genericdead)
            deadnumber[1,2]=instance_number(goombadead)
            deadnumber[2,2]=instance_number(koopadead)
            deadnumber[3,2]=instance_number(fishdead)
            
            for (i=0;i<4;i+=1) { 
                if (deadnumber[i,1]!=deadnumber[i,2]) {
                    with (instance_find(deadnumber[i,0],deadnumber[i,2]-1)) {
                        vspeed=-3
                        hspeed=5*esign(x-(global.coll).x,1)
                    }
                }
            }
        }
        
        if (bash) {
            playsfx(name+"bashkill")
            x-=hsp 
            hsp=(-0.4-jump)*xsc
            vsp=-2 
            jump=1 
            bash=0
            stunlok=20
            stunsprite="bashhit"
        }
    }
}



coll=instance_place(x,y,bowserboss)
if (coll) {
    y=-1000
}



#define projectile
switch type{
case "fartmonster":
	if (event="create") {
		image_xscale=8
		image_yscale=4

		frame_sub=0
		frame=0
		brickc=0
		seqcount=2
		getregion(x) 
		timer0=3
		timer1=90
		
		hspeed=xsc*3+owner.hsp*(xsc=sign(owner.hsp))
		speed=median(2,speed,5)
	}
	if (event="step") {
	if timer1>90 timer1=90
		timer0-=1 if (timer0=0) visible=1
		timer1-=1 if (timer1=0) instance_destroy()
		calcmoving()

		if (!inview()) instance_destroy()
		xsc=sign(hspeed)
		hspeed*=0.95
		ignoreoncount=1
		if timer1>30{

			if (go=1) {
			coll=instance_place(x,y,coin)
			if (coll) {
				fresh=1
				with (coll) {with (instance_create(x,y,coinup)) {red=(other.object_index=redcoin) p2=other.owner.p2 vspeed=-1.5+2*ref.go} noglitter=1 if !red give_item(other.owner,"coin") else gibcoinred(other.owner) instance_destroy()}
				}        
			}

			coll=instance_place(x,y,item)
			if (coll) if (coll.c && (coll.object_index=mushroom || coll.object_index=lifemush || coll.object_index=mushpoison || coll.object_index=starman)) if (!coll.getimer) {coll.vspeed=2.5*go coll.c=1 coll.drop=0 coll.hspeed=esign(coll.x-(x+8),1)}
			coll=instance_place(x,y+yoff,enemy)

			if (coll) {
				if (coll.object_index=koopa || coll.object_index=redkoopa || coll.object_index=beetle || coll.object_index=spiny) with (coll) {
					sound("enemykick")
					doscore_e(800,id)
					hspeed=0
					heorng=instance_create(x,y,shell)
					owner=other.owner
					with (heorng) { owner=other.owner vspeed=-2.5 stop=1 flip=1}
					if (object_index=redkoopa) heorng.type="red"
					if (object_index=blukoopa) {heorng.type="blu" enemy2=1}
					if (object_index=yelkoopa) {heorng.type="yel" enemy2=1}
					if (object_index=beetle) heorng.type="beetle"
					if (object_index=spiny) heorng.type="spiny"
					heorng.ysc=-1
					with other.owner soundinst=playsfx(name+"flipover",0)
					instance_destroy()
				} else if coll.object_index!=piranha && coll.object_index!=firepiranha {coll.vspeed=-2} //if object/enemy is NOT piranha AND NOT fire piranha, make enemy go up 
				if (coll.object_index=shell) {
					if (!coll.kicked && !coll.stop) {
						doscore_e(800,coll)
						coll.owner=owner
						coll.vspeed=-2.5
						coll.hspeed=esign(coll.x-(x+8),1)
						coll.stop=1 
					}
				}
			}

	
			coll=instance_place(x,y,bowserboss)
			if (coll) {
				if (!coll.flash) {
					coll.hp-=1
					coll.flash=64
					coll.owner=owner
					sound("enemybowserhurt")
					instance_create(x,y,kickpart)
					timer1=30
				}
			}


		}
		frame+=0.1
		if timer1<30{
		frame-=0.1
		frame+=0.3/4
		}
	}
	if (event="draw") 
		if frame<8
		draw_sprite_part_ext(sheet,0,97+33*floor(frame),94,32,16,round(x-16*xsc),round(y-8),xsc,1,$ffffff,1)
break
default:
	if (event="create") {
		image_xscale=8
		image_yscale=4

		frame_sub=0
		frame=0
		brickc=0
		seqcount=2
		getregion(x) 
		timer0=3
		timer1=90
		
		hspeed=xsc*3+owner.hsp*(xsc=sign(owner.hsp))
		speed=median(2,speed,5)
		playsfx("sonicboom")	
	}
	if (event="step") {
		timer0-=1 if (timer0=0) visible=1
		timer1-=1 if (timer1=0) instance_destroy()
		calcmoving()
		hspeed*=0.95
		frame_sub=!frame_sub
		if frame_sub frame+=1
		if (frame>=3) frame=0

		if (!inview()) instance_destroy()
		xsc=sign(hspeed)
		coll=instance_place(x,y,collider)
		if (coll) {
			if (object_is_ancestor(coll.object_index,hittable)) {
				if (coll.object_index=brick) brickc+=1 else brickc=4
				hitblock(coll,owner,1,-1,0)
			} else brickc=4
			if (object_is_ancestor(coll.object_index,hittable)) instance_create(x,y,kickpart)     
			if (brickc=4) {sound("itemblockbump") myCount+=1}
		}

		coll=instance_place(x,y,enemy)
		if (coll) {
			if (coll.object_index!=beetle) {
				yes=1
				if (coll.object_index=shell) if (coll.type="beetle") yes=0
				if (yes) {
					global.coll=owner.id  
					instance_create(x,y,kickpart)  
					enemydie(coll,2)
				}
			}
			myCount+=1
		}

		coll=instance_place(x,y,bowserboss)
		if (coll) {
			if (!coll.flash) {
				coll.hp-=1
				coll.flash=64
				coll.owner=owner
				sound("enemybowserhurt")
				instance_create(x,y,kickpart)
				myCount+=1
			}
		}


		if myCount>=4 instance_destroy()
		frame=floor(timer1/15)mod 4
	}
	if (event="draw") 
		draw_sprite_part_ext(sheet,0,97+33*frame,111,32,16,round(x-16*xsc),round(y-8),xsc,1,$ffffff,1)
break
}



#define sprmanager
frspd=1
if (grabflagpole) {sprite="flagslide"}
else if (fired) {sprite="fire"}
else if (hurt) {sprite="knock"}
else if (spin) {sprite="spin"}
else if (throw) {sprite="throw" frspd=0.2}
else if (pounded) {sprite="poundland"}
else if (pound) {sprite="pound"}
else if (roll) {sprite="rolling" frspd=0.4}
else if (slipnslide) {sprite="sliding" frspd=0.2}
else if (water) {sprite="swim" if (swim) sprite="paddle"}
else if (crouch) {if (h!=0 && !jump) {sprite="crawl" frspd=0.25} else sprite="crouch"}
else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
    else if (fall=6) {sprite="knock"}
	else if (stunlok) {sprite=stunsprite frspd=0.4}
	else if (spin) {sprite="spin" frspd=0.4}
	else if (bash) {sprite="bashjump" frspd=0.4}
	else if (bonk) {sprite="bonk"}
	else {sprite="jump" if (vsp>0) sprite="fall"}
} else {
	if (bash) {sprite="bash" frspd=0.4}
	else if (braking) {sprite="brake" xsc=-brakedir}
	else if (hsp=0) {
		if (lookup) {sprite="lookup"}
		else if (waittime>maxwait &&!carry) {sprite="wait"}
		else if (posed) {sprite="pose"}
		else {sprite="stand"}
	} else {
		{
			sprite="walk"
			frspd=median(0.5,1,0.3+abs(hsp/4))
		}
	}
}
if (carry) sprite=sprite+"carry"

#define controls
com_inputstack()

tempbrick=0
carryoffsetx=8
carryoffsety=-(10+8*!!size-(1+9*!!size)*crouch)

if (rise!=0 || hurt || piped || pound) {
    di=0
    h=0
    exit
}

if (up || water) com_piping()
oup=up

lookup=0
if (up && hsp=0 && !jump && !carry && !throw) lookup=1

if (
rise!=0 ||
spin ||
slipnslide ||
buttslide ||
stunlok
) h=0

//esign madness
if (bash) h=esign(h,xsc)
if (bashdir!=h && bash) bash=0
if ((h!=0 || bash) && !water) {
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
        if (!pound && !water && fall!=6 && !crouch && h=xsc && !carry) if (knuxcanclimb(collision(8*h,0))) {
            xsc=h
        }
    } else if (!water) {
        if (!jump) {
            if (sign(hsp)!=h && hsp!=0) {
                hsp=0
                xsc=esign(h,xsc)
            } else {
                hsp+=((0.06+0.12*bash)+(0.06+0.12*bash)*(abs(hsp)<1))*wf*h
                xsc=h
                braking=0
            }
        } else {
            hsp+=(0.12+0.12*bash)*wf*h
            xsc=h
        }
    }
}

if (water) {
	vsp+=0.25 //apparently gravity is disabled in swimming so I had to add it myself 
	hsp*=0.9
	hsp+=right-left*0.75
	if abs(hsp)>2+(2*!!swim) hsp=(2+(2*!!swim))*sign(hsp)
	if vsp>0.75 && !swim vsp=0.75 //this looks contradictory to the below code and make wario not swim downward, however, he still can, as the code that adds velocity to him is just below this limiter, it makes his real max vsp be 1.5 (technically not max but oh well)
	vsp+=down-up*0.75
	if abs(vsp)>2+(2*!!swim) vsp=(2+(2*!!swim))*sign(vsp)	
	if vsp<0 || hsp!=0 jump=1
	if swim && !down && !up vsp=0.01
	if swim && !right && !left hsp=0.01
	
    xsc=esign(h,xsc)
}

if (push!=h) push=0

com_di()

//////////a button code
if ((abut || jumpbufferdo) && !springin) {
    if (water) {
        if (!pound) {
            swim=12
            //hsp=2*sign(hsp) This code was just bound to cause problems
            //vsp=2*sign(vsp) It was a smart solution for the original swimming but this destroys the new version
			hsp=2*esign(right-left,xsc)
			vsp=2*sign(down-up)
        }
    }
    else if (!jump ||fall=69||grabflagpole ||tailsgrab) {
        jumpsnd=playsfx(name+"jump")
        vsp=-(4.7-crouch+min(1,abs(hsp)/8))
        jump=1
        fall=0
		onvine=0
		grabflagpole=0
		if tailsgrab{
			tailsgrab=0
			graber.tailsgrabbed=0
		}
        latchedtoflagpole=0
        braking=0
        canstopjump=1
        if (slipnslide && !roll) {slipnslide=0 roll=0 crouch=0}
        if (mymoving) hsp+=avgmovingh
        fall=1
        jumpspd=min(1,0.5+abs(hsp)/5)
    }
}
jumpbufferdo=0
springin=0

if (akey) {
    if (jumpbuffer) jumpbuffer-=1
} else {
    jumpbuffer=0
    if (canstopjump=1 && jump && vsp<-2 && !sprung && !water) {
        vsp/=2
    }
    canstopjump=0
}

if (bbut) {
    if (carry) {
        updatecarry()
        if (!down) {throw=16 instance_create(carryid.x,carryid.y,kickpart) sound("enemykick")
			if tailsgrabbed {
				with grabvictim{
						jump=1
					if (other.up) {vsp=-6 hsp=abs(other.hsp*0.75)}
					else if (other.down) {vsp=other.vsp x+=2*other.xsc hsp=abs(other.hsp)+0.1 hsp=spd*other.xsc}
					else hsp=(abs(other.hsp)+5)*other.xsc
					
					if abs(hsp)>maxspd
					hyperspeed=(abs(hsp)-maxspd)*sign(other.hsp)
				}
			}
		}
        with (carryid) event_user(0)
        carryid=noone
        carry=0
    }
    else if ((!jump || size=3) && !water && !crouch && !bash) { //I had to add !water because Eth forced swimming wario to always be in the jump state, which caused the annoying sfx
        
        bashdir=xsc
        bashtimer=60-30*!size
        bash=1
		flytimer=0
		flybash=0
		if jump && size=3 {flybash=1 vsp=0.01 playsfx(name+"jet",0) }
		soundinst=playsfx(name+"bash",1)
    } else if crouch &&!fired && !count_projectiles() && size=2{
		fired=30
		with fire_projectile(x,y) type="fire"
		my_flamesfx=playsfx(name+"fire",1)
	
	}
}

if (bkey) {
	if size=2 if bashtimer<10 bashtimer=10
	if bash && flybash && jump { flytimer+=1 if flytimer<60 vsp=0.01   }
	if !bash && fired>1 && fired<10 {
		fired=30
		with fire_projectile(x,y) type="fire"
	}

}else {flytimer=60 if fired>1 stopsfx(my_flamesfx)}

if (cbut) {
	if coop_carryable && !double && !spin && place_meeting(x,y,player) && !water && (coop_toggle) && !carry{//HAlf the fun is fucking with other people on purpose, so I'm having Mario choose if he wants to fuck with people or not
			with instance_place(x,y,player) {
				if !piped && !tailsgrab && !tailsgrabbed //If I didn't add thsi check shit would very likely break.
				{
					other.coll=id
					with other{
						coll.jump=1
						coll.tailsgrab=1
						coll.graber=id
						coll.jump=1
						carry=coll.id
						tailsgrabbed=1
						tailsgrab_cooldown=30
						grabvictim=coll.id
					}
				}
			}
        }

}

if (ckey) {
}

//crouching
if (down && !up && !water) {
    if (jump) {
        if (fall!=6 && !pound && !poundlok && !pounded && !stunlok && fall!=69 && !grabbedflagpole) {
            pound=15
            if (water) seqcount=1
            slipnslide=0
            bash=0
        }
    } else if (!braking && !buttslide && !slipnslide) {
        if (slobal!=0) {
            slipnslide=1
            bash=0
            grip=30
            slipxsc=sign(slobal)
        } else {
            crouch=1
			if !fired && bkey
            hsp=1.5*h
            if (bash) {hsp=3.5*xsc buttslide=1 bash=0}
        }
    com_piping()
    }
    poundlok=1
} else {
    if (!jump && (!collision(0,-12) || !size)) crouch=0
    poundlok=0
}

if (size=0 || crouch || pound || spin || dropkick || slipnslide || buttslide) mask_set(12,12)
else if (jump) mask_set(12,26)
else mask_set(12,24)


#define movement
if (piped) exit

if ((loose && !jump) || (crouch && !jump)) {
if (braking) xsc=brakedir
braking=0
frick=0.06
if (slipnslide) frick=0.03
if (buttslide) frick=0.08
hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

maxspd=(2+water+swim+slipnslide+roll+1.5*(bash || buttslide))*wf
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

if (water) vsp-=0.06*sign(vsp)
vsp=min(7+downpiped,vsp)

calcmoving()

if (!dead && !grabflagpole) {
	if fall!=69
		player_horstep()
	player_nslopforce()
	//if (yground!=verybignumber) yground-=14
	if (jump) {
		if fall!=69{
			if (pound) {vsp=6*wf hsp=0}
			else if (vsp<-2) vsp+=0.15
			else if (bash && flybash && jump && bkey) {vsp+=0.1}
			else if (!water) vsp=min(4,vsp+0.25)
			braking=0

			braking=max(0,braking-1)
			if (!fall && !spinjump) fall=1
			if (pound=-1) pound=0
			if (sprung && !fall) fall=1
			if (fall=12) {vsp=6*wf hsp=0}
		}
		vine_climbing()
		push=0
		rise=0 risec=0
		coyote=0
		player_vertstep()
	}
	if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
	else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3
	if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		if (finish && ending="retainer" && !jump) coyote=0
		if (!collision(0,4) /*&& (y<yground-2)*/) {
			coyote+=1
			if (down) {y+=1 coyote=3}
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

#define cpu
	if !auto &&  (global.joynum>(global.input[p2]-2)) input_get(global.input[p2])
	if (left||right||down||up||akey||bkey||ckey||skey||xkey||ykey||zkey)
		&& !(left&&right&&down&&up&&akey&&bkey&&ckey&&skey&&xkey&&ykey&&zkey){
		player_controlled=1
	}
	if !player_controlled { 
		akey=0 
		bkey=0 
		ckey=0 
		skey=0
		left=0 
		xkey=0 
		ykey=0 
		zkey=0
		backtocputimer=0
	} else { backtocputimer+=1 if backtocputimer>480 {player_controlled=0 backtocputimer=0} }
	
	if player_controlled exit
	
	if !instance_exists(my_leader) exit
	
#define actions
com_warping()
com_actions()


if coop_carryable{
	if tailsgrabbed && instance_exists(grabvictim){
		if !carry tailsgrabbed=0
		if carry!=grabvictim tailsgrabbed=0
	} //Rechecking just in case
	if tailsgrabbed && instance_exists(grabvictim){
		{grabvictim.x=x+10*xsc-hsp
		grabvictim.y=y-30+(10*!size)}
		
		with grabvictim if collision(0,0) with other{
		grabvictim.x=x-hsp
		grabvictim.y=y
		}
		grabvictim.fall=0
		grabvictim.jump=1
		grabvictim.hsp=hsp
		grabvictim.vsp=vsp
		grabvictim.xsc=xsc
		
	}
	if !tailsgrabbed {
		if instance_exists(grabvictim){ grabvictim=noone carry=0 carrid=noone}
		if tailsgrab_cooldown{tailsgrab_cooldown-=1}
	}
	
}

weight=0.5+0.5*!!size
bartype=1

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1) is_intangible=1

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
pvp_spin=spin||sign(bash) //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=!pound //make sure to set for 0 for the mario bros when pounding
pvp_ignore=pound //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away
break_crackedground=(roll||bash)+(sign(pound)*2)
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
	if (!skidding) {skidding=1 playsfx(name+"skid",1)}
	} else if (skidding) {soundstop(name+"skid") skidding=0}
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
		if (abs(vsp)>2) water_splash(1)
		fall=1
		vsp=min(1,vsp/2)
		jumpspd=1
	}
	water=1 wf=0.45 eoll=0
	if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
	} else {
	if (water) {
		water=0
		if (vsp<-1 && !abs(h) && up-down) vsp=min(vsp/2,-4)
		else {vsp=2 y+=1 water=underwater() y-=1}
		if (abs(vsp)>2) water_splash(0)
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

//maxe=6
swim=max(0,swim-1)
throw=max(0,throw-1)
if (pounded) pounded-=1
if (stunlok) stunlok-=1
if (bashtimer) {if (!jump) bashtimer-=1}
else bash=0
boost=bash
if (!bash || jump) soundstop(name+"bash")

wsk=(wsk+0.1) mod 4
if (spin) spinframe+=1
else sspinframe=0
if (spinframe>9) spinframe=9-9*jump

if (!jump && run && !bkey) run=0
if (pound) {
crouch=1
fall=4
}
if (fall=6 && sign(hsp)=xsc) fall=1
if (rise!=0) {crouch=1 hsp=0 xsc=rise risec+=1 if (risec=10) {risec=0 rise=0 crouch=down}}
sprung=0

if (slipnslide) {
    crouch=1
    xsc=slipxsc
    if (grip) grip-=1
    if (abs(hsp)>1.2 && sign(hsp)=slipxsc && !grip && !roll) {roll=1 soundinst=playsfx(name+"roll",1)}
    else if ((abs(hsp)<0.6 && !grip) || (jump && sign(hsp)=-slipxsc) || (instance_place(x,y,slopy) && esign(slobal,slipxsc)!=slipxsc && !jump)) {roll=0 slipnslide=0}
    hsp+=0.1*slipxsc
}
else {roll=0 soundstop(name+"roll")}
jesus=roll
if (buttslide) {
    crouch=1
    if (abs(hsp)<0.5 || jump) buttslide=0
}

jumpspd=min(jumpspd,100)

com_endactions()


#define enemycoll
if (hurt || piped || fall=6) exit

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
            coll.phase=id
        } else enemyexplode(coll)
        exit
    }
    
    if (type=piranha || coll.damage_player_on_contact)  {
        hurtplayer("enemy")
        exit
    }
    
    if (spin) {
        if (type=shell) {if (coll.type!="beetle") {enemydie(coll) exit}}
        else if (type=beetle) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}
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
            if (!carry && !spin && !bash) {
                coll.carry=id coll.owner=id coll.alarm[1]=600 coll.alarm[2]=-1 carryid=coll
                playsfx(name+"carry")
                carry=1
            } else { 
                if (coll.stop && !coll.kicked) doscore_p(8000)
                else {seqcount=max(seqcount,2+scorelok1) doscore_p()}
                if (jump) {
                    if (vsp>0) {
                        vsp=-3-akey*1.5
                        canstopjump=akey
                        if (fall=12) fall=5
                        jump=0
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
bash=0
roll=0
slipnslide=0
oldsize=size
jumpbuffer=0
hyperspeed=0
hp=0
star=0
if (super) stopsuper()   


if ((!size || ohgoditslava || name="kid") && !shielded && global.rings[p2]==0) {
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
	hurt=1
    hyperspeed=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")

    starhit=0

        fired=0
        if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size=3 size-=1 size-=1}
        flash=1
        jump=1
        canstopjump=0
        fall=6
        hsp=xsc*-2*wf vsp=-3*wf

}

//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || ((owner.size=0 && !biggie) || (owner.size && biggie)) && !owner.slipnslide && insted!=1 && !owner.tempkill && cracked=0) {
    if (!goinup) {
        if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1
    }
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
} else if (stonebump || (owner.size=0 && biggie && !owner.slipnslide && insted!=1 && !owner.tempkill)) {
    if (!goinup) {
        if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1
    }
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
    if biggie{
		i=instance_create(x+4,y+12+(16*biggie),bigpart) i.hspeed=-1 i.vspeed=-1+2*go
		i=instance_create(x+12+(16*biggie),y+12,bigpart) i.hspeed=1 i.vspeed=-1+2*go 
		i=instance_create(x+4,y+4,bigpart) i.hspeed=-1 i.vspeed=-3+2*go
		i=instance_create(x+12+(16*biggie),y+4,bigpart) i.hspeed=1 i.vspeed=-3+2*go
	}else{
		i=instance_create(x+4,y+12+(16*biggie),part) i.hspeed=-1 i.vspeed=-1+2*go
		i=instance_create(x+12+(16*biggie),y+12,part) i.hspeed=1 i.vspeed=-1+2*go 
		i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
		i=instance_create(x+12+(16*biggie),y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    }
    
    with (turing) event_user(4)
    instance_destroy()
  }
 }
} else if typeblockhit=1{
	hititembox()
}

#define hitwall
if (object_is_ancestor(coll.object_index,hittable)) {
    if (bash && coll.object_index=monitor) {with (coll) event_user(6) coll=noone}
    if (roll || slipnslide || (bash && (!size || coll.object_index!=brick || coll.object_index!=crackedbrick)) || (spin && abs(hsp)>0.5)){
        s=vsp
        global.coll=id
        with (coll) {
            if (other.roll) insted=1
            if (other.bash) picked=1
            go=1
            event_user(0)
            insted=0
            picked=0
        }
        if (coll.object_index=brick && coll.hit || !instance_exists(coll)) coll=noone
        if ((roll || slipnslide) && coll=noone) exit

        if (spin && instance_exists(coll)) {instance_create(x+8,y+6*s,kickpart) x-=hsp hsp=-2*argument[0] vsp=-2*spin jump=(jump || spin) spin=0 crouch=1 coll=noone}
    }
}
else if (coll.object_index=moving && coll.owner.object_index=cork) if (coll.owner.hsp=0 && bash) coll.owner.hsp=3*xsc

if (hurt) {hurt=0 fall=6 flash=1 fk=0}

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}

if (water) {com_piping()}

hsp=0
if (roll || bash && (coll.object_index!=phaser || coll.dir=0)) {instance_create(x+8,y,kickpart) playsfx(name+"hit") x-=hsp hsp=(-0.4-jump)*xsc vsp=-2 jump=1 crouch=0 stunlok=20 if (bash) stunsprite="bashhit" else stunsprite="knock" bash=0 roll=0}
slipnslide=0 
hyperspeed=0         




#define landing
kicked=0
braking=0
if !(size=2 &&bkey) bash=0
stunlok=0
if spin{spin=0}

if (downpiped) {
    shoot(x-8,y+4,psmoke,-2,-1)
    shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}
           
if !water playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1

hang=0   
kicked=0

if (pound) {
    com_piping()
    pound=0
    pounded=15
    crouch=0
    jump=1
    vsp=-2
    playsfx(name+"pound") 
    screenshake(x,4) 
    shoot(x-8,y+4,psmoke,-2,-1) 
    shoot(x+8,y+4,psmoke,2,-1)	
	
	with fire_projectile(x,y+8) type="fartmonster" 
	with fire_projectile(x,y+8) {type="fartmonster" hspeed*=-1} 
	
}
 

#define death
if (event="create"){
alarmmp=60
alarm0=30
alarm1=300
sprite="dead"
frspd=1
frame=0
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
    if (water) {set_sprite("swim")}
}
if (type="down") {
if (pound) {set_sprite("pound") frame=frame_number(sprite) vspeed=5 alarm[6]=6 fastpipe=1}
}

if (skidding) {soundstop("marioskid") skidding=0}
soundstop(name+"bash")
bash=0
braking=0
crouch=0
push=0
pound=0
pounded=0

#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}   

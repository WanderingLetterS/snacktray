#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,brake,jump,bonk,fall,fly,wall,pound,slide,standcarry,crouchcarry,walkcarry,jumpcarry,bonkcarry,fallcarry,throw,spin,pound,swim,paddle,twirl,fire,kick,dive,capeflight,climbing,flagslide,grinding,piping,pipingup,sidepiping,doorenter,doorexit


#define soundlist
skid,swim,pound,stomp,smalljump,flip,spin,slide,kick,fireball,wallkick,smallwallkick,dive,spinjump,spinbounce


#define movelist
Mario
#
[a]: Double Jump (air)
[down]: Groundpound (air) / Slidekick (ground)
[c]: Dive (air) / Spinjump (ground) 
Jump out of a Groundpound to reach higher places
<fire>
Mario [flwr]
#
[a]: Double Jump (air)
[down]: Groundpound (air) / Slidekick (ground)
[b]: Fireball
[c]: Dive (air) / Spinjump (ground) 
Jump out of a Groundpound to reach higher places
<feather>
Mario [fthr]
#
[a]: Double Jump (air)
[a]>[a]>[a]: Wing Cap
[down]: Groundpound (air) / Slidekick (ground)
[c]: Dive (air) / Spinjump (ground) 
[down][a]: Slidekick (ground)
[fthr] Hold A while mid-air to descend slowly
Jump out of a Groundpound to reach higher places

#define rosterorder
2

#define hud
if !dontdrawhud {
	spr=sheets[size]
	drawdefaulthud()
}


#define effectsbehind
with (carryid) {hspeed=0 event_user(1)}

#define grabflagpole
grabflagpole=1
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
if (type="jumprefresh") {spinjump=0
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
		if (!super && size<2) grow=1
		tired=0
		oldsize=size
		size=2
	}
	itemget=1
}      
if (type="bfeather") {
if (!piped && !hurt ) {
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
if (type="jumprefresh") {if (double) double=0
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
			if (coll.object_index!=beetle && coll.object_index!=bulletbill && (coll.object_index!=bombenemy)) {
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
	if exploding=0{
		draw_sprite_part_ext(sheet,0,10+17*frame,104,16,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
	} else {
		draw_sprite_part_ext(sheet,0,10+17*floor(exploframe/1.333333333),87,16,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
	}
}


#define sprmanager
frspd=1
if (grabflagpole) {sprite="flagslide"}
else if (hurt||ow_fuck) {sprite="knock"}
else if (dive) {sprite="dive"}
else if (spin) {sprite="spin" if (spinframe=9) sprite="kick"}
else if (fired && !spinjump) {sprite="fire"}
else if (throw) {sprite="throw"}
else if (pound) {sprite="pound"}
else if (slipnslide) {sprite="slide"}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if (onvine) { sprite="climbing" frspd=sign(left+right+up+down) }
	else if (flight) {sprite= "capeflight" frspd=0 frame=((vsp+2.5)/6.5)*(global.animdat[p2,(16+128*32)+1+min(4,size)]-1) }
	else if (spinjump) {sprite="twirl"}
	else if (hang>0 && !spinjump) {sprite="wall"}
	else if (double || triplejump>=1) { if carry {sprite="jump" if (vsp>0) sprite="fall"} else sprite="spin" frspd=0.4}
	else if (triplejump>=0.5) {sprite="fly"}
	else if (water) {sprite="swim" if (swim) sprite="paddle"}
	else if (bonk) {sprite="bonk"}
	else {sprite="jump" if (vsp>0) sprite="fall" if (jumpspd=99) sprite="fly" if fall=0 sprite="spin" }
} else {
	if (crouch) {sprite="crouch" frspd=0}
	else if (braking) {sprite="brake" xsc=-brakedir}
	else if (hsp=0) {
	if (lookup) {sprite="lookup"}
	else if (waittime>maxwait &&!carry) {sprite="wait"}
	else if (posed) {sprite="pose"}
	else {sprite="stand"}
	} else {
		if (abs(hsp+hyperspeed)>3 && !carry) {sprite="run"}
		else {
			sprite="walk"
			frspd=median(0.5,1,0.3+abs(hsp/4))
		}
	}
}
if (carry && sprite!="dive" && sprite!="knock") sprite=sprite+"carry"

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
rise!=0 || 
flight ||
(crouch && !jump) ||
(poundcancel || pound || spin || dive)
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
            if (jump) {hang=4 double=0}
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
                hsp+=(0.44-0.175*!water+0.04*(abs(hsp)<1))*wf*h
                if (abs(hsp)<0.5 || carry && !spin) xsc=h
            } else {
                hsp+=(0.06+0.04*(abs(hsp)<0.5))*wf*h
                xsc=h
                braking=0
            }
        } else {
            if (water) {if (h!=sign(hsp)) hsp+=0.1*h else hsp+=0.0475*h}
            else if (dropkick) hsp+=0.1*wf*h
            else hsp+=0.06*wf*h
            if (!hang && !wallkick && !twist && !spin) xsc=h
        }
    }
}

if (push!=h) push=0

com_di()

if ((abut || jumpbufferdo) && !springin) {
    if (!jump || water ||fall=69||tailsgrab||grabflagpole) {
        if (water) {if (!pound) {vsp=-1.5-up*0.75 swim=24 crouch=0 playsfx("marioswim") double=0}}
        else {
            if ((abs(hsp)<=2.5 && triplejump) || triplejump>=1 || (triplexsc!=sign(hsp) && triplexsc!=0) || poundjump && !carry && !crouch) {triplejump=0 triplexsc=0}
            else if (jumptiming && (abs(hsp+hyperspeed)>2.5 || !triplejump) && !carry && !crouch) {triplejump+=0.5 triplexsc=sign(hsp)}
            if (size==0) jumpsnd=playsfx("mariosmalljump",0,1+triplejump/2)
            else jumpsnd=playsfx("mariojump",0,1+triplejump/2)
            {vsp=-(4.7+min(1,abs(hsp)/8)+!!poundjump+triplejump) hellothisisajump=1}
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)
        }
        if (poundjump) {springsmoke(x,y+8) crouch=0}
        jumptiming=0
        onvine=0
        jump=1
		if tailsgrab{
			tailsgrab=0
			graber.tailsgrabbed=0
		}
		i=shoot(x,y+4,psmoke,hsp,-2) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.05
		i=shoot(x,y+16,psmoke,2,-0.5) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
		i=shoot(x,y+16,psmoke,-2,-0.5) i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75
        fall=0
        dropkick=0
        braking=0
        canstopjump=1
        if (mymoving) hsp+=avgmovingh
        if (!star) fall=1
        else crouch=0
        if (rise && !down) crouch=0
        jumpspd=min(1,0.5+abs(hsp)/5)
    } else {
        if (hang && !carry && !flying) {
            hang=0 spinjump=0 dive=0 triplejump=0 triplexsc=0
            kicked=xsc
            hsp=xsc*-2.5 jumpspd=100 instance_create(x+6*xsc,y+8,kickpart)
            xsc*=-1 vsp=-5
            if (size) playsfx("mariowallkick") else playsfx("mariosmallwallkick")
            wallkick=12 crouch=0
            run=1
            canstopjump=1
        } else if (!crouch && !flying && !dropkick && !double && !spinjump  && !spin && !carry && (vsp<3||!collision(0,vsp*3) )) {
			jumpspd=0 
			playsfx('marioflip') 
			if vsp>-3
			vsp=-3
			else vsp-=1
			fall=0
			double=1 
			triplejump=0 
			triplexsc=0 
			hellothisisajump=0 
			shoot(x,y+8,psmoke,0,-1)
			dive=0
		}
        
        if (super && !crouch && !flying && fall!=6 && !float && ((abs(hsp)>2 && (vsp)<0) || fly)) {
            fly=1
            vsp=-3
            playsfx("marioflip")
        } else if (super && !flying &&  !crouch && fall!=6 && !fly) {
            float=20
            playsfx("marioflip")
			
        }
        jumpbuffer=4*!jumpbufferdo
    }
}
if (!jump) {
	ow_fuck=0

    if (jumptiming) jumptiming-=1
    else {triplejump=0 triplexsc=0}
}
jumpbufferdo=0
springin=0

if (akey) {
    if (jumpbuffer) jumpbuffer-=1
} else {
    jumpbuffer=0
    if (canstopjump=1 && jump && vsp<-2 && !sprung && !water) {
        vsp*=0.6
    }
canstopjump=0
}

if (bbut) {
    if (size=2 && count_projectiles()<2 && !crouch && !dive) {	
        fire_projectile(x+8*xsc,y+2)
        fired=8
    }
}

if (bkey) {
    if (!jump) run=1.5
} else {
    if (carry) {
        updatecarry()
        if (!down) {throw=16 instance_create(carryid.x,carryid.y,kickpart) sound("enemykick")
			if tailsgrabbed {
				with grabvictim{
					if !other.up{
						jump=other.jump
						if!jump spin=1
					}
					if (other.up) {vsp=-6 hsp=abs(other.hsp*0.75)}
					else if (other.down) {vsp=other.vsp x+=2*other.xsc hsp=abs(other.hsp)+0.1 hsp=spd*other.xsc}
					else hsp=(abs(other.hsp)+3)*other.xsc
					
					if abs(hsp)>maxspd
					hyperspeed=(abs(hsp)-maxspd)*sign(other.hsp)
				}
			}
		}
        with (carryid) event_user(0)
        carryid=noone
        carry=0
    }
}

if (cbut) {
    if (!carry || tailsgrabbed ) {
		if coop_carryable && !double && !spin && place_meeting(x,y,player) && bkey && !water && (coop_toggle) && !carry{//HAlf the fun is fucking with other people on purpose, so I'm having Mario choose if he wants to fuck with people or not
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
        } else if (spin && !jump) {vsp=-1 instance_create(x,y+12,smoke)}
		else if (!jump && !spin && !carry) {
            jump=1
            fall=0
            spinjump=1
            jumpspd=0
            crouch=0
            playsfx("mariospinjump")
            vsp=-(4.2+min(1,abs(hsp)/8))
        }
        else if (dive=0 && !water && !up && (pound || spin || !crouch)) {
            jump=1
            pound=0
            dive=1
            spin=0
            dropkick=0
            spinjump=0
            crouch=0
            run=1.5
            runvar=1.5
			soundstop(name+"jump")
			soundstop(name+"smalljump")
            playsfx("mariodive")
            vsp=-2-!jump
			if abs(hsp)<(3.5)
            hsp=maxspd*xsc
			else 
			hyperspeed=2*xsc
            hellothisisajump=0
			shoot(x,y+8,psmoke,-xsc*2,-1)
        }
		
		
		
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
        if (!carry && fall!=6 && !dive && !pound && !poundlok && fall!=69) {
            pound=1
            if (water) seqcount=1
            slidejump=0
            dropkick=0
            spinjump=0
            playsfx("mariopound")
        }
    } else if (!braking) {
        if (slobal!=0 && !carry) {
            slipnslide=1
        } else {
            if (((right-left=sign(hsp) || hsp=0) && (left || right)) && pound!=-1 && !water && !carry && !spin) {
                spin=1
                crouch=0 
                xsc=esign(hsp,esign(right-left,xsc)) 
                hsp=max(abs(hsp),2.5)*xsc 
                playsfx("mariokick")
            } else crouch=1           
        }
    }
    poundlok=1
    com_piping()
} else {
    if (pound=-1) pound=0
    if (!jump) crouch=0
    poundlok=0
}

if (size=0 || crouch || pound || spin || dropkick || dive || (fall=0 && jump)) mask_set(12,12)
else if (jump) mask_set(12,26)
else mask_set(12,24)


#define movement
if (piped) exit

//speed limits
if ((loose && !jump) || (crouch && !jump)) {
if (braking) xsc=brakedir
braking=0
frick=0.06
if (slipnslide) frick=0.01
if !flight hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

maxspd=(1.25+runvar*1.75+water+slipnslide+!!spin)*wf
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

if (pound) {
vsp=min(6,vsp)
} else vsp=min(7+downpiped,vsp)

calcmoving()

if (!dead && !grabflagpole) {
	if fall!=69
	player_horstep()
	player_nslopforce()
	//if (yground!=verybignumber) yground-=14
	if (jump) {
		if (flight) {
			if !frame1flight{
				frame1flight=1
				flightdir=sign(xsc)
			}
			hsp=flightdir*maxspd
			if hsp!=0
			xsc=sign(hsp)
			movevar=xsc*(right-left)

			if movevar>0 { //pulling down, make gravity stronk + give speed
				vsp=min(4,vsp+0.25)
				frame1uppies=0
			} else if movevar=0{ //Neutral, let gravity do it's thing
				vsp=min(4,vsp+0.15)
				frame1uppies=0
			} else if movevar<0{  //pulling up, glide and gain upward force based on how hard you're falling
				if !frame1uppies{
					airtime=vsp*5
					savedvsp=vsp
					frame1uppies=1
					if energy=0 airtime=0
					energy-=1
				}
				if vsp>=1{ //stop falling, transition into gliding/flying
					vsp*=0.9  
				} else {
					if savedvsp<1||airtime<=0{ //No more uppies for you! *vine boom sfx*
					vsp=min(1,vsp+0.05)
					}
				else { //use up airtime 
					vsp-=0.6
					if vsp<-2.25 vsp=-2.25
						airtime-=1
					}
				}

			}
			if pound flight=0

			if sign(hsp)!=flightdir flight=0
		} 
		else if (pound>0) {
			hsp=0
			if (pound<14) {vsp=0 if size=2 pound=13}
			else if (pound>=14 && pound<15) vsp=6*wf
			else if (water) {vsp-=0.1*wf if (vsp<1.5) pound=0}
			else vsp+=0.375*wf
		}
		else if (vsp<-2) vsp+=0.15
		else if (water) vsp=min(1.5,vsp+0.04)
		else if (twist>5) vsp=min(1,vsp+0.1)
		else if fall!=69 && !flight{
			vsp=min(4,vsp+0.25)
		} vine_climbing() 
		if (!flight && akey && size=3) {if vsp>2 vsp=2}
		if (hang>0 && vsp>1 && !spinjump && !water) {vsp=1.5 if !fall fall=1}

		if (skidding) {soundstop("marioskid") skidding=0}
		braking=0
		braking=max(0,braking-1)

		//if (!fall && !spinjump) fall=1
		if (pound=-1) pound=0
		if (sprung && !fall) fall=1
		if (fall=12) {vsp=6*wf hsp=0}
		if fall=69 {dive=0 flight=0}
		if !flight frame1flight=0

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
#define cpu
	
	up=   0
	down= 0
	left= 0
	right=0
	akey= 0
	bkey= 0
	ckey= 0
	skey= 0
	xkey=0
	ykey=0
	zkey=0

	if cpu_myleader.flash flash=cpu_myleader.flash
	size=cpu_myleader.size
	super=cpu_myleader.super
	if cpu_myleader.shielded shielded=cpu_myleader.shielded
	cpu_myleader=cpu_myleader

    //if my player is standing on blockq and I'm directly below it, find a way to get to my player
	
	if !auto &&  (global.joynum>(global.input[p2]))||global.input[p2]<2 input_get(global.input[p2])
	if (left||right||down||up||akey||bkey||ckey||skey||xkey||ykey||zkey)
		&& !(right){
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
	
	if !instance_exists(cpu_myleader) exit
		
	
	
	//the actual bot itself
	
	akey=0
	if cpu_myleader.x>x+(16*!jump) right=1
	if cpu_myleader.x<x-(16*!jump) left=1

	if cpu_myleader.y<(y-32) && cpu_myleader.jump=0 akey=1
	//if cpu_myleader.y<(y-12)&&cpu_myleader.jump akey=1
	if cpu_myleader.down down=1
	if cpu_myleader.spindash&&abs(hsp)<0.5&&!jump{xsc=cpu_myleader.xsc spindash=cpu_myleader.xsc}
	if cpu_myleader.abut && !jump {jumpwait=abs(cpu_myleader.x-x)/max(abs(cpu_myleader.hsp),1)  }
	
	if !jump {if jumpwait {jumpwait-=1 if jumpwait<=1 akey=1}}
	

	if vsp>0 canstopjump=0
	if jump && (cpu_myleader.vsp+cpu_myleader.y) <(y+16)&&canstopjump &&vsp<-1 {akey=1 cpu_akeystuck=0}
	
	//Mario characters only
	bkey=1  //Runnin'
	
	
	
	////Some good pathfinding to avoid bots getting stuck in stupid ways
	if push!=0 && !instance_place(x+8*xsc,y-32,collider) akey=1
	if !jump
	if collision_line(x,y,cpu_myleader.x,cpu_myleader.y,collider,0,1){
		//Determine where the thing is.
		
		if abs(cpu_myleader.x-x)<32 && !push{ //Unlikely that there's something between us horizontally, let's check vertically.
			
	
		} else{	//Ah shit there's something here, even worse, jumping wont fix our issues.
			if collision_line(x,bbox_bottom,cpu_myleader.x,cpu_myleader.bbox_bottom,collider,0,1){
				//It's not a tube... (From here characters would likely react differently)
				
			} else{ //Oh it's just a tube lmao (Found a small tunnel, characters will react differently.)
				down=1 akey=1 
			}
			
		}
		
		
	}
	
	
	//Back to general stuff
	if akey cpu_akeystuck+=1 else cpu_akeystuck=0
	if cpu_akeystuck>5{akey=0 cpu_akeystuck=0}
	
    if !inview() {x=cpu_myleader.x y=cpu_myleader.y}

#define actions
com_warping()
com_actions()

weight=0.5+0.5*!!size
bartype=1
maxe=4


if coop_carryable{
	if tailsgrabbed && instance_exists(grabvictim){
		if !carry tailsgrabbed=0
		if carry!=grabvictim tailsgrabbed=0
	} //Rechecking just in case
	if tailsgrabbed && instance_exists(grabvictim){
		{grabvictim.x=x+8*xsc-hsp
		grabvictim.y=y-8+(4*!size)}
		
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

if jump&&triplejump>=1&&size=3&&vsp>=0&&akey&&!carry{
	if hsp=0 hsp=sign(xsc)*0.01
	flight=1
}

//Cancel the Dropkick !!
if (spin && abs(hsp)<1)
{
	if (left || right)
	{
		dropkick = 0
		spin = 0
	}
}

if (abs(hsp)>=2 && !jump) {
	if (mcs>8) {energy+=1 mcs=0}
} else if (!jump) if (mcs>30) {energy-=1 mcs=0}

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1 ) is_intangible=1

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
pvp_spin=spin||spinjump //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=!pound //make sure to set for 0 for the mario bros when pounding
pvp_ignore=pound //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away
break_crackedground=(!!spinjump)*2
//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

if (!jump) {
	vsp=0
	if (!star) seqcount=0
	//check for deathpits
	if (dive) dive+=1
	if (dive=3) dive=0
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

//water
if (underwater()) {
	if (!water) {
		if (abs(vsp)>2) water_splash(1)
		watrlock=10 spinjump=0 fall=1 hang=0
		if (!pound) vsp=min(1,vsp/2)
		if (dive) {vsp+=2 hsp=max(0,abs(hsp)-2)*xsc dive=0}
		jumpspd=1
		dropkick=0
	}
	water=1 wf=0.45 eoll=0 dropkick=0 run=0
	if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
} else {
if (water) {
	water=0
	if (vsp<-1) vsp=min(vsp,-3)
	else {vsp=1 y+=1 water=underwater() y-=1}
	if (abs(vsp)>2) water_splash(0)
}
wf=1
}

//smoke generation
if (global.dustframe) {
	if (abs(hsp)>=maxspd-0.25)&&runvar&&!jump {
		i=shoot(x-12*xsc,y+12,psmoke,-hsp*0.25,0) i.drag=1 i.growsize=-1
		vd=point_direction(0,0,-hsp*0.25,vsp)+point_direction(0,0,1,slobal/1.5)
		vm=point_distance(0,0,-hsp*0.25,vsp)
		i.hspeed=lengthdir_x(vm,vd)
		i.vspeed=lengthdir_y(vm,vd)
	}
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
twist=max(0,twist-1)
runvar=inch(runvar,run,0.05)
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
if (spinframe>=9) spinframe=9*!jump
if (sprung) {triplejump=0 triplexsc=0}

if (!jump && run && !bkey) run=0
if (!collpos(xsc*16,0) || !jump) hang=0
if (pound) {
	crouch=1
	hang=0
	if (pound<15) pound+=1
	else if (up || (water && vsp>5)) {pound=0 dive=-1 fall=0 insted=1 crouch=0 canstopjump=1}
	else fall=4
} else poundcancel=0
if (fall=6 && sign(hsp)=xsc) fall=1
if (rise!=0) {crouch=1 hsp=0 xsc=rise risec+=1 if (risec=10) {risec=0 rise=0 crouch=down} }
sprung=0
if (slipnslide) {
	crouch=1
	if ((slobal=0 && (hsp=0 || ((left || right) && !down))) || jump) {slipnslide=0 crouch=0}
}
jumpspd=min(jumpspd,100)

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

//WHO IS CLIMBING MY SHIT.
if (up && !down && !onvine) {
    onvine=instance_place(x,y,vine)
    if (onvine) fall=69 //nice
}
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

if ((hsp*xsc)>=2 && !carry) {triplejump+=0.5}  

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
            playsfx(name+"spinbounce")
            vsp=-3-ckey*1.5
            canstopjump=akey
            pound=0
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
            if (bkey && !carry && !spin && !dropkick && !dive) {
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
                        dive=0
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
        
        if (type=bulletbill)
        {
        if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 dive=0 vsp=-0.5 enemydie(coll) exit}
        }
        
        if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
        if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
        if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
        if (type=hammerbro) seqcount=max(5,seqcount)
        if (fall=12) fall=5     
        dive=0                   
        enemystomp(coll) exit      
    } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 dive=0 vsp=-0.5 enemystomp(coll) exit}
    
    hurtplayer("enemy")   
}    

#define hurt
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
gk=0
fk=0
punch=0
bounce=0
twirl=0
dive=0
oldsize=size
jumpbuffer=0
hyperspeed=0
hp=0
star=0
if (super) stopsuper()   


if (((!size && global.rings[p2]==0) || ohgoditslava || name="kid") && !shielded) {
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
		hurt=1
        fall=6
        hsp=xsc*-2*wf vsp=-3*wf
}

//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || owner.size=0 && insted!=1 && !owner.dropkick && !owner.spin && !dive && !owner.tempkill && (biggie || cracked=0)) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else if (stonebump || (owner.size && insted!=1 && !owner.tempkill && cracked=0 && biggie)) { //break spiner
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
skiphsp=0
flight=0
if (object_is_ancestor(coll.object_index,hittable)) {
    if (dropkick || dive) || (spin && abs(hsp)>0.5){
        s=vsp
        global.coll=id
        with (coll) {
        go=1
        event_user(0)
		skiphsp=1
        }
        if (coll.object_index=brick && coll.hit || !instance_exists(coll)) coll=noone
    }
}
else {
    if (abut && dive && knuxcanclimb(coll)) {
        dive=0
        hsp=-(hsp+1)
        jumpspd=100 
        instance_create(x+6*xsc,y+8,kickpart)
        xsc*=-1 
        vsp=-4
        if (size) playsfx("mariowallkick") else playsfx("mariosmallwallkick")
        wallkick=12 
        crouch=0
        run=1
        canstopjump=1
        hyperspeed=(abs(hyperspeed)+1)*xsc
        exit
    }
}
if (dropkick || spin || flight || dive)if instance_exists(coll) {instance_create(x+8*s,y+6,kickpart) x-=hsp dropkick=-1 hsp=-2*esign(hitside,xsc) vsp=-2*spin jump=(jump || spin) spin=0 dive=0 ow_fuck=1 crouch=1 skiphsp=1}

if (hurt) {hurt=0 fall=6 flash=1 fk=0}

if (!collpos(sign(hitside)*10,8,1)) {
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}

if (!skiphsp) hsp=0
hyperspeed=0         




#define landing
hang=0   
kicked=0
braking=0
double=0
flight=0
i=shoot(x,y+16,psmoke,2,0.25) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
i=shoot(x,y+16,psmoke,-2,0.25) i.growsize=1 i.image_xscale=0.25 i.image_yscale=0.25
if (hellothisisajump) jumptiming=6
hellothisisajump=0
if spin{spin=0}

spinjump=0
    if (dropkick || (dive && ckey)) {spin=1 dropkick=0 spinframe=7+2*dive}
    else {
        dropkick=0
        if (((right-left=sign(hsp) || hsp=0) && (left || right)) && down && !pound && !water && !carry && !crouch) {spin=1 crouch=0 xsc=(right-left) hsp=2.5*xsc playsfx("mariokick")}
    }
dive=0

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
	if (!poundcancel && !piped) {
        playsfx(name+"stomp")         
        shoot(x-8,y+4,psmoke,-2,-1)
        shoot(x+8,y+4,psmoke,2,-1)    
		poundjump=16
    }
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
	if size=2 {
		i=instance_create(x+16,y+16,burnerfire)
		i.dir=0
		i.playermade=1
		i=instance_create(x-32,y+16,burnerfire)
		i.dir=0
		i.playermade=1	
	}
}
 

#define death
if (event="create"){
alarmmp=60
alarm0=30
alarm1=300
sprite="dead"
frame=0
frspd=1
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

#define spritelist
stand,wait,lookup,pose,crouch,knockstand,knockrun,deadair,run,runnojet,turn,fly,jump,ball,dead,fired,climbing,flagslide,handlegrab,grindgrab,grind,piping,pipingup,sidepiping,doorenter,doorexit

#define soundlist
release,skid,spin,spindash,chain,jet,splode,stomp,lookup,taunt


#define movelist
Mecha Sonic
#
[a]: Jet (air)
[up] + [a]: Highjump
[b]: fired
[c]: Charge Dash (hold)
<fire>
Mecha Sonic [flwr]
#
[a]: Jet (air)
[up] + [a]: Highjump
[b]: Spike Attack (air) / fired (stand)
[c]: Charge Dash (hold)
<feather>
Mecha Sonic [fthr]
#
[a]: Jet (air)
[up] + [a]: Highjump
[b]: fired
[c]: Charge Dash (hold)
[fthr] Increased energy recharge rate

#define rosterorder
7

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()

#define start
mask_set(18,26)
sparklvl=1
snack_turn= 1
dowait=1


#define stop
if (skidding) {soundstop(name+"skid") skidding=0}
star=0
grow=0
hurt=0
braking=0
spindash=0
spin=0
push=0
super=0
boost=0
sparkcharge=0
chargestored=0
firedarm=0

#define effectsbehind

#define effectsfront
if iaminsidemyself=1 exit

if (hsp!=0 && !jump){
	draw_sprite_general(sheets[size],0,8+(floor(sparkanim)*16),48,15,8,x-(sign(hsp)*20),y+6+dy,sign(hsp),1,sign(hsp),$ffffff,$ffffff,$ffffff,$ffffff,1)
}
sparkanim= (sparkanim+0.1) mod 2



if randomsparksGO mod 2{
	draw_sprite_part_ext(sheets[size],0,49,46,25,31,round(x-10),round(y-16+dy),1,1,$ffffff,1)
	
}if randomsparksGO randomsparksGO-=1

#define itemget
if type="jumprefresh" energy=maxe
com_item()



#define endofstage
right=1
grabbedflagpole=0
if (hsp>=3 || push) {
	akey=1
}


#define damager
y=-1000
if (event="create") {
    x=owner.x+owner.hsp 
    y=owner.y+16
    i=instance_create(x-6,y,part) i.hspeed=-1 i.vspeed=-5
    i=instance_create(x+6,y,part) i.hspeed=1 i.vspeed=-5
    i=instance_create(x-12,y,part) i.hspeed=-1.5 i.vspeed=-3
    i=instance_create(x+12,y,part) i.hspeed=1.5 i.vspeed=-3
    i=instance_create(x,y,smoke) i.vspeed=-0.5
    //instance_create(x,y,poundeff)
    alarm0=12
    stomp=1
	p2=owner.p2
} else if (event="step") {
    //Jets and Powersaw
    hittype="pvp"
    ox=x
    oy=y
    image_xscale=12
    if (owner.jet && !owner.piped) {x=owner.x+owner.xsc image_yscale=kek kek=max(8,kek-1) go=1 y=owner.y+12+kek}
    else {
        kek=14
        if (owner.lookup && !owner.piped) {x=owner.x-owner.xsc*5 image_yscale=16 go=-1 y=owner.y-6}
    }
    if (owner.jet || owner.lookup) {
        coll=instance_place(x,y,collider)
        if (coll) {
        if (object_is_ancestor(coll.object_index,hittable)) {
        if (coll.object_index=brick) brickc+=1 else brickc=4
        hitblock(coll,owner,1,go,1)
        }    
        }
        
        coll=instance_place(x,y,enemy)
        if (coll) {
            with (owner) {
                coll=other.coll
                global.coll=id
                enemyexplode(coll)
            }
        }
        
        coll=instance_place(x,y,player)
        if (coll) {
            if (coll.id!=owner) if (!invincible(coll)) {    
                if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
                    coll.hittype=hittype
                    with (coll) hurtplayer(hittype)
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
            }
        }
    }
    x=ox
    y=oy
    
    //Stomping
    if (stomp) {
        hittype="pvp"
        image_xscale=24
        image_yscale=8
        alarm0=max(0,alarm0-1)
        if (!alarm0) {stomp=0 exit}
        x=owner.x+owner.hsp 
        y=owner.y+16
        
        coll=instance_place(x,y,collider)
		if (coll) {
			if (object_is_ancestor(coll.object_index,hittable)) {
				if (coll.object_index=brick) brickc+=1 else brickc=4
				owner.stomp=1
				hitblock(coll,owner,1,1,1)
				owner.stomp=0
			}    
		}
        
        coll=instance_place(x,y,enemy)
        if (coll) {
            with (owner) {
                coll=other.coll
                global.coll=id
                
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
                            vspeed=-4
                            hspeed=1*esign(x-(global.coll).x,1)
                        }
                    }
                }
            }
        }
        
        coll=instance_place(x,y,player)
        if (coll) {
            if (coll.id!=owner) if (!invincible(coll)) {    
                if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
                    coll.hittype=hittype
                    with (coll) hurtplayer(hittype)
                }
            }
        }
    }
    if (!owner.jet && !owner.lookup && !stomp) y=-1000
}


#define projectile
if event="create" 
	is_spike=owner.spikin
if is_spike{
	if (event="create") {
		image_xscale=4
		image_yscale=4

		frame_sub=0
		frame=0
		brickc=0
		seqcount=2
		getregion(x) 
		timer0=3
		timer1=128
		speed=5
		p2=owner.p2
	}
	if (event="step") {
		timer0-=1 if (timer0=0) visible=1
		timer1-=1 if (timer1=0) instance_destroy()
		calcmoving()

		frame_sub=!frame_sub
		if frame_sub frame+=1
		if (frame>=3) frame=0

		if (!inview()) instance_destroy()
		xsc=1

		coll=instance_place(x,y,collider)
		if (coll) {
			if (object_is_ancestor(coll.object_index,hittable)) {
				if (coll.object_index=brick) brickc+=1 else brickc=4
				hitblock(coll,owner,1,go,1)
			}    
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
			instance_destroy()
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

		coll=instance_place(x,y,player)
		if (coll) {
			if (coll.id!=owner) if (!invincible(coll)) {    
				if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
					if (coll.name="knux" && coll.glide && sign(hspeed)=-sign(coll.hsp) && object_index!=powah_wave) {hspeed=abs(coll.hsp+1)*esign(coll.hsp,1) owner=coll.id with (owner) playsfx("knuxreflect") exit}                                                                   
					if (coll.name="robo" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) instance_destroy() exit}
					with(coll) fragplayer(other.owner)
				}
				instance_create(x,y,kickpart) instance_destroy()
			}
		}

	}
	if (event="draw") {

		if global.legacy_skin[p2]==1{ //193
		
			draw_sprite_part_ext(owner.sheet_193,0,
			100+((direction<90)||direction>240)*13-((direction>90)&&direction<240)*13  ,
			193-((direction<180)&&direction>0)*13+((direction>180)&&direction<360)*13  ,
			12,12,round(x-8),round(y-8),xsc,1,$ffffff,1)
			
		}else if global.legacy_skin[p2]==2{ //18
		
			draw_background_part_ext(owner.sheet_18,
			568+((direction<90)||direction>240)*13-((direction>90)&&direction<240)*13  ,
			193-((direction<180)&&direction>0)*13+((direction>180)&&direction<360)*13  ,
			12,12,round(x-8),round(y-8),xsc,1,$ffffff,1)
			
		}else if global.legacy_skin[p2]==3{//17
		
			draw_background_part_ext(owner.sheet_17,
			568+((direction<90)||direction>240)*13-((direction>90)&&direction<240)*13  ,
			193-((direction<180)&&direction>0)*13+((direction>180)&&direction<360)*13  ,
			12,12,round(x-8),round(y-8),xsc,1,$ffffff,1)
			
		}else//Bowl
		
		draw_sprite_part_ext(sheetshields,0,
		88+((direction<90)||direction>240)*13-((direction>90)&&direction<240)*13  ,
		59-((direction<180)&&direction>0)*13+((direction>180)&&direction<360)*13  ,
		12,12,round(x-248),round(y-8),xsc,1,$ffffff,1)
	}


} else {
	if (event="create") {
		image_xscale=4
		image_yscale=4

		frame_sub=0
		frame=0
		brickc=0
		seqcount=2
		getregion(x) 
		timer0=3
		timer1=128
		hspeed=(5*owner.xsc+owner.hsp)
		xsc=owner.xsc
		p2=owner.p2
	}
	if (event="step") {
		timer0-=1 if (timer0=0) visible=1
		timer1-=1 if (timer1=0) instance_destroy()
		calcmoving()

		if (!inview()) instance_destroy()

		coll=instance_place(x,y,collider)
		if (coll) {
			if (object_is_ancestor(coll.object_index,hittable)) {
				if (coll.object_index=brick) brickc+=1 else brickc=4
				hitblock(coll,owner,1,go,1)
			}    
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
			instance_destroy()
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

		coll=instance_place(x,y,player)
		if (coll) {
			if (coll.id!=owner) if (!invincible(coll)) {    
				if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
					if (coll.name="knux" && coll.glide && sign(hspeed)=-sign(coll.hsp) && object_index!=powah_wave) {hspeed=abs(coll.hsp+1)*esign(coll.hsp,1) owner=coll.id with (owner) playsfx("knuxreflect") exit}                                                                   
					if (coll.name="robo" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) instance_destroy() exit}
					with(coll) fragplayer(other.owner)
				}
				instance_create(x,y,kickpart) instance_destroy()
			}
		}
		frame=(frame+0.1) mod 2
	}
	if (event="draw") {

		if global.legacy_skin==1{ //193
			draw_sprite_part_ext(owner.sheet_193,0,126,205+16*(owner.size==2),64,15,round(x-56*xsc),round(y-8),xsc,1,$ffffff,1)
		}else if global.legacy_skin==2{ //18
			draw_background_part_ext(owner.sheet_18,126,205+16*(owner.size==2),64,15,round(x-56*xsc),round(y-8),xsc,1,$ffffff,1)
		}else//Bowl
		draw_sprite_part_ext(sheetshields,0,274,16+16*floor(frame),64,15,round(x-56*xsc),round(y-8),xsc,1,$ffffff,1)
	}

}


#define grabflagpole
grabflagpole=1
hsp=0
vsp=0

#define sprmanager
frspd=1
if (grabflagpole) {sprite="flagslide"}
else if (transform) {sprite="transform"}
else if (alarm[5]) {sprite=knockspr}
else if (staydash) {sprite="run"}
else if (fired) {sprite="fired" /*frspd=2*/}
else if (spindash) {sprite="ball" frspd=spindash/6}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if (onvine) 
	{
	sprite="climbing" frspd=sign(left+right+up+down)
	}
    else if (jet) {sprite="fly" /*frspd=0.4*/}
    else {if (fall) sprite=fallspr else sprite="jump" if (fallspr="turn") fallspr="run" frspd=fallspd}
} else {
    if (spin) {sprite="ball" frspd=0.5+abs(hsp/6)}
    else if (turning && turning<maxturning-8 && turning>8)|| ((sign(hsp)!=h || sign(xsc)!=esign(hsp,xsc))  && snack_turn) {if snack_turn {if sign(hsp)!=h || sign(xsc)!=esign(hsp,xsc) sprite="turn" else sprite="run"  frspd=0.3} else sprite="turn" if !snack_turn frspd=0.3*sign(turning-middleturning)}
    else if (hsp=0) {
        if (posed) sprite="pose"
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        sprite="run" frspd=abs(hsp/3)
    }
}
if sprite="run"||sprite="turn" && h=0 sprite="runnojet"
#define controls
com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (hurt || piped || move_lock || grabbedflagpole) {
    di=0
    exit
}

if (up) com_piping()
oup=up

if (up && (!hang || !size || size==5)) {
    if (hsp=0 && !jump) lookup=1
} else lookup=0 

if !global.legacy_skin_193[p2] if (lookup && !taunted){playsfx("robolookup") taunted=1} if (!lookup) {soundstop("robolookup") taunted=0}

maxturning=25+((20*wf)*water)
middleturning=floor(mean(0,maxturning))

//list of things that prevent you from moving
if (spindash || (crouch && !jump) || (super && fall=10) || vinegrab || spin || e_timer || (sparkcharge&&!chargestored)) h=0

//movement
if (h!=0) {
    loose=0
    coll=noone
    if (h=sign(hsp) || hsp=0) coll=collision(h,0)
    if (coll) if (object_is_ancestor(coll.object_index,moving)) coll=place_meeting(x+h,y+coll.vsp+sign(coll.vsp),coll)
    if (coll) if (player_climbstep(coll)) coll=noone
    if (x<=minx && left) coll=1
    if (coll) {
        com_hitwall(h)
        if (!jump && !spin && !crouch && !firedash && xsc=h) push=h
    }
    if (!jump) {
        if (hsp=0 && !coll && !instance_place(x,y+4,spring)) {
            playsfx(name+"release") 
            i=instance_create(x-4*t,y+4,smoke) i.hspeed=-2*h i.vspeed=-1 i.friction=0.1
            i=instance_create(x-4*t,y+4,smoke) i.hspeed=-2*h i.vspeed=1 i.friction=0.1
        }
        if (xsc!=h && !count_projectiles() && !(chain>0 && chain<11)) {
            if (!turning) {turning=maxturning turndir=h}
        } else {if (!turning>middleturning) turning+=1 if (turning>=maxturning) turning=0}
        if (!coll) hsp+=(0.3+0.2*(abs(hsp)<1.4)+0.02*(size==5))*wf*h
    } else if (!coll) {
        hsp+=0.06*wf*h
        if (firedash) collwin=instance_place(x+hsp,0,goalblock)
        if collwin {hsp=0 fallsprite="dash" collwin.owner=id with collwin{ event_user(4)}}
        
    }
}

if (turning) {
	if h!=turndir && turning>middleturning*0.5 {turning=0 xsc=turndir}
    turning-=1
    if (turning=middleturning) xsc=turndir
}
if (jump || spin) turning=0

if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && !springin && !spindash) {
    if (!jump||fall=69) { //jump
        if (hsp==0 && crouch && push==0 && size && size!=5 && !vinegrab && !spindash &&!grabbedflagpole) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=1
            tempbrick=1
        } else {
            jumpsnd=playsfx(name+"jump",0,1+((size==5)/3))
            vsp=-4.20 //swagger
    

            if (water) vsp=-sqrt(sqr(vsp)*wf+2)
            onvine=0
            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/2)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)

            sprite_angle=0

            jump=1
            fall=0+up
            braking=0
            spin=0
            canstopjump=1
            if (mymoving) hsp+=avgmovingh
            crouch=0
            if (spin && !star) seqcount=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps
        if (energy>0 && !jetdead) {
            jet=1
            fall=1
            with (instance_create(x-4,y+16,smoke)) {hspeed=-1 vspeed=2 friction=0.1}
            with (instance_create(x+4,y+16,smoke)) {hspeed=1 vspeed=2 friction=0.1}
            playsfx(name+"jet")
        }
        jumpbuffer=4*!jumpbufferdo
    }
}
jumpbufferdo=0
springin=0

if (akey) {
    if (spindash) spindash=min(4,spindash+0.04)
    if (jumpbuffer) jumpbuffer-=1
} else jumpbuffer=0

if (!akey) {
    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp*=0.5
    }
    if (jet) {jet=0 soundstop(name+"jet") fall=1 fallspr="stand"}
    canstopjump=0
}

//code for specifically the b button
if (bbut ) {
	if (jump && !fall && size=2 && !insted) {
		insted=1
		kek=0
		if (energy=6) {
			energy=0
			jetdead=1
			spikin=1
			fired=20
			playsfx("robospike")
			for (kek=0;kek<8;kek+=1) {
				o=fire_projectile(x,y)
				o.direction=kek*45
			}
			spikin=0
		} else {
			playsfx("robostep")
			instance_create(x+hsp+2*xsc,y,smoke)
		}
	}	
	else {
		if (energy>=(3+(size==1)) && size) && !(chain) {energy-=(3+(size==1)) fired=40 chain=1 turning=0}
		}
}




//crouching and spinning
if (down && !up) {
    if (!jump && !braking && !spin) {
        if (abs(hsp)<0.5) {
            crouch=1
        } else if (!spin && !crouch) {
            spin=1
            hsp=3*xsc*wf
            playsfx(name+"spin")
        }
    }
    com_piping()
} else {
    if (!jump) crouch=0
}

if (size==5) mask_set(9,8) //please dont ask why the width has to be 9 pipes are weird and wacky and this is the only way i got to stop players from getting stuck in pipes and turning invisible/
else if (dead) mask_set(12,20)
else if (spin || crouch || fall=5) mask_set(18,18)
else mask_set(18,26)


#define movement
if (piped || move_lock) exit

//speed limits
if (!jump && !spin) if (loose || crouch) {
    braking=0
    frick=0.06
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula
maxspd=(3 + (size==5)*0.55 - jet + spin + (fall==10)*0.5 + firedash/24)*wf
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

vsp=min(7+downpiped,vsp)

///movement
//hi moster here dont uncomment the yground or easyground stuff because its required for the cool new slope system to work
//for anyone porting a charm from unfinished build or below to this build, delete or comment all of the commented code and add player_nslopforce()
calcmoving()

if (!dead && !grabflagpole) {
    player_horstep()
    player_nslopforce()
    //yground=easyground()
//if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        hang=0
        stamped=0
            if fall!=69 {

vine_climbing()
vsp+=0.15*wf-(size=5 && vsp>-0.35 && !water)*0.075
} else{
hsp=h
vsp=(down-up)
}

        crouch=0
        spindash=0
        braking=max(0,braking-1)
        if (sprung && !fall) fall=1
        push=0 spin=0
        coyote=0
osld=0
player_vertstep()
if (!jump) sld=point_direction(0,0,1,slobal)
    }

sprite_angle=0
if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3

    if (!jump) {
//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
osld=sld
sld=point_direction(0,0,1,slobal)
if (!jump && abs(hsp)>1.5) {
diff=anglediff(sld,osld)
if (sign(diff)=sign(hsp) && diff*sign(hsp)>20 && sld=0) {
jump=1 fall=1 fallspr=sprite fallspd=frspd
y=min(y,yp)
hsp=lengthdir_x(hsp,osld) vsp=-abs(lengthdir_y(hsp,osld))*1.5 // coolness factor
}
}

        if (finish && ending="retainer" && !jump) coyote=0
        if (!collision(0,4) /*&& (y<yground-2)*/) {
            coyote+=1
            if (coyote=3) {
jump=1
fall=1
fallspr=sprite
if (spin || spindash) fall=5
fallspd=frspd
spin=0
crouch=0
}
        } else coyote=0
        if (jumpbuffer=-1) {
            jumpbuffer=0
            //jump buffering
            if (rise=0 && !down) {
                jumpbufferdo=1
            }
        }
    }
}
com_finishmove()

#define cpu
{
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

	//respawn
	if (global.mplay<2 && cpu_deadstore!=dead && alarm[7]=-1) {alarm[7]=120}
	cpu_deadstore=dead
	
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
	if cpu_myleader.x>x+(32*!jump) right=1
	if cpu_myleader.x<x-(32*!jump) left=1

	if cpu_myleader.y<(y-32) && cpu_myleader.jump=0 akey=1
	//if cpu_myleader.y<(y-12)&&cpu_myleader.jump akey=1
	if cpu_myleader.down down=1
	if cpu_myleader.spindash&&abs(hsp)<0.5&&!jump{xsc=cpu_myleader.xsc spindash=cpu_myleader.xsc}
	if cpu_myleader.abut && !jump {jumpwait=abs(cpu_myleader.x-x)/max(abs(cpu_myleader.hsp),1)  }
	
	if !jump {if jumpwait {jumpwait-=1 if jumpwait<=1 akey=1}}
	//Sonic characters only
	if !right && !left && down && cpu_myleader.spindash {akey=1 spindash=1}

	if vsp>0 canstopjump=0
	if jump && (cpu_myleader.vsp+cpu_myleader.y) <(y+16)&&canstopjump &&vsp<-1 {akey=1 cpu_akeystuck=0}
	if size=2 && cpu_myleader.bbut && !cpu_myleader.jump &&!jump && abs(cpu_myleader.x-x)<32 if !collision(xsc*4,0) {bkey=1}
	
	
	
	
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
		
	
	//Character Specific shit 
	if fly && !tailsgrabbed {coop_toggle=min(coop_toggle-1,0)} else coop_toggle=1
	
	if fly && cpu_myleader.y<y && vsp>-1 { akey=1 cpu_akeystuck=0}
	if fly && tailsgrabbed { right=cpu_myleader.right  left=cpu_myleader.left bkey=cpu_myleader.bbut}

	
	if cpu_myleader.jump && jump{
		if cpu_myleader.up && (cpu_myleader.abut || cpu_myleader.bbut || cpu_myleader.cbut || cpu_myleader.xbut) { // fly whenever a player is here
			akey=1
			coop_toggle=30
		}
	}
	
	if (jump /*&& vsp>-4*/ && !collision_line(x,y,cpu_myleader.x,cpu_myleader.y,collider,0,1)  &&  abs(cpu_myleader.x-x)>100 || superdashactive=1) {
		bkey=1 if sign(cpu_myleader.y-(y+32))>0 down=1 else if sign(cpu_myleader.y-(y-16))<0 up=1
		
	} else if abs(cpu_myleader.x-x)>100 && !jump akey=1
    
	if fly && !ckey && cpu_myleader.y>(y+16) ckey=1
	
	
	//Back to general stuff
	if akey cpu_akeystuck+=1 else cpu_akeystuck=0
	if cpu_akeystuck>5{akey=0 cpu_akeystuck=0}
	
    if !inview() && !dead {x=cpu_myleader.x y=cpu_myleader.y}

}


#define actions
com_warping()
com_actions()

weight=1.5
bartype=1



if chain{
	if chain<=22 {
		chain+=1 
	}
	//chain less than 11 is the wind up animation, no special code here
	if chain>=11 && firedarm==0 {fire_projectile(x,y) playsfx("robochain") firedarm=1} 

}

if chain>=22 {
	chain=0
	firedarm=0
}

//Special interactions
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=0 //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

break_crackedground=2*(vsp>5) //1 for Horizontal only, 2 for Vertical 3 for All directions


is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1 ) is_intangible=1

power_lv=0
is_coinexplosive=0
if (spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (star) power_lv=5
if (super) power_lv+=1

if (piped) exit

//waiting animation
if dowait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

//grounded state
if (!jump) {
    vsp=0
    jet=0
    jetdead=0 
    if (!star && !spin && !spindash) seqcount=0
    //ledge hang animation detection
    if ((sprite="stand" && hsp=0) || hang) {
        image_xscale=1/6
        hang=(!instance_place(x,y+4,collider) && instance_place(x-7*xsc,y+4,collider))
        image_xscale=1
    } else hang=0

    //skidding
    if (push=0 && hsp!=0 && braking) {
        playsfx(name+"skid")
skidding=1
    } else if (skidding) {soundstop(name+"skid") skidding=0}
}
    
//water
if (underwater()) {
    if (!water) {
        if (abs(vsp)>2) water_splash(1)
        vsp=min(1,vsp/2)
    }
    water=1 wf=0.45
} else {
    if (water) {
        water=0
        vsp=max(-4,vsp*2)
        if (abs(vsp)>2) water_splash(0)
    }
    wf=1
}

//smoke generation
if (global.dustframe) {
    if (braking || fall=3) {
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

maxe=4+(!!size && size!=5)*2
if (!jump && !fired) energy=max(0,energy+0.05)

if (jet) {
    if (water) with (instance_create(x+hsp+choose(0,8)*xsc,y+14,airbubble)) jet=4
    vsp=min(2,vsp-0.25*(vsp>-1.25))
	energy=max(0,energy-0.05) //uhhh i'll balance it whenever I'm more available
	if (energy=0) {jet=0 soundstop(name+"jet") playsfx(name+"step") instance_create(x+hsp+2*xsc,y+16,smoke) jetdead=1}
    
}

if (boost) {
    if (hurt && !super) boost=0
    if (point_distance(0,0,hsp,vsp)<2.5) boost=0
}
if (super) boost=1
//haha fix for hurt hahahaha (help)
if (hurt) {flash=1 fk=0 hsp=0 hurt=0
sparkcharge=0
chargestored=0

}

//spindash/spin
global.coll=id
if (spindash || spin) {
    coll=instance_position(x-10*sign(hsp),y+22,hittable)
    coll2=instance_position(x,y+22,hittable)
    
    if (spindash) coll=coll2
    else if (coll2) if (coll2.object_index!=brick) coll=coll2
    if (coll) if (coll.hit) coll=0
    if (coll=spinblacklist) coll=0
    if (!coll)
        with (hittable)
            if (id!=other.spinblacklist && (object_index!=brick || other.spindash) && !hit)
                if (instance_place(x,y-4,other.id)) other.coll=id
    
    if (coll) if (!coll.goinup || tempbrick) {
        i=coll.object_index
        hitblock(coll,id,0,1,0)
        if (i=brick) {spinblacklist=coll if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf}}
    }
    
    if (spindash) {
        if (!crouch) {
            spin=1
            hsp=xsc*4*(0.75+0.25*median(0,spindash-1,2)/2)*wf
            spindash=0
            
            soundstop(name+"spindash")
            playsfx(name+"release")
            
        }
        if (hsp!=0) spindash=0
    }
    
    //stop spinning
    if (abs(hsp)<0.2 && spin) { 
        spinc+=1 if (spinc=8) {
            spinc=0
            spin=0    
            hsp=0
            soundstop(name+"spin")
            /*if (name!="mario") */crouch=down            
        }
    }
} else spinblacklist=noone

jesus=(((boost && vsp<4)||(size==5 && !down && abs(hsp)>3.2)) && !water)

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
//Code that defines collision with enemies
//sorry for the scuffed code, robo has stuff
if (hurt || piped || (intangible() && !diggity)) exit

coll=noone extracheck=id inst=0



with (enemy) if (phase!=other.id && !lock)
    if (instance_place(x,y-other.vsp-16*!!other.diggity,other.id)) other.coll=id

if (coll) {



    calcfall=fall
    if (fall=5 || fall=12) calcfall=0
    global.coll=id
    type=coll.object_index
        
    seqcount=max(1,seqcount)
    
    if (super||(abs(hyperspeed)>0.5&&size=2)) {
        if (water) seqcount=1
        enemyexplode(coll)
        exit
    }
    
    if (vsp>5) {enemyexplode(coll) exit}
        
    if (coll.object_index=lakitu) if (coll.flee) exit
    
    if (star  
    || (spin && type!=spinyegg && type!=beetle && type!=shell)
    || (pound>13 || (vsp>5 && size==5) && type!=piranha && type!=spinyegg && type!=spiny)) {
        if size==5 && !spin && !star && vsp>5 {if vsp<=0 {hurtplayer("enemy") exit} else playsfx(name+"jump",0,1.8) vsp=-3-(akey && star)*1.5 canstopjump=akey}
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        if (type=hammerbro) seqcount=max(5,seqcount)
        enemydie(coll)                
        exit
    }
    
    if (spindash || inst || firedash) {if (diggity=32) exit enemyexplode(coll) exit}
    
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
        if (!fall && vsp<0 && size!=5) enemyexplode(coll)
        else hurtplayer("enemy") exit
    }
    if (type=spinyegg) {
        if (punch && punch<=10) enemydie(coll) else hurtplayer("enemy") exit
    }                
            
    if (type=shell && !coll.time) {          
        if (coll.type="spiny" && (coll.vspeed-vsp)*coll.ysc<0) {
            hurtplayer("enemy") exit
        } else if (!coll.kicked || (coll.stop && (coll.owner=id || coll.vspeed>=0))) {
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
        if (jump && (!calcfall || !water) && vsp>0 && size!=5) {if (calcfall) enemystomp(coll,5) else enemyexplode(coll)}
        else if (size==5 && jump && (!calcfall || !water) && vsp>0) {
           vsp=-3-akey*1.5
           canstopjump=akey
           if (fall=12) fall=5
           playsfx(name+"jump",0,1.8)
        }
        else hurtplayer("enemy") exit
    }
    
    if (type=cheepred || type=cheepwhite) {
        if (jump && !calcfall && !size==5) {enemyexplode(coll) exit}
        else if (!calcfall && size==5 && jump) {
            if (vsp>0) {
            vsp=-3-akey*1.5
            canstopjump=akey
            if (fall=12) fall=5
            playsfx(name+"jump",0,1.8)
            } else {hurtplayer("enemy")} exit
        }
        else {hurtplayer("enemy") exit}
    }
    
    if (jump) {
        if (type=koopa || type=beetle || object_is_ancestor(type,koopa)) {
            if (vsp<0) {
                if (calcfall || size==5) hurtplayer("enemy")
                else enemyexplode(coll) exit
            }
        } else {
            if (!calcfall && size!=5) {enemyexplode(coll) exit}
            if (vsp<0) {hurtplayer("enemy") exit}
        }
        
        if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
        if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
        if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
        if (type=hammerbro) seqcount=max(5,seqcount)
        if (fall=12) fall=5                        
        if (size==5) {
            if (vsp>0) {
            vsp=-3-akey*1.5
            canstopjump=akey
            if (fall=12) fall=5
            playsfx(name+"jump",0,1.8)
            }
            else hurtplayer("enemy") exit
        }                        
        else enemystomp(coll) exit      
    } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 enemystomp(coll) exit}
    
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
fairdash=0
gianadash=0
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

if ((!size || size==5 || ohgoditslava) && !shielded && global.rings[p2]=0) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    fly=0
    jet=0
    climb=0 
    rise=0
    slide=0
    glide=0
    sprung=0
    fall=0
    pound=0  
    braking=0
    boost=0
    upper=0
    hyperspeed=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")
	sparklvl=1
    starhit=0
	randomsparksGO=60
		
	hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size>=3 size=2 size-=1}
	piped=1
	if (abs(hsp)) knockspr="knockrun"
	else knockspr="knockstand"
	throwsparks(x,y)
	alarm[5]=16
	charm_run("sprmanager")
    
}


//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (tpos && owner.stomp) exit
if (stonebump || owner.stomp && owner.size!=5 && !cracked) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
    if (!stonebump) {
        cracked=1
        i=instance_create(x,y,crackedbrick)
        i.owner=id
        i.biome=biome
        i.imcrack=1
        i.go=go
        i.tpos=1
        
    }
} else if (owner.size!=5) { 
    if (!insted) {owner.vsp=1.5}
    owner.blockc+=1
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
  } else if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
 }
} else if typeblockhit=1{
hititembox()
}


#define hitwall
//hit blocks sideways
if (firedash || (spin && abs(hsp)>0.5) || (super && fall=10)) {
    global.coll=id
    with (hittable) if (instance_place(x-other.hitside,y,other.id)) {	
		if global.coll.firedash go=sign(global.coll.vsp) else go=-1
        insted=1
        event_user(0)
		insted=0
    }
    coll=collision(hitside,0)
    if (firedash && jump) {fall=5 vsp=0}
}

if (coll=noone) exit

if (hurt) {hurt=0 fall=6 flash=1 fk=0}

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}

hsp=0
hyperspeed=0        


#define landing
braking=0
jet=0
jetdead=0
insted=0

if (downpiped) {
shoot(x-8,y+4,psmoke,-2,-1)
shoot(x+8,y+4,psmoke,2,-1)    
    downpiped=0
}

if (vsp>5 && !stamped && size!=5) {with (mydamager) {event="create" event_user(p2)} playsfx(name+"stomp") screenshake(x,4) stomp=1 com_piping() stomp=0 stamped=1}

playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1

//fall into spin
if (!spin && rise=0 && !hurt && down && abs(hsp)>=0.5) {
    spin=1
    hsp=3*xsc*wf
    playsfx(name+"spin")
    seqcount=1
}

//jump into tiny space
if (insted!=2 && !spin) {
	mask_temp(12,12)
	coll=collision(0,0)
	mask_reset()
	if (!coll && collision(0,0)) {
		spin=1
		mask_set(12,12) 
		playsfx(name+"spin")
		hsp=3*xsc*wf
	}
}


#define death
if (event="create"){
alarm0=60
alarm1=120
frame=0
sprite="dead"
jump=1
frspd=1
size=0
spindash=0
alpha=1
dest=0


name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
water=owner.water
mask_index=global.playermask[p2]
gravity=0.2

} 
else if (event="step"){
//1.9 moment
alarm0=max(0,alarm0-1)
alarm1=max(0,alarm1-1)
if alarm1=0 dest=1

coll=collision(0,vspeed)
if (coll && vspeed>0 && jump) {
    jump=0
    y=coll.y-14
    speed=0
    gravity=0
    playsfx(name+"stomp")
}

if (jump) sprite="deadair"
else sprite="dead"

if (dest) {c+=1 alpha=(c mod 5>2) if (c>60) instance_destroy()}

if (!irandom(5)) if (owner.water) instance_create(x+irandom_range(-16,16),y+irandom_range(-16,24),airbubble)
if (!irandom(10)) {playsfx(name+"splode") with (instance_create(x+irandom_range(-16,16),y+irandom_range(-16,16),dethplotion)) owner=other.owner sheet=other.sheet}
if (!irandom(30)) playsfx(name+"splode")

} else if (event="draw") {
	with dethplotion{
            draw_sprite_part(sheetshields,0,209+frame*25,48,24,24,round(x-12),round(y-12)) 
		visible=1
		
	}
}


#define enterpipe
if (type="side") {
	if (spin||crouch) {
		set_sprite("ball")
		frspd=min(1,0.1+abs(hsp/4))
		if (abs(hspeed)>=(maxspd-1) && !underwater()) {fastpipe=1 playsfx(name+"spin")}
	}
	if (boost) {fastpipe=1}
}
if (type="up") {
	//set_sprite("fly")
}
if (type="down") {/*set_sprite("pose") */if (stomp) fastpipe=1}

if (skidding) {soundstop("sonicskid") skidding=0}
soundstop("robolookup")
braking=0
crouch=0
push=0
turning=0
turndir=0



#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}

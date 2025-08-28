#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,brake,spring,jump,bonk,ball,spindash,push,hang,fire,upper,climb,climbstill,climbdown,glide,recover,slide,climbing,flagslide,piping,pipingup


#define soundlist
release,skid,spin,spindash,punch,uppercut,fire,reflect,land


#define movelist
Knuckles
#
[a]: Glide (air)
[down][b]: Pound (air) / Dig (ground)
While digging, you can move freely in the ground
<big>
Knuckles [mush]
#
[a]: Glide (air)
[b]/[up][b]: Punch
[down][b]: Pound (air) / Dig (ground)
While digging, you can move freely in the ground
<fire>
Knuckles [flwr]
#
[a]: Glide (air)
[b]/[up][b]: Flaming Knuckle
[down][b]: Pound (air) / Dig (ground)
While digging, you can move freely in the ground
<feather>
Knuckles [fthr]
#
[a]: Floating Glide (air)
[b]: Punch
[up][b]: Super Uppercut
[down][b]: Pound (air) / Dig (ground)
While digging, you can move freely in the ground


#define rosterorder
5

#define hud
if !dontdrawhud {
	drawdefaulthud()
}

#define grabbedflagpole
grabbedflagpole=1
hsp=0
vsp=0

#define start
energy=6
diggity=0
digvisible=0
mask_set(12,12)


#define stop
if (skidding) {soundstop(name+"skid") skidding=0}
star=0
grow=0
hurt=0
braking=0
spindash=0
spin=0
push=0
glide=0
climb=0
upper=0
diggity=0
punch=0

#define effectsfront
//glide ring
if glide && size=3 && glidetimer<30 draw_sprite_part_ext(sheet,0,10+floor(glidetimer/10)*17,87,16,32,round(x+8*xsc),round(y-12),1*xsc,1,$ffffff,1)
if parry>60 && !dontdraw{
	d3d_set_fog(true, c_white, 0, 1-((parry-90)/20))
	dontdraw=1
	ssw_core(0)
	dontdraw=0
	d3d_set_fog(false, c_black, 0, 0)
	
}
if parry<60 && parry && !dontdraw{
	d3d_set_fog(true, c_dkgray, 0, 3-((parry)/30))
	dontdraw=1
	ssw_core(0)
	dontdraw=0
	d3d_set_fog(false, c_black, 0, 0)
	
}



#define itemget
if (type="jumprefresh") {	if (fall=4) fall=0
	mc=0
}
if (type="mushroom") {
	if ((!diggity && !piped && !hurt && !(global.mplay>1 && flash))) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("")
		if (skidding) {soundstop(name+"skid") skidding=0}
		if (size=0) grow=1
		energy+=2
		oldsize=size
		size=max(size,1)
		itemget=1
	}   
}
if (type="fflower") {
	if ((!diggity && !piped && !hurt && !(global.mplay>1 && flash))) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		if (skidding) {soundstop(name+"skid") skidding=0}
			if (!super && size!=2) grow=1
			playgrowsfx("2")
			energy+=4
			oldsize=size
			size=2
		
		itemget=1
	}                
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
if (type="star") {
	if ((!diggity && !piped && !hurt && !(global.mplay>1 && flash))) {
		coll=other.id
		doscore_p(1000)
		sound("itemstar")
		itemc+=1
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
	if (super) superpower=6000
	energy=maxe
	itemget=1
	with (instance_create(other.x,other.y-16,scoreeffect)) value=10
}
if (type="shield") {
    if ((!diggity && !piped && !hurt && !(global.mplay>1 && flash)) || other.object_index=robochain) {
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
	if (!diggity) {
		
			sound("itemcoin")
			if (other.fresh) global.scor[p2]+=100
			global.coins[p2]+=1
			coint+=1
			hit=1
		
		itemget=1
	}
}
if (type="ring") {
    if (!diggity) {
        
            sound("itemring")
            if (other.fresh) global.scor[p2]+=100
            global.rings[p2]+=1
            hit=1
        
        itemget=1
    }
}
#define endofstage
down=1
bkey=1
grabbedflagpole=0


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
				with (coll) if spin {if sign(hsp)!=other.owner.xsc  {hsp*=-4 xsc*=-1 instance_create(x,y,kickpart)} } 
			}
			 
		}
	}



#define projectile
if (event="create") {

	image_xscale=8
	image_yscale=8
	vspeed=0
	last=24
	friction=0.1
	seqcount=2

	frame_sub=0
	frame=0
	brickc=0
	

	timer0=3
	timer1=128
	if owner.vert_proj=0{
	if (sign(owner.hsp)=owner.xsc) hspeed=owner.hsp*0.5+4*owner.xsc
        else hspeed=4*owner.xsc	
		xsc=sign(hspeed)}
		
	if owner.vert_proj=1{
	hspeed=0
	vspeed=-4
	xsc=owner.xsc
	}
}
if (event="step") {
	timer0-=1 if (timer0=0) visible=1
	timer1-=1 if (timer1=0) instance_destroy()
	calcmoving()

	last-=1

	frame=2-floor(last/8)
	if (last=0) instance_destroy()
	
	if (!inview()) instance_destroy()
	

	coll=instance_place(x,y,collider)
	if (coll) {
		if (object_is_ancestor(coll.object_index,hittable)) {
			if (coll.object_index=brick) brickc+=1 else brickc=4
			hitblock(coll,owner,1,-1,0)
			instance_create(x,y,kickpart) 
		}    
		if (brickc=4) {sound("itemblockbump") instance_destroy()}
	}

	coll=instance_place(x,y,enemy)
	if (coll) {                    
		global.coll=owner.id
		enemydie(coll,2)
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
				with (coll) hurtplayer("enemy")
			}
			instance_create(x,y,kickpart) instance_destroy()
		}
	}
}
if (event="draw") {
        if (vspeed=0) {draw_sprite_part_ext(sheet,0,64,69+17*frame,32,16,round(x-24*xsc),round(y-8),xsc,1,$ffffff,1)}
        else {draw_sprite_part_ext(sheet,0,10+(17*frame),87,16,32,round(x-8),round(y-8),1,1,$ffffff,1)}
    }


#define sprmanager
frspd=1
if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}
else if (spindash) {sprite="spindash"}
else if (crouch || land) {sprite="crouch"}
else if (jump) {
if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
	else if (transform) {sprite="transform"}
	
    else if (glide && !upper) {sprite="glide" if (!skindat("glideanim"+string(p2))) {frspd=0 frame=0.5+abs(ggf)*1.5}}
    else if (climb) {if vsp<0{sprite="climb"} else if vsp>0 {sprite="climbdown"}else sprite="climbstill" frspd=1}
	else if !upper&&didupper &&vsp>1 sprite="recover"
	else if (upper||didupper) {if (size) {sprite="upper"} else sprite="ball"}
   
    else if (sprung) {sprite="spring" if (vsp>=0) {sprung=0 fall=1}}
    else if (fall) {
        if (fall=1) sprite="walk"
        if (fall=2) sprite="run"
        if (fall=3) sprite="brake"
        if (fall=4) {sprite="recover"}
        if (fall=5) {sprite="ball" frspd=jumpspd}
        if (fall=6) {sprite="knock"}
        if (fall=11) {if (size) {sprite="upper"} else sprite="ball"}
        if (fall=12) {sprite="ball"}
    } else if (bonk) sprite="bonk"
    else {sprite="jump" frspd=jumpspd}
} else {
    if (diggity) {
        if (diggity<=32) {sprite="ball"}
        else if (size) {sprite="upper"} else {sprite="ball"}
    } else if (upper) {sprite="upper"}
    else if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
    else if (fired) {sprite="fire"}
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
    else if (hsp=0) {
        if (hang) {sprite="hang"}
        else if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (slide) sprite="slide"
        else if (braking) sprite="brake"
        else if (abs(hsp)>maxspd*0.9 && (!water || abs(hyperspeed)>1) && !finish) {sprite="run" frspd=abs((hsp+hyperspeed*water*3)/3)}
        else {sprite="walk" frspd=0.2+abs((hsp+hyperspeed)/4)}
    }
}

#define grabflagpole
grabflagpole=1
hsp=0
vsp=0

#define controls
com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (rise!=0 || slide || upper || watrlock || hurt || piped) {
    di=0
    exit
}

if (diggity) {
    if (diggity<32) {
        hsp=median(0,abs(hsp)-0.2,2)*sign(hsp)
        if (collision(hsp,0)) hsp=0
		diggyy=y
		xdig=x
    }
    if (diggity=32) {
        if ((left || right || up || down) && global.dustframe) {o=instance_create(x,diggyy+16,digsmoke) o.p2=p2}
        {
			x+=hspdig
			diggyy+=vspdig
            hspdig=right-left
			vspdig=down-up
			if diggyy+vspdig>y+16 {diggyy=y+16 vspdig=0}
			savemyy=y
			y=diggyy
			
			
            if  ((!knuxcandig(instance_place(x+8*hsp,y+18+vspdig,collider))  && place_meeting(x+8*hsp,y+18+vspdig,collider)) ) 
			    { 
					hspdig=0 
					if !knuxcandig(collposinst(8*hsp,18+vspdig,collider)) vspdig=0  
				}
			else if !place_meeting(x+8*hsp,y+18,ground){ 
				x+=hsp y=diggyy+vspdig  diggity=0  
				if vspdig<0 {upper=1 y-=1 actualy=y} 
				else { //If i'm coming out of the ground going down do this, only possible on one block tall ground
					y+=8 
					actualy=y
					fall=12
					vsp=6
					hsp=0
					glide=0
					shoot(x,y,psmoke,-1,-2)
					shoot(x,y,psmoke,1,-2)
					playsfx("knuxrelease")

				} 
			} else{
				diggyy+=vspdig
				y=savemyy
			}
		}
        xsc=esign(hsp,xsc)
        if (!collision(0,1)){y+=1}
		digvisible=1
		if energy=0 y=actualy
		if ((!bkey || energy=0) ) {x=startdigx y=startdigy  actualy=y diggity=0 upper=1} 
		digy=0
		y=actualy
    }
    exit
}

if (up) com_piping()
oup=up

if (up && !hang) {
    if (hsp=0 && !jump) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (rise!=0 || climb || spindash || land || (crouch && !jump) || (fired && !jump)) h=0

//movement
if (h!=0 && !wallkick) {
    loose=0
    coll=noone
    if (h=sign(hsp) || hsp=0) coll=collision(h,0)
    if (coll) if (object_is_ancestor(coll.object_index,moving)) coll=place_meeting(x+h,y+coll.vsp+sign(coll.vsp),coll)
    if (coll) if (player_climbstep(coll)) coll=noone
    if (x<=minx && left) coll=1
    if (coll) {
        com_hitwall(h)
        //push/turn
        if (!jump && !spin && !crouch) {
            //pushing animation
            push=h
            xsc=h
            braking=0
            hitblock(coll,id,1,-1,0)
        }
    } else if (fall=4) {
        xsc=h hsp=median(-1.5,hsp+0.1*h,1.5)
    } else if (fall=11) {
        hsp=median(-0.5+xsc,hsp+0.1*h,0.5+xsc)
    } else {
        if (spin) {
            if (sign(hsp)!=h) hsp+=h*0.05*wf
        } else {
            if (!jump) {
                if (sign(hsp)!=h) {
                    if (abs(hsp)>maxspd*0.8) {
                        braking=1
						skidding=1
						playsfx(name+"skid")
                        brakedir=h
                    }
                    hsp+=0.33*wf*h
                    if (abs(hsp)<0.5) xsc=h
                } else {
					if (abs(hsp)<maxspd)
                    hsp+=0.06*wf*h
                    braking=0
                    xsc=h
                }
            } else {
				if (abs(hsp)<maxspd ||sign(hsp)!=h)
                hsp+=0.08*wf*h
                xsc=h
            }
        }
    }
}

if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && !springin) {
    if (!jump || climb ||fall=69) { //jump
        if (hsp==0 && crouch && push==0 && size) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
            land=0
        } else if (!land) {
            jumpsnd=playsfx(name+"jump")

            vsp=-4.7
			onvine=0
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)

            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/2)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)

			i=shoot(x,y+4,psmoke,hsp,-2) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.05
			i=shoot(x,y+16,psmoke,2,-0.5) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
			i=shoot(x,y+16,psmoke,-2,-0.5) i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75

			sprite_angle=0


            jump=1
            fall=0
            braking=0
            spin=0
            canstopjump=1
            if (mymoving) hsp+=avgmovingh
            if (climb) {climb=0 vsp=-2 hsp=-3*sideclimb xsc*=-1}
            crouch=0
            if (spin && !star) seqcount=0
            jumpspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps
        if ((!fall || fall=5)&& !didupper) {
            glide=1
            fall=0
          if (size=3) {if vsp>-1.5 vsp=-1.5}
            vsp-=0.5
            glidec=max(0,abs(hsp)-2)
            glidev=vsp

            gg=xsc
            ggf=xsc
        }
        jumpbuffer=4*!jumpbufferdo
    }
}
jumpbufferdo=0
springin=0

if (akey) {
    if (jumpbuffer) jumpbuffer-=1
    if (name="fang") {
        if (down) {
            bounce=1
        }
        if (!jump && bounce) {
            vsp=-5
            jump=1
        }
        //fall=0
    }
} else jumpbuffer=0

if (!akey) {
    if (canstopjump=1 && jump && vsp<-2 && !sprung && !glide) {
        //jump height control
        vsp*=0.5
    }
    canstopjump=0
}

if (!akey) {
    if (glide) if fall!=69{glide=0 fall=4 xsc=gg frame=0}
	else{glide=0 upper=0 }
}

//code for specifically the b button

if (bbut) {
    if (spindash) {
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } else {
        if (down) {
            if (!fired && !upper && !didupper && !diggity && !climb && jump && (fall=0 || fall=4)) {
                fall=12
                vsp=6
                hsp=0
                glide=0
                shoot(x,y,psmoke,-1,-2)
                shoot(x,y,psmoke,1,-2)
                playsfx("knuxrelease")
            }
        } else if (size) {
            if (up && !didupper) {
                if (!spindash) {
                    upper=1
					didupper=1
                    crouch=0
                    spin=0
                    frame=0
					glide=0
					//vsp=-4
					//jump=1
                }
            } else if (!spin) {
				if parry{
					if parry>60{
						if (size=2 && energy>=2 && !crouch && fall!=4 && fall!=11 && !fired) {
							energy-=2
							vert_proj=0
							parry=60
							fire_projectile(x+8*xsc,y+2+8*glide)
							playsfx("knuxfire")
							if (!jump) fired=16
						} else if (!jump && !fired) { parry=60 fired=16 hsp=h*maxspd playsfx("knuxpunch")}
					}
				}else parry=90
				
            }
        }
    }
}

if (bkey) {
    if (down && !fired && !upper && !spindash && !diggity && !climb && !jump) {
        //"The echidna has two claws on each hand, and his dominant trait is his strength and is used to dig." - the sacred texts
        if (knuxcandig(collision(0,4-digy))) {
			actualy=y
			startdigx=x
			startdigy=y
            diggity=1
            playsfx("knuxspin")
            sound("itemblockbreak")
            com_piping()
        }
    }
}

if (cbut) {
    if (spindash || (crouch && down && size)) {
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } 
}


//crouching and spinning
if (down && !up) {
    if (!jump && !braking && !spin) {
        if (abs(hsp)<0.5) {
            if (!crouch && !carry) {
                crouch=1
            }
        } else if (!upper && !fired && !spin && !crouch) {
            spin=1
            playsfx("knuxspin")
        }
    }
    com_piping()
} else {
    if (!jump) crouch=0
}

if (spin || spindash || crouch || size=0 || fall=5 || diggity || fall=12 || slide) mask_set(12,12)
else if (jump && !fall) mask_set(12,15)
else mask_set(12,24)


#define movement
if (piped) exit

if (checkland == 41 && !jump && !land) {land=16 playsfx(name+"land") fall=0 hsp=0} //This is for Knuckles landing onto the floor after a glide cancel.
checkland=(fall*10)+jump
land-=1

if (diggity) {
    if (camwalll && x<view_xview[p2]+7) {x=view_xview[p2]+7 hsp=0}
    if (camwallr && x>view_xview[p2]+393) {x=view_xview[p2]+393 hsp=0}
    x+=hsp
    calcmoving()
} else {
    if (((loose && !jump) || spin || (crouch && !jump))) {
        braking=0
        frick=0.06
        if (spin) frick=0.005
        hsp=max(0,abs(hsp)-frick)*sign(hsp)
    }

    maxspd=(3.25+!!size*0.75+spin)*wf
	
	//There's an extra check in the hsp+= section of h!=0 to compensate!.
	//Can you believe it, I don't give a shit about manually capping a character's speed anymore!
	//if (abs(hsp)>maxspd) {
	//	if (!spin && !(jump && !fall) && !glide) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)
	//}
	
    if (!glide && abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

    vsp=min(7+downpiped,vsp)

    calcmoving()

    if (!dead && !grabflagpole) {
		if fall!=69
        player_horstep()
        yground=easyground()
		if (yground!=verybignumber) yground-=14
		if !glide glidetimer=0
		if (jump) {
            if (glide) {
				if (size=3) {
					glidetimer+=3
					vsp+=0.01
					if vsp<-0.5 vsp=-0.5
				  } else {vsp+=0.10}
            } else {
				if (megadrill){
					vsp+=0.15*down-0.15*up
				} else {
					if fall!=69 {
						vsp+=0.15*wf
					} 
					crouch=0 spindash=0
				}
            }
			vine_climbing()
            braking=max(0,braking-1)
            if (climb) {vsp=(down-up)*wf if size=3 vsp*=2}
            if (slide) slide=0
            if (sprung && !fall) fall=1
            push=0 spin=0
            rise=0 risec=0
            coyote=0
		osld=0
		player_vertstep()
		if (!jump) sld=point_direction(0,0,1,slobal)
		}

	sprite_angle=0
	if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
	else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3

	if (!jump) {
		if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
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
            if (!collision(0,4) && (y<yground-2)) {
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
                if (!slide && rise=0 && !down) jumpbufferdo=1
            }
        }
    }
    com_finishmove()
}
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
	
	//the actual bot itself
	
	akey=0
	if my_leader.x>x+(16*!jump) right=1
	if my_leader.x<x-(16*!jump) left=1

	if my_leader.y<(y-32)&&my_leader.jump =0 akey=1
	//if my_leader.y<(y-12)&&my_leader.jump akey=1
	if my_leader.down down=1
	if my_leader.spindash&&abs(hsp)<0.5&&!jump{xsc=my_leader.xsc spindash=my_leader.xsc}
	if my_leader.abut && !jump {jumpwait=abs(my_leader.x-x)/max(abs(my_leader.hsp),1)  }
	
	if !jump {if jumpwait {jumpwait-=1 if jumpwait<=1 akey=1}}
	
	
	//Sonic characters only
	if !right && !left && down && my_leader.spindash {akey=1 spindash=my_leader.spindash}

	if vsp>0 canstopjump=0
	if jump && (my_leader.vsp+my_leader.y) <(y+16)&&canstopjump &&vsp<-1 {akey=1 cpu_akeystuck=0}
	if size=2 && my_leader.bbut && !my_leader.jump &&!jump && abs(my_leader.x-x)<32 if !collision(xsc*4,0) {bkey=1}
	
	
	////Some good pathfinding to avoid bots spamming jump/GEtting stuck with obvious solutions
	if push!=0 && !instance_place(x+8*xsc,y-32,collider) akey=1
	if !jump
	if collision_line(x,y-8,my_leader.x,my_leader.y,collider,0,1){
		//Determine where the thing is.
		
		if push=0{ //Unlikely that there's something between us horizontally, let's check vertically.
			
	
		} else{	//Ah shit there's something here, it's unlikely I can just jump it away.
			if collision_line(x,bbox_bottom-2,my_leader.x,my_leader.bbox_bottom-2,collider,0,1){
				//It's not a tube. (From here characters would likely react differently)
				
				//Okay uhhhh... Yeah shit.
				
			} else if push!=0{ //Oh it's just a tube lmao (Found a small tunnel, characters will react differently.)
				if crouch akey=1
				down=1
				if spindash>3 down=0
			}
			
		}	
	}
	
	
	//Back to general stuff
	if akey cpu_akeystuck+=1 else cpu_akeystuck=0
	if cpu_akeystuck>5{akey=0 cpu_akeystuck=0}
	
    if !inview() {x=my_leader.x y=my_leader.y}

//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || ((owner.size=0 && !biggie) || (owner.size && biggie)) && insted!=1 && !owner.tempkill && cracked=0) { //break spiner
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

} else if ((owner.size || (!owner.size && owner.spin && !biggie && owner.y>=y)) && !tpos) { 
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
    i=instance_create(x+4,y+12+(16*biggie),part) i.hspeed=-1 i.vspeed=-1+2*go
    i=instance_create(x+12+(16*biggie),y+12,part) i.hspeed=1 i.vspeed=-1+2*go 
    i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
    i=instance_create(x+12+(16*biggie),y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    
    with (turing) event_user(4)
    instance_destroy()
  } else if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
 }
} else if typeblockhit=1{
	hititembox()
}

#define actions
com_warping()
com_actions()

weight=0.5+0.5*!!size
bartype=0

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || diggity || piped=1 ) is_intangible=1

power_lv=0
is_coinexplosive=0
if (megadrill ||spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (climb) power_lv=0
if (glide && size>0) power_lv=2
if (fall=12 || diggity) {power_lv=3 is_coinexplosive=1}
if (upper) is_coinexplosive=1

if (star) power_lv=5
if (super) power_lv+=1

if (piped) exit

//Special interactions
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=0 //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

break_crackedground=1+2*(sign(diggity)||fall=12) //1 for Horizontal only, 2 for Vertical 3 for All directions
//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

if (!jump) {
    vsp=0
    if (!star && !spin && !spindash) seqcount=0
    if ((sprite="stand" && hsp=0) || hang) {
        image_xscale=1/6
        hang=(!instance_place(x,y+4,collider) && instance_place(x-7*xsc,y+4,collider))
        image_xscale=1
    } else hang=0
    if (push=0 && hsp!=0 && braking) {
        playsfx(name+"skid")
    } else if (skidding) {soundstop(name+"skid") skidding=0}
}

if (underwater()) {
    if (!water) {
        if (abs(vsp)>2) water_splash(1)
        vsp=min(1,vsp/2)
        jumpspd=1
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
	if (abs(hsp)>=maxspd-0.25)&&!jump {
		i=shoot(x-12*xsc,y+12,psmoke,-hsp*0.25,0) i.drag=1 i.growsize=-1
		vd=point_direction(0,0,-hsp*0.25,vsp)+point_direction(0,0,1,slobal/1.5)
		vm=point_distance(0,0,-hsp*0.25,vsp)
		i.hspeed=lengthdir_x(vm,vd)
		i.vspeed=lengthdir_y(vm,vd)
	}
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

//Max energy
maxe=4+2*!!size

//Parry Timing
if (parry){
	parry=max(0,parry-1)
}


//Gliding +Climbing
if (glide) {
    glidev=max(0.25,glidev-0.1)
    vsp=min(glidev,vsp)
    glidec=min(1+(size>0),glidec+0.02)
    if (right) gg=1
    if (left) gg=-1
    if (gg=0) gg=xsc
    ggf=min(1,max(-1,ggf+sign(gg-ggf)/25))
    if (size=3) {hsp=(2.5+glidec)*ggf*max(0.5,wf)} else {hsp=(2+glidec)*ggf*max(0.5,wf)}
    xsc=esign(hsp,xsc)
}
if (climb) {
    hsp=0 xsc=sideclimb tempkill=1
    if (!knuxcanclimb(collision(sideclimb*8,-10))) y+=1
    if (!collision(sideclimb*8,-6)) {climb=0 jump=0 rise=sideclimb risec=0 x+=sideclimb*4 y-=6 vsp=0}
    if (instance_place(x+8,y,axewall) || (!collision(sideclimb*4,6) && down)) {climb=0 fall=4}
}
if (slide) {hsp-=sign(hsp)*0.1 if (abs(hsp)<0.1) {slide=0 hsp=0 if (size) rise=xsc}}
if (rise!=0) {crouch=1 hsp=0 xsc=rise risec+=1 if (risec=10-5*(size=0)) {risec=0 rise=0 crouch=down}}
if (fall=4 && vsp<-2.5) fall=1
if (upper) {
    upper=min(16,upper+1)
	canstopjump=0
    if (upper=5 && size=2 && energy>=2) {
        energy-=2
		vert_proj=1
		fire_projectile(x+8*xsc,y-20)
        playsfx("knuxfire")
		jump=1 vsp=-4
    } else if (upper=5) {playsfx("knuxuppercut")jump=1 vsp=-4 if size=3 vsp=-5}
    if (upper=16) upper=0
}
//Digging
if (diggity) {
    com_piping()
    if (piped) diggity=0
    else {
        if (!collision(0,16-digy)) {y+=diggity/2 diggity=0 fall=0 jump=1 vsp=1 depth=0}
        else {
            if (diggity!=32) {
                diggity+=1
				digy+=0.3
				if instance_place(x,actualy+digy,collider)||instance_place(x,actualy+digy,phaser) y=digy+actualy
                if (!collposinst(-8,18,collider)) x+=1
                if (!collposinst(8,18,collider)) x-=1
                if (diggity<32) {
                    energy=6
                    mcs=0
                    xdig=x
                    if (!(diggity mod 8)) {
                        i=instance_create(x-6,y+16,part) i.hspeed=-1 i.vspeed=-5
                        i=instance_create(x+6,y+16,part) i.hspeed=1 i.vspeed=-5
                        shoot(x-8,y+20,psmoke,-2,-1)
                        shoot(x+8,y+20,psmoke,2,-1)
                        sound("itemblockbreak")
                    }
                }
                if (diggity>32) {
                    if (diggity=34) {
                        hsp=0.5*xsc
                        i=instance_create(x-6,y+16,part) i.hspeed=-1 i.vspeed=-5
                        i=instance_create(x+6,y+16,part) i.hspeed=1 i.vspeed=-5
                        i=instance_create(x-12,y+16,part) i.hspeed=-1.5 i.vspeed=-3
                        i=instance_create(x+12,y+16,part) i.hspeed=1.5 i.vspeed=-3
                        shoot(x,y+16,psmoke,0,-0.5)
                        shoot(x-8,y+20,psmoke,-2,-1)
                        shoot(x+8,y+20,psmoke,2,-1)
                        playsfx("knuxrelease")
                        playsfx("knuxupper")
                        sound("itemblockbreak")
						y=actualy
						upper=1
                        if (size=2) {
                            vert_proj=1
							fire_projectile(x+8*xsc,y+2+8*glide)
                            playsfx("knuxfire")
                        }
						diggity=0
                    }
                    if (collision(1,0)) x-=1
                    if (collision(-1,0)) x+=1
                }
            } else {
                if (mcs>=160) {energy-=2 mcs=0}
            }
            if (diggity>=48) {diggity=0 fall=11 vsp=-2.5*wf jump=1 depth=0 y=actualy}
            depth=1000001
        }
    }
} else {digvisible=0 if (depth=1000001) depth=0}

if !(diggity && diggity<=32){
    if (mcs>=90) {energy+=2 mcs=0}
}


if (fall=11 && vsp>1) fall=4

//spindash/spin
global.coll=id
if (spindash || spin) {
    coll=instance_position(x-10*sign(hsp),y+22,hittable)
    coll2=instance_position(x,y+22,hittable)
    collmon=instance_position(x,y+22,monitor)
    if (collmon) {
        jump=1 spindash=0 spin=0 vsp=-2
        with (collmon) event_user(6)
    }
    if (spindash) coll=coll2
    else if (coll2) if (coll2.object_index!=brick) coll=coll2
    if (coll) if (coll.hit) coll=0
    if (coll=spinblacklist) coll=0
    if (!coll)
        with (hittable)
            if (id!=other.spinblacklist && (object_index!=brick || other.spindash) && !hit)
                if (instance_place(x,y-4,other.id)) other.coll=id
    
    if (coll) if (!coll.goinup || tempbrick || name="robo") {
        i=coll.object_index
        hitblock(coll,id,0,1,0)
        if (i=brick) {spinblacklist=coll if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf}}
    }
    
    if (spindash) {
        spindash=max(1,spindash-0.025)
        if (!crouch) {
            if (name="sonic" && spindash>3) boost=1
            spin=1
            hsp=xsc*6*(0.75+0.25*median(0,spindash-1,2)/2)
            spindash=0
            if (name="robo") {
                hsp=3
                playsfx("robospin")
            } else {
                soundstop(name+"spindash")
                playsfx(name+"release")
            }
        }
        if (hsp!=0) spindash=0
    }
    
    //stop spinning
    if (abs(hsp)<0.2 && spin) { 
            spinc+=1 if (spinc=8) {
            mask_temp(12,24)
            if (collision(0,0) && size) {
                xsc=esign(h,xsc)
                hsp=xsc
                spinc=0
                spin=1
            } else {
                spinc=0
                spin=0    
                hsp=0
                soundstop(name+"spin")
                crouch=down
            }
            mask_reset()
        }   
    }
} else spinblacklist=noone

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
    
	if (parry>60) {
		if (size=2 && energy>=2 && !crouch && fall!=4 && fall!=11 && !fired) {
			energy-=2
			vert_proj=0
			fire_projectile(x+8*xsc,y+2+8*glide)
			playsfx("knuxfire")
			if (!jump) fired=16
		} else if (!jump && !fired) {fired=16 hsp=esign(h,xsc)*maxspd hyperspeed=esign(sign(hsp),xsc)*2 playsfx("knuxpunch")}
		enemyexplode(coll)
		parry=0
        exit
	}
	
	
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
    if (climb && !(!coll.kicked || (coll.stop && (coll.owner=id || coll.vspeed>=0)))) {hurtplayer("enemy") exit}
    
    if (star  
    || (spin && type!=spinyegg && type!=beetle && !object_is_ancestor(type,koopa) && type!=shell)) {
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
            sound("enemystomp")
            vsp=-3-akey*1.5
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
		else if (type=koopa|| object_is_ancestor(type,koopa)) { with enemyflip(coll) {y-=3 vspeed=-3 intangible_timer=30} exit }
        else if (type=beetle ) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}	
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
            if ((name="luigi" || name="mario") && bkey && !carry && !punch) {
                coll.carry=id coll.owner=id coll.alarm[1]=600 coll.alarm[2]=-1 carryid=coll
                carry=1
            } else { 
                if (coll.stop && !coll.kicked) doscore_p(8000)
                else {seqcount=max(seqcount,2+scorelok1) doscore_p()}
                if (jump) {
                    if (vsp>0) {
                        vsp=-3-akey*1.5
                        canstopjump=akey
                        if (name="giana") {twirl=0 insted=1}
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
        if (type=koopa || type=beetle || type=rexbig || object_is_ancestor(type,koopa)) {
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
if ((invincible() && (hurt || flash)) || intangible())

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
onvine=0
if (super) stopsuper()   

if ((!size || ohgoditslava) && !shielded && global.rings[p2]==0) {
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

    starhit=0
    
	
	jump=1 hurt=1+starhit 
	if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings()} else  {if size>=3 size=2 size-=1} hsp=xsc*-2*wf vsp=-3*wf
    
}


#define hitwall
upper=0

didupper=0
//hit blocks sideways
if ((spin && abs(hsp)>0.5) || ((!jump && size) || (!up && !down && glide))) {
    s=vsp
    global.coll=id
    with (hittable) if (instance_place(x-other.hitside,y,other.id)) {
        if (other.glide) go=1 else go=-1
        insted=!(!other.size && !other.spin)
        event_user(0)
        insted=0
    }
    coll=collision(hitside,0)
    if (glide) vsp=s
}

if (coll=noone) exit

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
    
    //glide slideup
    if (((glide && !down) && y<coll.y-6 && vsp<0))
        with (coll) if (!collision(0,-4)) {other.y-=3 other.coll=noone exit}
}

if (glide) {
    if (knuxcanclimb(coll)) {climb=1 com_piping() glide=0 sideclimb=esign(hitside,xsc)}
}

hsp=0
hyperspeed=0           


#define landing
upper=0
i=shoot(x,y+16,psmoke,2,0.25) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
i=shoot(x,y+16,psmoke,-2,0.25) i.growsize=1 i.image_xscale=0.25 i.image_yscale=0.25
didupper=0
braking=0
glidec=0
didupper=0
actualy=y
if (downpiped) {
    shoot(x-8,y+4,psmoke,-2,-1)
	shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}
           
playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1

if (fall=12) {
    if (down && bkey && knuxcandig(collision(0,4-digy))) {
		actualy=y
        diggity=1
        fall=0
        vsp=0
        playsfx("knuxspin")
        sound("itemblockbreak")
        com_piping()        
    } else {
        shoot(x-8,y+4,psmoke,-2,-1)
        shoot(x+8,y+4,psmoke,2,-1)
        rise=xsc               
    }
}

if (climb) {climb=0 rise=xsc}
if (glide) {slide=1 hsp=(2.5+(size>0)+glidec)*ggf glide=0}

//fall into spin
if (!spin && rise=0 && !slide && !hurt && down && abs(hsp)>=0.5) {
    spin=1
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
		hsp=max(abs(hsp),2)*esign(hsp,xsc)
	}
}

#define death
if (event="create"){

alarm0=30
alarm1=300
sprite="dead"
frame=0
frspd=1
spindash=0
alpha=1


name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
water=owner.water
vspeed=-3.5 gravity=0.1

} 
else if (event="step"){
alarm0=max(0,alarm0-1)
alarm1=max(0,alarm1-1)

if alarm1=0 instance_destroy()
} else if (event="draw"){

}


#define enterpipe
if (type="side") {
	if (climb) {climb=0 set_sprite("glide") frame=frame_number(sprite)}
	if (spin) {
		set_sprite("ball")
		frspd=min(1,0.1+abs(hsp/4))
		if (abs(hsp)>=3 && !water) {fastpipe=1 playsfx(name+"spin")}
	}
}
if (type="down") {
	if (diggity) {diggity=0 set_sprite("ball") frspd=0.5}
}

if (skidding) {soundstop("knuxskid") skidding=0}
braking=0
crouch=0
push=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}

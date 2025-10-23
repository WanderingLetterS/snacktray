#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,flyfast,brake,spring,airwalk,jump,bonk,ball,spindash,spincharge,push,hang,fire,flyup,fly,flydown,flytired,swim,climbing,flagslide,tailspin,tailidle,handlegrab,piping,pipingup,sidepiping,doorenter,doorexit


#define soundlist
release,skid,spin,spindash,throw,bomb,fly,swim,superfly,peelcharge,peelrelease


#define movelist
Tails
#
[a]: Fly (air)
[b]: Superfly
[c]: Cancel Flight
<fire>
Tails [flwr]
#
[a]: Fly (air)
[b]: Superfly (air) / Toss Bomb (ground)
[c]: Cancel Flight
<feather>
Tails [fthr]
#
[a]: Fly (air)
[b]: Superfly
[c]: Cancel Flight


#define rosterorder
13

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()

#define grabflagpole
grabflagpole=1
hsp=0
vsp=0
fly=0
superdashactive=0 
superdashspeedboost=0
superdash=0
boost=0




#define start
energy=6
mask_set(12,12)

for (i=0;i<global.animdat[p2,0];i+=1) {
	if (string(global.animdat[p2,16+128*i])=="tailspin") {tail_spin_sid=i}
	else if (string(global.animdat[p2,16+128*i])=="tailidle") {tail_idle_sid=i}
}


#define stop
if (skidding) {soundstop(name+"skid") skidding=0}
star=0
grow=0
hurt=0
braking=0
superdashed=0
superflyactive=0
superfly=0
spindash=0
spin=0
push=0
fly=0 tired=0


#define itemget
if type="jumprefresh" energy=maxe
com_item()

#define effectsbehind
if tail_draw=0{
	if (sprite="ball" || sprite="jump" || sprite="bonk" || sprite="specfall" || sprite="grind"){
		funkysid=tail_spin_sid
		tail_draw=1
	} else if (sprite="stand" || sprite="wait" || sprite="lookup" || sprite="crouch"){
		funkysid=tail_idle_sid
		tail_draw=1
	}
	if tail_draw=1{	
		drawx=x
		drawy=y
		drawxsc=xsc
		drawysc=ysc
		if funkysid=tail_spin_sid{
			saveangle=sprite_angle	
			sprite_angle=dir
			drawxsc=-abs(xsc)
			drawysc=abs(ysc)
		} else {
			drawx-=xsc*6
		}
		if funkysid=tail_spin_sid{
			drawx+=lengthdir_x(floor(sprcx*1)-margin,dir)
			drawy+=lengthdir_y(floor(sprcy+24)-margin,dir)*0.45+5
			//due to the ball sprites being lowered from the regular sprite center, we must apply an offset in here, change it at your leasure.
		}
		
		k=16+128*funkysid
		tailfrn=global.animdat[p2,k+1+min(4,size)]
		tailfrl=global.animdat[p2,k+7]-1
		tailframe+=(global.animdat[p2,k+6])/max(1,global.animdat[p2,k+8+floor(tailframe)]) //Animate tails
		if (tailframe<0) tailframe+=tailfrn
		if (tailframe>=tailfrn) {tailframe=tailframe-tailfrn if (tailfrl<tailfrn) tailframe+=tailfrl}
		
		funkysplitpadding=0
		fullsid=funkysid
		funkyoi=0	
		funkysplitpadding=global.spritelistpadding[p2,funkysid]	
		ssw_frx=floor(tailframe)+global.animationstartX[p2,funkysid]
		
		funkysid=global.animationstartY[p2,funkysid]
		
		c=blend
		if !blend c=$ffffff
		
		if (sprite_angle!=0) draw_sprite_general(
		//  sprite, subimage
			sheets[size],0,
		//  left, top
			funkysplitpadding+8+ssw_frx*sprw+margin,skin_offsety+funkysid*sprh+margin,
		//  width, height
			sprw-1-margin*2,sprh-1-margin*2,
		//  left top corner of the quad, accounting for rotation
			round(drawx)+lengthdir_x((margin-(sprcx/divisio))*drawxsc*pxsc*mxsc,sprite_angle)+lengthdir_x((margin+((dy-(14+sprcy))/divisio))*drawysc*mysc+14,sprite_angle-90),
			round(drawy)+lengthdir_y((margin-(sprcx/divisio))*drawxsc*pysc*mysc,sprite_angle)+lengthdir_y((margin+((dy-(14+sprcy))/divisio))*drawysc*mysc+14,sprite_angle-90),
		//  scale and rotation
			(drawxsc/divisio)*pxsc*mxsc,(drawysc-((size==5 && !minisheet)/2))*pysc,sprite_angle,
		//  blending
			c,c,c,c,alpha*(1-0.75*shadow)
		)
		else draw_sprite_part_ext(
			sheets[size],0,
			ceil(funkysplitpadding+8+ssw_frx*sprw),ceil(skin_offsety+funkysid*sprh),
			sprw-1,sprh-1,
			round(drawx-sprcx*drawxsc*pxsc*mxsc), //drawxsc =direction PXSC = Pipe Squishing MXSC=Modifiable drawxsc
			round(drawy+(dy-(14+sprcy))*drawysc*pysc*mysc+14),
			drawxsc*pxsc*mxsc,drawysc*pysc*mysc,
			c,1*(1-0.75*shadow)
		)
		
		ssw_frx=savefrx

		tail_draw=0
		sprite_angle=saveangle
		
	}
}

#define effectsfront
com_spindashdust()

#define endofstage
right=1
grabflagpole=0
if (hsp>=3 || push) {
	akey=1
	bkey=!(jump && vsp<-1)
}


#define projectile
if (event="create") {
	explod=0
	red=0
	explodtimer=0
	image_xscale=6
	image_yscale=6
	
	alarm0=30
}
if (event="step") {
	visible=1
	if explod=0{	
		calcmoving()
		
		if !inview() instance_destroy()
		
		explodtimer=(explodtimer+1) mod 32
		red=explodtimer<8
	
		if (vspeed<0) {
			coll=collision(0,vspeed)
			if (coll) {
				vspeed=abs(vspeed)/2
				y=coll.bbox_bottom+6
				playsfx("tailsbomb")
				explod=1
				image_xscale=1.25
				image_yscale=1.25
				hspeed=0
				vspeed=0
				image_index=spr_round32
				mask_index=spr_round32
				alarm0=32
				seqcount=2
			} else vspeed=min(5,vspeed+0.25)
		} else {
			yground=easyground()
			if (y>=yground-7-4*(vspeed=0)) {
				y=yground-7
				if owner.size!=4{
				hspeed=max(0,abs(hspeed)-0.15)*sign(hspeed)
				vspeed=-abs(vspeed)*0.3
				if (abs(vspeed)<1) vspeed=0
				playsfx("tailsbomb")
				explod=1
				image_xscale=1.25
				image_yscale=1.25
				hspeed=0
				vspeed=0
				image_index=spr_round32
				mask_index=spr_round32
				alarm0=32
				seqcount=2
				} else {
					vspeed=0
					if abs(hspeed)<0.25 {
						playsfx("tailsbomb")
						explod=1
						image_xscale=1.25
						image_yscale=1.25
						hspeed=0
						vspeed=0
						image_index=spr_round32
						mask_index=spr_round32
						alarm0=32
						seqcount=2
					
					
					}
				}
			} else vspeed=min(5,vspeed+0.25)
		}                  
		

		coll=collision(hspeed,0)
		if (coll) {
			hspeed=abs(hspeed)*sign(x-mean(coll.bbox_left,coll.bbox_right))
				playsfx("tailsbomb")
				explod=1
				image_xscale=1.25
				image_yscale=1.25
				hspeed=0
				vspeed=0
				image_index=spr_round32
				mask_index=spr_round32
				alarm0=32
				seqcount=2
			
		}
		coll=instance_place(x,y,enemy)
		if coll {
			explod=1
			image_xscale=1.25
			image_yscale=1.25
			hspeed=0
				vspeed=0
			image_index=spr_round32
			mask_index=spr_round32
			alarm0=32
			seqcount=2
		}
		
		coll=instance_place(x,y,spreng)
		if (coll){
			x-=hspeed
			hspeed*=-1
			xsc*=-1
			sound("itemspring") other.shot=12
		}
		
		
	} else {
		alarm0-=1
		if !alarm0{
			instance_destroy()
			}
		frame=global.fastframe4 mod 2

		coll=instance_place(x,y,enemy)
		if (coll) {                    
			global.coll=owner.id
			enemydie(coll,2)
		}
		image_xscale*=1.3
		coll=instance_place(x,y,owner)
		if (coll) {
			if sign(coll.hsp)=sign(coll.x-x){

			coll.hyperspeed=sign(coll.x-x)*3
			}
		}
		
		image_xscale/=1.3

		
		
		coll=instance_place(x,y,collider)
		if (coll) {
			if (object_is_ancestor(coll.object_index,hittable)) {
				if (coll.object_index=brick) brickc+=1 else brickc=4
				hitblock(coll,owner,1,-1,0)
				instance_create(x,y,kickpart) 
			}    
			if (brickc=4) {sound("itemblockbump") instance_destroy()}
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
	}
}
if (event="draw") {
	if !explod
	draw_sprite_part_ext(sheet,0,93+17*red,42,16,16,round(x-8*xsc),round(y-16+dy)+8,xsc,1,$ffffff,1)
	if explod
	draw_sprite_part_ext(sheet,0,93+33*floor(global.bgscroll/5 mod 2),8,33,3,round(x-11),round(y-33+dy)+8,1,1,$ffffff,1)

}



#define damager
if (owner.fly && !owner.piped && !owner.water) {
    x=owner.x+owner.hsp
    y=owner.y-1+owner.vsp
	hittype="tail"
    if (owner.size) {
        image_xscale=12
        image_yscale=6
    } else {
        image_xscale=8
        image_yscale=2
    }
	coll=instance_place(x,y,collider)
	if (coll) {
		if (object_is_ancestor(coll.object_index,hittable)) {
			if (coll.object_index=brick) brickc+=1 else brickc=4
			hitblock(coll,owner,0,esign(coll.y-owner.y),0)
			}    
		}
	if coll{
		savey=coll.y
		coll.y=-verybignumber
		coll2=instance_place(x,y,collider)
		if (coll2) {
			if (object_is_ancestor(coll2.object_index,hittable)) {
				if (coll2.object_index=brick) brickc+=1 else brickc=4
				hitblock(coll2,owner,0,esign(coll2.y-owner.y),0)
			}    
		}
		coll.y=savey
	}
	coll=instance_place(x,y,enemy)
	if (coll) {                    
		global.coll=owner.id
		enemydie(coll,2)
	}

} else y=-verybignumber



#define sprmanager
if sprite="flyfast" && !jump{
	spritekeep+=1
	if superdashactive spritekeep=1
	if spritekeep>(15+15*jump) { spritekeep=0  if jump sprite="jump"  else if !boost && !peelout{sprite="run"}}
} else spritekeep=0
frspd=1
if (using_grindblock) {sprite="grind" if grind_hanging sprite="grindgrab"}
else if tailsgrab sprite="handlegrab"
else if (using_skateboard) {if jump sprite="spring" else sprite="grind" }
else if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}
else if (spindash) {sprite="spindash"}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
	else if (hurt) {sprite="knock" onvine = 0}
	else if (transform) {sprite="transform"}
	else if (superdashactive||spritekeep) {if oldspr!="flyfast" spritekeep=1 sprite="flyfast"}
	else if (fly) {sprite="fly" if fly>5 sprite="flyup" if (down) sprite="flydown" if (tired) sprite="flytired" frspd=1-0.5*tired +(fly/30) if underwater() sprite="swim"}
	else if (sprung) {sprite="spring" if (vsp>=0) {sprung=0 fall=1}}
	else if (fall) {
		if (fall=1) {sprite="airwalk" if (abs(hsp+hyperspeed)>maxspd*0.9 && !water && !finish) { sprite="run" if boost {sprite="flyfast"}} } 
		if (fall=2) {sprite="run" /*if (superdashspeedboost) sprite="flyfast"*/}
		if (fall=3) sprite="brake"
		if (fall=4) {sprite="recover"}
		if (fall=5) {sprite="ball" frspd=jumpspd}
		if (fall=6) {sprite="knock"}
	} else if (bonk) sprite="bonk"
	else {sprite="jump" frspd=jumpspd /*if (superdashspeedboost) sprite="flyfast"*/}
} else {
	if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
	else if (fired) {sprite="fire"}
	else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
	else if (hsp=0) {
		if (hang) {sprite="hang"}
		else if (peelout){
			if (peelout<25) {sprite="walk" frspd=abs(peelout/15)}
			else if (peelout<45) {sprite="run" frspd=abs(peelout/20)}
			else {sprite="flyfast" frspd=abs(peelout/20)}
		}
		
		else if (pose) sprite="pose"
		else if (lookup) {sprite="lookup"}
		else if (waittime>maxwait) {sprite="wait"}
		else {sprite="stand"}
	} else {
		if (braking) sprite="brake"
		else if (abs(hsp)>maxspd*0.9 && !water && !finish  && (boost||abs(hsp)>maxspd*1.2) ) {sprite="flyfast" frspd=abs(hsp/3)}
        else if ((abs(hsp)>maxspd*0.9 && !water && !finish) ) {sprite="run" frspd=abs(hsp/3)}
        else {sprite="walk" frspd=0.2+abs(hsp/4)}
	}
}



#define controls
com_inputstack()

if (using_skateboard){

	hsp=(4+(xsc==h)-(esign(h,xsc)!=xsc)  )*xsc //4 speed, move faster or slower depending on other shit.
	
	if (esign(h,xsc)!=xsc) skateboard_turnaroundtimer+=1 else skateboard_turnaroundtimer=0
	
	if skateboard_turnaroundtimer>30{
		//this is a good place for sparks
		hsp=2*xsc
	} if skateboard_turnaroundtimer>=60{
		xsc*=-1
	}
	
	spin=0
	fall=0
	
	maxe=6
	
	if abut{
		vsp=-skateboard_gravity*2
		jump=1
		fall=0
	}
	
	if bbut{
		energy-=0.1
		hsp=5*xsc
		//this is a good place for sparks
	}
	
	if skateboard_gravity==-1{
		vsp-=0.5
	}



	di=0
	exit

}





tempbrick=0

//situations in which it should skip controls entirely
if (hurt || piped || move_lock) {
	di=0
	exit
}

if (up) com_piping()
oup=up

if (up && (!hang || !size)) {
	if (hsp=0 && !jump && !peelout) lookup=1
	else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (spindash || (crouch && !jump)|| vinegrab || grabflagpole || peelout) h=0

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
		if (!jump && !spin && !crouch) {
			push=h
			xsc=h
			braking=0
			com_piping()
        } else{com_piping()}
	} else {
		if (spin) {
			if (sign(hsp)!=h) hsp+=h*0.04*wf
		} else {
            if (!jump) { //ground accel
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
                    hsp+=0.06*wf*h
                    if size==5 hsp+=0.02*wf*h
                    braking=0
					xsc=h
                }
            } else { //air accel
				if !(jump && !fall) || (abs(hsp)<maxspd ||sign(hsp)!=h)
                hsp+=(0.03+0.03)*wf*h
				xsc=h
				spin=0	
            }
        }
	}
}
if superdashactive{
	hsp=(4.5)*sign(direc)
	if size!=4{
	hyperspeed=(superdash/40)*sign(direc)
	vsp=vdirec*2
	}else {
		if superdash{
		energy-=0.05
		vsp=(down-up)*2
		}
		if energy<=0{
			hyperspeed=(superdash/80)*sign(direc)
			superdash=0
			superdashactive=0
		}
		else
		superdash=40
	}
	
	boost=1
}

if (push!=h) push=0

com_di()

if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||fall=69||tailsgrab||grabflagpole) { //jump
        if (hsp==0 && crouch && push==0 &&fall!=69 &&!grabbedflagpole) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
        } else if (!peelready && ((size==5 && !collision(0,-4)) || size!=5)) {
			jumpsnd=playsfx(name+"jump")
			onvine=0
			vsp=-5.2-0.2*super
			spritekeep=0
			if (water) vsp=-sqrt(sqr(vsp)*wf+2)
			grabflagpole=0
            latchedtoflagpole=0
			if tailsgrab{
				tailsgrab=0
				graber.tailsgrabbed=0
			}
            latchedtoflagpole=0
			//change jump angle in steep slopes
			vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/2)
			vm=point_distance(0,0,hsp,vsp)
			hsp=lengthdir_x(vm,vd)
			vsp=lengthdir_y(vm,vd)

			i=shoot(x,y+4,psmoke,hsp,-2) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.05
			i=shoot(x,y+16,psmoke,2,-0.5) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
			i=shoot(x,y+16,psmoke,-2,-0.5) i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75


			sprite_angle=0
			spritekeep=0
			jump=1
			fall=0
			braking=0
			spin=0
			canstopjump=1
			if (mymoving) hsp+=avgmovingh
			crouch=0
			if (spin && !star) seqcount=0
			jumpspd=min(1,0.5+abs(hsp)/5)
		}
	} else { //air jumps
		if size=4{
			if energy>=2{
			 	if (fly) {
					spritekeep=0
					energy-=2
					vsp=-4
					
					if (y<view_yview) {y=view_yview vsp=-0.75}
					if energy<1
					 fly=0
					 else fly=1
				} else {
					if ((!fall || fall=5 || fall=1 ) && y>0) {
						spritekeep=0
						fly=1
						fall=1
						energy-=4
						vsp=-4
						mc=0
						if (inst) {stopsfx(inst) inst=0}
					}
				}
				playsfx(name+"release")
				i=shoot(x+16*xsc,y+8,psmoke,0,4) i.growsize=-1 i.depth=depth+2 i=shoot(x+16*xsc,y+8,psmoke,0,4) i.growsize=1 i.depth=depth-2
				
				i=shoot(x+16*xsc,y,psmoke,xsc*-2,2) i.growsize=-1  i.depth=depth+2 i.image_xscale=0.75 i.image_yscale=0.75 
				i=shoot(x+16*xsc,y,psmoke,xsc*2,2) i.growsize=1	i.image_xscale=0.75	i.image_yscale=0.75	i.depth=depth-2	
				i=shoot(x,y-16,psmoke,xsc*-3,4) i.growsize=-1 i.depth=depth+2 i.image_xscale=0.5 i.image_yscale=0.5 
				i=shoot(x+16*xsc,y,psmoke,xsc*3,4) i.growsize=1	i.image_xscale=0.5 i.image_yscale=0.5 i.depth=depth-2
			}
		
		} else{
			if (fly) {
				spritekeep=0
				if (y<view_yview) {y=view_yview vsp=-0.75}
				if (down) {fly=0 fall=0}
				if (!tired) fly=30
			} else {
				if ((!fall || fall=5 || fall=1) && y>0) {
					spritekeep=0
					fly=30
					if fall=1 vsp=-1
					fall=1
					tired=(energy<1)
					if tired fly=1
					mc=0
					if (inst) {stopsfx(inst) inst=0}
				}
			}
		}
		jumpbuffer=4*!jumpbufferdo
	}
}
jumpbufferdo=0
springin=0

if (peelready){
	if peelsound == 0
	{
		peelsound = 1
		peelout=1
		peelready=0
		playsfx(name+"peelcharge")
		
	}
	
}


if (akey) {
	if (jumpbuffer) jumpbuffer-=1
} else jumpbuffer=0

if (peelout && !up) {
	peelready=0
	peelsound=0 soundstop(name+"peelcharge")
	if (peelout>45) {
		boost=1
		playsfx(name+"peelrelease")
		hsp=sign(xsc)*maxspd*1.25
		boosted=1
		boostvar=0.75
		hyperspeed=(peelout/45)*sign(hsp)
		peelout=0
	}
	else if (peelout<45) {
		playsfx(name+"peelrelease")
		hsp=sign(xsc)*peelout*0.05
		peelout=0
	}
	else peelout=0
} else if (peelout && up){
	peelout+=1
	if peelout>60 peelout=60
}



if (!akey) {
	if (canstopjump=1 && jump && vsp<-2 && !sprung) {
		vsp*=0.5
	}
	canstopjump=0
}

//code for specifically the b button

if (bbut) {
    if (spindash || (hsp=0 && crouch && push=0)) {
		playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
		spindash=min(4,spindash+1)
		tempbrick=1
	}
	if size=2||(size=4 && !jump) && !count_projectiles(){
		i=fire_projectile(x,y)
		i.hspeed=xsc*(!jump || (size=2 && !left && !right))*2.5 +(hsp/2)
		if size!=4
		i.vspeed=-4*(!jump || (size=2 && !left && !right))+down*2-up
		fired=15
	}
	if (energy>=3-((size=3)) || (energy && size=4) ) && jump && !(size=2 && !left && !right){
		if h=0
		direc=sign(xsc) else direc=h
		vdirec=down-up	
		superdashactive=1 
		superdashspeedboost=1
		superdash=40
		if size!=4
		energy-=3-((size=3))
		playsfx(name+"superfly")
		i=shoot(x,y,psmoke,-3*xsc,1) i.growsize=2 i.image_xscale=0.75 i.image_yscale=0.75
		i=shoot(x,y,psmoke,-3*xsc,-1) i.growsize=-2 i.image_xscale=0.75 i.image_yscale=0.75
		fall=1
	}
}
if /*size=3 &&*/ superdash superdash-=(4-(size=3)*2)

if size=4 && !bkey && superdash{
	superdash=0
	energy-=0.1
}


if cbut{
	if (spindash || (hsp=0 && crouch && push=0)) {
		playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
		spindash=min(4,spindash+1)
		tempbrick=1
	} else if jump && fly && !insted{
		spritekeep=0
		fly=0 fall=0
		if !tired && energy>0 energy-=0.5
		if energy<0 energy=0
	}
}


//crouching and spinning
if (down && !up) {
	if (!jump && !braking && !spin) {
		if (abs(hsp)<0.5) {
			crouch=1
			hsp=0
		} else if (!spin && !crouch) {
			spin=1
			playsfx(name+"spin")
		}
	}
	com_piping()
} else {
	mask_temp(12,12)
    if (!jump) {
        if (collision(0,-16) && size) spin=1
        crouch=0
    }
    mask_reset()
}

if (!grabflagpole && !piped && size==5) mask_set(9,8) //please dont ask why the width has to be 9 pipes are weird and wacky and this is the only way i got to stop players from getting stuck in pipes and turning invisible/
else if (spin || spindash || crouch || size=0) mask_set(12,12)
else if (jump && (!fall || fly)) mask_set(12,15)
else mask_set(12,24)


#define movement
if (piped) exit

//speed limits
if (((loose && !jump) || spin || (crouch && !jump))) {
	braking=0
	frick=0.06
	if (spin) frick=0.005
	hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula
maxspd=(3.25 + !!size*0.75 + ((size==5)*0.55) + !!superdashspeedboost*0.75)*wf
if (fly && vsp<0) {maxspd=min(3,maxspd)}


//There's an extra check in the hsp+= section of h!=0 to compensate!.
if (abs(hsp)>maxspd) {
	if (fly && vsp<0) || (!spin && !(jump && (!fall || fall==7))) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)
}

vsp=min(7+downpiped,vsp)

//movement
calcmoving()

if (!dead && !grabflagpole)  {
	vine_climbing()
	if fall!=69
	player_horstep()
	player_nslopforce()
	//if (yground!=verybignumber) yground-=14
	if (jump) {
		
		if (fly) {
			if (fly>1) vsp-=0.1
			else vsp+=0.05
			if down vsp+=0.3
			vsp=median(2+down,vsp,-1-(5*(size=4)))
        } else {
			if superdashactive vsp*=0.7 else
			if fall!=69&&fall!=70 {
				vsp+=0.15*wf -(size=5 && vsp>-0.35 && !water)*0.075
			}
		}
		
		hang=0
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
		if abs(hsp)<maxspd boost=0
	
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		osld=sld
		sld=point_direction(0,0,1,slobal)
		if (!collision_point(x+((mask_w/2)+max(maxspd,hsp)+18)*sign(hsp),bbox_bottom+4,ground,0,0) && (abs(hsp)+abs(hyperspeed))>2 && spin) {
			diff=anglediff(sld,osld)
			if (sign(diff)=sign(hsp) && diff*sign(hsp)>40 && sld=0) {
				jump=1 fall=!spin fallspr=sprite fallspd=frspd
				y=min(y,yp)
				/*hsp=lengthdir_x(hsp,osld)*/ vsp=-abs(lengthdir_y((hsp+hyperspeed+gm8exspd),osld))*1.5 // coolness factor
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
			if (!down) {
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
	if cpu_myleader.x>x+(16*!jump) right=1
	if cpu_myleader.x<x-(16*!jump) left=1

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
	
	if fly && cpu_myleader.y<y && vsp>-1 { akey=1 cpu_akeystuck=0}
	if fly && tailsgrabbed { right=cpu_myleader.right  left=cpu_myleader.left bkey=cpu_myleader.bbut}

	
	if cpu_myleader.jump && jump{
		if cpu_myleader.up && (cpu_myleader.abut || cpu_myleader.bbut || cpu_myleader.cbut || cpu_myleader.xbut) { // fly whenever a player is here
			akey=1
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


if collision_circle(x,y,max(mask_w,mask_h),skateboard,0,0){
	using_skateboard=1
	with player { //single screen coop makes things so nice...
		using_skateboard=1
		xsc=other.xsc
		x=other.x
		y=other.y
		skateboard_gravity=other.skateboard_gravity
	}
}






weight=0.3+0.3*!!size
bartype=0

//Multiplayer shits,  pressing down also allows the carried to not have to deal with it

coll=instance_place(x,y,player)
if coll && !tailsgrabbed && fly && !tailsgrab_cooldown {
	if !coll.down //"dont fucking grab me you piece of shit" "Bitch just fucking press DOWN".
	if !coll.piped //If I didn't add this check shit would very likely break.
	if !(!coll.jump && vsp>0)
	if !coll.tailsgrab
	{
		coll.jump=1
		coll.tailsgrab=1
		coll.graber=id
		coll.jump=1
		tailsgrabbed=1
		tailsgrab_cooldown=30
		grabvictim=coll.id
	}
}
if tailsgrabbed && instance_exists(grabvictim){
	if !fly && !superdashactive tailsgrabbed=0
	if grabvictim.jump==0 {tailsgrabbed=0 tailsgrabbed.y-=vsp grabvictim.vsp=0}
} //Rechecking just in case
if tailsgrabbed && instance_exists(grabvictim){
	if !superdashactive && fly
	{grabvictim.x=x
	grabvictim.y=bbox_bottom-4+(grabvictim.bbox_bottom-grabvictim.bbox_top)}
	else {
	grabvictim.x=x-hsp
	grabvictim.y=y-4
	}
	grabvictim.fall=0
	grabvictim.hsp=hsp
	grabvictim.vsp=vsp
	grabvictim.xsc=xsc
}
if !tailsgrabbed {
	if tailsgrab_cooldown{tailsgrab_cooldown-=1}
}
	


// VULNERABILITY AND PLAYER COLLISION

//Intangibility
is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1) is_intangible=1

//Power levels
power_lv=0
is_coinexplosive=0
if (spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (firedash) power_lv=4
if (star) power_lv=5
if (super) power_lv+=1

if (piped) exit

//BEING ABLE TO PIP IN SHIT WHILE AIRBORNE IS IMPORTANT I PROMISE
if (superdashactive) {canpipejump=1 fly=0 tired=0 if (!jump||superdash<=2) {superdashactive=0}} else canpipejump=0

//Special interactions
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=0 //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

if (fly){
soundframe-=1
if soundframe<0{if underwater() playsfx("tailsswim") else if tired playsfx("tailstired")else playsfx("tailsfly") soundframe=15 if tired soundframe=30}
}

if (!jump) {
	vsp=0
	energy=maxe
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



//water
if (underwater()) {
	if (!water) {
		if (abs(vsp)>2) water_splash(1)
		if (inst) {stopsfx(inst) inst=0}
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
//Energy management
maxe=2*(2+!!size)

if (fly) {
	fly=max(1,fly-1)
	if !water energy-=1/90
	if (energy=0) { tired=1}
	
} else {
	tired=0
	mc=0
	if (inst) {stopsfx(inst) inst=0}
}

if (sprite!="jump" && sprite!="ball" && sprite!="bonk" && sprite!="airwalk") 
	dir=point_direction(x,y,xp,yp)
else if (!(x=xp && y=yp)) {
	dir+=anglediff(dir,point_direction(x,y,xp,yp))/3
}

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
        if ((i=brick) && size && size!=5) {spinblacklist=coll if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf}}
	}
    
    if (spindash) {
        spindash=max(1,spindash-0.025)
        if (!crouch) {
            
            spin=1
            hsp=xsc*6*(0.75+0.25*median(0,spindash-1,2)/2)
            spindash=0
            soundstop(name+"spindash")
            playsfx(name+"release")
            
        }
        if (hsp!=0) spindash=0
    }
    
    //stop spinning
    if (abs(hsp)<0.2 && spin) { 
            spinc+=1 if (spinc=8) {
            mask_temp(12,24)
            if (collision(0,0) && size && size!=5) {
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

//Christianity 3
jesus=((size==5 && !down && abs(hsp)>3.2) && !water)


com_endactions()

#define enemycoll
//Code that defines collision with enemies

if (coll) {
    if (!coll.damage_player_on_contact) {
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
            
        if (coll.object_index=lakitu) if (coll.flee) exit
        
        if (star  
        || (spin && type!=spinyegg && type!=beetle && type!=koopa && !object_is_ancestor(type,koopa) && type!=shell)
        || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
            instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
            if (type=hammerbro) seqcount=max(5,seqcount)
            enemydie(coll)                
            exit
        }
        
    if coll.tails_dmgontouch=1 {
    hsp*=1.25
    vsp*=1.25
    enemystomp(coll)
    exit
    }
        
        if (spindash || inst || firedash) {if (diggity=32) exit enemyexplode(coll) exit}
        
        if (type=piranha || coll.damage_player_on_contact) {
            hurtplayer("enemy")
            exit
        }
        
        
         
    if (spin) {
    if (type=koopa|| object_is_ancestor(type,koopa)) { with enemyflip(coll) {y-=3 vspeed=-3 intangible_timer=30} exit }
            else if (type=beetle ) {enemystomp(coll) jump=1 jumpspd=0.5 vsp=-((abs(hsp)*1.25)+(abs(gm8exspd))) hsp/=1.5 exit}
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
            if (type=koopa || type=beetle || type=rexbig || object_is_ancestor(type,koopa)) {
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
        } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 if size!=5 enemystomp(coll) else playsfx(name+"jump",0,1.8) exit}
        
        hurtplayer("enemy")   
    } else hurtplayer("enemy")
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
superdashed=0
star=0
if (super) stopsuper()   

if ((!size || size==5 || ohgoditslava || name="kid") && !shielded && global.rings[p2]==0) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    fly=0
    climb=0 
    rise=0
    slide=0
superdash=0
superdashactive=0
    sprung=0
    fall=0
    braking=0
    boost=0
    upper=0
    hyperspeed=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")

    starhit=0    
    jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings()} else {if size>=3 size=2 size-=1} hsp=xsc*-2*wf vsp=-3*wf
}

//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || (owner.size=0 || owner.size=5) && insted!=1 && !owner.tempkill && (biggie || cracked=0 || (cracked=1 && owner.size=5))) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else if (stonebump || owner.size && owner.size!=5 && insted!=1 && !owner.tempkill && cracked=0 && biggie) { //break spiner
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

} else if (((owner.size || (!owner.size && owner.spin && !biggie && owner.y>=y)) && !tpos) && owner.size!=5)  { 
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
else { 
    com_breakblocks()
  }
 }
} else if typeblockhit=1{
	hititembox()
}

#define hitwall
if fall=70{//hit a wall while tethered
	ringimtetheredto.tether=0
	fall=0
	ringimtetheredto.goback=1
}


//hit blocks sideways
if (spin && abs(hsp)>0.5) {
    global.coll=id
    with (hittable) if (instance_place(x-other.hitside,y,other.id)) {
        go=-1
        insted=1
        event_user(0)
        insted=0
    }
    coll=collision(hitside,0)
}

if (coll=noone) exit

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}

hsp=0
hyperspeed=0        


#define landing
braking=0
tired=0     
fly=0
superdashed=0
superdashspeedboost=0
insted=0
ringlvl=size

if (downpiped) {
    shoot(x-8,y+4,psmoke,-2,-1)
    shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}
           
playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1

//fall into spin
if (!spin && rise=0 && !hurt && down && abs(hsp)>=0.5) {
    spin=1
	{playsfx(name+"spin") seqcount=1}
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
frn=owner.frn
vspeed=-3.5 gravity=0.1

if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}
} 
else if (event="step"){
if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}
alarm0=max(0,alarm0-1)
alarm1=max(0,alarm1-1)

if alarm1=0 instance_destroy()
} else if (event="draw"){

}


#define enterpipe
if (type="side") {
	if (superdashactive) {fastpipe=1 hspeed=xsc*3 set_sprite("flyfast") frspd=1}
	if (spin) {
		set_sprite("ball")
		frspd=min(1,0.1+abs(hsp/4))
		if (abs(hsp)>=3 && !water) {fastpipe=1 playsfx(name+"spin")}
	}
}
if (type="up") {
	//set_sprite("fly")	
}

if (skidding) {soundstop("tailsskid") skidding=0}
braking=0
crouch=0
push=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}

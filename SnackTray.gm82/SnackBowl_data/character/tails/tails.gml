#define spritelist
stand,wait,lookup,crouch,balance,pose,knock,dead,walk,run,maxrun,push,brake,jump,bonk,fall,spring,springfall,roll,climbing,flagslide,piping,pipingup,sidepiping,doorenter,doorexit,spinjump,spindash,spincharge,rampof,trickup,trickright,fired,fly_up,fly,fly_down,fly_tired,swim,tail_idle,tail_movement,handlegrab,grindgrab,grinding


#define soundlist
release,skid,spin,spindash,insta,dash,boom,firedash,trick,peelout,peelrelease

#define movelist
Tails
#
Working on it!

#define rosterorder
11

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()


#define start
mask_set(12,12)
dontdrawdefaulthud=true

use_under_sprite=true
use_over_sprite=false


tail_offset_x=unreal(playerskindat(slot,name+" movement tails offset x"),0)
tail_offset_y=unreal(playerskindat(slot,name+" movement tails offset y"),0)
spindashtail_offset_x=unreal(playerskindat(slot,name+" spindash tails offset x"),0)
spindashtail_offset_y=unreal(playerskindat(slot,name+" spindash tails offset y"),0)


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
firedash=0
insta=0


#define itemget
com_item()



#define effectsbehind
if (feathdasheffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),129,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
}

#define effectsfront
if (firedash && !piped) {
    draw_sprite_part_ext(sheetshields,0,209+40*(firedash mod 4),49,39,39,round(x-19.5*xsc),round(y-19.5+dy)+4,xsc,1,$ffffff,alpha)
}


if (feathdasheffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),89,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
	feathdasheffect+=0.35
	if feathdasheffect>=5 feathdasheffect=0
	feathdasheffecty_x+=feathdasheffecty_hsp
	feathdasheffecty_y+=feathdasheffecty_vsp
}


#define grabflagpole
grabflagpole=1
hsp=0
vsp=0


#define endofstage
right=1
grabflagpole=0
if (hsp>=3 || push) {
	akey=1
	bkey=(jump && vsp>-3)
}


#define damager
if (owner.insta){
	com_dmgr_instashield() //Ashura reuses the instashield, hence this. So, it's just nice to have.
} else {y=-1000}

#define projectile
if (event="create"){
	type=owner.proj_type
	visible=1
	event=type+"_create"
}
else if (event="step"){

	event=type+"_step"
}
else if (event="draw"){
	event=type+"_draw"
	
}

if (event=="pstar_create" || event=="4star_create"){
	fr=0
	friction=0.1
	getregion(x)
	growsize=0	
}
else if (event=="pstar_step")||(event=="4star_step"){
	fr=fr+0.2

	if growsize!=0{
		image_xscale*=1+(growsize*0.1*0.25)
		image_yscale*=1+(growsize*0.1*0.25)
	}
	if drag{
	speed*=0.99*drag

	}
	frame=floor(fr)

	if (frame>=4) {instance_destroy() visible=0}
}
else if (event=="pstar_draw"){
	if owner.usepalette scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,global.reroutedsizes[owner.p2,owner.size],1,owner.totpal+1)

	draw_sprite_part_ext(owner.sheetshields,0,469+frame*25,9,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)
	shader_reset()
}
else if (event=="4star_draw"){
	draw_sprite_part_ext(owner.sheetshields,0,469+frame*25,34,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)
}


#define sprmanager
frspd=1
cantslowanim=0

if sprite="maxrun" && !jump{
	spritekeep+=1
	if superdashactive spritekeep=1
	if spritekeep>(15+15*jump) { spritekeep=0  if jump sprite="jump"  else if !boost && !peelout{sprite="run"}}
} else spritekeep=0

if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}
else if (bouncewindup) sprite="bouncewindup"
else if (spindash) {if (spinchargetimer) sprite="spincharge" else sprite="spindash"}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if !(spindash) {
		if (onvine) 
		{
		sprite="climbing" frspd=sign(left+right+up+down)
		}
		else if using_grindblock{
			if grind_hanging sprite="grindgrab"
			else sprite="grinding"
		}
		else if (superdashactive||spritekeep) {if oldspr!="maxrun" spritekeep=1 sprite="maxrun"}
		else if (fly) {sprite="fly" if fly>5 sprite="fly_up" if (down) sprite="fly_down" if (tired) sprite="fly_tired" frspd=1-0.5*tired +(fly/30) if underwater() sprite="swim"}
		else if (tricking) {if tricking!=2 sprite="trickup" else sprite="trickright"}
		else if (sprung|| sproinged) {sproinged=true uncurl=false sprite="spring" if (vsp>=0) sprite="springfall"}
		else if (rampof) {sprite="rampof"  }
		else if uncurled {sprite="uncurl"}
		else if (fall=10) {sprite="dash"}
		else if (bonk) sprite="bonk"
		else if (fall=6) {sprite="knock"}
		else {if (fall) if vsp>=0 sprite="fall" else sprite="jump" if !fall sprite="spinjump" frspd=fallspd} //frspd=fallspd
	}
} else {
    if (spin) {sprite="roll" frspd=0.2+abs(hsp/4)}
    else if (fired) {sprite="fire" cantslowanim=1}
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
	else if (peelout){
		if (peelout<25) {sprite="walk" frspd=abs(peelout/15)}
		else if (peelout<45) {sprite="run" frspd=abs(peelout/20)}
		else {sprite="maxrun" frspd=abs(peelout/20)}
	}
    else if (hsp=0) {
        if (balance) {sprite="balance"}
        else if (pose) sprite="pose"

        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (braking) sprite="brake"
		else if ((abs(hsp)>maxspd*1.4 || (abs(hsp)>maxspd*0.95 && boost))&& !water && !finish) {sprite="maxrun" frspd=abs(hsp/3)}
        else if (abs(hsp)>maxspd*0.9 && !water && !finish) {sprite="run" frspd=abs(hsp/3)}
        else {sprite="walk" frspd=0.2+abs(hsp/4)}
    }
}
under_sprite=""
over_sprite=""
if sprite="stand"||sprite="crouch"||sprite="lookup"||sprite="wait"||sprite="handlegrab"{
	under_sprite="tail_idle"
	under_sprite_angle=0
	under_xoffset=0
	under_yoffset=0

} else if sprite="spinjump" || sprite="roll" {
	under_sprite="tail_movement"
	under_sprite_angle=point_direction(0,0,hsp*sign(xsc),vsp*sign(xsc))
	under_xoffset=tail_offset_x
	under_yoffset=tail_offset_y

}else if sprite="spindash" || sprite="spincharge"{
	under_sprite="tail_movement"
	under_sprite_angle=point_direction(0,0,2,0.5*xsc)
	under_xoffset=spindashtail_offset_x
	under_yoffset=spindashtail_offset_y

} else if sprite="grinding" || sprite="grindgrab" {

	under_sprite="tail_movement"
	under_sprite_angle=point_direction(0,0,hsp*sign(xsc),vsp*sign(xsc))
	under_xoffset=tail_offset_x+4*xsc
	under_yoffset=tail_offset_y
} 


#define controls
com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (hurt || piped || move_lock) {
    di=0
    exit
}

if (up) com_piping()
oup=up

if (up && (!balance)) {
    if (hsp=0 && !jump && !peelout) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (homingattack ||spindash || (crouch && !jump) || (super && fall=10) || vinegrab || grabflagpole || (spin && !jump) || peelout) h=0

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
        if (!jump && !spin && !crouch && !firedash) {
            push=h
            xsc=h
            braking=0
			com_piping()
        } else{com_piping()}
    } else {
        if (spin) {
            if (sign(hsp)!=h || abs(hsp)<maxspd) hsp+=h*0.04*wf
        } else {
            if (!jump) { //ground accel
                if (sign(hsp)!=h) {
                    if (abs(hsp)>maxspd*0.8) {
						if !skidding playsfx(name+"skid") //play sound once
                        braking=1
						skidding=1
                        brakedir=h
                    }
                    hsp+=0.33*wf*h
                    if (abs(hsp)<0.5) if (!firedash) xsc=h
                } else {
					if (abs(hsp)<maxspd || sign(hsp)!=h)
                    hsp+=0.06*wf*h
                    braking=0
                    if (!firedash) xsc=h
                }
            } else { //air accel
				if (abs(hsp)<maxspd || sign(hsp)!=h)
                hsp+=(0.03+0.03*!fairdash+(0.03*size==3))*wf*h
				spin=0
               // if !(fall=10 && boost) {hsp+=0.08*wf*h} else {hsp+=0.01*wf*h}
				if (!firedash) xsc=h
				else collwin=instance_place(x+hsp,0,goalblock)
				if collwin {
					hsp=0 collwin.owner=id with collwin{ event_user(4)}
				}
            }
        }
    }
}
if superdashactive{
	hsp=(4.5)*sign(direc)
	if !is_ice(){
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

//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||fall=69||grabflagpole||tailsgrab||(fall!=0 && size==9 && !cloverjumped && !insted)) { //jump
        if (up && hsp=0 && fall!=69 && !jump) com_startpeelout()
        else if (crouch && fall!=69)          com_startspindash()
		else if !peelready {
            jumpsnd=playsfx(name+"jump")
            vsp=-5.2-0.2*super
            onvine=0
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)
			if tailsgrab{
				tailsgrab=0
				graber.tailsgrabbed=0
			}
			if (fall!=0 && size==9 && !cloverjumped && !insted) cloverjumped=1
			grabflagpole=0
			tricked=0
            latchedtoflagpole=0
            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/1.5)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)
				proj_type="psmok"
				i=shoot(x,y+12,psmoke) i.hspeed=hsp i.vspeed=-2 i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.friction=0.05 i.gravity=0.05
				i=shoot(x,y+12,psmoke) i.hspeed=2*xsc i.vspeed=-1 i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.depth=depth+2 i.gravity=0.1
				i=shoot(x,y+12,psmoke) i.hspeed=-2*xsc i.vspeed=-2 i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.1
				/*
				i=fire_projectile(x,y+8,speedsmoke,2,0) i.pxsc=-1
				i=fire_projectile(x,y+8,speedsmoke,-2,0)
				*/
				uncurled=0
				sprite_angle=0

            jump=1
            fall=0
            braking=0
            canstopjump=1
            dashtimer=60
            if (mymoving) hsp+=avgmovingh
            crouch=0
			if !down spin=0
            if (spin && !star) seqcount=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else if !peelready { //air jumps
		//flight
		if is_ice(){
			if energy>=2{
			 	if (fly) {
					spritekeep=0
					energy-=2
					vsp=-4
					tricking=0
					sprung=0
					sproinged=0
					bouncetrick=0
					tricking=0

					if (y<view_yview) {y=view_yview vsp=-0.75}
					if energy<1
					 fly=0
					 else fly=1
				} else {
					if ((!fall) && y>0) {
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
				if ((!fall) && y>0) {
					spritekeep=0
					fly=30
					tricking=0
					sprung=0
					sproinged=0
					bouncetrick=0
					tricking=0
							
					if fall=1 vsp=-1
					fall=1
					tired=(energy<1)
					if tired fly=1
					mc=0
					if (inst) {stopsfx(inst) inst=0}
				}
			}
		}
		
		if fall && !insted && !fly {
			fall=0 
			if !uncurled
			vsp=-1
			tricking=0
			sprung=0
			sproinged=0
			bouncetrick=0
			tricking=0
			if !uncurled{
				proj_type="pstar"
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=-2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=-2
			}
			uncurled=0
		}
		
        jumpbuffer=4*!jumpbufferdo
    }
}

if (spindash) {
	com_handlespindashdust(-xsc*spindash)	
} 

if (sprite="maxrun" && !jump) {
	com_handlespindashdust(-hsp/2)		
}



jumpbufferdo=0
springin=0

if (akey) {
	if (up && abs(hsp)<=0.5 && h=0 && !jump && !!peelout){
		com_startpeelout()
	}

    if (jumpbuffer) jumpbuffer-=1
} else {
    jumpbuffer=0
}




if (!akey) {
if (peelout && up) peelout+=1 


    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp*=0.5
    }
    canstopjump=0
}

//code for specifically the b button
if (bbut) {
    if (spindash || (crouch)) {
		com_startspindash()
	} else {
		if (jump && (fall=0 || fall=2 || fall=5 || fly)) {
			{
			
			

				/*if size=2||(size=4 && !jump) && !count_projectiles(){
					i=fire_projectile(x,y)
					i.hspeed=xsc*(!jump || (size=2 && !left && !right))*2.5 +(hsp/2)
					if size!=4
					i.vspeed=-4*(!jump || (size=2 && !left && !right))+down*2-up
					fired=15
				}*/
				if (energy>=2.5-((is_feather())) || (energy && is_ice()) ) && jump && !(is_fire() && !left && !right){
					if h=0
					direc=sign(xsc) else direc=h
					vdirec=down-up	
					superdashactive=1 
					superdashspeedboost=1
					superdash=40
					if !is_ice()
					energy-=3-((is_feather()))
					playsfx(name+"flydash")
					i=shoot(x,y,psmoke,-3*xsc,1) i.growsize=2 i.image_xscale=0.75 i.image_yscale=0.75
					i=shoot(x,y,psmoke,-3*xsc,-1) i.growsize=-2 i.image_xscale=0.75 i.image_yscale=0.75
					fall=1
				}
				
				
			
			}	
        } else if sproinged||sprung{
			if up{
				tricking=1
				vsp=-5
				hsp*=0.9
				proj_type="pstar"
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
				proj_type="4star"
				sproinged=0
				sprung=0
				bouncetrick=0
				fall=1
				i=fire_projectile(x,y+4)
				playsfx(name+"trick")
			}else  if h!=0{
				if energy>=maxe boost=1
				playsfx(name+"trick")
				tricking=2
				vsp=-2
				hsp=maxspd*h*1.25
				proj_type="pstar"
				i=fire_projectile(x-4*xsc,y+4) i.hspeed=-2*t i.vspeed=2  i.growsize=0.25
				i=fire_projectile(x-4*xsc,y+4) i.hspeed=-2*t i.vspeed=-2 i.growsize=-0.25 
				proj_type="4star"
				i=fire_projectile(x,y+4)
				sproinged=0
				bouncetrick=0
				sprung=0
				fall=1
			} 

		}
    }
}
if superdash superdash-=(4-(size=3)*2)

if size=4 && !bkey && superdash{
	superdash=0
	energy-=0.1
}


if (cbut) {
	if !jump && (spindash||crouch)
		com_startspindash()
	else if jump && fly && !insted{
		spritekeep=0
		fly=0 fall=0
		if !tired && energy>0 energy-=0.5
		if energy<0 energy=0
	}
}



spinchargetimer=(max(0,spinchargetimer-1))

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
        if (collision(0,-16) && size && size!=5) spin=1
        crouch=0
    }
    mask_reset()
}

if (!grabflagpole && !piped && size==5) mask_set(9,8) //please dont ask why the width has to be 9 pipes are weird and wacky and this is the only way i got to stop players from getting stuck in pipes and turning invisible/
else if (!grabflagpole && (spin || spindash || crouch || size=0 || fall=5)) mask_set(12,12)
else if (jump && !grabflagpole && (!fall || fly || fall=10)) mask_set(12,15)
else mask_set(12,24)





#define movement
if (piped || move_lock) exit

//speed cap rubberband formula
maxspd=(3.25 + !!size*0.25 + (airdash)*0.5 +boost + firedash/24)*(wf+(0.5*water)+(0.5*(size==7)*water))

if vsp<-1.5 && fly && abs(hsp)>2 hsp*=0.95

vsp=min(7+downpiped,vsp)
calcmoving()

if (!dead && !grabflagpole) {
	if fall!=69    player_horstep()
	player_nslopforce()
		//aerial state
    if (jump) {
        //gravity
        balance=0
        if (fly) {
			if (fly>1) vsp-=0.05
			else vsp+=0.05
			if down vsp+=0.3
			vsp=median(2+down,vsp,-2-(5*(is_ice())))
        } else {
			if superdashactive vsp*=0.7 
			else if fall!=69 {
				vsp+=(0.15 - (size == 5 && vsp > 0.5) * 0.03) *wf
			}
		} 
		
		peelout=0
		vine_climbing()
        crouch=0
        spindash=0
        braking=max(0,braking-1)
        if (sprung && !fall) fall=1
        push=0 spin=0
        coyote=0
		osld=0
		player_vertstep()
		if (!jump) sld=point_direction(0,0,1,slobal)
    } else {
		//grounded state
		energy=maxe
		sproinged=0 uncurled=0 tricking=0 rampof=0 
		bouncetrick=0
		if vsp>0 vsp=0
		//sprite angle and offsetting visually into sloped ground.
		sprite_angle=0
		if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
		else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3

		//the power of additional friction! (I dont get it...)
		if (loose || spin || crouch) {
			braking=0
			frick=0.06
			if (spin) frick=0.005
			hsp=max(0,abs(hsp)-frick)*sign(hsp)
		}
		
		//Rampoff from a spin.
		osld=sld
		sld=point_direction(0,0,1,slobal)
		if (!collision_point(x+((mask_w/2)+max(maxspd,hsp)+18)*sign(hsp),bbox_bottom+4,ground,0,0) && (abs(hsp)+abs(hyperspeed))>2 && spin) {
			diff=anglediff(sld,osld)
			if (sign(diff)=sign(hsp) && diff*sign(hsp)>40 && sld=0) {
				jump=1 fall=!spin fallspr=sprite fallspd=frspd
				if vsp<0 && abs(hsp)>2
				rampof=!spin
				y=min(y,yp)
				/*hsp=lengthdir_x(hsp,osld)*/ vsp=-abs(lengthdir_y((hsp+hyperspeed+gm8exspd),osld))*1.5 // coolness factor
			}
		}

		if (!star && !spin && !spindash) seqcount=0
		//ledge balance animation detection
		if ((sprite="stand" && hsp=0) || balance) {
			image_xscale=1/6
			balance=(!instance_place(x,y+8,collider) && instance_place(x-7*xsc,y+4,collider))
			image_xscale=1
		} else balance=0

		//skidding
		if (push=0 && hsp!=0 && braking) {
			if !skidding playsfx(name+"skid") //play sound once
			skidding=1
		} else if (skidding) {soundstop(name+"skid") skidding=0}
		

        if (finish && ending="retainer" && !jump) coyote=0
        if (!collision(0,4) /*&& (y<yground-2)*/) {
            coyote+=1
            if (coyote=3) {
				jump=1
				fall=1
				if vsp<0 && abs(hsp)>2
				rampof=1
				fallspr=sprite
				if (spin || spindash) fall=5
				if (firedash) fall=10
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
                if (insta) insted=1
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
	
	
	if piped && !dead && cpu_myleader.piped==0 {
		piped=0
		x=cpu_myleader.x
		y=cpu_myleader.y	
		region=cpu_myleader.region
		visible=1
	}
	
    //if my player is standing on blockq and I'm directly below it, find a way to get to my player, preferably without hitting the block.
	
	if !auto &&  (global.joynum>(global.input[p2]))||global.input[p2]<2 input_get(global.input[p2])
	if (left||right||down||up||akey||bkey||ckey||skey||xkey||ykey||zkey)
	{
		player_controlled=1
		backtocputimer=0
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

weight=0.4+0.4*(size!=0 && size!=5)

bartype=0

maxe=2*(2+!!size)
if !jump energy=maxe
if (fly) {
	fly=max(1,fly-1)
	if !water {energy-=0.5/90
	if vsp<=-1.5 energy-=1.5/90
	if vsp<=-2 energy-=1/90
	}
	if (energy=0) { tired=1}
	
} else {
	tired=0
	mc=0
	if (inst) {stopsfx(inst) inst=0}
}
if !jump && abs(hsp)<3 boost=0

// VULNERABILITY AND PLAYER COLLISION

//Intangibility
is_intangible=0 with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1) is_intangible=1

//Power levels
power_lv=0 is_coinexplosive=0
if (spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (firedash) power_lv=4 if (star || insta) power_lv=5 if (super) power_lv+=1
if (firedash) is_coinexplosive=1

//Special interactions
pvp_spin=(spin&& !jump) pvp_avoid=0 pvp_stomper=0 pvp_ignore=!!insta pvp_knockaway=0 

//whoputshitinyourpip
if (piped) exit

//BEING ABLE TO PIP IN SHIT WHILE AIRBORNE IS IMPORTANT I PROMISE
if (superdashactive) {canpipejump=1 fly=0 tired=0 if (!jump||superdash<=2) {superdashactive=0}} else canpipejump=0

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

//spindash/spin
global.coll=id
if (spindash || spin) {
    com_spinhitblocks()
    com_handlespindash()
    com_handlespinning()
} else spinblacklist=noone


com_handlepeelout()

if (insta) insta-=1
if (super) boost=1
if (firedash) {firedash-=1 boost=1}


com_waterforces()
//Christianity moment
jesus=(((boost && vsp<4)||(size==5 && !down && abs(hsp)>3.2)) && !water)


com_smokegeneration()
com_endactions()



#define enemycoll
//Code that defines collision with enemies
success=com_defaultenemycollision() 
//Returns 1 if an enemy is exploded, 2 if they're stomped, 3 for generic death and 4 if flipped, and 5 for mini form non killing bounces, 6 for a kicked shell, 
//0 for getting hurt, and -1 for an enemy that ignored collision.


#define hurt
pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
clover_climb=0 
energy=0
flydash=0
flydashactive=0
superdash=0
superdashactive=0
boost=0
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
dropdash=0
if (super) stopsuper()   

if ((!size || size==5 || ohgoditslava) && !shielded && global.rings[p2]==0) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    fly=0
    jet=0
    clover_climb=0 
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
	dropdash=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")

    starhit=0
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if is_big() if size>=2 size=1 else size=0} hsp=xsc*-2*wf vsp=-3*wf
    
}


#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || (owner.size=5) && insted!=1 && !owner.tempkill && (biggie || cracked=0 || (cracked=1 && owner.size=5))) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else if (stonebump || owner.size!=5 && insted!=1 && !owner.tempkill && cracked=0 && biggie) { //break spiner
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
    i=instance_create(x+4,y+12+(16*biggie),part) i.hspeed=-1 i.vspeed=-1+2*go
    i=instance_create(x+12+(16*biggie),y+12,part) i.hspeed=1 i.vspeed=-1+2*go 
    i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
    i=instance_create(x+12+(16*biggie),y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    
    with (turing) event_user(4)
    instance_destroy()
  } 
} 
else { 
    com_breakblocks()
  }
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
    if (firedash && jump) {canpipejump=1 com_piping() fall=5 vsp=0} else canpipejump=0
	if firedash exit
}

if (coll=noone) exit

if (!collpos(sign(hitside)*10,8,1)) {        
    //gap running
    if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
}
com_piping()
hsp=0
hyperspeed=0

#define landing
braking=0
insted=0
fly=0
dashanim=0
waterinsted=0
boosted=0
cloverjumped=0
if !down spin=0

if (dropdash) {
	//smoke and shit
	playsfx(name+"release")
	if dropdash>3 boost=1
	hsp=esign(h,xsc)*min(dropdash*1.125, maxspd+3)
	dropdash=0
	spin=1
	shoot(x-8*xsc,y+8,psmoke,-2*xsc,-1)
}

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
	jump=0
	mask_set(12,12) 
	playsfx(name+"spin")
	hsp=max(abs(hsp),2)*esign(hsp,xsc)
	}
}
sproinged=0 uncurled=0 tricking=0 rampof=0 
		bouncetrick=0

#define death
if (event="create"){

alarmmp=60
alarm1=300
sprite="dead"
frame=0
frspd=1
spindash=0
alpha=1

if global.mplay>1 alphadecay=1

if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}
name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
frn=owner.frn
vspeed=-3.5 gravity=0.1-(owner.water*0.015)

} 
else if (event="step"){
alarmmp=max(0,alarmmp-1)
alarm1=max(0,alarm1-1)

if alphadecay &&!alarmmp alpha-=0.1

if alarm1=0 instance_destroy()
if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}

} else if (event="draw"){

}


#define enterpipe
if (type="side") {
	if (firedash) {set_sprite("dash") frspd=1 hspeed=xsc*3 fastpipe=1  }
	if (spin||crouch) {
		set_sprite("ball")
		frspd=min(1,0.1+abs(hsp/4))
		if (abs(hsp)>=(maxspd) && !underwater()) {fastpipe=1 playsfx(name+"spin")}
	}
	if (boost) {fastpipe=1}
}
if (type="up") {
//set_sprite("fly")
}
if (type="down") {}

if (skidding) {soundstop("sonicskid") skidding=0}
braking=0
insta=0
crouch=0
push=0     
firedash=0
dash=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}



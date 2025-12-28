#define spritelist
stand,wait,lookup,crouch,balance,pose,knock,dead,walk,run,maxrun,push,brake,jump,bonk,fall,spring,springfall,roll,climbing,flagslide,piping,pipingup,sidepiping,doorenter,doorexit,spinjump,spindash,spincharge,rampof,trickup,trickright,uncurl,dash,handlegrab,grindgrab,grinding,firedash,featherdash,thunderdash


#define soundlist
release,skid,spin,spindash,insta,dash,boom,firedash,trick,peelout,peelrelease

#define movelist
Sonic
#
[a]: Instashield (air)
[b]: Dash (air)
Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!
<fire>
Sonic [flwr]
#
[a]: Instashield (air)
[b]: Fire Dash (air) / Sonic Boom (ground)
Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!
<feather>
Sonic [fthr]
#
[a]: Instashield (air)
[b]: Feather Dash (air)
Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!
<custom>
Sonic [tndr]
#
[a]: ShieldJump(air)
[b]: Homing Attack (air)
Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!
<custom>
Sonic [watr]
#
[a]: Instashield (air) (Can be used Twice)
[a]: Swim (water)
[b]: Dash (air)
Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!
<custom>
Sonic [ifwr]
#
[a]: Ice roll (air)
While in Ice Roll:
[a]: Ice Burst
[b]: Icycle Dash (air)
Try chaining these moves one after the other!

<custom>
Sonic [clvr]
#
[a]: Instashield (air)
[a]: Recovery Jump (falling)
[b]: Dash (air)
Sonic can Wallrun in this form!

Sonic builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!


#define rosterorder
11

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()


#define start
mask_set(12,12)
dontdrawdefaulthud=true
sonic_additive_firedash=funnytruefalse(playerskindat(p2,name+" additive firedash"))


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
	if (sonic_additive_firedash==true) {draw_set_blend_mode(bm_add)}

    draw_sprite_part_ext(sheetshields,0,209+40*(firedash mod 4),49,39,39,round(x-19.5*xsc),round(y-19.5+dy)+4,xsc,1,$ffffff,alpha)
	
	/*if sonic_additive_firedash*/ draw_set_blend_mode(bm_normal)
}
if (insta) {
    draw_sprite_part_ext(sheetshields,0,209+(floor((20-insta)/3) mod 4)*40,9,39,39,round(x-19.5*xsc),round(y-19.5+dy+4*!size)+4,xsc,1,$ffffff,alpha)
}

if (fall==10 && is_water() && vsp>0 && !waterinsted) {
	if (sonic_additive_firedash==true) {draw_set_blend_mode(bm_add)}
    draw_sprite_part_ext(sheetshields,0,469,110,39,39,round(x-19.5*xsc),round(y-19.5+dy)+36-vsp*8,xsc,vsp/4,$ffffff,alpha)
	draw_set_blend_mode(bm_normal)
}


if (feathdasheffect){
draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),89,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
feathdasheffect+=0.35
if feathdasheffect>=5 feathdasheffect=0
feathdasheffecty_x+=feathdasheffecty_hsp
feathdasheffecty_y+=feathdasheffecty_vsp
}

if boost {
	if !instance_exists(myafterimage) || myafterimage==0 {
		myafterimage=(instance_create(x,y,afterimage))
		with myafterimage  {event_user(0) depth=other.depth-8 visible=1 x=other.x+other.hsp y=other.y+other.vsp alarm[0]=2}
	}

	frame4flipper+=1
	if frame4flipper>=3 {frame4flipper=0 }
} 

/*if homingenemy{
draw_circle_color(homingenemy.x,homingenemy.y,16,c_yellow,c_orange,2)
}
*/

if (energy>=maxe-1) && size!=8 && !boost  && !dontdraw{
sineframe= (sineframe+0.1) mod 360

d3d_set_fog(true, c_white, 0, 5-(sin(sineframe)+1)*2 )
dontdraw=1
ssw_core(0)
dontdraw=0
d3d_set_fog(false, c_black, 0, 0)

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
if (grabflagpole) {sprite="flagslide"}

else if (hurt) {sprite="knock"}
else if (bouncewindup) sprite="bouncewindup"
else if (spindash) {if (spinchargetimer>10) sprite="spincharge" else sprite="spindash"}
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
		} else if using_handle{ sprite="handlegrab"}
		else if bouncetrick sprite="bouncetrick"
		else if (clover_climb) {sprite="maxrun" sprite_angle=90*xsc  dy=-7}
		else if (tricking) {if tricking!=2 sprite="trickup" else sprite="trickright"}
		else if (sprung|| sproinged) {sproinged=true uncurl=false sprite="spring" if (vsp>=0) sprite="springfall"}
		else if (rampof) {sprite="rampof"  }
		else if uncurled {sprite="uncurl"}
		else if (fall=10) {sprite="dash" if firedash sprite="firedash"}
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
		else if (firedash) {sprite="firedash"}
		else if ((abs(hsp)>maxspd*1.4 || (abs(hsp)>maxspd*0.95 && boost))&& !water && !finish) {sprite="maxrun" frspd=abs(hsp/3)}
        else if (abs(hsp)>maxspd*0.9 && !water && !finish) {sprite="run" frspd=abs(hsp/3)}
        else {sprite="walk" frspd=0.2+abs(hsp/4)}
    }
}
	if /*size==3 &&*/ vsp<-2 && sprite="dash" sprite="featherdash"
	if elecdash sprite="thunderdash"

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

		if is_water() && water{
			jumpsnd=playsfx(name+"jump")
			vsp=-2.2-0.2*super
			fall=0
			//WOW WATER SONIC CAN SWIM??? CRAAAZYYYYY
		}


        if ((!insted|| (is_water() && !waterinsted)) && !clover_climb &&(fall=0 || fall=10)) {
            if insted waterinsted=1
			insted=1
            airdash=0
            firedash=0
            boost=0
             if is_water() && fall=10 {
				
				 {
					i=shoot(x,y+12,psmoke)  i.hspeed=-2 i.vspeed=2
					i=shoot(x,y+12,psmoke)  i.hspeed=2 i.vspeed=2
					i=shoot(x,y+12,psmoke)  i.hspeed=-2 i.vspeed=-2 i.gravity=0.5
					i=shoot(x,y+12,psmoke)  i.hspeed=2 i.vspeed=-2 i.gravity=0.5
					if vsp>5{
						i=shoot(x,y+12,psmoke)  i.hspeed=-3 i.vspeed=-4 i.gravity=0.5
						i=shoot(x,y+12,psmoke)  i.hspeed=3 i.vspeed=-4 i.gravity=0.5
					
					}
				}
				vsp=-abs(vsp)
			 
			 
			 }
			if is_ice() && fall=0{vsp=-2 fall=10 insted=0}
			else if is_ice() && fall=10 {
				vsp=-4.2 fall=0
				playsfx("sonicrelease",0,0.5)  
				proj_type="psmok"
				i=shoot(x+16*xsc,y+8) i.hspeed=0 i.vspeed=4
				i.growsize=-1
				i.depth=depth+2
				i=shoot(x+16*xsc,y+8) i.hspeed=0 i.vspeed=4
				i.growsize=1
				i.depth=depth-2

				i=shoot(x+16*xsc,y) i.hspeed=xsc*-2 i.vspeed=2
				i.growsize=-1
				i.depth=depth+2
				i.image_xscale=0.75i.image_yscale=0.75
				i=shoot(x+16*xsc,y) i.hspeed=xsc*2 i.vspeed=2
				i.growsize=1
				i.image_xscale=0.75 i.image_yscale=0.75
				i.depth=depth-2

				i=shoot(x,y-16) i.hspeed=xsc*-3 i.vspeed=4
				i.growsize=-1
				i.depth=depth+2
				i.image_xscale=0.5i.image_yscale=0.5
				i=shoot(x+16*xsc) i.hspeed=xsc*3 i.vspeed=4
				i.growsize=1
				i.image_xscale=0.5i.image_yscale=0.5
				i.depth=depth-2

			}
		else {insta=20+water*10 fall=0}
		if is_thunder() {
			i=shoot(x,y+8)
					i.hspeed=0 i.vspeed=2
					i.growsize=-1 i.depth=depth-1
			vsp=-4
			proj_type="pstar"
			i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
			i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
			i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=-2
			i=fire_projectile(x,y) i.hspeed=2 i.vspeed=-2


		} 
            if (super) {
                braking=0
                sprung=0
                d=point_direction(0,0,right-left,down-up)
                if (!right && !left && !down && !up) d=90
                hsp+=lengthdir_x(4,d)
                vsp+=lengthdir_y(4,d)-1
                vsp=median(-7,vsp,7)
                throwsparks(x,y)
				proj_type="pstar"
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=-2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=-2
                screenshake(x,2)
                
            } else if !is_ice() playsfx(name+"insta")
        }
		
		if fall && !insted {
			playsfx(name+"trick",false,3)	
			com_dorecurl()
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
		if (jump && (fall=0 || fall=2 || fall=5) && !airdash && !firedash)&&!bouncetrick {
			if up && fall==0{
				uncurled=1
				fall=1

			}else{
				airdash=1
				tricked=0
				fall=0

				t=esign(right-left,xsc)
				xsc=t

				hsp=max(abs(hsp)+0.1, 1.25)*sign(xsc) //hsp=max(2,abs(hsp))*esign(hsp,xsc)
				vsp=-2
				fall=10
				

				if is_fire(){
					hsp=4.5*xsc
					vsp=-2
					firedash=24
					boost=1
					playsfx(name+"firedash")

				}
				if is_feather(){
					vsp=-4
					feathdasheffect=1
					feathdasheffecty_x=x
					feathdasheffecty_xsc=xsc
					feathdasheffecty_y=y
					feathdasheffecty_hsp=-xsc*2
					feathdasheffecty_vsp=1
				}
				if (energy>=(maxe-1) || boost) && !is_ice() {
					hyperspeed=(2-size==0)*esign(hsp,xsc)
					boost=1 boosted=1  playsfx(name+"release",0,0.8)  
					proj_type="psmok"

					i=shoot(x+16*xsc,y+8)
					i.hspeed=0 i.vspeed=-4
					i.growsize=-1 i.depth=depth+2

					i=shoot(x+16*xsc,y+8)
					i.hspeed=0 i.vspeed=-2
					i.growsize=1 i.depth=depth-2

					i=shoot(x+16*xsc,y) 
					i.hspeed=xsc*-2 i.vspeed=0
					i.growsize=-1 i.depth=depth+2
					i.image_xscale=0.75 i.image_yscale=0.75

					i=shoot(x+16*xsc,y) 
					i.hspeed=xsc*2 i.vspeed=0
					i.growsize=-1 i.depth=depth+2
					i.image_xscale=0.75 i.image_yscale=0.75


					i=shoot(x,y-16) 
					i.hspeed=xsc*-3 i.vspeed=-2
					i.growsize=-1i.depth=depth+2
					i.image_xscale=0.5 i.image_yscale=0.5


					i=shoot(x,y-16) 
					i.hspeed=xsc*3 i.vspeed=-2
					i.growsize=-1 i.depth=depth-2
					i.image_xscale=0.5 i.image_yscale=0.5
					hsp*=1.01

				}else if !is_ice(){
					if !underwater(){
						proj_type="psmok"
						i=shoot(x-4*t,y+4) i.hspeed=-2*t i.vspeed=0.5 i.growsize=0.25
						i=shoot(x-4*t,y+4) i.hspeed=-2*t i.vspeed=-0.5 i.growsize=-0.25 
						} else {
						//wds=shoot(x,y+((sign(xsc)=-1)*16))
						//wds.waterdust=1
					}

					playsfx(name+"release")
				}else{
					proj_type="psmok"
					vsp=4
					hsp=maxspd*sign(xsc)
					i=shoot(x+16*xsc,y+8) i.hspeed=0 i.vspeed=-4
					i.growsize=-1
					i.depth=depth+2
					i=shoot(x+16*xsc,y+8) i.hspeed=0 i.vspeed=-4
					i.growsize=1
					i.depth=depth-2	

					i=shoot(x+16*xsc,y) i.hspeed=xsc*-2 i.vspeed=-2
					i.growsize=-1
					i.depth=depth+2
					i.image_xscale=0.75
					i.image_yscale=0.75
					i=shoot(x+16*xsc,y) i.hspeed=xsc*2 i.vspeed=-2
					i.growsize=1
					i.image_xscale=0.75
					i.image_yscale=0.75
					i.depth=depth-2

					i=shoot(x,y-16) i.hspeed=xsc*-3 i.vspeed=-4
					i.growsize=-1
					i.depth=depth+2
					i.image_xscale=0.5
					i.image_yscale=0.5
					i=shoot(x+16*xsc,y) i.hspeed=xsc*3 i.vspeed=-4
					i.growsize=1
					i.image_xscale=0.5
					i.image_yscale=0.5
					i.depth=depth-2
					playsfx(name+"release",0,0.5)  
				}
				
				
				if is_thunder(){
					//com_starthomingattack()
					
					elecdash=12
					playsfx(name+"firedash",false,4)
					playsfx(name+"release",false,2) 	
					playsfx(name+"trick",false,1.5)		
					if boost {playsfx(name+"trick",false,0.5)	energy=0}				
					hsp=hsp+(1+!!boost*2)*esign(h,xsc)
					if hsp>(6+!!boost) hsp=(6+!!boost)
					if hsp<-(6+!!boost) hsp=-(6+!!boost)
					hyperspeed=hyperspeed+(!!boost*3)*esign(h,xsc)
					
					boost=0 
					vsp=0
					
					
				}
				
            }
        } else if sproinged||sprung||bouncetrick{
			if up{
				tricking=1
				vsp=-4
				//hsp=0
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
				vsp=0
				hsp=maxspd*h*1.5
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


if (cbut) {
if !jump && (spindash||crouch)
com_startspindash()
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
maxspd=(3.5 + !!size*0.5 + (airdash)*0.5 +boost + firedash/24)*(wf+(0.5*water)+(0.5*(size==7)*water))

vsp=min(7+downpiped,vsp)
calcmoving()

if (!dead && !grabflagpole) {
	


	if fall!=69    player_horstep()
	player_nslopforce()
		//aerial state
    if (jump) {
        //gravity
        balance=0
        if (fall=10 && super) {
            vsp=0.01
			hsp=maxspd*sign(xsc)
        } else if fall!=69 {
			vsp+=(0.15 - (size == 5 && vsp > 0.5) * 0.03) *wf
        }
		if elecdash vsp=0
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
			if is_clover() && !ckey && energy>0.05{
				energy-=0.1 vsp=0
				i=shoot(x,bbox_bottom+random(3),psmoke) i.image_xscale=max(random(4)/3,0.1) 
				if random(2)>1 i.image_xscale*=-1
				i.image_yscale=0.5
				if energy>0.2 coyote=0
			}
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





#define actions
com_warping()
com_actions()

weight=0.4+0.4*(size!=0 && size!=5)

bartype=0

maxe=6-2*(is_big())


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

//waiting animation
if maxwait{
	if (sprite="stand")
	{waittime+=1}
	else if sprite!="wait" waittime=0
}



//spindash/spin
global.coll=id
if (spindash || spin) {
    com_spinhitblocks()
    com_handlespindash()
    com_handlespinning()
} else spinblacklist=noone


com_handlepeelout()
com_handlesonicdash()
if (size==6 && jump && (fall!=10||homingattack)) com_handlehomingattack()
com_handlecloverwallrun()

if (insta) insta-=1
if (super) boost=1
if (firedash) {firedash-=1 boost=1}
if elecdash elecdash-=1



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
if (fall=10||uncurled=1 && size==9){
	 if (knuxcanclimb(coll)) {clover_climb=1 com_piping() glide=0 clover_sideclimb=esign(hitside,xsc)}

}

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
airdash=0
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
	if (firedash||elecdash) {set_sprite("dash") frspd=1 hspeed=xsc*3 fastpipe=1  }
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



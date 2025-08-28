#define spritelist
stand,wait,lookup,crouch,balance,pose,knock,dead,walk,run,maxrun,push,brake,jump,bonk,fall,spring,springfall,roll,climbing,flagslide,piping,pipingup,sidepiping,doorenter,doorexit,spinjump,spindash,spincharge,rampof,trickright,trickup,uncurl,dash,bouncewindup,bouncetrick


#define soundlist
release,skid,spin,spindash,insta,dash,boom,firedash,dropdash

#define movelist
Ray
#
[a]: Instashield (air)
[b]: Dash (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<fire>
Ray [flwr]
#
[a]: Instashield (air)
[b]: Fire Dash (air) / Ray Boom (ground)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<feather>
Ray [fthr]
#
[a]: Instashield (air)
[b]: Feather Dash (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<custom>
Ray
#
[a]: Air Dash (air)
[b]: Homing Attack (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<custom>
Ray
#
[a]: Instashield (air)
[b]: Dash (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<custom>
Ray
#
[a]: Instashield (air)
[b]: Dash (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.
<custom>
Ray
#
[a]: Instashield (air)
[b]: Dash (air)
[a]/[c]: Drop Dash (air)
Ray builds up energy as he runs, 
with max energy, dashing lets him break the sound barrier!.


#define rosterorder
20

#define customhud
dontdrawdefaulthud=true
with other
draw_snack_hud()



#define start
mask_set(12,12)
dontdrawdefaulthud=true

//shielded=1







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

if (type="tflower") {
	coll=other.id
	if (p2!=other.p2) {
		itemc+=1
		doscore_p(1000,1)
	}
	playgrowsfx("6")

	if (skidding) {
		soundstop(name+"skid")
		skidding=0
	}
	
	if (!super && size!=6) grow=1
	oldsize=size
	size=6
	itemget=1
}

if (type="wflower") {
	coll=other.id
	if (p2!=other.p2) {
		itemc+=1
		doscore_p(1000,1)
	}
	playgrowsfx("7")

	if (skidding) {
		soundstop(name+"skid")
		skidding=0
	}
	
	if (!super && size!=7) grow=1
	oldsize=size
	size=7
	itemget=1
}

if (type="iflower") {
	coll=other.id
	if (p2!=other.p2) {
		itemc+=1
		doscore_p(1000,1)
	}
	playgrowsfx("8")

	if (skidding) {
		soundstop(name+"skid")
		skidding=0
	}
	
	if (!super && size!=8) grow=1
	oldsize=size
	size=8
	itemget=1
}

if (type="cflower") {
	coll=other.id
	if (p2!=other.p2) {
		itemc+=1
		doscore_p(1000,1)
	}
	playgrowsfx("9")

	if (skidding) {
		soundstop(name+"skid")
		skidding=0
	}
	
	if (!super && size!=9) grow=1
	oldsize=size
	size=9
	itemget=1
}

#define effectsbehind
if (feathdasheffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),129,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
}

#define effectsfront

if (firedash && !piped) {
    draw_sprite_part_ext(sheetshields,0,209+40*(firedash mod 4),49,39,39,round(x-19.5*xsc),round(y-19.5+dy)+4,xsc,1,$ffffff,alpha)
}
if (insta && insta<14) {
    draw_sprite_part_ext(sheetshields,0,209+(floor((insta-1)/2) mod 4)*40,9,39,39,round(x-19.5*xsc),round(y-19.5+dy+4*!size)+4,xsc,1,$ffffff,alpha)
}

if (feathdasheffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),89,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
	feathdasheffect+=0.35
	if feathdasheffect>=5 feathdasheffect=0
	feathdasheffecty_x+=feathdasheffecty_hsp
	feathdasheffecty_y+=feathdasheffecty_vsp
}

if (size==6  && jump && (fall!=10||homingattack)) {
	coll=instance_nearest(x,y,enemy)
	if coll{
		if sign(x-coll.x)==-xsc{
			if abs(y-coll.y)<128 && abs(x-coll.x)<128 && y<(coll.y+32){
				
				homingenemy=coll.id
			
			} else homingenemy=0           
		} else homingenemy=0  
	}
	if !collision_line(x,y,coll.x,coll.y,homingenemy,1,1) homingenemy=0
	if homingenemy{
		draw_circle_color(homingenemy.x,homingenemy.y,16,c_yellow,c_orange,2)
	}else homingattack=0
}else homingattack=0
	
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
if (owner.instashieldin){
if alarm0=0 {alarm0=14}
alarm0-=1
if alarm0=0 {owner.instashieldin=0}
x=owner.x+owner.hsp y=owner.y+4+4*!owner.size sprite_index=spr_round32 mask_index=spr_round32 image_yscale=1 image_xscale=1
hittype="instashield"

coll=instance_place(x,y,collider)
if (coll) {
if (object_is_ancestor(coll.object_index,hittable)) {
if (coll.object_index=brick) brickc+=1 else brickc=4
hitblock(coll,owner,0,esign(coll.y-owner.y),0)
}    
}
coll=instance_place(x,y,itembox)
if (coll) {
if (object_is_ancestor(coll.object_index,hittable)) {
if (coll.object_index=brick) brickc+=1 else brickc=4
hitblock(coll,owner,0,esign(coll.y-owner.y),0)
}    
}

coll=instance_place(x,y,enemy)
if (coll) {                    
global.coll=owner.id
if coll.object_index=lavabubble || coll.object_index=boo {
coll.vsp=2
} else if (coll.object_index!=bombenemy && coll.object_index!=drybones
    && coll.object_index!=boo && coll.object_index!=urchin) {
enemyexplode(coll,2)
owner.vsp=-owner.vsp
}
}
nah=0
coll=instance_place(x,y,player)
if (coll) {
	with coll if (is_invincible(other.hittype)) other.nah=1
		
		if (coll.id!=owner) if !nah if (!invincible(coll)) {    
	if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { coll.hittype=hittype
	with (coll) hurtplayer(hittype)
	}
	instance_create(x,y,kickpart)
	}
}
} else {y=-1000}

#define projectile
if (event="create"){
	type=owner.proj_type
	visible=1
	event=type+"_create"
}
if (event="step"){

	event=type+"_step"
}
if (event="draw"){
	event=type+"_draw"
	
}

if (event=="psmok_create"){
	fr=0
	friction=0.1
	visible=1
	getregion(x)
	growsize=0	
}
if (event=="psmok_step"){
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
if (event=="psmok_draw"){
	draw_sprite_part_ext(owner.sheetshields,0,369+frame*25,9+25*(owner.size- (2*(owner.size>3))),24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)

}

if (event=="pstar_create"){
	fr=0
	friction=0.1
	getregion(x)
	growsize=0	
}
if (event=="pstar_step"){
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
if (event=="pstar_draw"){
	if owner.usepalette scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,global.reroutedsizes[owner.p2,owner.size],1,owner.totpal+1)

	draw_sprite_part_ext(owner.sheetshields,0,469+frame*25,9,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)
	shader_reset()
}
if (event=="4star_create"){
	fr=0
	friction=0.1
	getregion(x)
	growsize=0	
}
if (event=="4star_step"){
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
if (event=="4star_draw"){
	draw_sprite_part_ext(owner.sheetshields,0,469+frame*25,34,24,24,round(x-12*image_xscale),round(y-12*image_yscale),image_xscale,image_yscale,c_white,1)
}


#define sprmanager
frspd=1
cantslowanim=0
if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}
else if (spindash) {if (spinchargetimer) sprite="spincharge" else sprite="spindash"}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if !(spindash) {
	if (onvine) 
	{
	sprite="climbing" frspd=sign(left+right+up+down)
	}
	else if (climb) {sprite="maxrun" sprite_angle=90*xsc  dy=-7}
	else if (tricking) {if tricking!=2 sprite="trickup" else sprite="trickright"}
    else if (sprung|| sproinged) {sproinged=true uncurl=false sprite="spring" if (vsp>=0) sprite="springfall"}
	else if (rampof) {sprite="rampof"  }
	else if uncurled {sprite="uncurl"}
    else if (fall=10) {sprite="dash"}
    else if (bonk) sprite="bonk"
    else if (fall=6) {sprite="knock"}
    else {if (fall) if vsp>=0 sprite="fall" else sprite="jump" if !fall sprite="spinjump" frspd=1} //frspd=fallspd
	}
} else {
    if (spin) {sprite="roll" frspd=0.5+abs(hsp/3)}
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
if (homingattack||spindash || (crouch && !jump) || (super && fall=10) || vinegrab || grabflagpole || (spin && !jump) || peelout) h=0

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
        if (up && hsp=0 && fall!=69 && !jump) peelready=1
		
        else if (hsp==0 && crouch && push==0 && hsp=0  &&fall!=69) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
        } else if !peelready {
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
			i=fire_projectile(x,y+12) i.hspeed=hsp i.vspeed=-2 i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.friction=0.05 i.gravity=0.05
			i=fire_projectile(x,y+12) i.hspeed=2*xsc i.vspeed=-1 i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.depth=depth+2 i.gravity=0.1
			i=fire_projectile(x,y+12) i.hspeed=-2*xsc i.vspeed=-2 i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.1
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
	
		if size==7 && water{
			jumpsnd=playsfx(name+"jump")
            vsp=-2.2-0.2*super
			fall=0
			//WOW WATER Ray CAN SWIM??? CRAAAZYYYYY
		}
	
	
        if ((!insted|| (size==7 && !waterinsted)) && !climb &&(fall=0 || fall=10)) {
            if insted waterinsted=1
			insted=1
            airdash=0
            firedash=0
            boost=0
            
			if size==8 && fall=0{vsp=-2 fall=10 insted=0}
			else if size==8 && fall=10 {vsp=-4.2 fall=0
					playsfx("sonicrelease",0,0.5)  
					proj_type="psmok"
					i=fire_projectile(x+16*xsc,y+8) i.hspeed=0 i.vspeed=4
					i.growsize=-1
					i.depth=depth+2
					i=fire_projectile(x+16*xsc,y+8) i.hspeed=0 i.vspeed=4
					i.growsize=1
					i.depth=depth-2
					
					i=fire_projectile(x+16*xsc,y) i.hspeed=xsc*-2 i.vspeed=2
					i.growsize=-1
					i.depth=depth+2
					i.image_xscale=0.75	i.image_yscale=0.75
					i=fire_projectile(x+16*xsc,y) i.hspeed=xsc*2 i.vspeed=2
					i.growsize=1
					i.image_xscale=0.75 i.image_yscale=0.75
					i.depth=depth-2
					
					i=fire_projectile(x,y-16) i.hspeed=xsc*-3 i.vspeed=4
					i.growsize=-1
					i.depth=depth+2
					i.image_xscale=0.5	i.image_yscale=0.5
					i=fire_projectile(x+16*xsc) i.hspeed=xsc*3 i.vspeed=4
					i.growsize=1
					i.image_xscale=0.5	i.image_yscale=0.5
					i.depth=depth-2
					
				}
			else {insta=1 alarm[1]=20+water*10 fall=0}
			if size==6 {
			
				vsp=-4
				proj_type="pstar"
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
					
			
			} instashieldin=1
            if (super) {
                braking=0
                sprung=0
                d=point_direction(0,0,right-left,down-up)
                if (!right && !left && !down && !up) d=90
                hsp+=lengthdir_x(4,d)
                vsp+=lengthdir_y(4,d)-1
                vsp=median(-7,vsp,7)
                throwsparks(x,y)
                screenshake(x,2)
                
            } else if !size==8 playsfx(name+"insta")
        }
        jumpbuffer=4*!jumpbufferdo
    }
}

if (spindash) {
	spindust+=0.5
	spindust=wrap_val(spindust,0,7)
} else spindust=0


jumpbufferdo=0
springin=0

if (akey) {
	if (up && abs(hsp)<=0.5 && h=0 && !jump && !fall && peelready){
		if peelsound == 0
		{
		playsfx(name+"peelcharge")
		peelsound = 1
		}
		peelout+=1
		if peelout>60 peelout=60
	}

    if (jumpbuffer) jumpbuffer-=1
} else {
    jumpbuffer=0
}


if (peelout && !up) {
	peelready=0
	peelsound=0 soundstop(name+"peelcharge")
	if (peelout>45) {
		proj_type="psmok"
		i=fire_projectile(x,y) 
		i.depth=depth+2 
		i.xsc=xsc
		if peelout>60 peelout=60
		if size==2 firedash=28
		playsfx(name+"peelrelease")
		hsp=sign(xsc)*maxspd*1.25

		energy=4
		hyperspeed=(peelout/45)*sign(hsp)
		peelout=0
	}
	else if (peelout<45) {
		playsfx(name+"peelrelease")
		hsp=sign(xsc)*peelout*0.1
		peelout=0
		}
	else peelout=0
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
    if (spindash || (hsp=0 && crouch && push=0)) {
		if (spindash) spinchargetimer=20
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } else {
        if (jump && (fall=0 || fall=2 || fall=5) && !airdash && !firedash) {
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
				if (size==6 && homingenemy && !homingattack) {
					homingattack=1
					homingstartx=x
					homingstarty=y
					homingtarget=homingenemy
					homingtimer=0
					fall=0
				}
				if size==2{
					hsp=4.5*xsc
					vsp=0
					firedash=24
					boost=1
					playsfx(name+"firedash")
				
				}
				if size==3{
					vsp=-4
					feathdasheffect=1
					feathdasheffecty_x=x
					feathdasheffecty_xsc=xsc
					feathdasheffecty_y=y
					feathdasheffecty_hsp=-xsc*3
					feathdasheffecty_vsp=-1
				}
				if (energy>=(maxe-1) || boost) && size!=8 {
					hyperspeed=(2-size==0)*esign(hsp,xsc)
					boost=1 boosted=1  playsfx(name+"release",0,0.8)  
					proj_type="psmok"

					i=fire_projectile(x+16*xsc,y+8)
					i.hspeed=0 i.vspeed=-4
					i.growsize=-1	i.depth=depth+2
					
					i=fire_projectile(x+16*xsc,y+8)
					i.hspeed=0 i.vspeed=-2
					i.growsize=1	i.depth=depth-2
					
					i=fire_projectile(x+16*xsc,y) 
					i.hspeed=xsc*-2 i.vspeed=0
					i.growsize=-1	i.depth=depth+2
					i.image_xscale=0.75	i.image_yscale=0.75
					
					i=fire_projectile(x+16*xsc,y) 
					i.hspeed=xsc*2 i.vspeed=0
					i.growsize=-1	i.depth=depth+2
					i.image_xscale=0.75	i.image_yscale=0.75
					
					
					i=fire_projectile(x,y-16) 
					i.hspeed=xsc*-3 i.vspeed=-2
					i.growsize=-1	i.depth=depth+2
					i.image_xscale=0.5	i.image_yscale=0.5
					
					
					i=fire_projectile(x,y-16) 
					i.hspeed=xsc*3 i.vspeed=-2
					i.growsize=-1	i.depth=depth-2
					i.image_xscale=0.5	i.image_yscale=0.5
					hsp*=1.01
					
				}else if size!=8{
					if !underwater(){
						proj_type="psmok"
						i=fire_projectile(x-4*t,y+4) i.hspeed=-2*t i.vspeed=0.5 i.growsize=0.25
						i=fire_projectile(x-4*t,y+4) i.hspeed=-2*t i.vspeed=-0.5 i.growsize=-0.25 
					} else {
						//wds=fire_projectile(x,y+((sign(xsc)=-1)*16))
						//wds.waterdust=1
					}
					
					playsfx(name+"release")
				}else{
				{
					proj_type="psmok"
					vsp=4
					hsp=maxspd*sign(xsc)
						i=fire_projectile(x+16*xsc,y+8) i.hspeed=0 i.vspeed=-4
						i.growsize=-1
						i.depth=depth+2
						i=fire_projectile(x+16*xsc,y+8) i.hspeed=0 i.vspeed=-4
						i.growsize=1
						i.depth=depth-2
						
						i=fire_projectile(x+16*xsc,y) i.hspeed=xsc*-2 i.vspeed=-2
						i.growsize=-1
						i.depth=depth+2
						i.image_xscale=0.75
						i.image_yscale=0.75
						i=fire_projectile(x+16*xsc,y) i.hspeed=xsc*2 i.vspeed=-2
						i.growsize=1
						i.image_xscale=0.75
						i.image_yscale=0.75
						i.depth=depth-2
						
						i=fire_projectile(x,y-16) i.hspeed=xsc*-3 i.vspeed=-4
						i.growsize=-1
						i.depth=depth+2
						i.image_xscale=0.5
						i.image_yscale=0.5
						i=fire_projectile(x+16*xsc,y) i.hspeed=xsc*3 i.vspeed=-4
						i.growsize=1
						i.image_xscale=0.5
						i.image_yscale=0.5
						i.depth=depth-2
						playsfx("snack_sonicrelease",0,0.5)  
					
				}
				
				
				}
            }
        } else if sproinged && !tricking{
			if up{
				tricking=1
				vsp=-4
				hsp=0
				proj_type="pstar"
				i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
				i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
				proj_type="4star"
				i=fire_projectile(x,y+4)
			}else  if h!=0
			{
				tricking=2
				vsp=0
				hsp=maxspd*h*1.5
				proj_type="pstar"
				i=fire_projectile(x-4*xsc,y+4) i.hspeed=-2*t i.vspeed=2  i.growsize=0.25
				i=fire_projectile(x-4*xsc,y+4) i.hspeed=-2*t i.vspeed=-2 i.growsize=-0.25 
				proj_type="4star"
				i=fire_projectile(x,y+4)
			
			} 
		
		}
    }
}

if (bkey) {
    if (!jump) cancarry=1
	else
	cancarry=0
} else {
    if (carry) {
        updatecarry()
        if (!down) {throw=16 instance_create(carryid.x,carryid.y,kickpart) sound("enemykick")}
        with (carryid) event_user(0)
        carryid=noone
        carry=0
    }
}

if ((cbut || jumpbufferdo) && (!springin)) {
	
    if (!jump||fall=69||grabflagpole) { //grounded
		if (spindash || (hsp=0 && crouch && push=0)) {
			if (spindash) spinchargetimer=20
			playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
			spindash=min(4,spindash+1)
			tempbrick=1
		}
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

if !jump	{sproinged=0 uncurled=0 tricking=0 rampof=0}

//speed limits
if (!jump) if (loose || spin || crouch) {
    braking=0
    frick=0.06
    if (spin) frick=0.005
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula
maxspd=(3.5 + !!size*0.5 + (airdash)*0.5 +boost + firedash/24)*(wf+(0.5*water)+(0.5*(size==7)*water))

//There's an extra check in the hsp+= section of h!=0 to compensate!.
//if (abs(hsp)>maxspd) {
//	if (!spin && !(jump)) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)
//}
//That's right, death to the maxspeed just straight up capping your speed! GRAAAHHH

vsp=min(7+downpiped,vsp)

///movement
//hi moster here dont uncomment the yground or easyground stuff because its required for the cool new slope system to work
//for anyone porting a charm from unfinished build or below to this build, delete or comment all of the commented code and add player_nslopforce()
calcmoving()

if (!dead && !grabflagpole) {
	if fall!=69
    player_horstep()
player_nslopforce()
    //yground=easyground()
//if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        balance=0
        if (fall=10 && super) {
            vsp=0.01
			hsp=maxspd*sign(xsc)
        } else if fall!=69 {
			makeafterimages=0
			if ( homingattack) {
				homingtimer+=0.1
				makeafterimages=1
				airdash=0
				if homingtimer>=1.1 {homingattack=0 airdash=0}
				if homingtarget && !(homingtarget.x<=0) && instance_exists(homingtarget){
				hsp=0
				vsp=-3
				
				x=homingstartx*(1-homingtimer)+homingtarget.x*(homingtimer)
				y=(homingstarty*(1-homingtimer)+homingtarget.y*(homingtimer))-abs(sin(homingtimer*4))*16
				
				} else {homingtarget=0 airdash=0}
				if !jump {homingattack=0 airdash=0}
				fall=0
			} else vsp+=(0.15 - (size == 5 && vsp > 0.5) * 0.03) *wf
        }else climb=0 
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
    }

sprite_angle=0
if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3

    if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
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





#define actions
com_warping()
com_actions()



weight=0.4+0.4*(size!=0 && size!=5)
bartype=0

maxe=6-2*(size!=0 && size!=5)
if (abs(hsp+hyperspeed+gm8exspd)>=(maxspd*0.9) && !finish) {
	 energy+=1/32
	//HEhe	
} else if (energy) { energy=max(0,energy-1/32) if (energy=0) {boost=0 }}
if abs(hsp+hyperspeed+gm8exspd)<1 && !jump {energy=0 boost=0}

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
if (star || insta) power_lv=5
if (super) power_lv+=1
if (firedash) is_coinexplosive=1

//Special interactions
pvp_spin=(spin&& !jump) //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=instashieldin //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away

//Clover Flower's wallrun
if (climb) {
	fall=0
	if down climb=0
	if climb=1 {climb=2 if vsp>-3 vsp=-3}
    hsp=0 xsc=sideclimb tempkill=1
	vsp-=0.1 //a small nerf to gravity.
	if vsp>1 climb=0
	if abut { vsp=-4 hsp=-2*xsc  climb=0 airdash=0}
	if !collision(4*xsc,0) climb=0
	
	if climb==0 {sprite_angle=0 airdash=0}

}

//whoputshitinyourpip
if (piped) exit

//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

//grounded state
if (!jump) {
    vsp=0
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
	proj_type="psmok"
    if (braking || fall=3) {
        i=fire_projectile(x,y+10) i.depth=depth+2
    }
    if (vsp<-5-2*!sprung) {
        i=fire_projectile(x,y+8) i.vspeed=-1
    }
    if (vsp>7) {
        speedwagon+=1
        if (speedwagon>60) {i=fire_projectile(x,y) i.vspeed=-1}
    } else speedwagon=0
    if (abs(hsp)>4 && boostvar>=0.75 && !jump) {
		
		fire_projectile(x-12*xsc,y+12)
	
	}
}


if (insta) insta+=1
if (dashtimer) dashtimer-=1
if !(jump && fall=10)
boostvar=inch(boostvar,0.75*boost*!jump*!spin,0.025+(0.002*jump))
if (boost) {
    if (hurt && !super) boost=0
    if (point_distance(0,0,hsp,vsp)<3.5 || (boostvar<=0 && !boosted)) boost=0
} else boostvar=0
if (super) boost=1
if (firedash) {firedash-=1 boost=1}

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
        spindash=max(1,spindash-0.025)
        if (!crouch) && !(jump) {
            if (spindash>3) boost=3
            spin=1
            hsp=xsc*6*(0.75+0.075*median(0,spindash,2))
            spindash=0
            
                soundstop(name+"spindash")
                playsfx(name+"release")
            
        }
        if (hsp!=0) && !(jump) spindash=0
    }
    
    //stop spinning
    if (abs(hsp)<0.2 && spin) { 
            spinc+=1 if (spinc=8) {
            mask_temp(12,24)
            if (collision(0,0) && size!=5) {
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
//Christianity moment
jesus=(((boost && vsp<4)||(size==5 && !down && abs(hsp)>3.2)) && !water)



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
    } else if (!star && !flash) hurtplayer("enemy")
}    

#define hurt
pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
climb=0 
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
	dropdash=0
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")

    starhit=0
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size>=2 size=1} hsp=xsc*-2*wf vsp=-3*wf
    
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
	 if (knuxcanclimb(coll)) {climb=1 com_piping() glide=0 sideclimb=esign(hitside,xsc)}

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



#define description
A straight code port of Metal Sonic from the 1.9 Metal-Bloom mod featuring a fully functioning super form. Made by Todadoat and LYB4.                the moster "And i'm here too" 


#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,maxrun,brake,spring,springfall,jump,bonk,ball,spindash,spincharge,dropdash,push,balance,fire,dash,downdash,climbing,flagslide,hanging,hangmove,grinding,piping,pipingup,sidepiping,doorenter,doorexit,transform,boost,fall


#define soundlist
release,skid,spin,spindash,insta,dash,boom,airdash,firedash,dropdash,jump2,gosuper,taunt


#define movelist
Metal Sonic (1.9)
#
[a]: Double Jump (air)
[down]+[a]: Drop Dash
[b]: Insta-Boost
Collect all Chaos Emeralds to [c]: Go Super!

#define rosterorder
4


#define start
mask_set(12,12)
playerskinstr(p2,"supermusic"+string(p2),playerskinstr(p2,name + " supermusic")) //player.txt super music toggle :)
domusic=funnytruefalse(playerskindat(p2,"supermusic"+string(p2)))

if (usepalette || global.singlesheet[p2]) {
    sheets[6]=sheets[4]
    sheets[7]=sheets[4]
    sheets[8]=sheets[4]
    sheets[9]=sheets[4]
} else { //no palettes? no problem!  i hope.
    if !playerskindat(p2,"supersheets"+string(p2)) {
        var dir;
        dir=string_replace(playerskinstr(p2,"infotxt"+string(p2)),"player.txt","")
        replacesheet(p2,name+"6",dir+name+"-super1.png",0,0,1)
        replacesheet(p2,name+"7",dir+name+"-super2.png",0,0,1)
        replacesheet(p2,name+"8",dir+name+"-super3.png",0,0,1)
        playerskindat(p2,"supersheets"+string(p2),1)
    }
    sheets[6]=skindat("tex_"+name+"6"+string(p2)) //yes these are meant to be skindat
    sheets[7]=skindat("tex_"+name+"7"+string(p2))
    sheets[8]=skindat("tex_"+name+"8"+string(p2))
}


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

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()


#define itemget
if (type="bfeather") {
    type="fflower"
}
if (type="wflower") {
    type="fflower"
}
if (type="tflower") {
    type="fflower"
}
if (type="cflower") {
    type="fflower"
}
if (type="iflower") {
    type="fflower"
}
com_item()

#define effectsfront
if (firedash && !piped) {
    draw_sprite_part_ext(sheetshields,0,209+40*(firedash mod 4),49,39,39,round(x-19.5*xsc),round(y-19.5+dy)+4,xsc,1,$ffffff,alpha)
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
    if alarm0=0 {
        alarm0=14
    }
    alarm0-=1
    if alarm0=0 {
        owner.instashieldin=0
    }
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
        if (coll.object_index!=bombenemy && coll.object_index!=drybones && coll.object_index!=urchin && coll.object_index!=boo) {
            enemyexplode(coll,2)
            owner.vsp=-owner.vsp
        }
    } else {
        coll=instance_place(x,y,podoboo)
        if (coll) {
            global.coll=owner.id
            coll.vspeed=2
        }
    }

    nah=0
    
    coll=instance_place(x,y,player)
    if (coll) {
    	with coll if (is_invincible(other.hittype)) other.nah=1
    	if (coll.id!=owner) 
            if !nah 
                if (!invincible(coll)) {    
                    if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) {
                        coll.hittype=hittype
                        with (coll) hurtplayer(hittype)
                    }
                    instance_create(x,y,kickpart)
                }
    }
} else {
    y=-1000
}

#define projectile
if (event="create") {
image_xscale=8
image_yscale=4

frame_sub=0
frame=0
brickc=0
seqcount=2
getregion(x) 
timer0=3
timer1=128
depth=-1;

hspeed=xsc*3+owner.hsp*(xsc=sign(owner.hsp))
speed=median(2,speed,5)
playsfx(owner.name+"boom")
}
if (event="step") {
timer0-=1 if (timer0=0) visible=1
timer1-=1 if (timer1=0) instance_destroy()
calcmoving()

frame_sub=!frame_sub
if frame_sub frame+=1
if (frame>=3) frame=0

if (!inview()) instance_destroy()
xsc=sign(hspeed)
ignoreoncount=1
if (!waterdust && !feathdash){
ignoreoncount=0
coll=instance_place(x,y,collider)
if (coll) {
if (object_is_ancestor(coll.object_index,hittable)) {
if (coll.object_index=brick) brickc+=1 else brickc=4
hitblock(coll,owner,1,-1,0)
} else brickc=4
instance_create(x,y,kickpart)     
if (brickc=4) {sound("itemblockbump") instance_destroy()}
}

coll=instance_place(x,y,enemy)
if (coll) {
if (coll.object_index!=beetle && coll.object_index!=bulletbill 
&& coll.object_index!=bullseyebill && coll.object_index!=banzaibill 
&& coll.object_index!=cannonball && coll.object_index!=drybones 
&& coll.object_index!=bombenemy && coll.object_index!=boo 
&& coll.object_index!=urchin) {
yes=1
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
} else{
timer0=0
visible=1
if timer1>14 timer1=14 
if timer1=14 setxsc=owner.xsc
efxfr=efxfr+0.25 
if waterdust{
hspeed=(sign(setxsc)*(-3/efxfr*2))
xsc=sign(hspeed)
}
else {xsc=setxsc hspeed=-setxsc}


}
}
if (event="draw") {
	if !waterdust && !feathdash{
		draw_sprite_part_ext(owner.sheets[owner.size*!global.singlesheet[p2]],0,10+25*frame,88,24,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
	}
	else if !feathdash{
		draw_sprite_general(global.effectssheet[biome],0,8+25*floor(efxfr),158,24,24,x,round(y-8)-13,-1,-xsc,90,$ffffff,$ffffff,$ffffff,$ffffff,1)
		draw_sprite_general(global.effectssheet[biome],0,8+25*floor(efxfr),158,24,24,x,round(y-8)+15,1,-xsc,90,$ffffff,$ffffff,$ffffff,$ffffff,1)
		if efxfr<3{draw_sprite_general(global.effectssheet[biome],0,8+25*floor(efxfr*2),183,24,24,x,round(y-8)+18,1,-xsc,90,$ffffff,$ffffff,$ffffff,$ffffff,1)}
	} 
	else {
		draw_sprite_part_ext(owner.sheets[3*!global.singlesheet[p2]],0,227+40*floor(efxfr)+164*global.singlesheet[p2],46,39,39,round(x-19.5*xsc),round(y-19.5)+4,xsc,1,$ffffff,owner.alpha)
		savedepth=depth
		depth=owner.depth+1
		draw_sprite_part_ext(owner.sheets[3*!global.singlesheet[p2]],0,227+40*floor(efxfr)+164*global.singlesheet[p2],86,39,39,round(x-19.5*xsc),round(y-19.5)+4,xsc,1,$ffffff,owner.alpha)
		depth=savedepth
	}
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
    else if (sprung) {sprite="spring" fallspr="springfall" if (vsp>=0) {sprung=0 fall=1}}
	else if (dropdash) {sprite="dropdash"}
    else if (fall=10) {if ((vsp>2 && dashanim>30) || sprite="dash") sprite="dash" else sprite="dash" dashanim+=1}
    else if (bonk) sprite="bonk"
    else {if (fall) {sprite=fallspr if (fall=6) {sprite="knock"}} if sprite="walk"||sprite="run" sprite="springfall" if !fall {if (jumpball) {if vsp<=0 sprite="jump" else sprite="fall"} else sprite="jump"} frspd=1} //frspd=fallspd
	}
} else {
    if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
    else if (fired) {sprite="fire" cantslowanim=1}
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
    else if (firedash) {sprite="downdash"}
    else if (hsp=0) {
        if (balance) {sprite="balance"}
        else if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (braking) sprite="brake"
		else if (boost && boostvar>=0.75 && !super) {sprite="downdash"}
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

lookup=0
if (up && hsp=0 && !jump && !carry && !throw) {
    lookup=1
    if (!lookupsoundplayed) {
        lookupsoundplayed=1
        playsfx("19metaltaunt")
    }
} else {
    lookupsoundplayed=0
}


//list of things that prevent you from moving
if (spindash || (crouch && !jump) || (super && fall=10) || vinegrab || grabflagpole || (spin && !jump)) h=0

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
                    hsp+=(0.06 + (0.02*(size==5)))*wf*h
                    braking=0
                    if (!firedash) xsc=h
                }
            } else { //air accel
				if !(jump && !fall) || (abs(hsp)<maxspd || sign(hsp)!=h)
                hsp+=(0.03+0.03*!fairdash+(0.03*size==3))*wf*h
				spin=0
               // if !(fall=10 && boost) {hsp+=0.08*wf*h} else {hsp+=0.01*wf*h}
			    if (!firedash) xsc=h
				else collwin=instance_place(x+hsp,0,goalblock)
				if collwin {
					hsp=0 fallsprite="dash" collwin.owner=id with collwin{ event_user(4)}
				}				
            }
        }
    }
}

if (push!=h) push=0

com_di()



//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin) && !spindash) {
    if (!jump||fall=69 || grabflagpole) { //jump
        if (hsp==0 && crouch && push==0 && size && size!=5 && !vinegrab && !spindash &&!grabbedflagpole) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=1
            tempbrick=1
        } else if ((size==5 && !collision(0,-4)) || size!=5) {
            jumpsnd=playsfx(name+"jump",0,1+((size==5)/3))
            vsp=-5.2-0.2*super
            onvine=0
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)

            grabflagpole=0
            latchedtoflagpole=0
            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/1.5)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)

			sprite_angle=0

            jump=1
			spin=0
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
    } else { //air jumps
        if (name="19metal") {
            if (super && fall=10) {
                if (abs(hsp)>maxspd-0.75 && name="19metal") boost=1
	            t=esign(right-left,xsc)
	            xsc=t
	            if (super) {
	                hsp+=t
	                vsp=min(0,vsp/2)
	            }
	            if (jump) {fall=10}
	            hsp=4.5*(energy/2)*xsc
	            vsp=0                       
	            firedash=energy*8+size+super
	            boost=1
	            sxsc=xsc
	            playsfx("19metalrelease")
            }
            if (down && !dropdash && !fall) {if (size) {dropdash=1 playsfx('19metaldash')}}
            else if (!insted && !fall) {
                sxsc=xsc canstopjump=1 vsp=-3 insted=1 instance_create(x,y+16,smoke) playsfx(name+"jump2")
				if (super) {
                    insted=1 
                    fall=0
                    insta=1 alarm[1]=20+water*10-(name="ashura")*10 //what the fuck?
                    myhitbox=instance_create(x,y+4*!size,instaeffect)
                    myhitbox.owner=id                           
                    breaking=0
                    sprung=0
                    d=point_direction(0,0,right-left,down-up)
                    if (!right && !left && !down && !up) d=90
                    hsp+=lengthdir_x(4,d)
                    vsp+=lengthdir_y(4,d)-1
                    vsp=median(-7,vsp,7)
                    with (instance_create(x,y,kickpart)) {hspeed=-3 vspeed=-3}
					with (instance_create(x,y,kickpart)) {hspeed=3 vspeed=-3}
					with (instance_create(x,y,kickpart)) {hspeed=-3 vspeed=3}
					with (instance_create(x,y,kickpart)) {hspeed=3 vspeed=3}
                    screenshake(x,2)
                    playsfx(name+"release")
                } else playsfx(name+"jump2")
            } 
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
    if (jump && super && fall=10) {
        fall=1 airdash=0
    } else if (!crouch && !spin && !firedash && !dropdash && energy>0) {
        if (abs(hsp)>maxspd-0.75 && name="19metal") boost=1
        t=esign(right-left,xsc)
        xsc=t
        if (super) {
            hsp+=t
            vsp=min(0,vsp/2)
        }
        if (jump) {fall=10}
        hsp=4.5*(energy/2)*xsc
        vsp=0                       
        firedash=energy*8+size+super
        boost=1
        sxsc=xsc
        playsfx("19metalrelease")
    }
}

if (cbut) {
	if (jump && size && size!=5 && global.emeralds==7) {
        if (name="19metal" ) {
            //super input
            if (super) stopsuper(0)
            else gosuper()
	playsfx("19metalgosuper")
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


//speed limits
if (!jump) if (loose || spin || crouch) {
    braking=0
    frick=0.06
    if (spin) frick=0.005
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula
maxspd=(3.5 + super*0.5 + !!size*0.5 + spin + (fall=10)*0.5 + firedash/24)*wf

//There's an extra check in the hsp+= section of h!=0 to compensate!.
if (abs(hsp)>maxspd) {
	if (!spin && !(jump && (!fall))) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)
}

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
			hsp+=(right-left)*0.25
	        if (name="ashura") vsp+=(down-up)*0.15-0.075
	        else vsp+=(down-up)*0.15+0.05+0.1*max(0,2-abs(hsp))*(vsp<2)
	        l=median(0,point_distance(0,0,hsp,vsp)-0.05,maxspd)
	        d=point_direction(0,0,hsp,vsp)
	        hsp=lengthdir_x(l,d)
	        vsp=lengthdir_y(l,d)
	        xsc=esign(hsp,xsc)
        } else if fall!=69 {
            vsp+=(0.15 - (size == 5 && vsp > 0.5) * 0.03) *wf
        }
        if (!hurt) {
        vine_climbing()
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

if (global.music!="super" && domusic && super && global.gamemode!="battle") {
    playsupermusic=1
    mus_stop()
    global.music="super"
    mus_play(global.music,1,p2)
    supermusic=1
}   



weight=0.4+0.4*!!size

if (size=0) maxe=0 if (size=1) maxe=5 if (size=2 || super) maxe=6
bartype=1
if (mcs>=24) {energy+=1 mcs=0}

if (super) {
    realsupersizeyeah+=0.2
    if (realsupersizeyeah > 8.8 || realsupersizeyeah < 6) realsupersizeyeah=6 //[CHEAP HACK] the loop works like this because wrap_val kept crashing the game???? ok Ok.
    size=floor(realsupersizeyeah)
    oldsize=floor(realsupersizeyeah) //fixes super visually taking damage from being small sonic if you run into a bombshell koopa?
} else if (size>5) {
    size=1
}

if (dropdash) dropdash=min(20,dropdash+1)
if (hurt) dropdash=0    
runvar=inch(runvar,run,0.05)
stomplok=max(0,stomplok-1)
wallkick=max(0,wallkick-1)
watrlock=max(0,watrlock-1)
twist=max(0,twist-1)
throw=max(0,throw-1)            
hang=max(0,hang-1)
swim=max(0,swim-1) 
poundjump=max(0,poundjump-1)
spinlock=max(0,spinlock-1)
wsk=(wsk+0.1) mod 4    
if (flash) {fk+=1 if (fk>60) {flash=0 fk=0}}
if (insta) insta+=1
if (boost) {
    if (hurt && !super) boost=0
    if (point_distance(0,0,hsp,vsp)<maxspd-0.75) boost=0
}                     
if (pound) {       
    crouch=1
    spin=1
    boost=1
    hang=0
    myhitbox=instance_create(x,y+38*!size,instaeffect)
    myhitbox.owner=id
    myhitbox.image_xscale=0.5
    myhitbox.image_yscale=0.6    
    if (pound<3) pound+=1
    else if (up || (water && vsp>5)) {pound=0 fall=0 insted=1 crouch=0}
    else fall=4
} else poundcancel=0    
if (super) boost=1
if (firedash) {firedash-=1 boost=1 mcs=0 energy-=1}



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


//your feathers are firey now
if readyahit!=0 readyahit-=1
if readyahit=1 with(hittingblock){
with (phaser) y=-verybignumber
if (go=1) {if (instance_position(x+8,y+24,collider)) go=-1}
else {if (instance_position(x+8,y-8,collider)) go=1}    
with (phaser) y=ystart

iid=noone

if (content="itemfeather") {
    with (instance_create(x+8,y+8+4*go,item)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="thunderitem") {
    with (instance_create(x+8,y+8+4*go,item)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="wateritem") {
    with (instance_create(x+8,y+8+4*go,item)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="iceitem") {
    with (instance_create(x+8,y+8+4*go,item)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (content="cloveritem") {
    with (instance_create(x+8,y+8+4*go,item)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}

if (picked && iid) {
    i=instance_create(x+8,y+8,gravitymanager)
    i.vsp=go*4-1
    i.carry=iid
    i.phase=4
    i.drop=1
    iid.c=0
    iid.drop=0
    iid.speed=0
    iid.aaa=0
    iid.bbb=0
    iid.alarm[0]=-1
}

picked=0
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
    if (abs(hsp)>4 && boostvar>=0.75 && !jump) shoot(x-12*xsc,y+12,psmoke,0,0)
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
//Christianity moment
jesus=((((boost && vsp<4)||(size==5 || super)) && !down && abs(hsp)>3.2) && !water && vsp>=0.35)


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
        
        if (spindash || firedash) {if (diggity=32) exit enemyexplode(coll) exit}
        if (insta) {enemyexplode(coll) exit}
        
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
               coll.phase=id
            }
            else hurtplayer("enemy") exit
        }
        
        if (type=cheepred || type=cheepwhite) {
            if (jump && !calcfall && size!=5) {enemyexplode(coll) exit}
            else if (!calcfall && size==5 && jump) {
                if (vsp>0) {
                vsp=-3-akey*1.5
                canstopjump=akey
                if (fall=12) fall=5
                playsfx(name+"jump",0,1.8)
                coll.phase=id
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
                    coll.phase=id
                }
                else hurtplayer("enemy") exit
            }          
            else enemystomp(coll) exit      
        } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 if size!=5 enemystomp(coll) else {playsfx(name+"jump",0,1.8) coll.phase=id} exit}
        
        hurtplayer("enemy")   
    } else if (!star && !flash) hurtplayer("enemy")
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
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size=3 size=1 else if (super) {size=1 stopsuper(0)} else size-=1} hsp=xsc*-2*wf vsp=-3*wf
    
}


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
    with (blockcoll) {
        if (string(content)="itemfeather") {
            content="item"
}
	if (string(content)="thunderitem") {
            content="item"
}
        if (string(content)="wateritem") {
            content="item"
}
if (string(content)="iceitem") {
            content="item"
}
if (string(content)="cloveritem") {
            content="item"
}
    }
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
airdash=0
boosted=0

if !down spin=0

if (name="19metal") {
    if (dropdash=20) {playsfx('19metalrelease') hsp=4*xsc spin=1 seqcount=0 instance_create(x,y+8,smoke) 
    with (instance_create(x,y,kickpart)) {hspeed=-3 vspeed=-3}
	with (instance_create(x,y,kickpart)) {hspeed=3 vspeed=-3}
	with (instance_create(x,y,kickpart)) {hspeed=-3 vspeed=3}
	with (instance_create(x,y,kickpart)) {hspeed=3 vspeed=3}}
    dropdash=0
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



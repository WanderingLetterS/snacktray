#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,crawlwalk,brake,spring,jump,bonk,fall,slide,attack,crouchattack,dropkickdown,dropkickdiag,climb,flagslide,handlegrab,grindgrab,grind,doorenter,doorexit

#define soundlist
whip


#define movelist
Simon
#
[a]: Double Jump & Dropkick
[down]+[a]: Slide
[b]: Whip Attack
[up]+[b]: Subweapon
[c]: Backdash


#define rosterorder
3

#define customhud
if !dontdrawhud {
	draw_snack_hud()
	d3d_transform_stack_push()
	d3d_transform_add_translation(hoffx,hoffy,0)

	spr=sheets[size]


	p_offset=70

	if !(global.nohud) && !(dontdrawhudler){
		// apply ma shader
		scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,6)
		draw_sprite_part(sheetshields,0,550,59,18,18,8+p_offset*p2,global.screenheight-24-20) //grin emoji's backdrop, also used for subweapon
		if subweapon
		draw_sprite_part(sheetshields,0,569,43+(subweapon-1)*17,16,16,9+p_offset*p2,global.screenheight-24-19) //grin emoji
		
		draw_sprite_part(sheetshields,0,569,145,16,16,9+p_offset*p2+20,global.screenheight-24-19)
		draw_skintext(9+p_offset*p2+40,global.screenheight-24-19+4,string(subenergy))
		shader_reset()
	}
	
	d3d_transform_stack_pop()
}

#define start
mask_set(12,12)
maxe=6
dontdrawdefaulthud=1
energy=maxe
if global.stagecount>0{

	hearts=global.simon_info_hearts[p2]
	level=global.simon_info_level[p2]

	subweapon=global.simon_info_subweapon[p2]
	sublevel=global.simon_info_sublevel[p2]
} else {
	hearts=0
	subweapon=0
	level=1
	sublevel=1
}

bigger_whip=funnytruefalse(playerskindat(p2,name+" bigger whip"),0)

SUBWEP_KNIFE=1
SUBWEP_BOOMERANG=6
SUBWEP_AXE=2
SUBWEP_WATER=5
SUBWEP_STOPWATCH=3
SUBWEP_BOOK=4


#define finish
//Set the info for subweapon and stuff to the game.

global.simon_info_hearts[p2]=hearts
global.simon_info_level[p2]=level

global.simon_info_subweapon[p2]=subweapon
global.simon_info_sublevel[p2]=sublevel


#define stop
peelsound=0
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
coincheck=global.coins[0]
saveenergy=energy
com_item()
energy=saveenergy
//Obtain Weapon/Subweapon: Collecting the same powerup multiple times means getting a levelup.
switch (size){//Detect powerup gotten
	case 0: /*Nothing*/ break;
	case 1: /*Mushrom: Level up Whip*/ level=min(level+1,3) break;//Required To get subweapons. Level 3 is more damage, but isnt very common since it'd replace pure mushrooms.
	case 2: /*Fire Flower: Knife*/ if (subweapon=SUBWEP_KNIFE) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_KNIFE} break;
	case 3: /*Feather: Axe*/ if (subweapon=SUBWEP_AXE) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_AXE} break;
	case 8: /*Ice: Stopwatch*/ if (subweapon=SUBWEP_STOPWATCH) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_STOPWATCH} break;
	case 6: /*Thunder: Book*/ if (subweapon=SUBWEP_BOOK) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_BOOK} break;
	case 7: /*Water: Holy Water*/ if (subweapon=SUBWEP_WATER) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_WATER} break;
	case 9: /*Clover: Cross/Boomerang*/ if (subweapon=SUBWEP_BOOMERANG) {sublevel=min(sublevel+1,3)} else {subweapon=SUBWEP_BOOMERANG} break;
	case 5: /*Mini: Big Heart*/ subenergy+=5 break;
	case 4: /*Extra: Block Chicken*/ energy=maxe break;
}

subenergy+=global.coins[0]-coincheck


size=0

#define effectsfront
//Draw the Whip
if fired && !using_sub{
	if !bigger_whip{

		if level==1 {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,301,26,8,24,floor(x-xsc*24),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,310,26,16,24,floor(x-xsc*24),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,327,34,24,16,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		} else if level==2 {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,301,26+25,8,24,floor(x-xsc*24),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,310,26+25,16,24,floor(x-xsc*24),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,327,34+25,24,16,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		} else {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,301,26+25*choose(1,2,3,4),8,24,floor(x-xsc*24),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,310,26+25*choose(1,2,3,4),16,24,floor(x-xsc*24),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,327,34+25*choose(1,2,3,4),24,16,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		}
	} else {
		if level==1 {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,209,95,11,17,floor(x-xsc*27 ),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,221,95,19,27,floor(x-xsc*27),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,241,103,27,19,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		} else if level==2 {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,209,95+28,11,17,floor(x-xsc*24),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,221,95+28,19,27,floor(x-xsc*24),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,241,103+28,27,19,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		} else {
			if fired>30
				draw_sprite_part_ext(sheetshields,0,209,95+28*choose(1,2,3,4),11,17,floor(x-xsc*24),floor(y-9+7*crouch),xsc,1,c_white,1)
			else if fired>25
				draw_sprite_part_ext(sheetshields,0,221,95+28*choose(1,2,3,4),19,27,floor(x-xsc*24),floor(y-17+7*crouch),xsc,1,c_white,1)
			else
				draw_sprite_part_ext(sheetshields,0,241,103+28*choose(1,2,3,4),27,19,floor(x+xsc*12),floor(y-18+7*crouch),xsc,1,c_white,1)
		}
	
	
	}
}

#define damager
//Do things with whip.
if (owner.fired<=30 && owner.fired && !owner.using_sub){

	mask_index=spr_mask1x1
	sprite_index=spr_mask1x1
	
	
	if owner.fired>25 {
		if owner.fired=26 playsfx(owner.name+"whip")
		x=floor(owner.x-owner.xsc*24)
		y=floor(owner.y-9+7*owner.crouch)
		image_xscale=owner.xsc*16
		image_yscale=24
	} else{
		x=floor(owner.x+owner.xsc*12)
		y=floor(owner.y-5+7*owner.crouch)
		image_xscale=owner.xsc*24
		image_yscale=11
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
				hitblock(coll2,owner,owner.level>1,esign(coll2.y-owner.y),0)
			}    
		}
		coll.y=savey
	}

	coll=instance_place(x,y,enemy)
	if (coll) {                    
		global.coll=owner.id
		if coll.object_index=lavabubble {} //Lavabubbles are completely invincible for Simon, but nothing else is.
		else if !coll.hitby_simon[p2] {coll.simon_dmg+=owner.level coll.hitby_simon[owner.p2]=1 	with owner{ hiteffect=1 fire_projectile(other.coll.x,other.y) hiteffect=0 } }
		if coll.simon_dmg>=2 enemyexplode(coll,2)
	}
} else {y=-1000 alarm0=0 with enemy hitby_simon[owner.p2]=0 }



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




#define projectile
if (event=="create"){
	sub_type=owner.subweapon
	does_damage=0
	breaks_blocks=0
	xsc=owner.xsc
	if owner.hiteffect sub_type=69
	visible=1
	p2=owner.p2
}
if event=="draw" if global.debug draw_self()
switch (sub_type){
	case owner.SUBWEP_AXE:
		if (event=="create"){
			//Axe, has no timer
			hspeed=owner.xsc*2
			vspeed=-4
			gravity=0.1
			does_damage=2
			breaks_blocks=1 //this is the only Subweapon that breaks blocks.
		}if (event=="draw"){
			frame= (frame+0.1) mod 4
			draw_sprite_part_ext(owner.sheetshields,0,209+23*floor(frame),49,22,22,floor(x-12*xsc),floor(y-12),xsc,1,c_white,1)
		}
	break;
	case owner.SUBWEP_KNIFE:
		if (event=="create"){
			hspeed=owner.hsp+owner.xsc*6
			does_damage=2
			image_xscale=8
			image_yscale=4
		}
		if (event=="draw"){
			draw_sprite_part_ext(owner.sheetshields,0,209,9,28,16,floor(x-20*xsc),floor(y-8),xsc,1,c_white,1)
			
		}
	break;
	case owner.SUBWEP_STOPWATCH:
		if (event=="create"){
			with projectile if owner==other.owner && sub_type=SUBWEP_STOPWATCH && id!=other.id { global.simon_stopwatch=60*5 with other instance_destroy()} //Only reset timer if using stopwatch alongside another stopwatch.
			//Save position and speed
			global.simon_stopwatch=60*5 //5 Seconds.
			with enemy{
				simon_stop_x=x
				simon_stop_y=y
				
				simon_stop_hspeed=hspeed
				simon_stop_vspeed=vspeed
				simon_stop_gravity=gravity
				
				simon_stop_hsp=hsp
				simon_stop_vsp=vsp
				simon_stop_frame=frame

				speed=0
				hsp=0
				vsp=0
				gravity=0
			}
			fuckyofastframe=gamemanager.fastframe
			fuckyoframe8=gamemanager.frame8
			fuckyoframefire=gamemanager.framefire
			fuckyoframeitem=gamemanager.frameitem
		}if (event=="step"){
			global.simon_stopwatch-=1
			if (global.simon_stopwatch<=0) {
				with enemy{
					x=simon_stop_x
					y=simon_stop_y
					
					hspeed=simon_stop_hspeed
					vspeed=simon_stop_vspeed
					gravity=simon_stop_gravity
					
					hsp=simon_stop_hspeed
					vsp=simon_stop_vspeed
					
				}	
				instance_destroy()
			} else{
				gamemanager.fastframe=fuckyofastframe
				gamemanager.frame8=fuckyoframe8
				gamemanager.framefire=fuckyoframefire
				gamemanager.frameitem=fuckyoframeitem
				with enemy{
					hsp=0
					vsp=0
					hspeed=0
					vspeed=0
					x=enemy_stop_x
					y=enemy_stop_y
					frame=simon_stop_frame					
				}
			}
		}if (event=="draw"){
			with owner {
				draw_skintext(x,y-32,ceil(global.simon_stopwatch/60))
			}
		}
	break;
	case owner.SUBWEP_WATER:
		if (event=="create"){
			does_damage=0
			frame=0
			vspeed=-1
			gravity=0.1
			hspeed=1*xsc+owner.hsp
			
		}if (event=="step"){
			if place_meeting(x,y,collider) && !frame{
				frame=1
				gravity=0
				does_damage=1
				vspeed=0
				hspeed=0
				
			}
			if place_meeting(x,y,collider){y-=1}
			
			if frame>0{
				frame+=0.2
				if frame mod 2 with enemy subhitbysimon[p2]=noone
			}
			if frame>16 instance_destroy()
		}if (event=="draw"){
			if frame==0{
				draw_sprite_part_ext(owner.sheetshields,0,238,9,16,16,floor(x-8*xsc),floor(y-8),xsc,1,c_white,1)
			}else if frame<6{
				draw_sprite_part_ext(owner.sheetshields,0,255+floor(floor(frame mod 3)*9),9,8,16,floor(x-4*xsc),floor(y-8-6),xsc,1,c_white,1)
			}else{
				draw_sprite_part_ext(owner.sheetshields,0,282+floor(floor(frame mod 2)*17),9,16,16,floor(x-8*xsc),floor(y-8-6),xsc,1,c_white,1)
			}
		}
	break;
	case owner.SUBWEP_BOOK:
		if (event=="create"){
			does_damage=2
			frame=3
		}if (event=="step"){
			frame+=0.2
			x=owner.x+sin(frame)*frame*3
			y=owner.y+cos(frame)*frame*3
			if frame>40 instance_destroy()
		}if (event=="draw"){
			draw_sprite_part_ext(owner.sheetshields,0,209,72,22,22,floor(x-11*xsc),floor(y-11),xsc,1,c_white,1)
		}
	break;
	case owner.SUBWEP_BOOMERANG:
		if (event=="create"){
			hspeed=owner.hsp+owner.xsc*6
			does_damage=2
		}if (event=="step"){
			hspeed-=xsc*0.2
			if place_meeting(x,y,owner) && sign(hspeed)!=xsc instance_destroy()
		}if (event=="draw"){
			frame= (frame+0.1) mod 4
			draw_sprite_part_ext(owner.sheetshields,0,209+23*floor(frame),26,22,22,floor(x-12*xsc),floor(y-12),xsc,1,c_white,1)
		}
	break;
	
	case 69: //Hit effect :)
		if (event=="create"){
			frame=60
			does_damage=0
		}if (event=="step"){
			frame-=1
			if frame<=0 instance_destroy()
		}if (event=="draw"){
			draw_sprite_part_ext(owner.sheetshields,0,316+17*floor(frame/30),9,16,16,floor(x-8*xsc),floor(y-8),xsc,1,c_white,1)
		}
	break;
}
if !inview() && !sub_type==owner.SUBWEP_BOOK instance_destroy()

if (event=="step"){
	if does_damage{		
		coll=instance_place(x,y,enemy)
		if (coll) {                    
			global.coll=owner.id
			if coll.object_index=lavabubble {} //Lavabubbles are completely invincible for Simon, but nothing else is.
			else if (coll.subhitby_simon[p2]!=id) {coll.simon_dmg+=does_damage coll.subhitbysimon[p2]=id with owner{ hiteffect=1 fire_projectile(x,y) hiteffect=0 } }
			if coll.simon_dmg>=2 enemyexplode(coll,2)
		}	
	}
}


#define sprmanager
frspd=1
cantslowanim=0
if (grabflagpole) {sprite="flagslide"}
else if (fired) {sprite="attack" if crouch sprite="crouchattack"}
else if (hurt) {sprite="knock"}
else if (slide) {sprite="slide"}
else if (dropkick){ if dropkick==1 sprite="dropkickdown" else sprite="dropkickdiag"}
else if (crouch) {sprite="crouch" if h!=0 {sprite="crawlwalk" frspd=0.2}}
else if (jump) {
	if (onvine) 
	{
	sprite="climbing" frspd=sign(left+right+up+down)
	}
    else if (sprung) {sprite="spring"}
    else if (bonk) sprite="bonk"
    else {sprite="jump" if vsp>1 sprite="fall"} //frspd=fallspd
} else {
    if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
	else if backdash sprite="brake"
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
    else if (hsp=0) {
        if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (run) {sprite="run" frspd=0.4}
        else { sprite="walk" frspd=0.2}
    }
}

#define controls
com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (hurt || piped) {
    di=0
    exit
}

if (up) com_piping()
oup=up

if (up && (!hang || is_basic())) {
    if (hsp=0 && !jump && !peelout) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if ( vinegrab ||fired||backdash ) h=0


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
        if (!jump) {
            xsc=h
			com_piping()
        } else{com_piping()}
    } else {
		if !jump{
			if canrun>0 && h==xsc{run=1} else {canrun=0 run=0}
			if run canrun=2
		}
		if !slide && !dropkick && !backdash{
			hsp=h*(2+run)
			xsc=h
			if crouch hsp=h
		} else if backdash {hsp=-3*xsc backdash-=1}
		
    }
} else {
	if !jump if hsp!=0 canrun=10
	if !(jump && fired)
	hsp=0
	run=0
	if backdash {hsp=-3*xsc*backdash/30 backdash-=1}
}
if !jump canrun-=1

if slide {if jump slide=0 hsp=(slide/15)*xsc slide-=1}
		

if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||fall=69||grabflagpole||tailsgrab||(fall!=0 && is_clover() && !insted) && !fired) { //jump
        if (crouch && fall!=69) {
            slide=60
        } else if !peelready {
            jumpsnd=playsfx(name+"jump")
            vsp=-4.2-0.2*super
            onvine=0
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)
			if tailsgrab{
				tailsgrab=0
				graber.tailsgrabbed=0
			}
			slide=0
			backdash=0
            grabflagpole=0
            latchedtoflagpole=0

			i=shoot(x,y+4,psmoke,hsp,-2) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75 i.gravity=0.05
			i=shoot(x,y+4,psmoke,2,-0.5) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
			i=shoot(x,y+4,psmoke,-2,-0.5) i.growsize=1 i.image_xscale=0.75 i.image_yscale=0.75
			/*
			i=shoot(x,y+8,speedsmoke,2,0) i.pxsc=-1
			i=shoot(x,y+8,speedsmoke,-2,0)
			*/
			sprite_angle=0

            jump=1
            fall=1
            braking=0
            canstopjump=1
            dashtimer=60
            if (mymoving) hsp+=avgmovingh
            crouch=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else if !peelready { //air jumps
	
	
	
        if (!insted && !climb && !fired) {
            insted=1
            airdash=0
            firedash=0
            boost=0
            vsp=-4.2-0.2*super
			canstopjump=1
			
        }
		
		if insted && !climb && !dropkick && down && !fired{
			dropkick=1+(h!=0)
			if dropkick=0 dropkick=2
			vsp=7-(2*(dropkick==2))
		}
        jumpbuffer=4*!jumpbufferdo
    }
}
jumpbufferdo=0
springin=0

if (akey) {
	if (up && hsp=0 && !jump && !fall && peelready){
		if peelsound == 0
		{
		playsfx(name+"peelcharge")
		peelsound = 1
		}
	peelout+=1
	if peelout>60 peelout=60
	}

    if (jumpbuffer) jumpbuffer-=1
} else jumpbuffer=0




if (!akey) {

if (peelout && up) peelout+=1 

    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp*=0.5
    }
    canstopjump=0
}

//code for specifically the b button
if (bbut && !fired && !slide && !dropkick) {
	if backdash {hsp=0 backdash=0}
    fired=40
	if up && subweapon { 
		switch (subweapon){
			case SUBWEP_STOPWATCH: req_hearts=5 break;
			default: req_hearts=1 break;
		}
		if subenergy>=req_hearts{
			subenergy-=req_hearts
			using_sub=1 
			fired=20
			fire_projectile(x,y)
		}
	}
}

if (cbut) {
	if !jump{
		backdash=40
		fired=0
	}
}


//crouching and spinning
if !fired{
	if (down && !up) {
		if (!jump && !braking) {
			if backdash {backdash=0 hsp=0}
			crouch=1
		}
		com_piping()
	} else {
		mask_temp(12,12)
		if (!jump) {
			if (collision(0,-16) && is_big()) crouch=1
			crouch=0
		}
		mask_reset()
	}
}
mask_set(12,24)
if is_mini() mask_set(8,8)

#define movement
if (piped) exit


//speed cap rubberband formula
maxspd=3.5 *(wf)
//There's an extra check in the hsp+= section of h!=0 to compensate!.
if (abs(hsp)>maxspd) {
	//if (!spin && !(jump && (!fall || fall==7))) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)
}

vsp=min(7+downpiped,vsp)

//movement
calcmoving()

if (!dead && !grabflagpole) {
	if fall!=69
		player_horstep()
	player_nslopforce()
    //yground=easyground()
	//if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        hang=0
		if fall=69 {homing=0 climb=0 airdash=0 firedash=0 insted=0 fall=0}
		if fall!=69 {
            vsp+=0.15*wf
        } else peelout=0
		vine_climbing()
        crouch=0
        spindash=0
        braking=max(0,braking-1)
		if (sprung && !fall) fall=1
		push=0 
		coyote=0
		osld=0
		player_vertstep()
		if (!jump) sld=point_direction(0,0,1,slobal)
    }

	sprite_angle=0	

    if (!jump) {
	
		if (is_fire() && super) && abs(hsp)>3 && boost && (!(global.bgscroll mod 10) || (super && !(global.bgscroll mod 3))) {
			i=instance_create(x,y+16,burnerfire)
			i.dir=0
			i.playermade=1
		}
	
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		osld=sld
		sld=point_direction(0,0,1,slobal)

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
	if cpu_myleader.abut && !jump {jumpwait=abs(cpu_myleader.x-x)/max(abs(cpu_myleader.hsp),1)  }
	
	if !jump {if jumpwait {jumpwait-=1 if jumpwait<=1 akey=1}}
	//Sonic characters only
	if !right && !left && down && cpu_myleader.spindash {akey=1 spindash=1}

	if vsp>0 canstopjump=0
	if jump && (cpu_myleader.vsp+cpu_myleader.y) <(y+16)&&canstopjump &&vsp<-1 {akey=1 cpu_akeystuck=0}
	if is_fire() && cpu_myleader.bbut && !cpu_myleader.jump &&!jump && abs(cpu_myleader.x-x)<32 if !collision(xsc*4,0) {bkey=1}
	
	
	
	
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
size=0
spin=0

if !fired using_sub=0 

weight=0.4+0.4*is_big()
bartype=0

maxe=6

//Dropkick

if dropkick{
	if (dropkick==2){
		hsp=4*xsc	
	}
	if vsp<0 dropkick=0
	else
	vsp=7-(2*(dropkick==2))

	if !jump dropkick=0
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
if (star || insta) power_lv=5
if (super) power_lv+=1
if (whip_level==3) is_coinexplosive=1

//Special interactions
pvp_spin=(spin&& !jump) //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=instashieldin //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away
break_crackedground=(spin && !jump)

//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0
}

//whoputshitinyourpip
if (piped) exit

//grounded state
if (!jump) {
    vsp=0
}

//water
if (underwater()) {
    if (!water) {
        if (abs(vsp)>2) water_splash(1)
		if !dropkick
        vsp=min(1,vsp/2)
    }
    water=1 wf=0.45
} else {
    if (water) {
        water=0
		if !dropkick
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
    if (abs(hsp)>=maxspd-0.25)&&!jump {
		i=shoot(x-12*xsc,y+12,psmoke,-hsp*0.25,0) i.drag=1 i.growsize=-1
		vd=point_direction(0,0,-hsp*0.25,vsp)+point_direction(0,0,1,slobal/1.5)
		vm=point_distance(0,0,-hsp*0.25,vsp)
		i.hspeed=lengthdir_x(vm,vd)
		i.vspeed=lengthdir_y(vm,vd)
	}
	
	
}


if (insta) insta+=1


//Christianity moment
jesus=(false)



com_endactions()


#define enemycoll
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
        
    if (coll.object_index=lakitu) if (coll.flee) exit
    
    if (star  
    || (spin && type!=spinyegg && type!=beetle && type!=koopa && !object_is_ancestor(type,koopa) && type!=shell)
    || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        if (type=hammerbro) seqcount=max(5,seqcount)
        enemydie(coll)                
        exit
    }
    
    if (spindash || inst || firedash || (is_fire() && boost)) { enemyexplode(coll) exit}
    
    if (type=piranha || coll.damage_player_on_contact) {
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
pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}


if (shielded) playsfx(name+"shielddamage")
else playsfx(name+"damage")

starhit=0

jump=1 hurt=1+starhit 
if (!starhit) 
	if (shielded) {shielded=0} 
	else if global.rings[p2]>0 {droprings(0)} 
	else {
		energy-=1
	} 
hsp=xsc*-2*wf 
vsp=-3*wf

if ((energy<=0) && !shielded && global.rings[p2]==0) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    
    
}


//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || other.level==1 && insted!=1 && !owner.tempkill && cracked=0 && biggie) { //break spiner
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

} else if ((owner.level>1 || (!owner.size && owner.spin && !biggie && owner.y>=y)) && !tpos) { 
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
	
	
	/*if biggie{
		i=instance_create(x+4,y+12+(16*biggie),bigpart) i.hspeed=-1 i.vspeed=-1+2*go
		i=instance_create(x+12+(16*biggie),y+12,bigpart) i.hspeed=1 i.vspeed=-1+2*go 
		i=instance_create(x+4,y+4,bigpart) i.hspeed=-1 i.vspeed=-3+2*go
		i=instance_create(x+12+(16*biggie),y+4,bigpart) i.hspeed=1 i.vspeed=-3+2*go
	}else{*/
		i=instance_create(x+4,y+12+(16*biggie),part) i.hspeed=-1 i.vspeed=-1+2*go
		i=instance_create(x+12+(16*biggie),y+12,part) i.hspeed=1 i.vspeed=-1+2*go 
		i=instance_create(x+4,y+4,part) i.hspeed=-1 i.vspeed=-3+2*go
		i=instance_create(x+12+(16*biggie),y+4,part) i.hspeed=1 i.vspeed=-3+2*go
    //}
	
	
    with (turing) event_user(4)
    instance_destroy()
  } else if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
 }
} else if typeblockhit=1{
	if level>1 size=1 
	hititembox()
	size=0
}
#define hitwall
hsp=0





#define landing
spin=0

braking=0
insted=0
airdash=0
dashanim=0
boosted=0
i=shoot(x,y+16,psmoke,2,0.25) i.growsize=-1 i.image_xscale=0.75 i.image_yscale=0.75
i=shoot(x,y+16,psmoke,-2,0.25) i.growsize=1 i.image_xscale=0.25 i.image_yscale=0.25


if (downpiped) {

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
	mask_set(12,12) 
	playsfx(name+"spin")
	hsp=max(abs(hsp),2)*esign(hsp,xsc)
	}
}


#define death
if (event="create"){

alarmmp=60
alarm1=300
sprite="knock"
frame=0
frspd=1
spindash=0
alpha=1
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
gravity=0.2
hspeed=owner.hsp
vspeed=owner.vsp

} 
else if (event="step"){
	coll=collision(0,vspeed)
	if (coll && vspeed>0) {
		sprite="dead"
		hspeed=0
		vspeed=0
		gravity=0
		jump=0
	}
	alarmmp=max(0,alarmmp-1)
	alarm1=max(0,alarm1-1)

	if alphadecay &&!alarmmp alpha-=0.1

	if alarm1=0 instance_destroy()
	

} else if (event="draw"){

}


#define enterpipe
if (type="side") {

}

if (type="down") {}

braking=0
insta=0
crouch=0
push=0     
firedash=0
dash=0


#define exitpipe
if (type="door") {set_sprite("doorexit")}
if (type="side") {}
if (type="up") {}
if (type="down") {}
#define spritelist
stand,wait,lookup,pose,crouch,knock,walk,slide,jump,bonk,ball,climbing,shoot,throw,cloudcarry,tornado,phaser,crouchshoot,walkshoot,jumpshoot,climbingshoot,flagslide

#define soundlist
release,skid,spin,spindash,insta,dash


#define movelist
Megaman
#
[down] + [a]/ [c]: Slide
[b]: Shoot
[x]/[y]: Change Weapon
[z]: Shoot Mega Buster
Defeat enemies to get their weapon!
This character is a Work in Progress!

#define rosterorder
21

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()


#define match
MEGA_BUSTER=0
SHELL_SLIDE=1
HAMMER_THROW=2
CLOUD_CARRY=3
BOMB_BLAST=4
CHEEP_TORNADO=5
ORBINAUT_SHIELD=6
BULLET_SHOT=7
SPIKE_LEAD=8
//Extras
BOO_CLOAK=9
TANOOKI_STATUE=10
ROLLING_CUTTER=11
//Megaman Always has his buster, unless a pesky codeblock took it from him...
//The p2*100 is for each player in case you're going multiplayer

global.weapon_unlocked[(p2*100)+MEGA_BUSTER]=1
global.weapon_startingenergy[MEGA_BUSTER]=-1 //Sets it to not show the energy bar at all

global.weapon_unlocked[(p2*100)+SHELL_SLIDE]=0
global.weapon_unlocked[(p2*100)+HAMMER_THROW]=0

global.weapon_unlocked[(p2*100)+CLOUD_CARRY]=0
global.weapon_startingenergy[CLOUD_CARRY]=9
global.weapon_unlocked[(p2*100)+BOMB_BLAST]=0
global.weapon_unlocked[(p2*100)+CHEEP_TORNADO]=0
global.weapon_unlocked[(p2*100)+ORBINAUT_SHIELD]=0
global.weapon_unlocked[(p2*100)+BULLET_SHOT]=0
global.weapon_unlocked[(p2*100)+SPIKE_LEAD]=0
global.weapon_unlocked[(p2*100)+BOO_CLOAK]=0
global.weapon_unlocked[(p2*100)+TANOOKI_STATUE]=0
global.weapon_unlocked[(p2*100)+ROLLING_CUTTER]=0


global.weapon_requirement[(p2*100)+MEGA_BUSTER]=0
global.weapon_requirement[(p2*100)+SHELL_SLIDE]=5
global.weapon_requirement[(p2*100)+HAMMER_THROW]=1
global.weapon_requirement[(p2*100)+CLOUD_CARRY]=1
global.weapon_requirement[(p2*100)+BOMB_BLAST]=1
global.weapon_requirement[(p2*100)+CHEEP_TORNADO]=10
global.weapon_requirement[(p2*100)+ORBINAUT_SHIELD]=1
global.weapon_requirement[(p2*100)+BULLET_SHOT]=4
global.weapon_requirement[(p2*100)+SPIKE_LEAD]=4
global.weapon_requirement[(p2*100)+BOO_CLOAK]=1
global.weapon_requirement[(p2*100)+TANOOKI_STATUE]=1
global.weapon_requirement[(p2*100)+ROLLING_CUTTER]=1

global.weapon_progress[(p2*100)+MEGA_BUSTER]=0
global.weapon_progress[(p2*100)+SHELL_SLIDE]=0
global.weapon_progress[(p2*100)+HAMMER_THROW]=0
global.weapon_progress[(p2*100)+BOMB_BLAST]=0
global.weapon_progress[(p2*100)+CHEEP_TORNADO]=0
global.weapon_progress[(p2*100)+ORBINAUT_SHIELD]=0
global.weapon_progress[(p2*100)+BULLET_SHOT]=0
global.weapon_progress[(p2*100)+SPIKE_LEAD]=0
global.weapon_progress[(p2*100)+BOO_CLOAK]=0
global.weapon_progress[(p2*100)+TANOOKI_STATUE]=0
global.weapon_progress[(p2*100)+ROLLING_CUTTER]=0

#define enemykill

switch (kill.object_index){

case koopa:
case hopkoopa:
case redkoopa:
case redhover:
case yelkoopa:
case yelhover:
case blukoopa:
case bluhover:
	global.weapon_progress[(p2*100)+SHELL_SLIDE]+=1
	
break;
case hammerbro:
	global.weapon_progress[(p2*100)+HAMMER_THROW]+=1
break;

case lakitu:
	global.weapon_progress[(p2*100)+CLOUD_CARRY]+=1
break;

case bobomb:
case litbobomb:
case bombshellkoopa:
case bombenemy:
	global.weapon_progress[(p2*100)+BOMB_BLAST]+=1
break;

case cheepred:
case cheepwhite:
case cheepfly:
	global.weapon_progress[(p2*100)+CHEEP_TORNADO]+=1
break;

case orbinautgreen:
case orbinautblue:
case orbinautred:
case orbinautbbumper:
	global.weapon_progress[(p2*100)+ORBINAUT_SHIELD]+=1
break;

case bullseyebill:
case bulletbill:
	global.weapon_progress[(p2*100)+BULLET_SHOT]+=1
break;

case banzaibill:
	global.weapon_progress[(p2*100)+BULLET_SHOT]+=2
break;

case spikenemy:
	global.weapon_progress[(p2*100)+SPIKE_LEAD]+=1
break;

case boo:
	global.weapon_progress[(p2*100)+BOO_CLOAK]+=1
break;

case thwomp:
case thwimp:
	global.weapon_progress[(p2*100)+TANOOKI_STATUE]+=1
break;

//case cutman_boss:
//	global.weapon_progress[(p2*100)+ROLLING_CUTTER]+=1
//break;

default: break;


}

loopi=0
repeat (max_weapon+1){

if global.weapon_progress[(p2*100)+loopi]>global.weapon_requirement[(p2*100)+loopi]  global.weapon_unlocked[(p2*100)+loopi]=1

loopi+=1
}
#define start

usepalette=true

//Handle Easter eggs.

//Name of the skin is X
easter_X=(playerskindat(p2,"name"+string(p2)) =="X" || playerskindat(p2,"name"+string(p2)) =="Megaman X" || playerskindat(p2,"name"+string(p2)) =="MEGAMAN X")
//Name of the skin is Zero
easter_Zero=(playerskindat(p2,"name"+string(p2)) =="Zero" || playerskindat(p2,"name"+string(p2)) =="ZERO")
//Name of the skin isThe Kid
easter_Kid=(playerskindat(p2,"name"+string(p2)) =="Kid" || playerskindat(p2,"name"+string(p2)) =="The Kid")


mask_set(12,12)


////Constant Type shit
MEGA_BUSTER=0
SHELL_SLIDE=1
HAMMER_THROW=2
CLOUD_CARRY=3
BOMB_BLAST=4
CHEEP_TORNADO=5
ORBINAUT_SHIELD=6
BULLET_SHOT=7
SPIKE_LEAD=8
//Extras
BOO_CLOAK=9
TANOOKI_STATUE=10
ROLLING_CUTTER=11
//Max weapons
max_weapon=11





//global.mega_addon_weapons[p2]=  This is just here to make you remember it exists
/* More useful variables to keep in mind
global.mega_color_1[p2*100+weapon]  <--Outline
global.mega_color_2[p2*100+weapon]  <--Primary (The dark one)
global.mega_color_3[p2*100+weapon]  <--Secondary (The light one)
global.mega_color_4[p2*100+weapon]  <--Third (The skin one)
4th color is only used in the icon.

This system does only allow simple icons but booohooo shut up i dont care i dont care i dont care i dont care i don

*/
i=MEGA_BUSTER
repeat(max_weapon+global.mega_addon_weapons[p2]){
	weapon_energy[i]=global.weapon_startingenergy[i]
	if weapon_energy[i]=0 {weapon_energy[i]=9 global.weapon_startingenergy[i]=9}
	i+=1

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
	
	if (!super && size!=4) grow=1
	oldsize=size
	size=4
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
	
	weapon_energy[weapon]=weapon_startingenergy[weapon]
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
	
	weapon_energy[weapon]=weapon_startingenergy[weapon]
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
	
	weapon_energy[weapon]=weapon_startingenergy[weapon]
}



#define effectsback


#define effectsfront
if weapon_switch{
	if weapon=MEGA_BUSTER  scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)
	   
	draw_sprite_part_ext(sheetshields,0,209,7+17*weapon,16,16,round(x-8),round(y-32),1,1,$ffffff,1)
	shader_reset()
	weapon_switch-=1
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
	
}
if jump { //Jump n' Shoot Man
	bkey=(abs(vsp)<0.5)
	
}

#define damager
if !owner.jump && owner.weapon_energy[owner.CLOUD_CARRY]<global.weapon_startingenergy[owner.CLOUD_CARRY] owner.weapon_energy[owner.CLOUD_CARRY]+=0.0001

{y=-1000}

#define projectile

if (event="create") weapon=owner.weapon
switch (weapon){

	case owner.MEGA_BUSTER:{
		owner.can_charge=(owner.size=2)
		owner.chargemin=20
		if (event="create") {
			if owner.weapon_energy[weapon]=0 {instance_destroy() exit}
			else if owner.weapon_energy[weapon]>0 owner.weapon_energy[weapon]-=0.5
			image_xscale=8
			image_yscale=4
			owner.fired=20
			frame_sub=0
			frame=0
			brickc=0
			seqcount=2
			getregion(x) 
			timer0=3
			timer1=128
			x+=owner.xsc*6
			with owner if count_projectiles()>3 { fired=0 with other instance_destroy()}
			y+=1
			if owner.size==0 y+=6
			if owner.crouch y+=6-(4*(owner.size==0))
			
			hspeed=xsc*4
			speed=median(2,speed,5)
			playsfx("megamanfired")	
			if owner.charge>owner.chargemin{
				
				charged=1
				if owner.charge>100{
				charged=2
				image_xscale*=2
				image_yscale*=2
				}
				
			}
			owner.charge=0
		}
		if (event="step") {
			timer0-=1 if (timaer0=0) visible=1
			timer1-=1 if (timer1=0) instance_destroy()
			calcmoving()

			frame_sub=!frame_sub
			if frame_sub frame+=1
			if (frame>=3) frame=0

			if (!inview()) instance_destroy()
			xsc=sign(hspeed)
			
			ignoreoncount=0
			coll=instance_place(x,y,collider)
			if (coll) {
				if coll {
					if coll.object_index==phaser && coll.dir==1 && hsp>0{
						
					}else if coll.object_index==phaser && coll.dir==-1 && hsp<0{
					
					}if coll.object_index==phaser && coll.dir==0 || coll.dir==2{
					
					}else{
					if (object_is_ancestor(coll.object_index,hittable)) {
						hitblock(coll,owner,1,-1,0)
					}
					instance_create(x,y,kickpart)     
					sound("itemblockbump") instance_destroy()
					}
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
						coll.mega_damage+=1*(1+(coll.object_index=goomba))+charged
						if coll.mega_damage>=4  { with owner {kill=other.coll charm_run("enemykill")} enemydie(coll,2)}
					}
				}
				if charged!=2 && instance_exists(coll) instance_destroy()
			}

			coll=instance_place(x,y,bowserboss)
			if (coll) {
				if (!coll.flash) {
					coll.hp-=1+charged
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
			if charged=0
			draw_sprite_part_ext(owner.sheetshields,0,9+17*frame,209,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1)
			if charged=1{
			draw_sprite_part_ext(owner.sheetshields,0,9+17*frame,226,16,16,round(x-8*xsc),round(y-8),xsc,1,$ffffff,1)
			}
			if charged=2{
			draw_sprite_part_ext(owner.sheetshields,0,77+25*frame,209,24,33,round(x-12*xsc),round(y-16),xsc,1,$ffffff,1)
			}
		}
	break;
	}
	
	case owner.SHELL_SLIDE:{
		owner.can_charge=0
		if (event="create") {
			if owner.shell_slide {instance_destroy() exit}
			if owner.weapon_energy[weapon]=0 {instance_destroy() exit}
			else if owner.weapon_energy[weapon]>0 owner.weapon_energy[weapon]-=1
			//Energy check goes here
			owner.shell_slide=1
			mask_index=spr_mask2x2
			image_xscale=8
			image_yscale=1
			visible=1
			owner.visible=0
			xsc=owner.xsc
			ysc=1
		}
		if (event="step") {
			hsp=3.5*xsc
			//Energy check goes here
			owner.shell_slide=1
			owner.hsp=0
			owner.slide=1
			owner.maxspd=3.5
			if(owner.bbut=1 && notinstant)||owner.weapon!=owner.SHELL_SLIDE {
				instance_destroy()
				owner.shell_slide=0
				owner.visible=1
			}
			notinstant=1
			with owner {
				
				flash=2
				if shell_slide {
					hsp=other.hsp
					player_horstep()
					shellcoll=noone
					h=sign(hsp)
					if (h=sign(hsp) || hsp=0) shellcoll=collision(h,0)
					if (shellcoll) if (object_is_ancestor(shellcoll.object_index,moving)) shellcoll=place_meeting(x+h,y+shellcoll.vsp+sign(shellcoll.vsp),shellcoll)
					if (shellcoll) if (player_climbstep(shellcoll)) shellcoll=noone
					if (x<=minx && left) shellcoll=1
					if (shellcoll) {		
						push=h
						if !hang xsc=h
						com_piping()
					}
					
				}
				
			}
			coll=instance_place(x,y,collider)
			if coll {
				if coll.object_index==phaser && coll.dir==0{
				
				}else if coll.object_index==phaser && coll.dir==1 && hsp>0{
					
				}else if coll.object_index==phaser && coll.dir==-1 && hsp<0{
				
				}else{
					owner.xsc*=-1
					if (object_is_ancestor(coll.object_index,hittable)) {
						if (coll.object_index=brick) brickc+=1 else brickc=4
						hitblock(coll,owner,1,-1,0)
					} else brickc=4
					instance_create(x,y,kickpart)
					sound("itemblockbump")
				}
			}
			coll=instance_place(x,y,enemy)
			if coll 
			if (owner!=noone && owner!=coll) {
				doscore_e(8000,coll.id) 
				with owner {kill=other.coll charm_run("enemykill")} 
				with (coll) {
					sound("enemykick") 
					with (instance_create(x,y,genericdead)) {
						hspeed*=sign(x-coll.x) 
						type=2 
						biome=coll.biome
					} 
					instance_destroy()
				}
			}
			
			
			
			xsc=owner.xsc
			ysc=1
			x=owner.x+5*xsc
			y=owner.y+7
			
			for (shell_i=0;i<global.enemysprites;shell_i+=1) {
				if (global.enemysprite[shell_i,0]="shellspin") {
					shell_eid=shell_i
					if (shell_eid+1!=shell_emem) {
						shell_emem=shell_eid+1
						shell_shellframe=0
						shell_frn=global.enemysprite[shell_i,1]
						shell_frs=global.enemysprite[shell_i,2]
						shell_frl=global.enemysprite[shell_i,3]
					}
					break
				}
			}
			if (shell_eid!=-1) {
				shell_frame+=shell_frs
				if (shell_frame>=shell_frn) {shell_frame=shell_frame-shell_frn if (shell_frl<shell_frn) shell_frame+=shell_frl}
				shell_frame=modulo(precise(shell_frame),0,shell_frn)
			}
			
		}
		if (event="draw"){
			shell_fry=10
			shell_frx=floor(shell_frame)
			draw_sprite_general(
			//  sprite, subimage    
				global.enemysheet[biome],0,
			//  left, top    
				8+shell_frx*global.enemywidth,128+shell_fry*global.enemyheight,
			//  width, height    
				global.enemywidth-1,global.enemyheight-1,
			//  left top corner of the quad, accounting for rotation
				round(x+(global.enemywidth-1)*-xsc)+lengthdir_x((margin-global.enemyoffx)*-xsc,sprite_angle)+lengthdir_x((margin+dy-(14+global.enemyoffy))*ysc+14*ysc,sprite_angle-90),
				round(y)+lengthdir_y((margin-global.enemyoffx)*-xsc,sprite_angle)+lengthdir_y((margin+dy-(14+global.enemyoffy))*ysc+14*ysc,sprite_angle-90),
			//  scale and rotation
				xsc,ysc,sprite_angle,
			//  blending    
				$ffffff,$ffffff,$ffffff,$ffffff,1
			)
		}
	break;
	}
	case owner.HAMMER_THROW:{
		owner.can_charge=0
		if (event="create") {
			if owner.weapon_energy[weapon]=0 {instance_destroy() exit}
			else if owner.weapon_energy[weapon]>0 owner.weapon_energy[weapon]-=0.5
			if owner.hammerfired >5 {instance_destroy() exit}
			mask_index=spr_mask2x2
			image_xscale=2
			image_yscale=2
			x+=owner.xsc*10
			vspeed=-2.6
			gravity=0.075
			xsc=owner.xsc 
			hspeed=owner.xsc+(owner.hsp/1.5)
			visible=1
			type=0
			owner.hammerfired=10
			sound("enemyhammerthrow")	
		}
		if (event="step") {
			if (pitdeath()) instance_destroy()
			
			//Literally just hammer bro hammer
			coll=instance_place(x,y,enemy)
			if coll 
			if (owner!=noone && owner!=coll) {
				doscore_e(8000,coll.id) 
				with owner {kill=other.coll charm_run("enemykill")} 
				with (coll) {
					sound("enemykick") 
					with (instance_create(x,y,genericdead)) {
						hspeed*=sign(x-coll.x) 
						type=2 
						biome=coll.biome
					} 
					instance_destroy()
				}
			}
			
			
			coll=instance_place(x,y,collider)
			if (coll) {
				if (object_is_ancestor(coll.object_index,hittable)) {
					if (coll.object_index=brick) brickc+=1 else brickc=4
					hitblock(coll,owner,1,-1,0)
				} else brickc=4
			}
				
			coll=instance_place(x,y,bowserboss)
			if (coll) {
				if (!coll.flash) {
					coll.hp-=1
					coll.flash=64
					coll.owner=owner
					sound("enemybowserhurt")
					instance_destroy()
				}
			}
		}
		if (event="draw") {
			ssw_effects("hammer")
		}
	break;
	}
	case owner.CLOUD_CARRY:{
		owner.can_charge=0
		if (event="create") {
			if owner.cloud_carry {instance_destroy() exit}
			if owner.weapon_energy[weapon]=0 {instance_destroy() exit}
			owner.cloud_carry=true
			//Energy check goes here
			mask_index=spr_mask2x2
			image_xscale=8
			image_yscale=1
			visible=1
			xsc=1
			ysc=1
		}
		if (event="step") {
			//Energy check goes here
			owner.cloud_carry=1
			owner.hsp=owner.h*3.5
			owner.vsp=(owner.down-owner.up)*2 -0.2
			owner.jump=1
			if owner.weapon_energy[owner.CLOUD_CARRY]>0 owner.weapon_energy[owner.CLOUD_CARRY]-=0.01
			if(owner.bbut && notinstant)||owner.abut||owner.weapon!=owner.CLOUD_CARRY|| !owner.weapon_energy[owner.CLOUD_CARRY] {
				instance_destroy()
				owner.cloud_carry=0
			}
			notinstant=1
			
			xsc=owner.xsc
			ysc=1
			x=owner.x
			y=owner.y+8
			
			
		}
		if (event="draw"){
			if owner.size==0
			draw_background_part(global.master[biome],136,216,16,16,x-8,y)
			else {
				draw_background_part(global.master[biome],136,216,16,16,x-2,y)
				draw_background_part(global.master[biome],136,216,16,16,x-14,y)
			}
		}
	break;
	}

	
	default:{
		if (event="create") {
			//Example
			//			/* Actually adding the weapon */ with player if name="megaman" {global.mega_addon_weapons[p2]+=1 global.weapon_unlocked[(p2*100)+max_weapon+global.mega_addon_weapons[p2]]=1 }  /* Create event code */	with player if name="megaman" {global.mega_addonweapon_create[owner.p2*100+max_weapon+global.mega_addon_weapons[p2]]="visible=1 timer0=60  hspeed=owner.xsc*2  xsc=-owner.xsc "} /* Step event code*/ with player if name="megaman" {global.mega_addonweapon_step[owner.p2*100+max_weapon+global.mega_addon_weapons[p2]]="visible=1  timer0-=1 if timer0 mod 10 =0 {i= instance_create(x,y,firemissile) i.xsc=xsc i.hspeed=0 i.vspeed=-4 i.ygo=y i.owner=owner i= instance_create(x,y,firemissile) i.xsc=xsc i.owner=owner i.hspeed=0 i.vspeed=4 i.ygo=y } if timer0=0 instance_destroy()"} /* Draw event code */ with player if name="megaman" {global.mega_addonweapon_draw[owner.p2*100+max_weapon+global.mega_addon_weapons[p2]]="draw_self()"}
			if string(global.mega_addonweapon_create[owner.p2*100+weapon])==""
			{
				instance_destroy() 
				exit
			}
			string_execute(global.mega_addonweapon_create[owner.p2*100+weapon])
		}
		if (event="step") {
			if string(global.mega_addonweapon_step[owner.p2*100+weapon])==""
			{
				instance_destroy() 
				exit
			}
			string_execute(global.mega_addonweapon_step[owner.p2*100+weapon])
		}
		if (event="draw") {
			if string(global.mega_addonweapon_draw[owner.p2*100+weapon])==""
			{
				instance_destroy() 
				exit
			}
			string_execute(global.mega_addonweapon_draw[owner.p2*100+weapon])
		}
	break;
	}
	
}

#define sprmanager
frspd=1
cantslowanim=0
keepframebetween=0
if (fired){
	if oldspr=="walk" || oldspr=="jump"
	keepframebetween=1
	if (jump){
		if (onvine)  {sprite="climbing" frspd=sign(left+right+up+down)}
		 else {sprite="jumpshoot" frspd=fallspd} 
	} else if (hsp=0) {
		if crouch sprite="crouchshoot" else
        {sprite="shoot"}
    } else {
        {sprite="walkshoot" if step_timer<=7 frame=0 else frame=max(1,frame)  frspd=0.2+abs(hsp/4)}
    }
}else if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}
else if (slide) {sprite="slide"}
else if (dash && dashtype && !jump) {sprite="slide"}
else if (crouch) {sprite="crouch"}
else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
	else if (hang && vsp>=0) {sprite="flagslide"}
    else if (bonk) sprite="bonk"
    else {if oldspr=="jumpshoot" keepframebetween=1 sprite="jump" frspd=fallspd}
} else {
    if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
    else if (hsp=0) {
        if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        {if oldspr=="walkshoot" keepframebetween=1 sprite="walk" if step_timer<=7 frame=0 else frame=max(1,frame)  frspd=0.2+abs(hsp/4)}
    }
}
if (hammerfired) {sprite="throw" hammerfired-=1}
if cloud_carry sprite="cloudcarry"





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

if (up) {
    if (hsp=0 && !jump) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (spindash || (crouch && !jump) || (super && fall=10) || vinegrab || grabflagpole || shell_slide) h=0

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
            if !hang xsc=h
			com_piping()
        } else{
		if (!water && knuxcanclimb(collision(8*h,0)) && (size==4||easter_X || easter_Zero || easter_Kid)) {
				if (jump) framegoby+=1 if framegoby>2 {hang=4}
				xsc=h
			}  else {framegoby=0}
			com_piping()
		}
    } else if !shell_slide{
		if dontstepyoufuck<5 step_timer=7
		step_timer+=1
		if step_timer<7 && !jump{
			hsp=h*1/7
		} else hsp=h*2
		
		
		if slide && xsc!=h slide=0
		
		
		xsc=h
    } 
} else {step_timer=0 if (!left&&!right){dontstepyoufuck+=1 hsp=0}}
if (slide || dash ) && !shell_slide {hsp=xsc*4 if dash hsp=h*3 hyperspeed=(abs(hsp)-maxspd)*sign(hsp)} else hyperspeed=0
slide-=1


if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin)) {
	if down && !slide && (!jump || (!insted && size=3)){
		slide=20
		if jump {insted=1 vsp=0}
	}else if (!jump||fall=69||grabflagpole) { //jump
        {
            jumpsnd=playsfx(name+"jump")
            vsp=-5.2-0.2*super
            onvine=0
            grabflagpole=0
            latchedtoflagpole=0
			sprite_angle=0
			slide=0
            jump=1
            fall=1
            braking=0
            spin=0
            canstopjump=1
            dashtimer=60
            if (mymoving) hsp+=avgmovingh
            crouch=0
            if (spin && !star) seqcount=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps
        if (hang) { // Easter Egg shits
            hang=0
            canstopjump=1
            squat=4
            xsc*=-1 vsp=-5
            hsp=xsc*2.5 instance_create(x-6*xsc,y+8,kickpart) 
            kicked=xsc
            playsfx("kidwalljump")
            wallkick=12
            if (down||ckey) {
                dash=20
                dashside=xsc
                dashtype=1
                playsfx("kiddash")
                //shoot(x-4*t,y+4,psmoke,-2*t,-1)
                //shoot(x-4*t,y+4,psmoke,-2*t,1) 
            }
        }
        jumpbuffer=4*!jumpbufferdo
    }
}
jumpbufferdo=0
springin=0

if (akey) {
    if (jumpbuffer) jumpbuffer-=1
} else jumpbuffer=0

if (!akey) {
    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp=0
    }
    canstopjump=0
}

//code for specifically the b button
if (bbut) {
    {
        i=fire_projectile(x,y) //Everything the projectiles actually do is handled within themselves, 
		//This means that well, if Megaman even fires the weapon or does anything at all is the Projectile's decision.
		//Here's the thing, this means that there is a possibility that, because of the way I'm gonna do this, you can still create your own projectiles.
		//And therefore abilities.
		
		//There is no exceptions, charging is enabled by setting a variable to true or false
    }
}
if can_charge{
	if (bkey){ //The before mentioned exception
		charge+=1
	} else if charge>chargemin{
		fire_projectile(x,y)
	}
}

if (cbut) {
	
	if easter_X || easter_Kid ||easter_Zero{
		if (!dash && !jump) {
			dash=20
			dashside=xsc
			dashtype=1
			playsfx("kiddash")                
			//shoot(x-4*xsc,y+4,psmoke,-2*xsc,-1)
			//shoot(x-4*xsc,y+4,psmoke,-2*xsc,1)
		}     
	} else {
	
		if  !slide && (!jump || (!insted && size=3)){
			slide=20
			if jump {insted=1 vsp=0}
		}
	}
}
if (xbut) {
	
	weapon-=1
	done=0
	if weapon=-1 weapon=max_weapon+global.mega_addon_weapons[p2]
	while !global.weapon_unlocked[max(0,(p2*100)+weapon)] && done=0 { if weapon<=0 {weapon=max_weapon+global.mega_addon_weapons[p2]} else weapon-=1}
	
	charge=0
	cancharge=0
	weapon_switch=15    
}
if (ybut) {
	
	weapon+=1

	
	while !global.weapon_unlocked[(p2*100)+weapon] {weapon+=1 if weapon>(max_weapon+global.mega_addon_weapons[p2]) weapon=MEGA_BUSTER
	}
	while !global.weapon_unlocked[(p2*100)+weapon] && done=0 {weapon+=1 if weapon<0 done=1}
	charge=0
	cancharge=0
	weapon_switch=15    
}
if (zbut) {
	savewep=weapon
	weapon=MEGA_BUSTER
	charge=0
	cancharge=0
	fire_projectile(x,y)
	weapon=savewep

}

//crouching and spinning
if (down && !up) {
    if (!jump && !braking && !spin) {
        if (abs(hsp)<0.5) {
            crouch=1
            hsp=0
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

if (spin || slide || crouch || size=0 ||shell_slide) mask_set(12,12)
else mask_set(12,24)


#define movement
if (piped) exit

//speed limits
if (!jump) if (loose || spin || crouch) {
    braking=0
    frick=0.2
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
	
}
if jump && !(left||right) hsp*=0.9

//speed cap rubberband formula
maxspd=(2 + !!slide)
if abs(hsp)>maxspd hsp=maxspd*sign(hsp)

vsp=min(7+downpiped,vsp)

//movement
calcmoving()
if (wallkick) h=kicked
if (!dead && !grabflagpole) {
	if fall!=69 && !shell_slide
		player_horstep()
    yground=easyground()
	if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        if fall!=69 {
            if !(slide && size=3) vsp+=0.2*wf
        }
		vine_climbing()
		if (hang && vsp>1.5) vsp=1.5
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
		if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		osld=sld
		sld=point_direction(0,0,1,slobal)
		if (!jump && abs(hsp)>=maxspd && spin) {
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


switch (weapon){//Set up our palette depending on our current weapon.
	case MEGA_BUSTER:
	if charge>chargemin && can_charge{
		chargeframe+=min(8,charge/chargemin)//trying to avoid seizures here y'know
		if round(chargeframe/20 mod 3) = 0
			pal_index=1
		else if round(chargeframe/20 mod 3) = 1
			pal_index=2
		else pal_index=3
	} else {pal_index=0}
	
	break;
	
	default: 
		pal_index=weapon+3
	break;
}
	
global.pal_1[p2]=pal_index
global.pal_2[p2]=pal_index
global.pal_3[p2]=pal_index
global.pal_4[p2]=pal_index


weight=0.4+0.4*!!size
bartype=0
maxe=9
energy=weapon_energy[weapon]
if weapon_startingenergy[weapon] =-1 maxe=0

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
pvp_spin=spin //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=instashieldin //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away


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

}

//w�ter
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
    if (dash||slide && !jump) {
        //i=shoot(x,y+10,psmoke) i.depth=depth+2
    }
    if (vsp<-5-2*!sprung) {
        //shoot(x,y+8,psmoke,0,-1)
    }
    if (vsp>7) {
        speedwagon+=1
        //if (speedwagon>60) shoot(x,y,psmoke,0,1)
    } else speedwagon=0
}

wallkick=max(0,wallkick-1)

hang=max(0,hang-1)
if (insta) insta+=1
if (dash) {
    dash-=1
    if ((right-left!=dashside && right-left!=0) || (hang && vsp>0))
        dash=0
    if (jump && dash=0 && !(hang && vsp>0))
        dash=1
}
//spindash/spin
global.coll=id
if (spin) {
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
                if (name!="mario") crouch=down
            }
            mask_reset()
        }   
    }
} else spinblacklist=noone
//Christianity moment
jesus=(boost && vsp<4 && !water)



com_endactions()


#define enemycoll
//Code that defines collision with enemies

if (coll) {
    calcfall=fall
    if (fall=5 || fall=12) calcfall=0
    global.coll=id
    type=coll.object_index
        
    seqcount=max(1,seqcount)
    
    if (super) {
        if (water) seqcount=1
		{kill=coll charm_run("enemykill")}
        enemyexplode(coll)
		
        exit
    }
        
    if (coll.object_index=lakitu) if (coll.flee) exit
    
    if (star  
    || (spin && type!=spinyegg && type!=beetle && type!=koopa && !object_is_ancestor(type,koopa) && type!=shell)
    || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
        instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
        if (type=hammerbro) seqcount=max(5,seqcount)
		{kill=coll charm_run("enemykill")}
        enemydie(coll)                
        exit
    }
    
    if (spindash || inst || firedash) {if (diggity=32) exit enemyexplode(coll) exit}
    
    if (type=piranha) {
        hurtplayer("enemy")
        exit
    }
    
    if (spin) {
        if (type=shell) {if (coll.type!="beetle") {enemydie(coll) exit}}
        else if (type=beetle || object_is_ancestor(type,koopa) || type=koopa) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}
        else if (type=spinyegg) {hurtplayer("enemy") exit}
        else { {kill=coll charm_run("enemykill")} enemydie(coll) exit}
    }
                     
    if (type=spiny) {
        if (!fall && vsp<0) {{kill=coll charm_run("enemykill")} enemyexplode(coll)}
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
        if (jump && (!calcfall || !water) && vsp>0) {{kill=coll charm_run("enemykill")} if (calcfall) enemystomp(coll,5) else enemyexplode(coll)}
        else hurtplayer("enemy") exit
    }
    
    if (type=cheepred || type=cheepwhite) {
        if (jump && !calcfall) {{kill=coll charm_run("enemykill")} enemyexplode(coll) exit}
        else {hurtplayer("enemy") exit}
    }
    
    if (jump) {
        if (type=koopa || type=beetle || type=rexbig || object_is_ancestor(type,koopa)) {
            if (vsp<0) {
                if (calcfall) hurtplayer("enemy")
                else {{kill=coll charm_run("enemykill")} enemyexplode(coll)} exit
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
		dive=0                   
		if size==5 {if vsp<=0 {hurtplayer("enemy") exit} else playsfx(name+"smalljump",0,3.6) vsp=-3-akey*1.5 canstopjump=akey exit}
		{kill=coll charm_run("enemykill")}
        enemystomp(coll) exit      
    } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 {kill=coll charm_run("enemykill")} enemystomp(coll) exit}
    
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

if ((!size || ohgoditslava) && !shielded) {
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
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else {if size=3 size=1 else size-=1} hsp=xsc*-2*wf vsp=0
    
}


//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || owner.size=0 && insted!=1 && !owner.tempkill && cracked=0) {
    if (!goinup) {if (insted!=2) owner.vsp=1.5 sound("itemblockbump") tpos=1}
} else { 
    if (!insted) {owner.vsp=1.5}
    owner.blockc+=1
upwardthrust()
    global.scor[owner.p2]+=10
    sound("itemblockbreak")
    hit=1
    if (playerskindat(p2,"bricd")) {
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
  }
 }
} else if typeblockhit=1{
with (blockcoll){

if (!insted) {
owner.vsp=1.5             
}
if (!wait || owner.tempbrick) {
    if (object_index!=turing) sound("itemblockbump")
    wait=13
    if (!hit) {
if (content="coins"){
        picked=owner.is_coinexplosive || other.is_coinexplosive}
        x=xstart
        if (object_index=invisibox) {
            with (player) if (instance_place(x,y,other.id)) y+=other.bbox_bottom-bbox_top
        }
        untouched=0
        if (respawning) alarm[2]=400
        upwardthrust()
        if (object_index=goalblock) {
hsp=0
            event_user(4)
        } else if (object_index=turing) {
            if (mode=0) turingblock()
        } else if (content!="bros") {
            if (object_index=talkbox) {
                if (string_pos("sfx",text)) {
                    sound(string_delete(text,1,4))
                } else {
                    if (!open) {
                        with (talkbox) open=0
                        open=1
                        cur=0
                        sound("itemmessage")
                    } else {
                        if (trans) cur+=1
                        if (cur+1>=pages) open=0
                        else {sf=0 trans=1}
                    }
                }
            } else if (content="coins") {
                if (picked) {
                    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
                    if (go=1) if (instance_position(x+8,y+24,collider)) {
                        go=-1
                        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
                    }
                    i=cc
                    if (done || picked=2) i=1
                    cc-=i
                    picked=0
                    repeat (i) with (instance_create(x+8,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    global.scor[owner.p2]+=100           
                    with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    global.coins[owner.p2]+=1
                    owner.coint+=1
                    cc-=1  
                }
                if (done || cc=0) {
                    owner.blockc+=1
                    if object_index=bigitembox sprite="bigbox" else sprite="box"
                    hit=1       
                }
                if (alarm[1]=-1) alarm[1]=256
                tpos=0
            } else {
                owner.blockc+=1
                hit=1
                if object_index=bigitembox sprite="bigbox" else sprite="box"
                sound("itemappear")
                mush=!owner.size
                alarm[0]=18
            } 
        }
        tpos=1
        spendblock()
    }
}

if (object_index=bigitembox) {
 if (content="coins") {
                if (picked) {
                    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
                    if (go=1) if (instance_position(x+8,y+24,collider)) {
                        go=-1
                        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
                    }
                    i=cc
                    if (done || picked=2) i=1
                    cc-=i
                    picked=0
                    repeat (i) with (instance_create(x+8,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    global.scor[owner.p2]+=100           
                    with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    global.coins[owner.p2]+=1
                    owner.coint+=1
                    cc-=1  
                }
                if (content2="coins") {
                if (picked) {
                    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
                    if (go=1) if (instance_position(x+8,y+24,collider)) {
                        go=-1
                        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
                    }
                    i=cc
                    if (done || picked=2) i=1
                    cc-=i
                    picked=0
                    repeat (i) with (instance_create(x+8+16,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    global.scor[owner.p2]+=100           
                    with (instance_create(x+8+16,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    global.coins[owner.p2]+=1
                    owner.coint+=1
                    cc-=1  
                }
                if (content3="coins") {
                if (picked) {
                    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
                    if (go=1) if (instance_position(x+8,y+24,collider)) {
                        go=-1
                        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
                    }
                    i=cc
                    if (done || picked=2) i=1
                    cc-=i
                    picked=0
                    repeat (i) with (instance_create(x+8+16+16,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    global.scor[owner.p2]+=100           
                    with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
                    global.coins[owner.p2]+=1
                    owner.coint+=1
                    cc-=1  
                }
                if (done || cc=0) {
                    owner.blockc+=1
                    if object_index=bigitembox sprite="bigbox" else sprite="box"
                    hit=1       
                }
                if (alarm[1]=-1) alarm[1]=256
                tpos=0
            } else {
                owner.blockc+=1
                hit=1
                if object_index=bigitembox sprite="bigbox" else sprite="box"
                sound("itemappear")
                mush=!owner.size
                alarm[0]=18
            } 
        }
        tpos=1
        spendblock()
    }
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
boosted=0

if (downpiped) {
//shoot(x-8,y+4,psmoke,-2,-1)
//shoot(x+8,y+4,psmoke,2,-1)    
    downpiped=0
}
if (hurt) {flash=1 fk=0 hsp=0 hurt=0}

playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1



//jump into tiny space
if (insted!=2 && !spin) {
	mask_temp(12,12)
	coll=collision(0,0)
	mask_reset()
	if (!coll && collision(0,0)) {
	crouch=1
	mask_set(12,12) 
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
alarmmp=max(0,alarmmp-1)
alarm1=max(0,alarm1-1)

if alphadecay &&!alarmmp alpha-=0.1

if alarm1=0 instance_destroy()

} else if (event="draw"){

}


#define enterpipe
if (type="side") {

	set_sprite("walk")

}
if (type="up") {
set_sprite("jump")
}
if (type="down") {
set_sprite("jump")
}

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



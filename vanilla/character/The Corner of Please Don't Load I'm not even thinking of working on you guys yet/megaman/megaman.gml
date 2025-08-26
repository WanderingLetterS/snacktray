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

#define rosterorder
21

#define customhud
dontdrawdefaulthud=true
spr=sheets[global.reroutedsizes[p2,size]]
{
    
	//scope: player
	p=id

	d3d_transform_stack_push()
	d3d_transform_add_translation(hoffx,hoffy,0)

	global.halign=0
	//if dontdrawhudler=1 exit
	p_offset=80

	if !(global.nohud){
		if usepalette scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,global.reroutedsizes[p2,size],other.hud_alpha[p2],totpal+1)

		// apply ma shader
		draw_sprite_part(spr,0,59,22,21,21,8+p_offset*p2,199) //grin emoji
		
		draw_sprite_part(spr,0,8,8,72,13,30+p_offset*p2,198) //That's my name! :)


		//My fucking Energy!

		//energy holder
		if maxe
		switch (maxe){
			case 1: draw_sprite_part(spr,0,8,22,4,10,27+4+p_offset*p2,210) draw_sprite_part(spr,0,54,22,4,10,31+4+p_offset*p2,210) break; //special cases for 1 and 2
			case 2: draw_sprite_part(spr,0,8,22,8,10,27+4+p_offset*p2,210) draw_sprite_part(spr,0,50,22,8,10,35+4+p_offset*p2,210) break;
			default:
			draw_sprite_part(spr,0,8,22,16,10,27+4+p_offset*p2,210) //the starter segment is guaranteed
			tester=(maxe-2)
			offx=0
			while (tester>0){
				if tester==1{draw_sprite_part(spr,0,50,22,8,10,43+4+offx+p_offset*p2,210)}
				else if tester==2{draw_sprite_part(spr,0,42,22,16,10,43+4+offx+p_offset*p2,210)}
				else draw_sprite_part(spr,0,25,22,16,10,43+4+offx+p_offset*p2,210)
				offx+=16
				tester-=2
			}
			break;
		}
		//The actual fucking energy itself
		if maxe
		switch (maxe){
			case 1: if energy draw_sprite_part(spr,0,8,33,min(4,4-min(4,(0.5-energy)*8)),10,27+4+p_offset*p2,210) if energy>0.5 draw_sprite_part(spr,0,54,33,4-((0.5-(energy-0.5))*4),10,31+4+p_offset*p2,210) break; //special cases for 1 and 2
			case 2: if energy draw_sprite_part(spr,0,8,33,min(8,8-min(8,(1-energy)*8)),10,27+4+p_offset*p2,210) if energy>1 draw_sprite_part(spr,0,50,33,8-((1-(energy-1))*8),10,35+4+p_offset*p2,210) break;
			default:
			if energy{
				draw_sprite_part(spr,0,8,33,16-min(16,(2-min(2,energy))*8),10,27+4+p_offset*p2,210) //the starter segment is guaranteed
					tester=(maxe-2)
					offx=0
					enercheck=(energy-2) //remaining energy
				while (enercheck>0){
					if tester==1{draw_sprite_part(spr,0,50,33,8-min(8,(1-enercheck)*8),10,43+4+offx+p_offset*p2,210)}
					else if tester==2{draw_sprite_part(spr,0,42,33,16-min(16,(tester-enercheck)*8),10,43+4+offx+p_offset*p2,210)}
					else if (enercheck>=2) draw_sprite_part(spr,0,25,33,16,10,43+4+offx+p_offset*p2,210)

					else draw_sprite_part(spr,0,25,33,16-min(16,(2-(enercheck mod 2))*8),10,43+4+offx+p_offset*p2,210)
					offx+=16
					tester-=2
					enercheck-=2
				}
			}
			break;
		}
		shader_reset()

		draw_skintext(16,8,chr(36)+chr(42)+format(global.coins[view_current],2),$ffffff)
		maintain_ring=0
		if global.rings[view_current]=0
			with itemdrop if type="ringup" && p2=view_current {maintain_ring=1}
		if global.rings[view_current]==0
			col2=$ffffff
			if global.frame8 col2=$ff
		if ringxoffset!=-44 && global.rings[view_current]=0 && !maintain_ring{
			ringxoffset-=1
			col2=$ff
		}else if ringxoffset!=16 && (global.rings[view_current]>0 || maintain_ring) {
			ringxoffset+=1
			col2=$ffffff
		}
		if global.rings[view_current]!=0
			col2=$ffffff

		draw_skintext(ringxoffset,24,chr(16)+chr(42)+formatdark(global.rings[view_current],3),col2)

		if global.gamemode!="timeattack" {
			//Red Rings
			var rcol;
			i=1
			repeat (5) {
				rcol=c_white
				if !gamemanager.ringexists[i] rcol=c_gray
				draw_skintext(328+(i*8),24,chr(19+settings("rr" + string(i) + global.levelfname)),rcol)
				i+=1
			}

			//Score
			draw_skintext(248,8,formatdark(global.scor[view_current],9),$ffffff)

			if (global.inf_time || global.wanna) {
				draw_skintext(336,8,chr(17)+"-:--",c_white)
			} else {
				col=$ffffff
				if (gamemanager.time<=skindat("hurrytime") && global.frame8) col=$ff
				if (skindat("mariotime"))
					t=floor(tick/22.5)
				else
					t=floor(tick/60)

				t_offset = ((t div 60) >= 10) + ((t div 60) >= 100) //listen if you can get 1000 minutes of time i dont wanna hear nothing about it being offcentered

				draw_skintext(336 - (t_offset*8),8,chr(17)+string(t div 60)+":"+format(t mod 60,2),col)
			}
		} else {
			global.inf_time=1
			t=floor(tick/60)
			t2=floor(tick*1.66666666)

			var timestring, redstring;

			timestring=chr(17)+string(t div 60)+"'"+format(t mod 60,2)+"''"+format(t2 mod 100,2)
			redstring=" "+chr(19+ta_set("ta_win_" + global.levelfname + string_replace(global.lskins[global.levelskin+1,0], global.lbase, ""))) //i'll still find a use for this trust.
			
			global.halign=1
			draw_skintext(220,8,timestring + redstring,c_white)
			global.halign=0
		}
	}
	d3d_transform_stack_pop()
	
}

//Replace flags and signpost drawing with my own


with flag{
	visible=0
	if (issign){
		//interpolation sadly messes with our beloved shader so uh... no interpolation here.
		if (angle<90 || angle>270) draw_sprite_part_ext(other.spr,0,345,11,40,28,x+lengthdir_x(-20,angle)-view_xview[other.p2],y+8-18,lengthdir_x(1,angle)-view_yview[other.p2],1,$ffffff,1) //bowser face
		else {
			
			draw_sprite_part_ext(other.spr,0,345,11,40,28,x+lengthdir_x(-20,angle+180)-view_xview[other.p2],y+8-18-view_yview[other.p2],lengthdir_x(1,angle+180),1,$ffffff,1) //boser side
			if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,owner.totpal+1)
			draw_sprite_part_ext(other.spr,0,386+41*floor(signframe mod 3),11,40,28,x+lengthdir_x(-20,angle+180),y+8-18-view_yview[other.p2],lengthdir_x(1,angle+180),1,$ffffff,1) //player face
			shader_reset()
		}
		if (angle<180) draw_sprite_part_ext(other.spr,0,509,13,4,24,x+lengthdir_x(-20,angle)+lengthdir_x(-4,angle+90)-view_xview[other.p2],y+8-16-view_yview[other.p2],lengthdir_x(1,angle+90),1,$ffffff,1) //singpost side
		else draw_sprite_part_ext(other.spr,509,13,72,4,24,x+lengthdir_x(-20,angle+180)+lengthdir_x(-4,angle+270)-view_xview[other.p2],y+8-16-view_yview[other.p2],lengthdir_x(1,angle+270),1,$ffffff,1) //singpost side
		if anglego!=0 signframe=0
		else if signframe!=3 signframe+=0.1
	} else if !isblock{

		if !owner {draw_sprite_part_ext(other.spr,0,213+33*global.frame,8,32,35,x-view_xview[other.p2],y-14-view_yview[other.p2]+8,1,1,$ffffff,1)     dontdrawtimer=40}
		else if y>=ystart {if dontdrawtimer dontdrawtimer-=1 else draw_sprite_part_ext(other.spr,0,81+33*global.frame,8,32,35,x-view_xview[other.p2],y-23-view_yview[other.p2]+8,1,1,$ffffff,1) }

	}
}

with ermelnads_tronsform{
	visible=0
	if global.greenmode color=1 
	draw_sprite_part(owner.sheetshields,0,469+17*((color mod 3) +(1*color==6)),59+17*floor(color/3),16,16,round(x-8)-view_xview[other.p2],round(y-8)+8-view_yview[other.p2])
}



#define match

if global.mplay==1 { //thankfully you can't get emeralds anywhere else, so I can jsut replace the code outright and not worry about it.
object_event_clear(moranboll,ev_step,ev_step_end)
{ //The notepad++ experience allows me to add this {} here to hide the hideous moranboll replacement code, yippie!

object_event_add(moranboll,ev_step,ev_step_end,'var asp;

asp=25/14

if (!result) {      
    surf=sureface("moranboll",800,448) //double size so i can supersample
    surf2=sureface("moranboll2",400,224)
    ts=sureface("moranbolltemp",256,128)
    
    //build dynamic textures
    if (!sureface_set_target("moranbolltemp")) exit
    d3d_set_projection_ortho(0,0,256,128,0)
    draw_clear_alpha(0,0)
    draw_sprite(global.mbspr,0,0,0)
	color=global.emeralds
	if global.greenmode color=1
    if (room=speciale) draw_sprite(spr_emerald,0,184,79)
    else draw_sprite_part(skindat("tex_"+global.charname[global.option[0]]+"shields0"),0,469+17*((color mod 3) +(1*color==6)),59+17*floor(color/3),16,16,184,79)
	
    surface_reset_target()          
    global.mbtex=surface_get_texture(ts)
    
    //prerender background so the shadow blending doesnt cut holes
    if (!sureface_set_target("moranboll2")) exit
    d3d_set_projection_ortho(0,0,800,448,0)    
    draw_clear_alpha($ff8000,1) //editor sky color
    drawlayeredbackground(0)
    surface_reset_target()    
    
    //main surface
    if (!sureface_set_target("moranboll")) exit
    
    //background
    d3d_set_projection_ortho(0,0,800,448,0)    
    draw_clear_alpha(0,0)  
    d3d_set_zwriteenable(0)
    draw_surface_stretched(surf2,0,0,800,448)    
    d3d_set_zwriteenable(1)
    
    d3d_start()
    
    d3d_set_projection_ext(camx,camy,camz,xdb,ydb,z+16,0,0,1,60,asp,2,2048)
    d3d_transform_add_translation(-xdb,-ydb,-z)
    d3d_transform_add_rotation_y(-topx*10)
    d3d_transform_add_rotation_x(topy*10)
    d3d_transform_add_translation(xdb,ydb,z) 
    
    d3d_set_hidden(1)
    
    //static geometry
    d3d_model_draw(staticmodel,0,0,0,global.mbtex)
    
    //shadows
    d3d_set_zwriteenable(0)
    d3d_set_depth(0.01)
    draw_set_blend_mode(bm_subtract)       
    event_user(4)
    draw_set_blend_mode(0)    
    d3d_set_zwriteenable(1)
    d3d_set_depth(0)
    
    //draw dynamic objects
    d3d_primitive_begin_texture(pr_trianglelist,global.mbtex)
    d3d_set_culling(1)
    event_user(1)
    d3d_set_culling(0)
    d3d_primitive_end()      
    
    //player shadow
    d3d_set_zwriteenable(0)
    draw_set_blend_mode(bm_subtract)       
    d3d_set_depth(nzg-7.99)
    draw_circle_color(xdb-lengthdir_y(z-nzg,topx*10),ydb-lengthdir_y(z-nzg,topy*10),12/(1+abs(z-nzg-8)/128),merge_color(0,$cccccc,sha),0,0)    
    d3d_set_zwriteenable(1)
    draw_set_blend_mode(0)    
    d3d_set_depth(0)        
    
    d3d_transform_set_identity()
    
    //boll
    event_user(3)
    
    d3d_set_hidden(0)
    d3d_end()
    
    //fix alpha
    d3d_set_projection_ortho(0,0,800,448,0)    
    draw_set_blend_mode(bm_add)
    rect(0,0,800,448,0,1)
    draw_set_blend_mode(0)
    
    surface_reset_target()
}')
}



object_event_clear(moranboll,ev_other,ev_user14)
{ //The notepad++ experience allows me to add this {} here to hide the hideous moranboll replacement code, yippie!

object_event_add(moranboll,ev_other,ev_user14,'///draw results screen

slide1=min(vww,slide1+16)
slide2=max(vww,slide2-16)
slide3=min(vww,slide3+16)
slide4=max(vww,slide4-16)

if (mode=0) alpha3=max(0,alpha3-0.05)

if (slide4=vww && !mode) mode=1
if (mode=1) {
    resc+=1
    if (resc=120) {
        sound("systemtimecount",1)
        mode=2
        resc=0
    }
}
if (mode=2) {
    kek=!kek
    if (kek) {
        if (coins) {coins-=1 points+=500}
        if (time) {time-=1 points+=500}
        if (perfect) {perfect-=500 points+=500}
    }
    
    if (floor(points/20000)>mempts) {
        mempts+=1
        if (global.wanna) playgrowsfx("")
        else sound("item1up")
    }
    
    if (coins<=0 && time<=0 && perfect<=0) {
        soundstop("systemtimecount")
        sound("systemregister")
        mode=3
    }
}
if (mode=3) {
    resc+=1
    if (resc=64) {
        sound("itemspecial")
        mode=4
    }
}
if (mode=4) {
    alpha3=min(1,alpha3+0.05)
    if (alpha3=1) destroy=1
}

d3d_set_projection_ortho(view_xview[0],view_yview[0],400,224,0)
offmoran-=1
draw_clear_alpha(0,1)
drawlayeredbackground(0)
d3d_set_projection_ortho(0,0,400,224,0)

t+=0.25           
for (i=0;i<global.emeralds;i+=1) {
	color=i
	if global.greenmode color=1
	draw_sprite_part(skindat("tex_"+global.charname[global.option[0]]+"shields0"),0,469+17*((color mod 3) +(1*color==6)),59+17*floor(color/3),16,16,200-global.emeralds*12+24*i,64+round(sin(i*24+t/2)*2))
}

global.halign=1

global.tscale=2
if (global.emeralds=7) draw_skintext(vww,16,wordwrap(endstrall,24))
else draw_skintext(vww,16,wordwrap(endstr,24))
global.tscale=1

global.halign=2

draw_skintext(slide1,96,lang("score 3")+":",$ffff,1)
draw_skintext(slide2,112,lang("score 5")+":",$ffff,1)
draw_skintext(slide3,128,lang("score 9")+":",$ffff,1)
draw_skintext(slide4,144,lang("score 0")+":",$ffff,1)

global.halign=0

draw_skintext(slide1,96," "+string(coins))
draw_skintext(slide2,112," "+string(time))
draw_skintext(slide3,128," "+string(perfect))
draw_skintext(slide4,144," "+string(points))')
}

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

//Megaman Always has his buster, unless a pesky codeblock took it from him...
//The p2*100 is for each player in case you're going multiplayer

global.weapon_unlocked[(p2*100)+MEGA_BUSTER]=1
global.weapon_startingenergy[MEGA_BUSTER]=-1 //Sets it to not show the energy bar at all

global.weapon_unlocked[(p2*100)+SHELL_SLIDE]=1
global.weapon_unlocked[(p2*100)+HAMMER_THROW]=1

global.weapon_unlocked[(p2*100)+CLOUD_CARRY]=1
global.weapon_startingenergy[CLOUD_CARRY]=9
global.weapon_unlocked[(p2*100)+BOMB_BLAST]=0
global.weapon_unlocked[(p2*100)+CHEEP_TORNADO]=0
global.weapon_unlocked[(p2*100)+ORBINAUT_SHIELD]=0
global.weapon_unlocked[(p2*100)+BULLET_SHOT]=0
global.weapon_unlocked[(p2*100)+SPIKE_LEAD]=0
global.weapon_unlocked[(p2*100)+BOO_CLOAK]=0
global.weapon_unlocked[(p2*100)+TANOOKI_STATUE]=0
global.weapon_unlocked[(p2*100)+ROLLING_CUTTER]=0

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
weapon_switch-=1}



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
						if coll.mega_damage>=4  enemydie(coll,2)
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
			draw_background_part(global.master[biome],56,376,16,16,x-8,y)
			else {
				draw_background_part(global.master[biome],56,376,16,16,x-2,y)
				draw_background_part(global.master[biome],56,376,16,16,x-14,y)
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
    
    if (type=piranha) {
        hurtplayer("enemy")
        exit
    }
    
    if (spin) {
        if (type=shell) {if (coll.type!="beetle") {enemydie(coll) exit}}
        else if (type=beetle || object_is_ancestor(type,koopa) || type=koopa) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}
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



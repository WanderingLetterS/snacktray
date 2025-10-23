#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,jump,bonk,fall,pluck,toss,whistle,climbing,flagslide


#define soundlist
throw,pikmindie,pikminpluck1,pikminpluckcheer

#define movelist
Olimar
#
[a]-Jump
[b]-Pluck, Throw
[c]-Whistle
[x]-Change Type (Left)
[y]-Change Type (Right)
[z]-Designer Mode (Toggle)
You cant collect things by yourself,
but scouting ahead can prove really useful, just make
sure not to get stuck!

<custom>
Olimar (Designer Mode)
#
[a]-Placeblueprint
[b]-Removeblueprint
[c]-Send Pikmin to Highlightedblueprint
[x]-Changeblueprint (Left)
[y]-Changeblueprint (Right)
[z]-Normal Mode

<custom>
Red Pikmin
#
Red Pikmin are immune to Fire, and deal more damage! 
Very, VERY useful in castle levels.

<custom>
Blue Pikmin
#
Blue Pikmin can swim and survive underwater!
Elemental to clearing any level that forces 
one to be submerged.

<custom>
Yellow Pikmin
#
Yellow Pikmin can are immune to electricity, 
but that doesnt mean much.

The distance and height they are thrown at, 
however, is greatly increased!
They are also great diggers.

<custom>
White Pikmin
#
White Pikmin cannot be poisoned, and will inflict 
damage to anything that kills it!
They are great diggers, and can detect hidden 
valuables you wouldnt be bale to see otherwise!

<custom>
Purple Pikmin
#
These stompy guys are very slow, but they
can carry 10 times what a normal Pikmin can!

#define rosterorder
16

#define customhud
{
if p2!=0 exit

with projectile if owner.name=="olimar"{
	if type=="pikmin" && state=STATE_CARRY{
		draw_omitext(carrying.x-5-view_xview[view_current],carrying.y-16-view_yview[view_current],string(carrying.carriers)+"/"+string(carrying.pik_weight))
	
	}	
}


headx=8
heady=8
	draw_set_color(pik_color[0])
	draw_circle(headx+23.5,heady+23.5,23,0)
	draw_set_alpha(0.25)
	draw_set_color(c_black)
	draw_circle(headx+23.5,heady+23.5,23,1)
	draw_set_alpha(1)
	draw_sprite_part_ext(sheets[0],0,97,46,48,48,headx,heady,1,1,c_white,1)
	draw_set_blend_mode(bm_add)
	draw_sprite_part_ext(sheets[0],0,146,46,48,48,headx,heady,1,1,$C1DDDD,1)
	draw_set_blend_mode(bm_normal)
	
	draw_sprite_part_ext(sheets[0],0,97+(3-cap_hp)*29,97,28,28,headx+48+8,heady+24-14,1,1,c_white,1)
	
	draw_omitext(view_wview-24,8,string(pik_number[curr_type])+"#"+string(pik_numbertotal)+"##"+string(clayamount))
	
	
	if global.mplay>1 with gamemanager.players[1] if name="olimar"{
		texture_set_interpolation(1)
		headx=8
		heady=8+48
		draw_set_color(pik_color[0])
		draw_circle(headx+17,heady+23.5,17,0)
		draw_set_alpha(0.25)
		draw_set_color(c_black)
		draw_circle(headx+17,heady+23.5,17,1)
		draw_set_alpha(1)
		draw_sprite_part_ext(sheets[0],0,97,46,48,48,headx,heady+6,0.75,0.75,c_white,1)
		draw_set_blend_mode(bm_add)
		draw_sprite_part_ext(sheets[0],0,146,46,48,48,headx,heady+6,0.75,0.75,$C1DDDD,1)
		draw_set_blend_mode(bm_normal)
		
		draw_sprite_part_ext(sheets[0],0,97+(3-cap_hp)*29,97,28,28,headx+42+8,heady+24-14,0.75,0.75,c_white,1)
		texture_set_interpolation(0)
	
	}
	
	if designer_mode{
		draw_set_alpha(0.5)
		if youcant draw_set_color(c_red)
		else draw_set_color(c_aqua)
	
		
		
		if build_type==0{
			draw_sprite(spr_phaser,0,cursorx_16-view_xview[p2], cursory_16-view_yview[p2])
		} else if build_type==1{
			draw_sprite(spr_vine,0,cursorx_16-view_xview[p2]+8, cursory_16-view_yview[p2]+8)
		} else if build_type==2{
			draw_sprite(spr_16,0,cursorx_16-view_xview[p2], cursory_16-view_yview[p2])
		} else if build_type==3{
			draw_sprite(spr_nslopl,0,cursorx_16-view_xview[p2], cursory_16-view_yview[p2])
		} else if build_type==4{
			draw_sprite(spr_nslopr,0,cursorx_16-view_xview[p2], cursory_16-view_yview[p2])
		} else if build_type==5{
			draw_sprite(spr_bground,0,cursorx_16-view_xview[p2], cursory_16-view_yview[p2])
		}
		
		draw_rectangle(cursorx_16-view_xview[p2],cursory_16-view_yview[p2],cursorx_16+15-view_xview[p2],cursory_16+15-view_yview[p2],0)
		
		
		draw_set_alpha(1)
		draw_set_color(c_white)
	
	}
	
	
}
#define match
global.olimar_pikunlocked[0]=0
global.olimar_pikunlocked[1]=0
global.olimar_pikunlocked[2]=0
global.olimar_pikunlocked[3]=0
global.olimar_pikunlocked[4]=0
global.olimar_pikunlocked[5]=0
global.olimar_pikunlocked[6]=0
global.olimar_pikunlocked[7]=0
global.olimar_pikunlocked[8]=0
global.olimar_pikunlocked[9]=0
global.olimar_pikunlocked[10]=0

moddir=global.workdir+"mods\"
skindir=global.workdir+"skins\"
path=global.pskins[1+global.playerskin[p2],global.option[p2]]
if (skindat("bundleplayer") || path=global.pbase) skin=path
    else skin=skindir+path

    if (skin=global.pbase) {
            directory=moddir+"character\"+global.charname[global.option[p2]]+"\"   
    } else {
		directory=skin
        
    }
ss=string(p2)
slot=p2
name=global.charname[global.option[p2]]

global.reloadallsheets=1

replacesheet(slot,name+"1",directory + "pikmin-basic.png",0,0,1)
replacesheet(slot,name+"2",directory + "pikmin-red.png",0,0,1)
replacesheet(slot,name+"3",directory + "pikmin-blue.png",0,0,1)
replacesheet(slot,name+"4",directory + "pikmin-yellow.png",0,0,1)
replacesheet(slot,name+"5",directory + "pikmin-purple.png",0,0,1)
replacesheet(slot,name+"6",directory + "pikmin-white.png",0,0,1)
replacesheet(slot,name+"7",directory + "pikmin-green.png",0,0,1)//fuck you, that's right. (Glow pikmin have very similar properties to bulbmin.)
replacesheet(slot,name+"8",directory + "pikmin-gray.png",0,0,1)
replacesheet(slot,name+"9",directory + "pikmin-pink.png",0,0,1)
global.reloadallsheets=0

#define start
mask_set(12,12)
cap_hp=3
//moddir+"character\"+global.charname[char]+"\"+"player.txt"

ss=string(p2)
slot=p2


//if global.levelfname="world11"



sheets[1]=skindat("tex_"+name+"1"+ss)
sheets[2]=skindat("tex_"+name+"2"+ss)
sheets[3]=skindat("tex_"+name+"3"+ss)
sheets[4]=skindat("tex_"+name+"4"+ss)
sheets[5]=skindat("tex_"+name+"5"+ss)
sheets[6]=skindat("tex_"+name+"6"+ss)
sheets[7]=skindat("tex_"+name+"7"+ss)
sheets[8]=skindat("tex_"+name+"8"+ss)
sheets[9]=skindat("tex_"+name+"9"+ss)

capt_name=playerskindat(p2,"name"+string(p2))


pik_color[0]=c_red //Olimar
if capt_name =="Fiddlebert" pik_color[0]=c_green //Adding this guy so the pikmin redditors dont kill me

else if capt_name =="Adult Bulbmin" pik_color[0]=c_green //It's obvious that i like the dode.
else if capt_name =="Louie" pik_color[0]=c_blue //LUUWEE
else if capt_name =="The President" pik_color[0]=c_purple //SHACHO

else if capt_name =="Alph" pik_color[0]=c_aqua //Alph
else if capt_name =="Dumbass" || capt_name =="Brittany" pik_color[0]=c_fuchsia //Brittany
else if capt_name =="Charlie" pik_color[0]=c_green //Charlie

//imagine the rescue team is here too.
else if capt_name =="Oatchi" pik_color[0]=c_orange
else if capt_name =="Moss" pik_color[0]=c_green


pik_color[1]=c_gray //Basic/None
pik_color[2]=c_red //Red
pik_color[3]=c_blue //Blue
pik_color[4]=c_yellow //Yellow
pik_color[5]=c_purple //Purple
pik_color[6]=c_white //White
pik_color[7]=c_green //Bulbmin/Glow
pik_color[8]=c_dkgray //ROCK HARD BAYBEY 
pik_color[9]=c_fuchsia //Winged     these are not in the game right now

curr_type=0

dontdrawdefaulthud=1

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
if (type="jumprefresh") {
	insted=0
	mc=0
}
if (type="1up") {
    sound("item1up")
    itemc+=1	
	global.lifes+=1
	deaths=max(0,deaths-1)
	if (super) superpower=6000
	else energy=maxe
	itemget=1	
}



#define effectsbehind
sicksiner+=1
if curr_type!=0|| have_type[0]{
	
	
	checkx=x+8*xsc
	checky=y-8
	checkhspeed=hsp+2*xsc
	
	checkvspeed=-2
	if curr_type=3 checkvspeed-=2
	if down checkvspeed=0
	if down checkvspeed=0
	if up {checkvspeed=-3 checkhspeed*=0.5}
	checkgravity=0.1
	frameatonce=1
	
	inc=1
	i=0
	draw_set_color(pik_color[curr_type+1])
	draw_primitive_begin(pr_linestrip);
	for (i=0; i<1+inc; i+=1) {
		
		draw_vertex(checkx,checky)
		if position_meeting(checkx,checky,collider) {
			mycoll=instance_position(checkx,checky,collider)
			colltype=collider
			break;
		}
		else if position_meeting(checkx,checky,enemy) {
			mycoll=instance_position(checkx,checky,enemy)
			colltype=enemy
			break;
		}
		else if position_meeting(checkx,checky,item) {
			mycoll=instance_position(checkx,checky,item)
			colltype=item
			break;
		}
		else inc+=1
		if (checky>(view_yview[p2]+view_hview[p2])) {mycoll=-1 break;}
			
		
		checkx = checkx+checkhspeed*frameatonce
		checky = checky+checkvspeed*frameatonce
		checkvspeed= checkvspeed+ checkgravity*frameatonce
		
	}
	draw_primitive_end();
	
	if mycoll!=-1 if colltype=item{
		if mycoll.object_index==coin{
			draw_circle(mycoll.x,mycoll.y,14+sin(sicksiner/60),2)
			draw_circle(mycoll.x,mycoll.y,13.35+sin(sicksiner/60),2)
			draw_omitext(mycoll.x-5,mycoll.y-16,string(mycoll.carriers)+"/1")
			
		}
		
		
	
	}
	
	
	
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


#define projectile
if event="create"{
	ignoreoncount=1
	type=string(owner.proj_type)
	
	event="init"
	with owner{curr_proj=other.id charm_run(other.type) }
}
if event="step"{
	with owner{curr_proj=other.id charm_run(other.type)}
}
if event="draw"{

	

	with owner{curr_proj=other.id charm_run(other.type)}
	
	
}
//Both an Onion and a Spaceship
#define checkponion
with curr_proj{ 
	if event="init"{
		visible=1
		image_yscale=10	
		image_xscale=10
		frame=-5
		growanimx=0.5
		growanimy=0.5
		growframex=0
		growframey=0
		piktype=1
		x-=5
		fadein=0
	}
	if event="step"{
		if owner.xbut=1 {
			with owner{
				proj_type="sprout"
				o=fire_projectile(other.x,other.y-42)
				o.piktype=other.piktype//Basic
			}
		}
		if frame<7 frame+=0.25
		else {frame+=0.25
			if frame>9{
			growframey+=1
			growframex+=1
			if growframey<25 growanimy+=0.027
			else growanimy=max(growanimy-0.025/2,1)
			
			
			if growframex<(19*1.5) growanimx+=growframex/460
			else growanimx=max(growanimx-0.025,1)
			}
		
		}
		if growanimx==1 && growanimy==1{
			fadein+=0.02
			if fadein==0.5 with owner{
				proj_type="sprout"
				o=fire_projectile(other.x,other.y-42)
				o.piktype=other.piktype//Basic
			}
		}
	}
	if event="draw"{
		if growanimx==1 && growanimy==1{
			if fadein<1 draw_sprite_part_ext(owner.sheets[0],0,318,71,28,54,x-14+28*(1-growanimx)/2,y-19-32+54*(1-growanimy),growanimx,growanimy,c_white,1)
			draw_sprite_part_ext(owner.sheets[0],0,318,87,28,54,x-14,y-19-32+16,1,1,c_white,1)
			draw_sprite_part_ext(owner.sheets[0],0,347+17*piktype,71,16,16,x-8,y-51,1,1,c_white,fadein)
		}else if frame>=9
		draw_sprite_part_ext(owner.sheets[0],0,318,71,28,54,x-14+28*(1-growanimx)/2,y-19-32+54*(1-growanimy),growanimx,growanimy,c_white,1)
		else 
		draw_sprite_part_ext(owner.sheets[0],0,213+15*floor(min(max(frame,0),6)),81,14,44,x-7,y-9-32,1,1,c_white,1)
	
	}
	
}	

#define sprout
with curr_proj{ 
	if event="init"{
		ignoreoncount=0
		ready=0
		vspeed=-4
		hspeed=random(1.5)-0.75
		gravity=0.1
		jump=1
		xsc=esign(hspeed,1)
		sprite_angle=0
		visible=1
		image_yscale=4
		image_xscale=4
		frame=0
		depth=1000001
	}
	if event="step"{
		
		if jump{
			framesub+=1
			if framesub>=4 {frame=!frame framesub=0}
			sprite_angle=direction+90
			
			coll=collision(0,1)
			if coll{
				jump=0
				vspeed=0
				hspeed=0
				gravity=0
				y=coll.bbox_top-4
				sprite_angle=0
			}
			
			
		}
		else{
			timer+=1
			if timer=30 { ready=1 frame=2}
			sprite_angle=0
		
		
		}
		
	}
	if event="draw"{
		draw_sprite_general(
		//  sprite, subimage    
			owner.sheets[piktype+1],0,
		//  left, top    
			148+24*floor(frame),12,
		//  width, height    
			23,27,
		//  left top corner of the quad, accounting for rotation
			round(x)+lengthdir_x((margin-12)*xsc,sprite_angle)+lengthdir_x(margin-(20),sprite_angle-90),
			round(y)+lengthdir_y((margin-12)*xsc,sprite_angle)+lengthdir_y(margin-(20),sprite_angle-90),
		//  scale and rotation
			xsc,1,sprite_angle,
		//  blending    
			$ffffff,$ffffff,$ffffff,$ffffff,1
		)
		
		
		draw_set_blend_mode(bm_add)
		if ready draw_sprite_part_ext(owner.sheets[piktype+1],0,244,9,23,31,round(x-12),round(y-15-8),1,1,$ffffff,1)
		draw_set_blend_mode(bm_normal)
		
	}
}

#define pikmin
with curr_proj{ 
	
	if (event="init") { //Only plays when the projectile is fired
		
		ignoreoncount=0
		image_xscale=3
		image_yscale=3
		frame_sub=0
		frame=0
		brickc=0
		seqcount=2
		kek=8
		exploding=0
		exploframe=0
		visible=1
		xsc=owner.xsc
		piktype=owner.piktype_pull
		depth=owner.depth-1
		jump=0
		xp=x
		frc=0
		bob=0
		posbob=0
		state=0
		ending=""
		maxspd=owner.maxspd
		animation=ANIM_IDLE
		//Variables for the Animation states!
		ANIM_IDLE=0
		ANIM_WALK=5
		ANIM_JUMP=6
		ANIM_CARRY=7
		ANIM_ATTACHATTACK=8
		ANIM_KNOCK=9
		ANIM_PANIC=10
		ANIM_DEAD=11
		ANIM_THROWN=12
		
		
		//Play once and return to Idle
		ANIM_WAIT=1
		ANIM_DISSAPOINTED=2
		ANIM_DRINK=3
		ANIM_CELEBRATE=4
		
		//Variables for the state events!
		
		STATE_PLUCKED=0
		STATE_IDLE=1
		STATE_FOLLOW=2
		STATE_CARRY=3
		STATE_PANIC=4//Affected by element or is otherwise just scared
		STATE_DROWN=5//Self explanatory.
		STATE_HURT=6
		STATE_DIEFRAME=7//ONLY PLAYS FOR A FRAME, it spawns the soul pikmin type.
		STATE_THROWN=8
		STATE_GETTINGCLAY=9
		STATE_GOINGTOBUILD=10
	}
	if (event="step") { //Always plays
	
		instance_activate_region(x-440,y-240,880,440,1) //We have to activate the objects near by for our pathing, this might cause lag, but there's no other options!
		if (x+hspeed+hsp)<0 x=(0-hspeed-hsp)
		switch  (state){
			case STATE_THROWN:{
				animation=ANIM_THROWN
				coll=collision(hspeed,0)
				if coll{
					hspeed=0
				}
				
				coll=collision(0,1)
				if coll{
					jump=0
					vspeed=0
					hspeed=0
					gravity=0
					depth=owner.depth+10+random(4)
					y=coll.bbox_top-(image_yscale)
					state=STATE_IDLE
					jump=0
				}
				
				coll= instance_place(x,y,item)
				if coll{
					hspeed=0
					vspeed=0
					gravity=0
					depth=owner.depth+10+random(4)
					if coll.object_index=coin{
						carrying=coll
						coll.carriers+=1
						carrying.pik_weight=1
						state=STATE_CARRY
						jump=1
					}
					
				}
				
				
				coll= instance_place(x,y,projectile)
				if coll if coll.owner.name=="olimar" if coll.type=="piktreasure"{
					hspeed=0
					vspeed=0
					gravity=0
					depth=owner.depth+10+random(4)
					
					carrying=coll
					coll.carriers+=1
					state=STATE_CARRY
					
					
				}
				
				
			break}
			case STATE_IDLE:{
				if animation!=ANIM_WAIT{
					animation=ANIM_IDLE
					if random(500)>498.9{
						animation=ANIM_WAIT
						waitimer=0
					}
				} else {
					waitimer+=random(0.2)
					if waitimer>60 animation=ANIM_IDLE
					
				
				}
				if !collision(0,4){
					jump=1
				}
				
				vsp=min(7+downpiped,vsp) //It makes it so you can't enter mach 10 while falling
				
				if jump vsp+=0.15
				x+=hsp
				countx=abs(hsp)
				if collision(0,0){
					do {
					x-=sign(hsp)
					countx-=1
					if !collision(0,0) countx=0
					} until countx<=0
					hsp=0
				}
				
				y+=vsp
				county=abs(vsp)
				if collision(0,0){
					if vsp>0 jump=0
					do {
					y-=sign(vsp)
					county-=1
					if !collision(0,0) county=0
					} until county<=0
					vsp=0
				}
			
			}
			case STATE_PLUCKED:{
				if dosoundin dosoundin-=1
				if dosoundin==1 with owner playsfx(name+"pikminpluckcheer")
				if vspeed>0 depth=owner.depth+10
				coll=collision(0,1)
				if coll{
					jump=0
					vspeed=0
					hspeed=0
					gravity=0
					depth=owner.depth+10+random(4)
					y=coll.bbox_top-(image_yscale)
					state=STATE_FOLLOW
					jump=0
					with owner {
						
						if !have_type[other.piktype] {have_type[other.piktype]=1 if typetotal=0 curr_type=other.piktype typetotal+=1}
						pik_number[other.piktype]+=1 //This is entirely visual, so desyncs wont matter much thankfully.
						pik_numbertotal+=1
						other.myoffset=pik_numbertotal*3
					}
				}
				animation=ANIM_THROWN
			break}
			case STATE_CARRY:{
				animation=ANIM_CARRY
				if carrying.pik_weight<=carrying.carriers{
					
					carrying.x=approach_val(carrying.x,x,2)
					carrying.y=approach_val(carrying.y,y-carrying.pik_carry_offset,3)
					
					if carrying.carriers> carrying.pik_weight*2{
						 carrying.carriers-=1 
						 state=STATE_IDLE
						 carrying=noone
					}
					
					if !carrytarget
					with projectile{
						if type=="checkponion" {other.carrytarget=id}
					
					}
					if carrytarget==noone carrytarget=owner
					
					
					
				}else {hsp=0 vsp=0}
				
				if !instance_exists(carrying){carrying=noone state=STATE_IDLE}
				
				if place_meeting(x,y,carrytarget){
					if carrying.object_index==coin{
						instance_create(x,y,smoke)
						with carrying instance_destroy()
						carrying=noone
						carrytarget=noone
						owner.clayamount+=1
						state=STATE_IDLE
					}
					
					if carrying.object_index==projectile{
						
						if carrying.type=="piktreasure"{
							instance_create(x,y,smoke)
							mus_play("finish",0) global.finishmusic=1
							global.nextlevel=carrying.nextlevel
							with carrying instance_destroy()
							owner.endingstage=1
							state=STATE_IDLE
							carrying=noone
						carrytarget=noone
							with owner {ending="block" finish=1}
							
						}
					
					
					}
				
				}
				
				if !collision(0,4){
					jump=1
				}
				
				vsp=min(7+downpiped,vsp) //It makes it so you can't enter mach 10 while falling
				
				if jump vsp+=0.15
				right=0 left=0
				if jump h=0
				if !jump vsp=0
				if carrying.pik_weight<=carrying.carriers
				hsp+=0.15*h
				
				
				if (carrytarget.x)>(x) right=1
				else if (carrytarget.x)<(x) left=1
				h=right-left
				if carrying.carriers> carrying.pik_weight{
				
					if abs(hsp)>maxspd*(0.25+(0.25*(carrying.carrier/carrying.pik_weight))) hsp=maxspd*sign(hsp)*(0.25+(0.25*(carrying.carrier/carrying.pik_weight)))
				}else if abs(hsp)>maxspd*0.25 hsp=maxspd*sign(hsp)*0.25
				if h!=0 xsc=h
				
				
				x+=hsp
				countx=abs(hsp)
				coll=collision(0,0)
				if coll if !player_climbstep(coll,sign(hsp)){
					do {
					x-=sign(hsp)
					countx-=1
					if !collision(0,0) countx=0
					} until countx<=0
					hsp=0
				}
				
				y+=vsp
				county=abs(vsp)
				if collision(0,0){
					if vsp>0 jump=0
					do {
					y-=sign(vsp)
					county-=1
					if !collision(0,0) county=0
					} until county<=0
					vsp=0
				}
			
			
			break;}	
			case STATE_GOINGTOBUILD:
			case STATE_GETTINGCLAY:{
				if !carrytarget
				with projectile{
					if type=="checkponion" {other.carrytarget=id}
				
				}
				if carrytarget==noone carrytarget=owner
				
				if state==STATE_GOINGTOBUILD{
					if collision_circle(x,y,22+hsp,buildtarget,0,1){
						buildtarget.progress+=1
						state=STATE_IDLE
						hsp=0
						carrytarget=noone
						if buildtarget.progress>0{ //all builds cost one clay for now.
							buildtarget.built=1
							carrytarget=noone
						}
						
					}
				
				
				}
				
				
				if place_meeting(x,y,carrytarget){
					state=STATE_GOINGTOBUILD
					carrytarget=buildtarget
				}
				
				
				if !collision(0,4){
					jump=1
				}
				gonnajump=0
				coll=collision(hsp,0)
				if coll if !player_climbstep(coll,sign(hsp)){
					gonnajump=1
				}
				if gonnajump&&!jump{
					gravity=0
					vspeed=0
										
					//How high you're jumping
					if !collision(hsp*2,-16) vsp=-2.5
					else vsp=-4
					onvine=0
					jump=1
					if (water) vsp=-sqrt(sqr(vsp)*wf+2) //water boosts your height
					gonnajump=0
					grabflagpole=0
					latchedtoflagpole=0				
				}
				vsp=min(7+downpiped,vsp) //It makes it so you can't enter mach 10 while falling
				
				if jump vsp+=0.15
				right=0 left=0
				hsp+=0.15*h
				
				
				if (carrytarget.x)>(x) right=1
				else if (carrytarget.x)<(x) left=1
				h=right-left
				if abs(hsp)>maxspd hsp=maxspd*sign(hsp)
				if h!=0 xsc=h
				
				
				
				x+=hsp
				countx=abs(hsp)
				coll=collision(0,0)
				if coll if !player_climbstep(coll,sign(hsp)){
					do {
					x-=sign(hsp)
					countx-=1
					if !collision(0,0) countx=0
					} until countx<=0
					hsp=0
				}
				
				y+=vsp
				county=abs(vsp)
				if collision(0,0){
					if vsp>0 jump=0
					do {
					y-=sign(vsp)
					county-=1
					if !collision(0,0) county=0
					} until county<=0
					vsp=0
				}
				if abs(hsp)<=0.1 {
				
					if animation!=ANIM_WAIT{
						animation=ANIM_IDLE
						if random(500)>498.9{
							animation=ANIM_WAIT
							waitimer=0
						}
					} else {
						waitimer+=random(0.2)
						if waitimer>60 animation=ANIM_IDLE
						
					
					}
					
					
					
				}else animation=ANIM_WALK
			
			
			break;}		
			
			case STATE_FOLLOW:{
				gonnajump=0
				if owner.abut{
					with owner if collision(0,-vsp) &&vsp<0 other.jumpposx=x
				
				}
				if abs(x-jumpposx)<8{
					gonnajump=1
					jumpposx=0
				}
				if collision(hsp,0){
					gonnajump=1
				}
				//Pikmin can jump the same amount Olimar can
				if !collision(0,4){
					jump=1
				}
				if gonnajump&&!jump{
					if !collision(hsp*2,-16) vsp=-2.5
					else vsp=-4
					onvine=0
					jump=1
					if (water) vsp=-sqrt(sqr(vsp)*wf+2) //water boosts your height
					gonnajump=0
					grabflagpole=0
					latchedtoflagpole=0

				
				}
				vsp=min(7+downpiped,vsp) //It makes it so you can't enter mach 10 while falling
				
				if jump vsp+=0.15
				right=0 left=0
				hsp+=0.15*h
				if (owner.x-(myoffset*owner.xsc))>(x+16) right=1
				else if (owner.x-(myoffset*owner.xsc))<(x-16) left=1
				else {hsp=0 xsc=owner.xsc}
				h=right-left
				
				if abs(hsp)>maxspd hsp=maxspd*sign(hsp)
				if h!=0 xsc=h
				
				
				x+=hsp
				countx=abs(hsp)
				if collision(0,0){
					do {
					x-=sign(hsp)
					countx-=1
					if !collision(0,0) countx=0
					} until countx<=0
					hsp=0
				}
				y+=vsp
				county=abs(vsp)
				if collision(0,0){
					if vsp>0 jump=0
					do {
					y-=sign(vsp)
					county-=1
					if !collision(0,0) county=0
					} until county<=0
					vsp=0
				}
				
				if abs(hsp)<=0.1 {
				
					if animation!=ANIM_WAIT{
						animation=ANIM_IDLE
						if random(500)>498.9{
							animation=ANIM_WAIT
							waitimer=0
						}
					} else {
						waitimer+=random(0.2)
						if waitimer>60 animation=ANIM_IDLE
						
					
					}
					
					
					
				}else animation=ANIM_WALK
				if jump animation=ANIM_THROWN
				
				
			break}
			
		}
	}
	
	if (event="draw") { //Always plays. Allows to draw things on screen
	

	aniy=animation
	if animation==ANIM_THROWN sprite_angle-=30*xsc
	else sprite_angle=0
	frspd=0.25
	maxfr=1
	if animation==ANIM_WALK {maxfr=6 frspd=0.25}
	else if animation==ANIM_IDLE {maxfr=6 frspd=0.05}
	else if animation==ANIM_WAIT {maxfr=6 frspd=0.035}
	
	fr= (fr+1*frspd) mod maxfr
	
	frame=floor(fr)
	draw_sprite_general(
		//  sprite, subimage    
			owner.sheets[1+piktype],0,
		//  left, top    
			8+24*floor(frame),40+28*floor(aniy),
		//  width, height    
			23,27,
		//  left top corner of the quad, accounting for rotation
			round(x)+lengthdir_x((margin-15)*xsc,sprite_angle)+lengthdir_x(margin-(13),sprite_angle-90),
			round(y)+lengthdir_y((margin-12)*xsc,sprite_angle)+lengthdir_y(margin-(12),sprite_angle-90)-12,
		//  scale and rotation
			xsc,1,sprite_angle,
		//  blending    
			$ffffff,$ffffff,$ffffff,$ffffff,1
		)

	}
}

#define bridgeblueprint
with curr_proj{ 
	if (event="init") {
		built=0
		visible=1
		builders=0
		buildblueprint=1
	}
	if (event="step") {
		if built{
			instance_create(x,y,phaser)
			//do a nice tile_add, lmao
			instance_destroy()
		}
	}
	if (event="draw") {
	
			draw_set_alpha(0.5)
			draw_set_color(c_aqua)
		
			draw_rectangle(x,y,x+15,y+4,0)
			
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}

#define wallblueprint
with curr_proj{ 
	if (event="init") {
		built=0
		builders=0
		buildblueprint=1
		visible=1
	}
	if (event="step") {
		if built{
			i=instance_create(x,y,collider)
			i.olimar=true
			i.owner=owner.id
			instance_destroy()
		}
	}
	if (event="draw") {
			draw_set_alpha(0.5)
			draw_set_color(c_aqua)
		
			draw_rectangle(x,y,x+15,y+15,0)
			
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}
#define ladderblueprint
with curr_proj{
	if (event="init") {
		built=0
		buildblueprint=1
		builders=0
		visible=1
	}
	if (event="step") {
		if built{
			i=instance_create(x,y,vine)
			i.olimar=true
			i.owner=owner.id
			//do a nice tile_add, lmao
			instance_destroy()
		}
	}
	if (event="draw") {
			draw_set_alpha(0.5)
			draw_set_color(c_aqua)
		
			draw_rectangle(x+4,y,x+8,y+15,0)
			
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}
#define slopeleftblueprint
with curr_proj{
	if (event="init") {
		built=0
		builders=0
		buildblueprint=1
		visible=1
	}
	if (event="step") {
		if built{
			i=instance_create(x,y,nslopl)
			i.olimar=true
			i.owner=owner.id
			//do a nice tile_add, lmao
			instance_destroy()
		}
	}
	if (event="draw") {
			draw_set_alpha(0.5)
			draw_set_color(c_aqua)
		
			draw_triangle(x,y,x,y+15,x+15,y+15,0)
			
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}
#define sloperightblueprint
with curr_proj{ 
	if (event="init") {
		built=0
		builders=0
		buildblueprint=1
		visible=1
	}
	if (event="step") {
		if built{
			instance_create(x,y,nslopr)
			//do a nice tile_add, lmao
			instance_destroy()
		}
	}
	if (event="draw") {
			draw_set_alpha(0.5)
			draw_set_color(c_aqua)
		
			draw_triangle(x+15,y,x,y+15,x,y+15,0)
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}
#define backwallblueprint
with curr_proj{ 
	if (event="init") {
		built=0
		builders=0
		buildblueprint=1
		visible=1
	}
	if (event="step") {
		if built{
			
			instance_destroy()
		}
	}
	if (event="draw") {
			draw_set_alpha(0.5)
			draw_set_color(c_blue)
		
			draw_rectangle(x,y,x+16,y+16,0)
			
			draw_omitext(x,y-6,string(builders)+"/1")
			

	}
}


#define piktreasure
with curr_proj{
	if (event=="init"){
		treasuretype=floor(random(1)) //yeah uh,only one piktreasure for now.
		pik_weight=10
		pik_carry_offset=20
		visible=1
		mask_index=spr_mask2x2
		image_xscale=37/2
		image_yscale=40/2
		//while !collision(0,1) y+=1
		
	}
	if (event=="step"){
		if !collision(0,1) y+=1
		
	}
	if (event=="draw"){
		draw_sprite_part(owner.sheets[0],0,365,8,37,40,x-floor(37/2),y-floor(37/2))
		
		if global.debug draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,0,c_white,0.5)
	}
}

#define sprmanager
frspd=1//Default animation speed
cantslowanim=0//Flag meant to stop the slowing of animations underwater

if (grabflagpole) {sprite="flagslide"} //Grabbed the flagpole
else if (hurt) {sprite="knock"} //Hurt sprite
else if (whistle) {sprite="whistle" whistle-=1}
else if (fired) {sprite="toss" cantslowanim=1}
else if (crouch) {sprite="crouch"} //Crouching
else if (jump) {
if (onvine) 
{
sprite="climbing" frspd=sign(left+right+up+down) //Climbing a vine or fence
}
    else if (sprung) {sprite="spring" fallspr="springfall" if (vsp>=0) {sprung=0 fall=1}} //After jumping on a spring
    else if (fall=10) {if ((vsp>2 && dashanim>30) || sprite="specfall") sprite="specfall" else sprite="dash" dashanim+=1} //The Dash animation
    else if (bonk) sprite="bonk" //Bonking your head on a ceiling
    else {sprite="jump" if (vsp>0) sprite="fall"} //
} else {
    if (hsp=0) {
        if (hang) {sprite="hang"}
		else if (pulling) {sprite="pluck" pulling-=1}
        else if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (braking) sprite="brake"
else {sprite="walk" frspd=0.2+abs(hsp/4)}
    }
}
if endingstage sprite="pose"
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

if (up && (!hang || !size)) {
    if (hsp=0 && !jump) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (spindash || (crouch && !jump) || (super && fall=10) || vinegrab || grabflagpole || pulling || designer_mode) h=0

if pulling hsp=0
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
                    if (abs(hsp)<0.5) if (!firedash) xsc=h
                } else {
                    hsp+=0.06*wf*h
                    braking=0
                    if (!firedash) xsc=h
                }
            } else {
                hsp+=0.08*wf*h
                xsc=h
            }
        }
    }
}

if (push!=h) push=0

com_di()
if !designer_mode{

	//code for specifically the a button
	if ((abut || jumpbufferdo) && (!springin)) {
		if (!jump||fall=69||grabflagpole) { //jump
			jumpsnd=playsfx(name+"jump")
			vsp=-4 //How hight you're jumping
			onvine=0
			if (water) vsp=-sqrt(sqr(vsp)*wf+2) //water boosts your height

			grabflagpole=0
			latchedtoflagpole=0
			//change jump angle in steep slopes
			vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/2)
			vm=point_distance(0,0,hsp,vsp)
			hsp=lengthdir_x(vm,vd)
			vsp=lengthdir_y(vm,vd)

			sprite_angle=0

			jump=1
			fall=0
			braking=0
			spin=0
			canstopjump=1
			dashtimer=60
			if (mymoving) hsp+=avgmovingh
			crouch=0
			if (spin && !star) seqcount=0
			fallspd=min(1,0.5+abs(hsp)/5)//this is just the speed of the animation
		} else { //air jumps
			//"insted" is typically used to mark if you're used our air action
			jumpbuffer=4*!jumpbufferdo //jump buffering
		}
	}
	jumpbufferdo=0
	springin=0

	if (akey) {
		if (jumpbuffer) jumpbuffer-=1
	} else jumpbuffer=0

	if (!akey) {
		if (canstopjump=1 && jump && vsp<-2 && !sprung) {
			vsp*=0.5
		}
		canstopjump=0
	}

	//code for specifically the b button
	if (bbut){
		if !jump && !pulling{
			with projectile if string(type)!="sprout"{memy=y y=-verybignumber}
			pik_coll=instance_place(x,y,projectile)
			with projectile if string(type)!="sprout"{y=memy}
			if string(pik_coll.type)="sprout"{
				if pik_coll.ready=1{
					playsfx(name+"pikminpluck1")
					
					pulling=20
					proj_type="pikmin"
					o=fire_projectile(x-xsc*4,y+7)
					if (!pikfollower) {pikfollower=o piklast=o}
					else {o.pikfollower=pikfollower pikfollower.pikfollow=o pikfollower=o}
					o.pikfollow=id
					o.owner=id
					o.piktype=pik_coll.piktype
					o.vspeed=-4
					o.gravity=0.2
					o.hspeed=-1*xsc
					o.xsc=xsc
					o.x=x+(8*xsc)
					o.state=0//Plucked state!
					o.dosoundin=10
					with pik_coll instance_destroy()
				}
			} 
		}
		if !pulling && fired<10{
			if typetotal>0{
				
				with projectile if string(type)!="pikmin" {memy=y y=-verybignumber}
				
				with projectile if string(type)=="pikmin" if (piktype!=other.curr_type||state!=STATE_FOLLOW) {memy=y y=-verybignumber}
				
				
				pik_thrown=instance_nearest(x,y,projectile)
				with projectile if string(type)!="pikmin"  {y=memy}
				
				with projectile if string(type)=="pikmin" if (piktype!=other.curr_type||state!=STATE_FOLLOW) {y=memy}
				if !pik_thrown pik_thrown=instance_nearest(x,y,projectile)
				
				if abs(pik_thrown.x-x)<48 && pik_thrown.type="pikmin" && pik_thrown.state=pik_thrown.STATE_FOLLOW{
					pik_number[pik_thrown.piktype]-=1 //This is entirely visual, so desyncs wont matter much thankfully.
					pik_numbertotal-=1
					with projectile if string(type)="pikmin" if myoffset>other.pik_thrown.myoffset{myoffset=(max(myoffset-2,2))}
					frame=0
					fired=15
					jumpsnd=playsfx("olimarthrow")
					with pik_thrown{
						myoffset=3
						state=8
						xsc=owner.xsc
						x=owner.x+8*owner.xsc
						y=owner.y-8
						hspeed=owner.hsp+2*owner.xsc
						
						vspeed=-2
						if piktype=3 vspeed-=2
						if other.down vspeed=0
						if other.up {vspeed=-3 hspeed*=0.5}
						
						
						gravity=0.1
					}
				}
			}
		}
	}


	if (cbut) && !whistle{
		whistle=30
		with projectile if string(type)="pikmin" && inview() && state!=STATE_FOLLOW && state!=STATE_THROWN && state!=STATE_CARRY && state!=STATE_DIEFRAME{
			owner=other.id
			with owner {
				if !have_type[other.piktype] {have_type[other.piktype]=1 if typetotal=0 curr_type=other.piktype typetotal+=1}
				pik_number[other.piktype]+=1 //This is entirely visual, so desyncs wont matter much thankfully.
				pik_numbertotal+=1
				other.myoffset=pik_numbertotal*3
			}
			
			state=STATE_FOLLOW
			
		}

	} else if cbut{

		with projectile if string(type)="pikmin" && inview() && state!=STATE_FOLLOW && state!=STATE_THROWN && state!=STATE_DIEFRAME{
		
			with owner {
				if !have_type[other.piktype] {have_type[other.piktype]=1 if typetotal=0 curr_type=other.piktype typetotal+=1}
				pik_number[other.piktype]+=1 //This is entirely visual, so desyncs wont matter much thankfully.
				pik_numbertotal+=1
				other.myoffset=pik_numbertotal*3
			}
		
			state=STATE_FOLLOW
			
		}


	}

	if (ybut){
		curr_type= ((curr_type+1) mod 10)
	}

} else {
	xsc=esign(cursorx-x,xsc)
	cursorx+=(right-left)*2
	cursory+=(down-up)*2
	
	cursorx_16= floor(cursorx/16)*16
	cursory_16= floor(cursory/16)*16
	
		youcant=1
		if build_type=0 && position_meeting(cursorx_16,cursory_16,collider){
			if abut sound("itemblockbump")
		}
		else if build_type=1 && !(position_meeting(cursorx_16-1,cursory_16,collider)||position_meeting(cursorx_16+16,cursory_16,collider)){
			if abut sound("itemblockbump")
		}
		else if build_type=2 && position_meeting(cursorx_16,cursory_16,collider){
			if abut sound("itemblockbump")
		}
		else if build_type=3 && position_meeting(cursorx_16,cursory_16,collider){
			if abut sound("itemblockbump")
		}else if build_type=4 && position_meeting(cursorx_16,cursory_16,collider){
			if abut sound("itemblockbump")
		}else if build_type=5 && position_meeting(cursorx_16,cursory_16,background) ||position_meeting(cursorx_16,cursory_16,semiground){
			if abut sound("itemblockbump")
		}else if clayamount>0 && !position_meeting(cursorx_16,cursory_16,projectile){
			youcant=0
			if (abut){
				clayamount-=1
				
				
				if build_type=0 proj_type="bridgeblueprint"
				else if build_type=1 proj_type="ladderblueprint"
				else if build_type=2 proj_type="wallblueprint"
				else if build_type=3 proj_type="slopeleftblueprint"
				else if build_type=4 proj_type="sloperightblueprint"
				else if build_type=5 proj_type="backwallblueprint"
				fire_projectile(cursorx_16,cursory_16)
			}
			
		} else {if abut sound("itemblockbump") }
	if position_meeting(cursorx_16,cursory_16,projectile){
		coll= instance_position(cursorx_16,cursory_16,projectile)

		if (coll.buildblueprint)  {
			
			if (bbut){
				with coll instance_destroy()
				sound("itemblockbump")
				clayamount+=1
			}
			
			if (cbut){
				with projectile if string(type)=="pikmin" 
				if (piktype==other.curr_type && state==STATE_FOLLOW) {
					if other.coll.builders>0 {} else {
						other.coll.builders+=1
						state=STATE_GETTINGCLAY
						buildtarget=other.coll
					
					
					}
				
				}
			}
		}
	}
	
	if (ybut){
		build_type=(build_type+1) mod 6
	
	}
	
	
}


if (zbut){
	designer_mode=!designer_mode
	cursorx=x
	cursory=y
	build_type=0
}



//crouching and spinning
if (down && !up) {
    if (!jump && !braking) {
            crouch=1   
    }
	com_piping()  //Handles getting into pipes
}
else
if !jump crouch=0


//Masks, they dictate the size of your hurtbox (the size in which you interact with things)
if (crouch ) mask_set(12,12)
else mask_set(12,24)


#define cpu
if disband && inview() {wait_for_cap=1}
if whistle && inview() {wait_for_cap=0}
if wait_for_cap exit
akey=0
if my_leader.x>x+(16*!jump) right=1
if my_leader.x<x-(16*!jump) left=1
if push akey=1
if my_leader.y<(y-15) akey=1
if my_leader.y<(y-12)&&my_leader.jump akey=1
if my_leader.down down=1
if my_leader.spindash&&abs(hsp)<0.5&&!jump{xsc=my_leader.xsc spindash=my_leader.xsc}
if my_leader.abut && !jump {akey=1}

if vsp>0 canstopjump=0
if jump && (my_leader.vsp+my_leader.y) <(y+16)&&canstopjump &&vsp<-1 {akey=1 cpu_akeystuck=0}




if akey cpu_akeystuck+=1 else cpu_akeystuck=0
if cpu_akeystuck>5{akey=0 cpu_akeystuck=0}
if !inview() {x=my_leader.x y=my_leader.y}


#define actions
com_warping()
com_actions()

with flag {
	with player if name=="olimar" {
		proj_type="piktreasure"
		i=fire_projectile(other.x,other.y)
		i.nextlevel=other.nextlevel
	}

	instance_destroy()
	

}


if endingstage{
	endingstage+=1
	if endingstage==320 game_stageend()

}

pointx+=h*6
if pointx>120 pointx=120
if pointx<-120 pointx=-120
if !jump pointy=y

if p2=0
if !base|| base=noone{
		proj_type="checkponion"
		i=fire_projectile(x,y+11)
		i.depth=1000001
		base=i
}

if pik_number[0]<=0 have_type[0]=0
if pik_number[1]<=0 have_type[1]=0
if pik_number[2]<=0 have_type[2]=0
if pik_number[3]<=0 have_type[3]=0
if pik_number[4]<=0 have_type[4]=0
if pik_number[5]<=0 have_type[5]=0
if pik_number[6]<=0 have_type[6]=0
if pik_number[7]<=0 have_type[7]=0
if pik_number[8]<=0 have_type[8]=0
if pik_number[9]<=0 have_type[9]=0


checks=0
if !have_type[curr_type]
while !have_type[curr_type] {curr_type= ((curr_type+1) mod 10)  checks+=1 if checks>=11 {curr_type=0 break;}}


weight=0.4+0.4*!!size 
bartype=0 //0 is the arrows, 1 is the squares
//"maxe" is the variable used to denotate your maximum energy


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
pvp_spin=spin //Rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=0 //Make sure to set for 0 for the mario bros when pounding
pvp_ignore=0 //For when you wanna hit the others but not yourself
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

//woter
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


//sspin
global.coll=id
if (spin) {
    coll=instance_position(x-10*sign(hsp),y+22,hittable)
    coll2=instance_position(x,y+22,hittable)
    
     if (coll2) if (coll2.object_index!=brick) coll=coll2
    if (coll) if (coll.hit) coll=0
    if (coll=spinblacklist) coll=0
    if (!coll)
        with (hittable)
            if (id!=other.spinblacklist && (object_index!=brick) && !hit)
                if (instance_place(x,y-4,other.id)) other.coll=id
    
    if (coll) if (!coll.goinup || tempbrick) {
        i=coll.object_index
        hitblock(coll,id,0,1,0)
        if (i=brick) {spinblacklist=coll}
    }
    
    //stop spinning
    if (abs(hsp)<0.2) { 
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

//Christianity moment (makes you stand on water)
jesus=(boost && vsp<4 && !water)



com_endactions()


#define movement
if (piped) exit

size=0

//speed limits
if (!jump) if (loose || spin || crouch) {
    braking=0
    frick=0.09
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula
maxspd=(2 + !!size*0.5 + water*0.1)*wf //Your Maximum speed
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp) //This is what sets your speed to max if you're goign too fast

vsp=min(7+downpiped,vsp) //It makes it so you can't enter mach 10 while falling

//movement
calcmoving() 

if (!dead && !grabflagpole) {
	if fall!=69
	player_horstep() //Disables moving like normal if you're climbing
    player_nslopforce()
	//if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        hang=0
        if fall!=69 { //Makes sure you aren't affected by gravity while climbing
            vsp+=0.15*wf
        }
		vine_climbing() //The common code for all climbing acts
        crouch=0
        braking=max(0,braking-1)
		if (sprung && !fall) fall=1
		push=0
		coyote=0
		osld=0
		player_vertstep() //Mmoves you up and down
		if (!jump) sld=point_direction(0,0,1,slobal) //Sets your slope position when you land
	}


    if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
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

if ((!cap_hp || ohgoditslava) && !shielded) {
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
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else {cap_hp-=1} hsp=xsc*-2*wf vsp=-3*wf
    
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
if (content="coins"){ picked=owner.is_coinexplosive || other.is_coinexplosive}
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
                    repeat (i) with (instance_create(x+8+offset,y+8+16*go,itemdrop)) {
                        hspeed=myrand(2)-1
                        vspeed=(2+myrand(2))*other.go
                        drop=0
                        type="coinup"
                    } 
                } else {
                    with (instance_create(x+8+offset,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
if (object_index == bigitembox) { 
with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
with (instance_create(x+8+(offset*2),y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
global.coins[owner.p2]+=3
owner.coint+=3
global.scor[owner.p2]+=300   
} else {
global.coins[owner.p2]+=1
owner.coint+=1
global.scor[owner.p2]+=100
}
                    cc-=1  
                }
                if (done || cc=0) {
                    owner.blockc+=1
                    hit=1       
                }
                if (alarm[1]=-1) alarm[1]=256
                tpos=0
            } else {
                owner.blockc+=1
                hit=1
if (object_index == bigitembox) { 
with (instance_create(x+8,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
with (instance_create(x+8+(offset*2),y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
global.scor[owner.p2]+=200
global.coins[owner.p2]+=2
owner.coint+=2
}
                sound("itemappear")
                mush=!owner.size
                if !mush mush=owner.size==5
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
frame+=frspd

if alphadecay &&!alarmmp alpha-=0.1

if alarm1=0 instance_destroy()

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
set_sprite("fly")
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



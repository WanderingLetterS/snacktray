#define spritelist
stand,wait,lookup,pose,crouch,knock,dead,walk,run,maxrun,brake,spring,airwalk,jump,bonk,ball,spindash,push,hang,fire,fire2,fire3,dash,dashfall,dropdash,slide,zerodash,momentumbreak,wallslide,doublejump,doublejumpbonk,doublejumpfall,runjump,longjump,sideflip,groundpound,poundfall,marioslide,dive,spinjump,climbing,flagslide,grind,piping,pipingup,sidepiping,doorenter,doorexit,tailspin,tailidle


#define soundlist
release,skid,spin,spindash,insta,slide,boom,dash,dropdash,fireball,firedash,fly,jump2,peelcharge,peelrelease,tired,wallkick,smallwallkick,dive


#define movelist
Simple

Moveset failed to load.

#define rosterorder
420


#define start
//Global only stuff
shortsmallform=( unreal(playerskindat(p2,"simple-overall resizesmallform"),3)  )


for (i=0;i<=5;i+=1){

	fall_type[i]=( string(playerskindat(p2,"simple-overall jump type")) == "Mario"  )	
	mario_movement[i]=( string(playerskindat(p2,"simple-overall movement type")) == "Mario"  )
	accuratesonic_movement[i]=( string(playerskindat(p2,"simple-overall movement type")) == "AccurateSonic"  )
	top_speed[i]=( unreal(playerskindat(p2,"simple-overall top speed"),3)  )
	air_accel[i]=( unreal(playerskindat(p2,"simple-overall air acceleration"),3)  )
	ground_accel[i]=( unreal(playerskindat(p2,"simple-overall ground acceleration"),3)  )
	deaccel[i]=( unreal(playerskindat(p2,"simple-overall deaccelaration"),3)  )
	
	
	//Simple Unique
	can_zerodash[i]=funnytruefalse(playerskindat(p2,"simple-overall zerodash"))
	can_zerodashEX[i]=funnytruefalse(playerskindat(p2,"simple-overall zerodashEX"))
	can_zerodashplus[i]=funnytruefalse(playerskindat(p2,"simple-overall zerodashplus"))
	can_slide[i]=funnytruefalse(playerskindat(p2,"simple-overall slide"))
	can_slidekick[i]=funnytruefalse(playerskindat(p2,"simple-overall slidekick"))
	
	can_dropdash[i]=funnytruefalse(playerskindat(p2,"simple-overall dropdash"))
	can_momentumbreak[i]=funnytruefalse(playerskindat(p2,"simple-overall momentumbreak"))

	can_fireproj[i]=funnytruefalse(playerskindat(p2,"simple-overall fire projectile"))
	can_fireproj2[i]=funnytruefalse(playerskindat(p2,"simple-overall fire projectile 2"))
	can_fireproj3[i]=funnytruefalse(playerskindat(p2,"simple-overall fire projectile 3"))
	
	//Sonic 
	can_spindash[i]=funnytruefalse(playerskindat(p2,"simple-overall spindash"))
	can_roll[i]=funnytruefalse(playerskindat(p2,"simple-overall roll"))
	can_instashield[i]=funnytruefalse(playerskindat(p2,"simple-overall instashield"))
	can_sonicdash[i]=funnytruefalse(playerskindat(p2,"simple-overall sonicairdash"))
	can_firedash[i]=funnytruefalse(playerskindat(p2,"simple-overall sonicfiredash"))
	can_wingdash[i]=funnytruefalse(playerskindat(p2,"simple-overall sonicwingdash"))
	
	//Mario
	can_longjump[i]=funnytruefalse(playerskindat(p2,"simple-overall longjump"))
	can_sideflip[i]=funnytruefalse(playerskindat(p2,"simple-overall sideflip")) 
	can_triplejump[i]=funnytruefalse(playerskindat(p2,"simple-overall triplejump"))
	can_groundpound[i]=funnytruefalse(playerskindat(p2,"simple-overall groundpound")) //unimplemented
	can_marioslide[i]=funnytruefalse(playerskindat(p2,"simple-overall marioslide")) 
	can_spinjump[i]=funnytruefalse(playerskindat(p2,"simple-overall spinjump")) 
	can_dive[i]=funnytruefalse(playerskindat(p2,"simple-overall dive"))
	can_wallkick[i]=funnytruefalse(playerskindat(p2,"simple-overall wallkick"))
	can_wallhang[i]=funnytruefalse(playerskindat(p2,"simple-overall wallslide"))
	
	//Tails
	has_tails[i]=funnytruefalse(playerskindat(p2,"simple-overall has tails"))
	
	//The Kid
	can_airjump[i]=funnytruefalse(playerskindat(p2,"simple-overall airjump"))
	airjumpy_total[i]=unreal(playerskindat(p2,"simple-overall airjump amount"),0)
	airjumpy_refresh[i]=funnytruefalse(playerskindat(p2,"simple-overall airjump refreshes other moves"))
	airjumpy_changehsp[i]=funnytruefalse(playerskindat(p2,"simple-overall airjump changehorspeed"))
	airjumpy_changevsp[i]=funnytruefalse(playerskindat(p2,"simple-overall airjump changevertspeed"))
	airjumpy_hsp[i]=unreal(playerskindat(p2,"simple-overall airjump horspeed"),0)
	airjumpy_vsp[i]=unreal(playerskindat(p2,"simple-overall airjump vertspeed"),0)
}

for (i=0;i<=5;i+=1){

	switch(i){
		case 0: sizename="-basic" break;
		case 1: sizename="-big" break;
		case 2: sizename="-fire" break;
		case 3: sizename="-feather" break;
		case 4: sizename="-extra" break;
		case 5: sizename="-mini" break;
	}
	

	temp=playerskindat(p2,"simple"+sizename+" jump type")if (string(temp)!="0")fall_type[i]= (string(temp)=="Mario")
	temp=playerskindat(p2,"simple"+sizename+" movement type") 	if (string(temp)!="0") mario_movement[i]= (string(temp) == "Mario")	if (string(temp)!="0") accuratesonic_movement[i]= (string(temp) == "AccurateSonic")
	temp=playerskindat(p2,"simple"+sizename+" top speed")	if (string(temp)!="0") top_speed[i]=real(temp)
	temp=playerskindat(p2,"simple"+sizename+" air acceleration")	if (string(temp)!="0") air_accel[i]=real(temp)
	temp=playerskindat(p2,"simple"+sizename+" ground acceleration")	if (string(temp)!="0") ground_accel[i]=real(temp)
	temp=playerskindat(p2,"simple"+sizename+" deaccelaration")	if (string(temp)!="0") deaccel[i]=real(temp)
		
	
	//Simple unique	
	temp=playerskindat(p2,"simple"+sizename+" zerodash")	if (string(temp)!="0") can_zerodash[i]=funnytruefalse(temp)	
	temp=playerskindat(p2,"simple"+sizename+" zerodashEX")	if (string(temp)!="0") can_zerodashEX[i]=funnytruefalse(temp)	
	temp=playerskindat(p2,"simple"+sizename+" zerodashplus")	if (string(temp)!="0") can_zerodashplus[i]=funnytruefalse(temp)	
	temp=playerskindat(p2,"simple"+sizename+" slide")	if (string(temp)!="0") can_slide[i]=funnytruefalse(temp)	
	temp=playerskindat(p2,"simple"+sizename+" slidekick") if (string(temp)!="0") can_slidekick[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" dropdash")	if (string(temp)!="0") can_dropdash[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" momentumbreak")	if (string(temp)!="0") can_momentumbreak[i]=funnytruefalse(temp)
	
	
	
	
	
	//Sonic stuff
	temp=playerskindat(p2,"simple"+sizename+" spindash")	if (string(temp)!="0") can_spindash[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" roll")	if (string(temp)!="0") can_roll[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" instashield")	if (string(temp)!="0") can_instashield[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" sonicairdash")	if (string(temp)!="0") can_sonicdash[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" sonicfiredash")	if (string(temp)!="0") can_firedash[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" sonicwingdash")	if (string(temp)!="0") can_wingdash[i]=funnytruefalse(temp)
	

	
	//Mario
	temp=playerskindat(p2,"simple"+sizename+" longjump")	if (string(temp)!="0") can_longjump[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" sideflip")	if (string(temp)!="0") can_sideflip[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" triplejump")	if (string(temp)!="0") can_triplejump[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" groundpound")	if (string(temp)!="0") can_groundpound[i]=funnytruefalse(temp) //unimplemented
	temp=playerskindat(p2,"simple"+sizename+" marioslide")	if (string(temp)!="0") can_marioslide[i]=funnytruefalse(temp) 
	temp=playerskindat(p2,"simple"+sizename+" spinjump")	if (string(temp)!="0") can_spinjump[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" dive")	if (string(temp)!="0") can_dive[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" wallkick")	if (string(temp)!="0") can_wallkick[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" wallslide")	if (string(temp)!="0") can_wallhang[i]=funnytruefalse(temp)
	
	
	//Tails
	temp=playerskindat(p2,"simple"+sizename+" has tails")	if (string(temp)!="0") has_tails[i]=funnytruefalse(temp)
	
	
	//The Kid
	temp=playerskindat(p2,"simple"+sizename+" airjump")	if (string(temp)!="0") can_airjump[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump amount")	if (string(temp)!="0") airjumpy_total[i]=real(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump refreshes other moves")	if (string(temp)!="0") airjumpy_refresh[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump changevertspeed")	if (string(temp)!="0") airjumpy_changevsp[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump vertspeed")	if (string(temp)!="0") airjumpy_vsp[i]=real(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump changehorspeed")	if (string(temp)!="0") airjumpy_changehsp[i]=funnytruefalse(temp)
	temp=playerskindat(p2,"simple"+sizename+" airjump horspeed")	if (string(temp)!="0") airjumpy_hsp[i]=real(temp)

}

//setup the movelist

//Size is 0

for (i=0;i<=5;i+=1){
	
	global.movelist[global.option[p2],i]="${c=$"
	global.movelist[global.option[p2],i]+=playerskindat(p2,"simple-overall name color")
	global.movelist[global.option[p2],i]+="}"+playerskindat(p2,"simple name") + "${c=$FFFFFF}"
	if (i==1)
	global.movelist[global.option[p2],i]+=replacebuttonnames(" [mush]")
	if (i==2)
	global.movelist[global.option[p2],i]+=replacebuttonnames(" [flwr]")
	if (i==3)
	global.movelist[global.option[p2],i]+=replacebuttonnames(" [fthr]")
	if (i==4)
	global.movelist[global.option[p2],i]+=replacebuttonnames(" [star]")
	if (i==5)
	global.movelist[global.option[p2],i]+=replacebuttonnames(" [mini]")
	global.movelist[global.option[p2],i]+="##"	
	//Movement quirks
	
	if (can_wallhang[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("${c=$AAAAAA}Can slide down walls.#${c=$FFFFFF}")
	if (can_wallkick[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("${c=$AAAAAA}Can wallkick off of walls.#${c=$FFFFFF}")
	
	if (can_roll[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("${c=$AAAAAA}[down](Grounded with Speed) Roll#${c=$FFFFFF}")
	
	//abut shit
	if (!fall_type[i]) //Well, it is named Spin Attack.
	global.movelist[global.option[p2],i]+=replacebuttonnames("[a] Spin Attack#")
	if (can_triplejump[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[a]>[a]>[a](Ground) Triple Jump#")
	if (can_spindash[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("[down]+[a]/[b]/[c](Ground) Spindash#")
	if (can_airjump[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("[a](Air) Air Jump#")
	if (can_instashield[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("[a](Air) Insta Shield#")
	if (can_dropdash[i]) 
	global.movelist[global.option[p2],i]+=replacebuttonnames("[a](Air) Dropdash#")
	//bbut shit
	if (mario_movement[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[b] Run#")
	if (can_zerodash[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[b](Air) Zero dash#")
	if (can_zerodashEX[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[b](Air) Zero dash EX#")
	if (can_zerodashplus[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[b](Air) Zero dash Plus#")
	
	//cbut shit
	if (can_slide[i]){
		if (can_slidekick[i])
			global.movelist[global.option[p2],i]+=replacebuttonnames("[c](Ground) Slide + Slide Kick#")
		else global.movelist[global.option[p2],i]+=replacebuttonnames("[c](Ground) Slide#")
	}
	if (can_longjump[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[c](Ground) Long Jump#")
	if (can_momentumbreak[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[c](Air) Momentum Break#")
	if (can_dive[i])
	global.movelist[global.option[p2],i]+=replacebuttonnames("[c](Air) Dive#")

	//xbut shit
	
	//ybut shit
	
	//zbut shit
	

global.movelist[global.option[p2],i]-="#"
global.pagespec[global.option[p2],i]=i
}



mask_set(12,12)

//If you don't want tails on your character you can remove the following code. (You will have to remove some more code further down though.)
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
spindash=0
spin=0
push=0
super=0
boost=0
instashieldin=0
//Vanilla tends to forget to set important variables to 0 here, don't repeat vanilla's mistakes.

#define itemget
com_item()

#define effectsbehind
if has_tails[size]
if tail_draw=0{
	if (sprite="ball" || sprite="jump" || sprite="bonk" || sprite="specfall"){
		savesid=sid
		sid=tail_spin_sid
		tail_draw=1
	} else if (sprite="stand" || sprite="wait" || sprite="lookup" || sprite="crouch"){
		savesid=sid
		sid=tail_idle_sid
		tail_draw=1
	}
	if tail_draw=1{	
		if sid=tail_spin_sid{
			saveangle=sprite_angle	
			sprite_angle=dir
			savexsc=xsc
			saveysc=ysc
			xsc=-abs(xsc)
			ysc=abs(ysc)
		} else {
			x-=xsc*6
		}
		if sid=tail_spin_sid{
			x+=lengthdir_x(floor(sprcx*1)-margin,dir)
			y+=lengthdir_y(floor(sprcy+24)-margin,dir)*0.45+5
			//due to the ball sprites being lowered from the regular sprite center, we must apply an offset in here, change it at your leasure.
		}
		
		k=16+128*sid
		tailfrn=global.animdat[p2,k+1+min(4,size)]
		tailfrl=global.animdat[p2,k+7]-1
		tailframe+=(global.animdat[p2,k+6])/max(1,global.animdat[p2,k+8+floor(tailframe)]) //Animate tails
		if (tailframe<0) tailframe+=tailfrn
		if (tailframe>=tailfrn) {tailframe=tailframe-tailfrn if (tailfrl<tailfrn) tailframe+=tailfrl}
			
		ssw_frx=floor(tailframe)
		c=blend
		if !blend c=$ffffff
		if (sprite_angle!=0) draw_sprite_general(
		//  sprite, subimage
			sheets[size],0,
		//  left, top
			8+ssw_frx*sprw+margin,128+sid*sprh+margin,
		//  width, height
			sprw-1-margin*2,sprh-1-margin*2,
		//  left top corner of the quad, accounting for rotation
			round(x)+lengthdir_x((margin-sprcx)*xsc*pxsc*mxsc,sprite_angle)+lengthdir_x((margin+dy-(14+sprcy))*ysc*mysc+14,sprite_angle-90),
			round(y)+lengthdir_y((margin-sprcx)*xsc*pysc*mysc,sprite_angle)+lengthdir_y((margin+dy-(14+sprcy))*ysc*mysc+14,sprite_angle-90),
		//  scale and rotation
			xsc*pxsc*mxsc,ysc*pysc,sprite_angle,
		//  blending
			c,c,c,c,alpha*(1-0.75*shadow)
		)
		else draw_sprite_part_ext(
			sheets[size],0,
			ceil(8+ssw_frx*sprw),ceil(128+sid*sprh),
			sprw-1,sprh-1,
			round(x-sprcx*xsc*pxsc*mxsc), //XSC =direction PXSC = Pipe Squishing MXSC=Modifiable XSC
			round(y+(dy-(14+sprcy))*ysc*pysc*mysc+14),
			xsc*pxsc*mxsc,ysc*pysc*mysc,
			c,1*(1-0.75*shadow)
		)
		
		ssw_frx=savefrx
		if sid=tail_spin_sid{
			x-=lengthdir_x(floor(sprcx*1)-margin,dir)
			y-=lengthdir_y(floor(sprcy+24)-margin,dir)*0.45+5
		}
		if sid=tail_spin_sid{
			xsc=savexsc
			ysc=saveysc
		} else {
			x+=xsc*6
		}
		tail_draw=0
		sid=savesid
		sprite_angle=saveangle
		
	}
}
if (feathdasheffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(feathdasheffect-1),129,39,39,round(feathdasheffecty_x-19.5*feathdasheffecty_xsc),round(feathdasheffecty_y-19.5+dy)+4,feathdasheffecty_xsc,1,$ffffff,alpha)
}

if (boomeffect){
	draw_sprite_part_ext(sheetshields,0,209+40*floor(boomeffect-1),169,39,39,round(boomeffecty_x-19.5*1),round(boomeffecty_y-19.5+dy)+4,1,1,$ffffff,alpha)
	boomeffect+=0.1
	if boomeffect>=5 boomeffect=0
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

if (zerodash && can_zerodashEX[size]){
    draw_sprite_part_ext(sheetshields,0,209+40*floor(zerodash/4 mod 4),49,39,39,round(x-19.5*xsc),round(y-19.5+dy)+4,xsc,1,$ffffff,alpha)

}


if (spindash) { //spindust
	draw_sprite_part_ext(sheets[size*!global.singlesheet[p2]],0,10+27*(floor(spindust)),105,26,20,round(x-27*xsc),round(y-5)+dy,xsc,1,$ffffff,alpha)
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


#define sprmanager
frspd=1
cantslowanim=0
if (grabflagpole) {sprite="flagslide"}
else if (pound) {sprite="groundpound" if (pound>12 || stoppounding || vsp>0) sprite="poundfall"}
else if (hurt||wallbonk) {sprite="knock"}
else if (mario_slide) {sprite="marioslide" if slobal=0 sprite="slide"}
else if (slide) {sprite="slide" if slobal!=0 && sign(slobal)==sign(hsp) sprite="marioslide" }
else if (spindash) {sprite="spindash"}
else if (crouch) {sprite="crouch"}

else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
	else if (mombreak) {sprite="momentumbreak"}
	else if (wallhang && vsp>=1 && !spinjump && can_wallhang[size]) {sprite="wallslide"}
	else if (zerodash){sprite ="zerodash"}
	else if (dropdash) {sprite="dropdash"}
	else if (dive) {sprite="dive"}
	else if (spinjump) sprite="spinjump"
    else if (sprung) {sprite="spring" fallspr="airwalk" if (vsp>=0) {sprung=0 fall=1}}
	else if (longjump) {sprite="longjump"}
    else if (fall=10) {if ((vsp>2 && dashanim>30) || sprite="dashfall") sprite="dashfall" else sprite="dash" dashanim+=1}
    else if (fall=6) {sprite="knock"}
    else if (bonk) if triplejump=0.75 sprite="doublejumpbonk" else sprite="bonk"
	else if sideflip sprite="sideflip"
    else {if (fall) {
		sprite=fallspr  
		if fall_type[size] {
			if vsp<=0 sprite="spring" 
			else sprite="airwalk"
			}
		} 
		if sprite="walk"||sprite="run" sprite="airwalk" if !fall sprite="jump" 
		frspd=1   
		if triplejump=0.75{ 
			if vsp<0 sprite="doublejump" 
			else if fall==0 sprite="jump" 
			else sprite="doublejumpfall" 
		} if triplejumping {
			sprite="dropdash"
		}
	} 
} else {
    if (spin) {sprite="ball" frspd=0.5+abs(hsp/3)}
    else if (fired) {sprite="fire" cantslowanim=1}
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
    else if (hsp=0) {
        if (hang) {sprite="hang"}
        else if (pose) sprite="pose"
		else if (peelout){
			if (peelout<25) {sprite="walk" frspd=abs(peelout/15)}
			else if (peelout<45) {sprite="run" frspd=abs(peelout/20)}
			else {sprite="maxrun" frspd=abs(peelout/20)}
		}
        else if (lookup) {sprite="lookup"}
        else if (waittime>maxwait) {sprite="wait"}
        else {sprite="stand"}
    } else {
        if (braking) sprite="brake"
		else if (abs(hsp)>maxspd*0.95 && !water && !finish && !(mario_movement[size] && !run) && boost && (boostvar>=0.75||!can_dashmode[p2])) {sprite="maxrun" frspd=abs(hsp/3)}
        else if ((abs(hsp)>maxspd*0.9 && !water && !finish)  && (mario_movement[size] == 0 ||runvar>=1.4) ) {sprite="run" frspd=abs(hsp/3)}
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

if (up) {
    if (hsp=0 && !jump && !peelout) lookup=1
    else lookup=0
} else lookup=0

//list of things that prevent you from moving
if (spindash || (crouch && !jump) || (super && fall=10) || poundcancel || pound || vinegrab || grabflagpole || peelout ||wallbonk || mario_slide) h=0

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
        if (!pound && !jump && !spin && !crouch && !firedash) {
            push=h
            xsc=h
            braking=0			
        }
		if (!pound && !water && fall!=6 && !crouch && h=xsc && kicked!=h && !carry) if (knuxcanclimb(collision(8*h,0))) {
            if (jump) {wallhang=4 sideflip=0}
            if (vsp>1) crouch=0
            xsc=h
        }
		com_piping()
    } else {
        if (spin) {
            if (sign(hsp)!=h)
                hsp+=0.05*wf*h 
        } else {
            if (!jump) {
                if (sign(hsp)!=h && !(accuratesonic_movement[size] && hsp==0)) {
                    if (abs(hsp)>((maxspd+(runvar*1.5-mario_movement[size]*1.5))*0.8)) {
                        braking=1
						skidding=1
						playsfx(name+"skid")
                        brakedir=h
                    }
                    hsp+=deaccel[size]*wf*h
                    if (abs(hsp)<0.5) xsc=h
                } else {
                    if (abs(hsp)<(maxspd+(runvar*1.5-mario_movement[size]*1.5)))
					hsp+=ground_accel[size]*wf*h
					
                    if size==5 hsp+=0.02*wf*h
                    braking=0
					if !slide 
                    xsc=h
                }
            } else {
                if ((abs(hsp)<(maxspd+(runvar*1.5-mario_movement[size]*1.5))) ||sign(hsp)!=h)
                hsp+=air_accel[size]*wf*h 
				if !zerodash && !firedash 
                if (!wallhang && !wallkick && !twist && !mario_spinjump && !dive &&!longjump) xsc=h
            }
        }
    }
}

if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||fall=69||grabflagpole) { //jump
        if (hsp==0 && crouch && !slide && push==0 &&fall!=69 &&!grabbedflagpole && can_spindash[size]) {
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*playerskindat(p2,"pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
        } else if (!peelready && ((size==5 && !collision(0,-4)) || size!=5)) {
            
			if (abs(hsp)<=2.5 && triplejump) || triplejump>=1 || (triplexsc!=sign(hsp)  && triplexsc!=0) || poundjump && !carry && !crouch {triplejump=0 triplexsc=0}
            else if (jumptiming && ((abs(hsp+hyperspeed)>2.5 || !triplejump))  && !carry && !crouch && triplejump < 1.5 && can_triplejump[size]) {triplejump+=0.75 }
			else if triplejump>0.75 {triplejump=0.75 }
			jumpsnd=playsfx(name+"jump",0,1+triplejump/2+((size==5)/3))
			if triplejump > 0.75 triplejumping=1
            vsp=-5.2-0.2*super-triplejump-!!poundjump
			hellothisisajump=true
			if braking && can_sideflip[size]{vsp-=0.2 sideflip=true  hsp=-2*xsc}
			
            onvine=0
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)
			 if (poundjump) {springsmoke(x,y+8) crouch=0}
			slide=0
            grabflagpole=0
            latchedtoflagpole=0
            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/1.5)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)

			sprite_angle=0
			
			airjumps=0
			
            jump=1
            fall=fall_type[size]
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
		if (wallhang && !carry && !flying) {
            wallhang=0 spinjump=0 dive=0 triplejump=0 triplexsc=0
            kicked=xsc
            hsp=esign((right)+(-left),xsc)*-2.5 jumpspd=100 instance_create(x+6*xsc,y+8,kickpart)
            xsc*=-1 vsp=-4
            if (size) playsfx(name+"wallkick") else playsfx(name+"smallwallkick",0,1+(size==5)/3)
            wallkick=12 crouch=0
            run=1
			mombreaked=0
			dive=0
			insted=0
			sideflip=0
            canstopjump=1
        } else {
			
			if can_airjump[size] && airjumpy_total[size]>airjumps && (!wallbonk || airjumpy_refresh[size]){
				airjumps+=1
				if airjumpy_refresh[size] insted=false
				if airjumpy_changehsp[size] hsp=airjumpy_hsp[size]*esign(h,xsc)
				if airjumpy_changevsp[size] vsp=airjumpy_vsp[size]
				if airjumpy_refresh[size] {dive=0 mombreaked=0 wallbonk=0 zerodashed=0}
				longjump=0
				braking=0
				
			}
			
			
			if (!insted && can_instashield[size] && (fall=fall_type[size]||fall=0 || fall=10)) {
				insted=1
				fall=0
				sideflip=0
				playsfx(name+"instashieldin")
				insta=1 alarm[1]=20+water*10-(name="ashura")*10
				instashieldin=1
				brake=0
			}
			if (can_dropdash[size] && (fall=fall_type[size] ||fall=0 || fall=10)) {
				
				playsfx(name+"dropdash")
				dropdash=1.5
				sideflip=0
				brake=0
				
			}
			
			jumpbuffer=4*!jumpbufferdo
		}
    }
}
jumpbufferdo=0
springin=0

if (akey) {
	if dropdash{
		dropdash=min(dropdash+0.05,maxspd+1)
	}

    if (jumpbuffer) jumpbuffer-=1
} else jumpbuffer=0

if (can_triplejump[size]){
	if (!jump) {
		if (jumptiming) jumptiming-=1
		else {triplejump=0 triplexsc=0}
	}

}


if (!akey) {
	dropdash=0
    if (canstopjump=1 && jump && vsp<-2 && !sprung) {
        vsp*=0.5
    }
    canstopjump=0
}

//code for specifically the b button
if (bbut) {
    if (spindash || (hsp=0 && !slide && crouch && push=0 && can_spindash[size])) {
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*playerskindat(p2,"pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } else {
		////////MARIO MOVEMENT
		if mario_movement[size]{
			if (!bellyslide) run=1.5
		}
		////////ZERO DASH
		if can_zerodash[size] || can_zerodashEX[size]{
			if (jump && (fall=0 || fall=2 || fall=5) && !zerodashed){
				zerodashed=1
				zerodash=20
				if dive ||longjump xsc=esign(h,xsc)
				dive=0
				longjump=0
				if can_zerodashEX[size] boost=1
				playsfx("simpledash",0,1.5)
				playsfx("simplerelease",0,1)
				//playsfx("simpledash",0,1.2)
				i=shoot(x-4*t,y+4,psmoke,-2*t,2) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-2) i.growsize=-0.25 
				
				
			}	
		}else if can_zerodashplus[size] {
			if (jump && (fall=0 || fall=2 || fall=5) && !zerodashed){
				zerodashed=1
				zerodash=40
				if dive ||longjump xsc=esign(h,xsc)
				dive=0
				
				longjump=0
				boost=1
				playsfx("simpledash",0,1.1)
				playsfx("simplerelease",0,1.5)
				i=shoot(x-4*t,y+4,psmoke,-2*t,2) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-2) i.growsize=-0.25 
				
			}	
		}else if can_wingdash[size] {
			if (jump && (fall=0 || fall=2 || fall=5) && !airdash && !firedash) {
				airdash=1
				if (abs(hsp)>3.5 && dashtimer) { boosted=1 boost=1}
				if dive ||longjump xsc=esign(h,xsc)
				t=esign(right-left,xsc)
				xsc=t
				hsp=max(1,abs(hsp))*esign(hsp,xsc)
				fall=10
				dive=0
				longjump=0
				i=shoot(x-4*t,y+4,psmoke,-2*t,0.5) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-0.5) i.growsize=-0.25 
				vsp=-3
				hsp=maxspd*sign(xsc)
				playsfx("simpledash")
				
				feathdasheffect=1
				feathdasheffecty_x=x
				feathdasheffecty_xsc=xsc
				feathdasheffecty_y=y
				feathdasheffecty_hsp=-xsc*3
				feathdasheffecty_vsp=-1
			}
		} else if can_firedash[size] {
			if (jump && (fall=0 || fall=2 || fall=5) && !airdash && !firedash) {
				airdash=1
				if (abs(hsp)>3.5 && dashtimer) { boosted=1 boost=1}
				if dive ||longjump xsc=esign(h,xsc)
				t=esign(right-left,xsc)
				xsc=t
				hsp=max(1,abs(hsp))*esign(hsp,xsc)
				fall=10
				dive=0
				longjump=0
				i=shoot(x-4*t,y+4,psmoke,-2*t,0.5) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-0.5) i.growsize=-0.25 
				
				hsp=4.5*xsc
                vsp=0
                firedash=24
                boost=1
                playsfx("simplefiredash")
				
			}
		} else if can_sonicdash[size] {
			if (jump && (fall=0 || fall=2 || fall=5) && !airdash && !firedash) {
				airdash=1
				if (abs(hsp)>3.5 && dashtimer) { boosted=1 boost=1}
				if dive ||longjump xsc=esign(h,xsc)
				t=esign(right-left,xsc)
				xsc=t
				hsp=max(1,abs(hsp))*esign(hsp,xsc)
				fall=10
				dive=0
				longjump=0
				i=shoot(x-4*t,y+4,psmoke,-2*t,0.5) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-0.5) i.growsize=-0.25 
				playsfx("simpledash")
			}
		}
		
	}
}

if (cbut) {
    if (spindash || (hsp=0 && !slide && crouch && push=0 && can_spindash[size])) {
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*playerskindat(p2,"pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } else {
		if jump && can_momentumbreak[size] && !(can_dive[size] && dive) mombreak_trigger=1
	
		
		
		if can_dive[size]{
			if (jump && !dive && !wallbonk) {
				pound=0
				vsp=-3
				i=shoot(x-4*t,y+4,psmoke,-2*t,0.5) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-0.5) i.growsize=-0.25 
				hsp=maxspd*esign(h,xsc)*1.1
				xsc=esign(h,xsc)
				playsfx(name+"dive",0,1)
				dive =true
				jump=1
				zerodash=0
			}
		}
		if can_longjump[size] || (can_slidekick[size] && slide){
			if !jump {
				vsp=-3
				i=shoot(x-4*t,y+4,psmoke,-2*t,0.5) i.growsize=0.25
				i=shoot(x-4*t,y+4,psmoke,-2*t,-0.5) i.growsize=-0.25 
				if !slide
				hsp=maxspd*esign(h,xsc)*1.5
				else hsp=maxspd*esign(h,xsc)*1.2
				xsc=esign(h,xsc)
				playsfx(name+"dive",0,1.4)
				playsfx(name+"jump",0,0.9)
				longjump =true
				jump=true
			}
		
		}
		
		
		if can_slide[size]{
			if !jump && !slide{
				slide=60
				xsc=esign(h,xsc)
				playsfx(name+"slide",0,1)
			}
		}
		
		if can_spinjump[size]{
			if !jump {
				jump=1
				spinjump=1
				playsfx(name+"jump",0,1+((size==5)/3))
				vsp=-4.5-0.2*super
				hellothisisajump=true
				
			}
		}
	
		
	
	}
}
if (ckey){
	if can_momentumbreak[size] && mombreak_trigger && jump  {
		if mombreak ||!mombreaked{
			if !mombreak{
				savema_hsp=hsp
				truesave_vsp=vsp
				savema_vsp=vsp
				savema_hyper=hyperspeed
				savema_gm8=gm8exspd
				savema_firedash=firedash
				savema_airdash=airdash
				savema_zerodash=zerodash
				playsfx("simpledash",0,0.5)
				playsfx("simplerelease",0,0.5)
				savema_boost=boost
				mombreaked=true
			}

			hsp=0
			vsp=0
			hyperspeed=0
			gm8exspd=0
			firedash=0
			airdash=0
			zerodash=0
			boost=0
			mombreak=1
			savema_vsp=max(savema_vsp-0.1,min(truesave_vsp,-5))
			if global.dustframe{
			
			if savema_zerodash savema_hsp=abs(savema_hsp)*esign(h,xsc)
			if savema_firedash savema_hsp=abs(savema_hsp)*esign(h,xsc)
			i=shoot(x,y,psmoke) i.hspeed=savema_hsp i.vspeed=savema_vsp i.image_xscale=2 i.image_yscale=2 i.gravity=0.1 i.growsize=-1 i.friction=0.15
			}
		}
	}
} else {
	if mombreak{
		mombreak=0
		hsp=savema_hsp
		vsp=savema_vsp
		hyperspeed=savema_hyper
		gm8exspd=savema_gm8
		
		firedash=savevma_firedash
		airdash=savema_airdash
		zerodash=savema_zerodash
		boost=savema_boost
	}
}

//crouching and spinning
if (down && !up) {
	
    if (jump) {
        if (!carry && fall!=6 && !dive && can_groundpound[size] && !pound && !poundlok && fall!=69) {
            pound=1
			nocratebounce=1
            if (water) seqcount=1
            slidejump=0
            dropkick=0
            spinjump=0
            playsfx(name+"pound")
        }
    } else if (!braking && !spin && !mario_slide) {
        if (abs(hsp)<0.5 || (!can_roll[size] ))&& !(can_marioslide[size] && slobal!=0) {
            crouch=1
            if !can_marioslide[size] hsp=0
        } else if (!spin && !crouch && can_roll[size]) {
            spin=1
            playsfx(name+"spin")
        } else if (can_marioslide[size] && slobal!=0){
			mario_slide=1
			crouch=0
		}
    }
	poundlok=2
	com_piping()
} else {
    mask_temp(12,12)
	mario_slide=0
	if (pound=-1) pound=0
	poundlok=0
    if (!jump) {
        if (collision(0,-16)) {
			if (can_roll[size]) spin=1
			else if (can_marioslide[size]) {mario_slide=1}
		}
        crouch=0
    }
    mask_reset()
}

if jump mario_slide=0

if (!grabflagpole && !piped && size==5) mask_set(9,8) //please dont ask why the width has to be 9 pipes are weird and wacky and this is the only way i got to stop players from getting stuck in pipes and turning invisible/
else if (!grabflagpole && (spin || mario_slide|| pound  || spindash || crouch || size=0 || fall=5)) mask_set(12,12)
else if (jump && !grabflagpole && (!fall || fly || fall=10)) mask_set(12,15)
else mask_set(12,24)

#define movement
if (piped || move_lock) exit


//speed limits
if (!jump) if (loose || spin||mario_slide || crouch) {
    braking=0
    frick=0.06
    if (spin||mario_slide) frick=0.005
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}
//speed cap rubberband formula
maxspd= (top_speed[size]+mario_slide +(fall==10)*1.5 + boost*1.5  + water*0.1)*wf

if (abs(hsp)>(maxspd   - (1.5*(mario_movement[size]&&!runvar)))) {
	if (!spin && !mario_slide && !(jump && (!fall ||fall=10) /*&& inertia*/) )  hsp=(  (abs(hsp)*2+(maxspd- (1.5*(mario_movement[size]&&!runvar))))/3   )*sign(hsp)
} else {boost=0}

if (pound) {
vsp=min(6,vsp)
} else vsp=min(7+downpiped,vsp)

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
        hang=0
        if (fall=10 && super) {
            hsp+=(right-left)*0.25
            if (name="ashura") vsp+=(down-up)*0.15-0.075
            else vsp+=(down-up)*0.15+0.05+0.1*max(0,2-abs(hsp))*(vsp<2)
            l=median(0,point_distance(0,0,hsp,vsp)-0.05,3)
            d=point_direction(0,0,hsp,vsp)
            hsp=lengthdir_x(l,d)
            vsp=lengthdir_y(l,d)
            xsc=esign(hsp,xsc)
        } else if (pound>0) {
			hsp=0
			if (pound<14) {vsp=0}
			else if (underwater() && carry) {vsp=approach_val(vsp,0,0.075)}
			else if (pound>=14 && pound<15) {vsp=6*wf}
			else if (water) {vsp-=0.1*wf if (vsp<1.5) {pound=0}}
			else {vsp+=0.375*wf}
		}else if fall!=69 {
            vsp+=0.15*wf-(size=5 && vsp>-0.35 && !water)*0.075
        }
		vine_climbing()
		if (onvine){
			dive=0
			pound=0
			longjump=0
			crouch=0
			spinjump=0
			triplejump=0
			dash=0
			fall=1
		
		}
        crouch=0
        spindash=0
        braking=max(0,braking-1)
		if (sprung && !fall) fall=1
		if (pound=-1) pound=0
		push=0 
		coyote=0
		osld=0
		if zerodash {
			if !feathdasheffect {
				feathdasheffect=1
				feathdasheffecty_x=x+20*xsc
				feathdasheffecty_xsc=xsc
				feathdasheffecty_y=y
				feathdasheffecty_hsp=xsc*2
				feathdasheffecty_vsp=0
			}
		
			vsp=0 
			zerodash-=1 
			hsp=max(abs(hsp),maxspd+1.5)*xsc  
			if zerodash=0 && can_zerodashEX[size]{
				fall=0 
				boomeffect=1
				boomeffecty_x=x
				boomeffecty_y=y
				vsp=-3   
			} 
		}
		slide=0
		
		if (wallhang>0 && vsp>1 && !spinjump && !water && can_wallhang[size]) vsp=1.5
		
		player_vertstep()
		if (!jump) sld=point_direction(0,0,1,slobal)
    }

	sprite_angle=0
	

    if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		osld=sld
		sld=point_direction(0,0,1,slobal)
		if (!jump && abs(hsp)>=maxspd+1 && (spin||mario_slide)) {
			diff=anglediff(sld,osld)
			if (sign(diff)=sign(hsp) && diff*sign(hsp)>20 && sld=0) {
				jump=1 fall=1 fallspr=sprite fallspd=frspd
				y=min(y,yp)
				hsp=lengthdir_x(hsp,osld) vsp=-abs(lengthdir_y(hsp,osld))*1.5 // coolness factor
			}
		}
		if slide{ hsp=max(maxspd*(1+0.1*slide/60))*xsc if esign(h,xsc)!=sign(hsp) {hsp=0 slide=0} slide-=3 boost=1}
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
                if (instashieldin) insted=1
            }
        }
    }
}
com_finishmove()





#define actions
com_warping()
com_actions()
slipnslide=mario_slide
if slipnslide xsc=esign(slobal,xsc)
  if triplejumping && vsp>0 triplejumping=0

if !(pound) {
	nocratebounce=0
}

weight=0.4+0.4*!!size
bartype=0

if (insta) insta+=1
if (dashtimer) dashtimer-=1

// VULNERABILITY AND PLAYER COLLISION

//Intangibility
is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1) is_intangible=1

//Power levels
power_lv=0
is_coinexplosive=0
if (spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (!poundcancel && pound) power_lv=3
if (firedash) power_lv=4
if (star || instashieldin) power_lv=5

if (super) power_lv+=1
if (firedash) is_coinexplosive=1

if (pound<14) && (pound) {if !(is_intangible_timer) is_intangible_timer=10}



//Special interactions
pvp_spin=(spin&& !jump) //Rolling clash
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
wallbonk=0
spinjump=0
	wallhang=0
    vsp=0
	sideflip=0
	mombreaked=0
	kicked=0
	longjump=0
	airjumps=0

	if (pound) {
		com_piping()
		if (!poundcancel && !piped) {
			playsfx(name+"stomp")         
			shoot(x-8,y+4,psmoke,-2,-1)
			shoot(x+8,y+4,psmoke,2,-1)    
			poundjump=16
		}
		with (itembox) if !hit if (instance_place(x,y-max(4,other.vsp),other.id)) {
			go=1    
			event_user(0)
			picked=0
			other.stoppounding=!hit
			other.jump=1
			other.vsp=-0.1
		}
		with (crate) if (instance_place(x,y-max(4,other.vsp),other.id)) {
			event_user(0)
			other.stoppounding=1
			other.jump=1
			other.vsp=-0.1
		}
		if (stoppounding=1 && !down) {stoppounding=0}
		if stoppounding=0 {pound=0}     
	}


    if (!star && !spin && !spindash) seqcount=0
    //ledge hang animation detection
    if ((sprite="stand" && hsp=0) || hang) {
        image_xscale=1/6
        hang=(!instance_place(x,y+8,collider) && instance_place(x-7*xsc,y+4,collider))
        image_xscale=1
    } else hang=0

    //skidding
    if (push=0 && hsp!=0 && braking) {
        playsfx(name+"skid")
        skidding=1
    } else if (skidding) {soundstop(name+"skid") skidding=0}
}

//water
if (underwater()) {
    if (!water) {
		if (!pound) vsp=min(1,vsp/4)
        if (abs(vsp)>2) water_splash(1)
		if (dive) {vsp+=2 hsp=max(0,abs(hsp)-2)*xsc dive=0}
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
	if (slipnslide) {
		i=shoot(x,y+10,psmoke) i.depth=depth+2
	}
	if (slide) {
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

runvar=inch(runvar,run,0.05)
wallhang=max(0,wallhang-1)
wallkick=max(0,wallkick-1)
poundjump=max(0,poundjump-1)
poundlok=max(0,poundlok-1)

if (!jump && run && !bkey) run=0

if (super) boost=1

if (pound) {
	crouch=1
	hang=0
	if (pound<15) pound+=1
	else if (up || (water && vsp>5)) {pound=0 dive=-1 fall=0 insted=1 crouch=0 canstopjump=1}
	else fall=4
} else poundcancel=0

if (sprite!="jump" && sprite!="ball" && sprite!="bonk" && sprite!="airwalk") 
	dir=point_direction(x,y,xp,yp)
else if (!(x=xp && y=yp)) {
	dir+=anglediff(dir,point_direction(x,y,xp,yp))/3
}
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
        if (!crouch) {
            //if (spindash>3) boost=1
            spin=1
            hsp=xsc*6*(0.75+0.25*median(0,spindash,2)/2)
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
        || (spin||mario_slide && type!=spinyegg && type!=beetle && type!=koopa && !object_is_ancestor(type,koopa) && type!=shell)
        || (pound>13 && type!=piranha && type!=spinyegg && type!=spiny)) {
            instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
            if (type=hammerbro) seqcount=max(5,seqcount)
            enemydie(coll)                
            exit
        }
        
        if (spindash || inst || firedash || spinjump) {if (diggity=32) exit enemyexplode(coll) exit}
        
        if (type=piranha || coll.damage_player_on_contact) {
            hurtplayer("enemy")
            exit
        }
        
        
		if spinjump&&vsp>0{
			if (type=shell) {if (coll.type!="beetle") {enemyexplode(coll) exit}}
			else if (type=koopa|| object_is_ancestor(type,koopa)) {enemyexplode(coll) exit }
            else if (type=beetle ) { enemyexplode(coll) exit}
            else if (type=spinyegg) {jump=1 vsp=-3 instance_create(mean(x,coll.x),mean(y,coll.y),kickpart) exit}
            else {enemydie(coll) exit}
		
		}
		
         
		if (spin||mario_slide) {
            if (type=shell) {if (coll.type!="beetle") {enemydie(coll) exit}}
			else if (type=koopa|| object_is_ancestor(type,koopa)) { with enemyflip(coll) {y-=3 vspeed=-3 intangible_timer=30} exit }
            else if (type=beetle ) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll) exit}
            else if (type=spinyegg) {hurtplayer("enemy") exit}
            else {enemydie(coll) exit}
        }
    
     
        if (type=spiny) {
            if (!fall && vsp<0 && size!=5)||spinjump && vsp>0 enemyexplode(coll)
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
    if (shielded) playsfx(name+"shielddamage")
    else playsfx(name+"damage")

    starhit=0
    
jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else if global.rings[p2]>0 {droprings(0)} else {if size>=2 size=1 else size-=1} hsp=xsc*-2*wf vsp=-3*wf
    
}


//Block hitting

#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || owner.size && owner.size!=5 && insted!=1 && !owner.tempkill && cracked=0 && biggie) { //break spiner
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

} else if (((owner.size || (!owner.size && owner.spin && !biggie && owner.y>=y)) && !tpos) && owner.size!=5)  { 
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

#define hitwall
//hit blocks sideways
	if longjump||dive{
		if abut||jumpbuffer && can_wallkick[size]{
			
			wallhang=0 spinjump=0 dive=0 triplejump=0 triplexsc=0
			kicked=xsc
			hsp=esign((right)+(-left),xsc)*-2.5 jumpspd=100 instance_create(x+6*xsc,y+8,kickpart)
			xsc*=-1 vsp=-4
			if (size) playsfx(name+"wallkick") else playsfx(name+"smallwallkick",0,1+(size==5)/3)
			wallkick=12 crouch=0
			run=1
			mombreaked=0
			dive=0
			insted=0
			longjump=0
			canstopjump=1
			sideflip=0
			poundlok=60
			airjumps=0
		} else {
			wallbonk=1
			instance_create(x,y,kickpart)
			hsp=esign(xsc,xsc)*-3
			dive=0
			longjump=0
			vsp=-1
			sideflip=0
			sound("itemblockbump")
		}
	}
if (firedash || (spin && abs(hsp)>0.5) || (super && fall=10) || longjump||dive) {



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
} if !firedash && !(super && fall=10) {

	if (coll=noone) exit

	if (!collpos(sign(hitside)*10,8,1)) {        
		//gap running
		if (y<coll.y-12) {y=coll.y-14 coll=noone exit}
	}
	com_piping()
	if !wallbonk && !kicked
	hsp=0
	hyperspeed=0        
}

#define landing
braking=0
insted=0
airdash=0
dashanim=0
boosted=0
zerodashed=0
mombreak_trigger=0

if (hellothisisajump) jumptiming=6
hellothisisajump=false
if !down spin=0

if dropdash{
	//smoke and shit
	playsfx("simplerelease")
	if dropdash>3 boost=1
	
	
	hsp=esign(h,xsc)*min(dropdash*1.5, maxspd+3)
	if dive||longjump hsp=xsc*min(dropdash*1.5, maxspd+3)
	dropdash=0
	spin=1
	
}


 

dive =false

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
if (!spin && can_roll[size] && rise=0 && !hurt && down && abs(hsp)>=0.5) {
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

if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}
name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
water=owner.water
frn=owner.frn
vspeed=-3.5 gravity=0.1

} 
else if (event="step"){
if owner.sprite!=sprite {owner.sprite=sprite with owner set_sprite(sprite)}
alarmmp=max(0,alarmmp-1)
alarm1=max(0,alarm1-1)

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
//set_sprite("fly")
}
if (type="down") {}

if (skidding) {soundstop("sonicskid") skidding=0}
braking=0
instashieldin=0
crouch=0
push=0     
firedash=0
dash=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}



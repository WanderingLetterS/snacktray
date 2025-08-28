#define spritelist
stand,wait,lookup,pose,walk,jump,bonk,fall,wall,dash,bow,firedstand,firedwait,firedlookup,firedpose,firedwalk,firedjump,firedbonk,firedfall,firedwall,fireddash,firedbow,flagslide,climbing,grind,piping,pipingup,sidepiping,doorenter,doorexit

#define soundlist
jump2,fire,walljump,stomp,enemyhit,enemykill,glass,swim,yoku,reflect,dash


#define movelist
The Kid
#
[b]: Gun
[down][a]/[c]: Dash
[up][b]: Reset


#define rosterorder
22

#define hud
if !dontdrawhud {
	spr=sheets[size]
	drawdefaulthud()
}

#define unlock
unlocktext="You unlocked ##The Kid!" unlocktip="Have you ever gone the wrong way?"

#define grabbedflagpole
grabbedflagpole=1
hsp=0
vsp=0

#define timeattack
global.startsize[z]=0

#define start
mask_set(10,15)
maxe=0
#define stop
reset=0
hp=0
bow=0
dead=0
piped=0
hsp=0
vsp=0
jump=0
fall=0
hyperspeed=0

#define itemget
if (type="jumprefresh") {	insted=0
	mc=0
}
if (type="mushroom") {
	if size!=5 hurtplayer("item")
	else if ((!piped && !hurt && !(global.mplay>1 && flash)) && size==5) {
		coll=other.id
		if (p2!=other.p2) {
		itemc+=1
		doscore_p(1000,1)
		}
		playgrowsfx("")
		grow=1
		size=0
		itemget=1
		doscore_p(1000,1)
	}	
}
if (type="fflower") {
	hurtplayer("item")             
}
if (type="bfeather") {
	hurtplayer("item")
	/*if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("")
		if (skidding) {soundstop(name+"skid") skidding=0}		
		if (!super && size!=1) grow=1
		oldsize=size
		size=1
		itemget=1
	}  */              
}
if (type="star") {
	if ((!piped && !hurt && !(global.mplay>1 && flash))) {
		coll=other.id
		doscore_p(1000)
		sound("itemstar")
		itemc+=1
		if (!super) {
			star=1
			alarm[2]+=other.fuel+2
			alarm[3]=-1
			kek=0 with (player) if (super) other.kek=1
			if (!kek) {
				mus_play("starman",1)
				global.music="star"
			}                      
		}
		if (skindat("growsfx3"+string(p2))) playsfx("growsfx3") 
		else playgrowsfx("3")
		itemget=1
	}            
}
if (type="1up") {
    sound("item1up")
    itemc+=1	
	bow=1
	itemget=1	
}
if (type="shield") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        sound("itemshield")
		shielded=1
        itemget=1
    }   
}
if (type="poison") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
        coll=other.id
         if !invincible() hurtplayer("enemy")
        itemget=1
    }   
}
if (type="coin") {
}
if (type="ring") {
}
if (type="mini") {
    if ((!piped && !hurt && !(global.mplay>1 && flash))) {
    coll=other.id
    if (p2!=other.p2) {
    itemc+=1
    doscore_p(1000,1)
    }
        playgrowsfx("4")
        if (!super && size!=5) grow=1
        tired=0
        oldsize=size
        size=5
    }
    itemget=1
}      

#define endofstage
right=1
akey=(push*!akey || (jump && akey) || instance_place(x+16,y,enemy) || !collision(16,8))



#define projectile
if (event="create") {
breakflag=1
timer1=60
timer2=-1
frame=0
active=0
bullet=1
image_xscale=4
image_yscale=2

frame_sub=0
frame=0
brickc=0
seqcount=2
a=1
visible=1
if bloddrop{
speed=random(7)
gravity=random_range(0.1,0.3)
u=choose(126,46)
v=choose(133,53)
b=irandom(3)
a=1
image_xscale=3
image_yscale=3
bow=0
}else if gib{
speed=random_range(2,4)
direction=random_range(45,135)
gravity=0.4
fade=0
a=1

image_xscale=3
image_yscale=3
bow=0
}
else if owner.bow{
	name=owner.name
	p2=owner.p2
	charm_init()
	bow=1 
	///////SPRITESWITCHER IS A FLAG TO LET THE BOW BE INSIDE HIS SHEET STORED LIKE AN ANIMATION, THIS CAN BE USED BY ALL MODDED CHARACTERS
	is_spriteswitcher=1
	bullet=0
	owner=owner.id
	size=owner.size
	owner.mybow=id
	xsc=owner.xsc
	ysc=owner.ysc
	water=owner.water
	sprite="bow"
	sid=10 //make the bow sprite actually show up lole... if the slot for the bow changes please change this too kthx
	frame=0
	visible=1
	frame=0
	frspd=0.2
	alpha=1
	timer1=-1
	timer2=-1
}else{
bow=0
bullet=1
if owner.lookup {hspeed=owner.xsc*-6 vspeed=-6} 
else {hspeed=owner.xsc*8}
if (owner.hang && owner.vsp>1) {hspeed*=-1 x-=16*xsc}}
}
if (event="step") {
///BULLET CODE

timer1-=1 if (timer1=0) instance_destroy()
timer2-=1 if (timer2=0) fade=1
calcmoving()
if (abs(x-owner.x)>256) instance_destroy()

frame_sub=!frame_sub
if frame_sub frame=!frame
if (!bow){
xsc=sign(hspeed)
}
active=1
if(bullet){
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
with (invisibox){
if untouched=1
other.coll=instance_place(xstart-other.hsp,y-other.vsp,id)
if untouched=0
other.coll=instance_place(other.x,other.y,id)}
if (coll) {
if coll.seeit=0{ 
instance_destroy()} else{
hitblock(coll,owner,1,-1,1)
instance_create(x,y,kickpart)     
instance_destroy()}
}

coll=instance_place(x,y,coin)

if (coll) {
instance_destroy()
with (owner) playsfx("kidglass")
with (coll) {instance_create(x,y,kickpart) instance_destroy()}
}
coll=instance_place(x,y,axe)

if (coll){
with (coll) {
hp-=1
if (hp<=-5 && !hit) {
hit=1    
sound("itemaxe")
with (coll.owner) playsfx("kidglass")
if real(channelid) != 0 global.channel[real(channelid)] += 1
with (mybridge) event_user(0)
with (instance_nearest(x,y,axewall)) alarm[0]=30
y=-verybignumber
} else with (coll.owner) playsfx("kidenemyhit")
}
}
coll=instance_place(x,y,spreng)
if (coll){

x-=hspeed
hspeed*=-1
xsc*=-1
sound("itemspring") coll.shot=12
}

coll=instance_place(x,y,collider)
if (coll && (coll.object_index!=phaser || ((coll.dir!=0 && coll.dir!=2) && sign(coll.dir)!=xsc))) {
if (object_is_ancestor(coll.object_index,hittable)) {
if (coll.object_index=brick) brickc+=1 else brickc=4
hitblock(coll,owner,1,-1,1)
instance_create(x,y,kickpart)     
instance_destroy()
} else brickc=4
instance_create(x,y,kickpart)     
if (brickc=4) {sound("itemblockbump") instance_destroy()}
}

coll=instance_place(x,y,enemy)
if (coll) {
if (coll.object_index=bulletbill || coll.object_index=bullseyebill || coll.object_index=banzaibill) {
with (owner) playsfx("kidreflect")
direction=90
exit
}
else if (coll.object_index=shell) {
if (coll.type="beetle") {playsfx("kidreflect") direction=90 exit}
sound("enemykick")
coll.spd=3 coll.hspeed=coll.spd*xsc if (coll.type="red") {coll.hspeed*=-1} coll.kicked=1 coll.stop=0
} else {
coll.hp-=1
if (coll.hp=-3) {enemydie(coll.id,seqcount,1) with (owner) playsfx("kidenemykill")}
else with (owner) playsfx("kidenemyhit")
}
instance_create(x,y,kickpart) instance_destroy()
}

coll=instance_place(x,y,player)
if (coll) {
if (coll.id!=owner) if (!invincible(coll)&&!intangible(coll)) {    
if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { 
if (coll.name="knux" && coll.glide && sign(hspeed)=-sign(coll.hsp) && object_index!=powah_wave) {hspeed=abs(coll.hsp+1)*esign(coll.hsp,1) owner=coll.id with (owner) playsfx("knuxreflect") exit}                                                                   
if (coll.name="robo" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) instance_destroy() exit}
coll.hp-=1
if (coll.hp<=-5) with (coll) hurtplayer("enemy")

instance_create(mean(x,coll.x),mean(y,coll.y),kickpart)
with (owner) playsfx("kidenemyhit")
with(coll) fragplayer(other.owner)
}
instance_create(x,y,kickpart) instance_destroy()
}
} 
}//GIB CODE
else if (gib){
visible=1
rot-=hspeed*8
if (fade) {
a=max(0,a-0.02)
if (a=0) instance_destroy()
}

//collisions sp only
if !(global.gamemode="battle"||global.gamemode="coop"){
coll=instance_place(x,y,collider)
if coll{
if (instance_place(x,y,lavablock)) {
instance_create(x,y,smoke)
instance_destroy()
} else if (vspeed>0 && vspeed<1) {
y=yprevious
speed=0
} else {
if (instance_place(xprevious+hspeed,yprevious,other.id)) hspeed*=-0.7                                        
else hspeed*=0.7
if (instance_place(xprevious,yprevious+vspeed,other.id)) vspeed*=-0.5
x=xprevious
y=yprevious
}
}
}
} //BLOD CODE
else if (bloddrop){
visible=1
if!nowimstuck{
//waterology
if (water) {
if (!underwater()) vspeed=abs(vspeed)*0.5
if (speed=0 && !splat) instance_destroy()
}
fade=0
a=1
//collisions sp only
if !(global.gamemode="battle"||global.gamemode="coop"){
coll=instance_place(x,y,collider)
if coll{
if (instance_place(x,y,lavablock)) {
instance_create(x,y,smoke)
instance_destroy()
}
else if (splat){
nowimstuck=1
stuckx=x-coll.x
stucky=y-coll.y
stuck=coll
del=0
fade=0
a=1
timer2=32*a
}
} 
}
} else{
x=stuck.x+stuckx
y=stuck.y+stucky
gravity=0
if (fade) {
a=max(0,a-0.02)
if (a=0) instance_destroy()
}

}

}//////BOW CODE, hey there, -S- here, you would not believe how stupidly long it took me to fix this crashing the game, in fact, as i'm writing this, it's still not fixed,i hate this sooo much,,, EDIT: 27/12/2020 Finally fixed this with adding the spriteswitcherflag holy guacamole
else if (bow){
	ssw_core(1)
		visible=1
		xsc=owner.xsc
		ypos=owner.ypos
		if owner.pose instance_change(smoke,0)
		with (owner){mybow.bowlag=skindat("bowlag")} 
		ysc=owner.ysc
		if bowlag{
			myframe-=1 
			if myframe=0{
				x=owner.x y=owner.y myframe=3
			}
		}else x=owner.x y=owner.y
}
}
if (event="draw") {
if bullet{
draw_sprite_part_ext(sheet,0,93+9*frame,35,8,8,round(x-4*xsc),round(y-4),xsc,1,$ffffff,1)
}
else if bloddrop {
draw_sprite_part_ext(sheet,0,u,v,6,6,round(x-4*xsc),round(y-4),xsc,1,$ffffff,a)
}
else if gib {
d3d_transform_add_rotation_z(rot)
d3d_transform_add_translation(round(x),round(y),0)
draw_sprite_part_ext(sheet,0,u,v,w,h,-w/2,-h/2,1,1,$ffffff,a)
d3d_transform_set_identity()
}
}

#define grabflagpole
grabflagpole=1
hsp=0
vsp=0

#define sprmanager
frspd=1

if (grabflagpole) {sprite="flagslide"}
else if (lookup) {sprite="lookup"}
else if (hang && vsp>=0) {sprite="wall"}
else if (dash && dashtype) {sprite="dash"}
else if (jump) {
	if (onvine) {sprite="climbing" frspd=sign(left+right+up+down)}
	else if (bonk) sprite="bonk" 
	else if (vsp<0) sprite="jump" 
	else sprite="fall"
}
else if (hsp==0) {if (waittime>maxwait) {sprite="wait"} else sprite="stand"}
else {sprite="walk"}



#define controls
com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (piped || move_lock) {
    di=0
    exit
}

if (up) com_piping()
oup=up
               
if (up) {
    if (hsp=0 && !jump) lookup=1
    else lookup=0
} else lookup=0

//movement
if (wallkick) h=kicked
if (h!=0) {
    coll=collision(h,0)
    if (coll) {
        com_hitwall(h)
        push=h
        if (!water && knuxcanclimb(collision(8*h,0))) {
            if (jump) framegoby+=1 if framegoby>2 {hang=4}
            xsc=h
        }  else {framegoby=0}
    } 
    if (!hang) xsc=h
}

if (dash) {
    if (jump) dashside=h
    hsp=(3+(dash-1)/10)*dashside
} else hsp=h*2
    
if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && !springin) {
    if (!jump||fall=69) { //jump
        if (down) {
            if (!dash) {
                dash=20
                dashside=xsc
                dashtype=1
                playsfx("kiddash",0,1+(size==5)/3)                
                shoot(x-4*xsc,y+4,psmoke,-2*xsc,-1)
                shoot(x-4*xsc,y+4,psmoke,-2*xsc,1)
            }
        } else {
            jumpsnd=playsfx("kidjump",0,1+(size==5)/3)
            vsp=-6
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)                                           
            squat=4
            jump=1
            braking=0  
			onvine=0
            canstopjump=1
            if (mymoving) hsp+=avgmovingh
            fall=1
            dashtype=0
            jumpspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps
        if (hang) {
            hang=0
            canstopjump=1
            squat=4
            xsc*=-1 vsp=-5
            hsp=xsc*2.5 instance_create(x-6*xsc,y+8,kickpart) 
            kicked=xsc
            playsfx("kidwalljump",0,1+(size==5)/3)
            wallkick=12
            if (down||ckey) {
                dash=20
                dashside=xsc
                dashtype=1
                playsfx("kiddash",0,1+(size==5)/3)
                shoot(x-4*t,y+4,psmoke,-2*t,-1)
                shoot(x-4*t,y+4,psmoke,-2*t,1) 
            }
        } else if (!insted) {
            insted=1
            canstopjump=1
            dashtype=0
            if (water) {
                vsp=-3
                squat=4
                playsfx("kidswim",0,1+(size==5)/3)
            } else {
                vsp=-5
                squat=4
                playsfx("kidjump2",0,1+(size==5)/3)
                shoot(x,y+12,psmoke,0,2)
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
        vsp*=0.5
    }
    canstopjump=0
}

//code for specifically the b button
 if (bbut) {
    fired=firelength
    if (lookup) {
		playsfx("kidfire")
		if size!=5 bull=fire_projectile(x+8*xsc,y+5)
		else bull=fire_projectile(x+8*xsc,y+9)
		bull.bullet=1
        hurtplayer(1)
    } else if (count_projectiles()<(3+bow)) {
		playsfx("kidfire")
		if size!=5 bull=fire_projectile(x+8*xsc,y+5)
		else bull=fire_projectile(x+8*xsc,y+9)
		bull.bullet=1
    }           
}

if (cbut) {
    if (!dash && !jump) {
        dash=20
        dashside=xsc
        dashtype=1
        playsfx("kiddash",0,1+(size==5)/3)                
        shoot(x-4*xsc,y+4,psmoke,-2*xsc,-1)
        shoot(x-4*xsc,y+4,psmoke,-2*xsc,1)
    }      
}

if (down && !up) {
    com_piping()
}

if (size==5) mask_set(9,8) else mask_set(10,15)       

#define movement
if (piped || move_lock) exit

if (loose && !jump) {
    frick=0.06
    hsp=max(0,abs(hsp)-frick+((size==5)*0.75))*sign(hsp)
}

maxspd=2+dash+((size==5)*0.75)
if (abs(hsp)>maxspd) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)         

vsp=min(7+downpiped,vsp)
 
//the kid reveals invisible blocks on touch 
with (invisibox) if (untouched) if (instance_place(xstart-other.hsp,y-other.vsp,other.id)) {untouched=0 seeit=1 x=xstart with (other) playsfx("kidyoku")}

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
	if fall!=69 {
            vsp=min((5+3*downpiped)*wf,vsp+0.25*wf)
			if size==5 && vsp>-0.45 vsp-=0.105
        } vine_climbing()
        if (hang && vsp>1) vsp=1.5
        push=0 
        player_vertstep()
        coyote=0
    }
    
    if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
        if (finish && ending="retainer" && !jump) coyote=0
        if (!collision(0,4) /*&& (y<yground-2)*/) {
            coyote+=1
            if (coyote=1) {y+=1 coyote=3}
            if (coyote=3) {
				jump=1
				fall=1
			}
        } else coyote=0
        if (jumpbuffer=-1) {
            jumpbuffer=0
            if (!down) jumpbufferdo=1
        }
    }  
}
com_finishmove()   


#define actions
com_warping()
com_actions()
    
if (bow) {if (!mybow) fire_projectile(x,y) bow=0}
if (fired && (sprite!="flagslide" || sprite!="climbing")) {ypos=11}else ypos=0

weight=1
bartype=0

is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1) is_intangible=1

power_lv=0
if (star) power_lv=5
if (super) power_lv+=1

//Special interactions
pvp_spin=0 //rolling clash
pvp_avoid=0 //I don't like social interactions
pvp_stomper=1 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=0 //For when you wanna hit the others but not yourself
pvp_knockaway=1 //I won't hurt you, just go away

if (piped) exit

//waiting animation
if maxwait{
if (sprite="stand" && !fired)
{waittime+=1}
else if sprite!="wait" waittime=0
}


if (!jump) {
    vsp=0
    if (!star && !spin && !spindash) seqcount=0
    hang=0                   
    if (instance_place(x,y+4,lavablock)) hurtplayer(1)
}

if (underwater()) {
    if (!water) {
        if (abs(vsp)>2) water_splash(1)
        vsp=min(1,vsp/2)
        jumpspd=1           
    }
    water=1 wf=0.4
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
    if (dash && !jump) {
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

//character specific actions
wallkick=max(0,wallkick-1)

hang=max(0,hang-1)
squat=max(0,squat-1)

if (instance_place(x,y,part)) hurtplayer(1)

if (water || hang) insted=0

if (dash) {
    dash-=1
    if ((right-left!=dashside && right-left!=0) || (hang && vsp>0))
        dash=0
    if (jump && dash=0 && !(hang && vsp>0))
        dash=1
}

//WHO IS CLIMBING MY SHIT.
if (up && !down && !onvine) {
    onvine=instance_place(x,y,vine)
    if (onvine) fall=69 //nice
}
if (fall=69) {
    rightvine=instance_place(x+8,y,vine)
    leftvine=instance_place(x-8,y,vine)
    if (rightvine=noone) rightvine=0
    if (leftvine=noone) leftvine=0
    
    downvine=instance_place(x,y+8,vine)
    upvine=instance_place(x,y-8,vine)
    if (upvine=noone) rightvine=0
    if (downvine=noone) leftvine=0
    
    if (!rightvine && abs(x-onvine.x)>mask_h/2 && x>(onvine.x)) {
        x=onvine.x+mask_h/2
    } else if (rightvine && abs(x-onvine.x)>mask_h/2 && x>(onvine.x)) onvine=rightvine

    if (!leftvine && abs(x-onvine.x)>mask_h/2 && x<(onvine.x)) {
        x=onvine.x-mask_h/2
    } else if (leftvine && abs(x-onvine.x)>mask_h/2 && x<(onvine.x)) onvine=leftvine
    //Imagine adding separation just so that it doesn't look bad

    if !downvine && abs(y-onvine.y)>mask_v/2 && y>(onvine.y) {
        fall=0
        onvine=0
    } else if downvine && abs(y-onvine.y)>mask_v/2 && y>(onvine.y) onvine=downvine
    
    if (!upvine && abs(y-onvine.y)>mask_v/2 && y<(onvine.y)) {
        fall=0
        vsp=-2
        onvine=0
    } else if (upvine && abs(y-onvine.y)>mask_v/2 && y<(onvine.y)) onvine=upvine
    
    if (onvine.movingnation) {
        x+=onvine.hsp
        y+=onvine.vsp
    }
}

jeezus=((size==5 && !down && abs(hsp)>2.5) && !water)
if jeezus==1 {
    if !plat plat=instance_create(0,0,ground)
    plat.x=x-6
    plat.y=y-80
    plat.image_yscale=0.3
    with instance_place(x,y+4,waterblock) other.plat.y=y
    if plat.y=y-80 {
        if plat with plat instance_destroy() plat=0
    }
    else if instance_place(x,y+4,plat) && splashtime<=0 {splashtime=9 water_splash(-1)}
    splashtime-=1
} else {splashtime=0 plat.x=verybignumber plat.y=verybignumber if plat with plat instance_destroy() plat=0}


com_endactions()

#define enemycoll
if (hurt || piped || (intangible() && !diggity) || star) exit

coll=noone extracheck=id inst=0
if (insta) {extracheck=myhitbox inst=1}


with (pswitch) if (phase!=other.id && !lock && !carry) {
    mask_index=spr_cratemask
    if (instance_place(x,y-other.vsp-16*!!other.diggity,other.id) || instance_place(x,y,extracheck)) other.coll=id
    mask_index=spr_mask16x16
}
with (enemy) if (phase!=other.id && !lock && !carry)
    if (instance_place(x,y-other.vsp-16*!!other.diggity,other.id) || instance_place(x,y,extracheck)) other.coll=id

if (coll) {
    calcfall=fall
    if (fall=5 || fall=12) calcfall=0
    global.coll=id
    type=coll.object_index
    if (type=piranha || type=redpiranha || type=podoboo || (type=blooper && water) || type=spiny || type=spinyegg) hurtplayer("enemy")
    else if (type=cheepfly) {
        coll.phase=id
        playsfx("kidenemyhit")
        if (!wallkick) kicked=-coll.xsc             
        wallkick=16
        jump=1
        vsp=-4
        canstopjump=akey                                                                         
        } else {
            if (vsp<=0 || y>coll.y) hurtplayer("enemy")
            else {
                playsfx("kidstomp")
                vsp=-4-akey*2
                canstopjump=akey
                jump=1
                insted=0
            }
        }
        exit
    
}

#define hurt
pipe=0
sprongin=0
speed=0

onvine=0
energy=0
braking=0
sprung=0
diggity=0
grow=0
gk=0
fk=0
jumpbuffer=0
hyperspeed=0
hp=0
star=0
if (super) stopsuper()   

if (!shielded ||invincible() || hurt || flash || intangible() || (ohgoditslava && !shielded)) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0) else if !global.lemontest mus_play("reset",1)
   die()  
}else {
	jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0 playsfx(name+"shielddamage") } hsp=xsc*-2*wf vsp=-3*wf
}



//Block hitting
#define hitblocks
if typeblockhit=0{
with (blockcoll){
if (stonebump || owner.size=0 || owner.size==5  && insted!=1 && !owner.tempkill && cracked=0) {
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
}  else if typeblockhit=1{
	hititembox()
}

#define hitwall
if (abs(hyperspeed+hsp)>5) {x-=hsp+hyperspeed hurtplayer("crush")}
hsp=0
hyperspeed=0       


#define landing
insted=0
if hurt {flash=1 fk=0 hsp=0 hurt=0}

if (downpiped) {
    shoot(x-8,y+4,psmoke,-2,-1)
    shoot(x+8,y+4,psmoke,2,-1)
    downpiped=0
}

playsfx(name+"step")

//jump buffering
if (jumpbuffer) jumpbuffer=-1     

#define death
if (event="create"){
c=0
del=0
a=0
visible=0
sprite="dead"
frame=0
frspd=0.2
alpha=1


name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
if size==5 size=0
xsc=owner.xsc
ysc=owner.ysc
water=owner.water


} 
else if (event="step"){
for (i=0;i<=360;i+=10) if (!irandom(5)) repeat (4-3*(i>180)) {
    splat=skindat("kidsplat"+string(owner.p2)) || del
	owner.me=id
	with(owner){
    o=fire_projectile(me.x,me.y)}
	o=owner.o
	o.bloddrop=1
	o.bullet=0
	o.gib=0
	o.bow=0
    o.direction=i
    o.owner=owner
    o.del=del
    o.splat=splat
    o.a=a
	o.speed=random(7)
	o.gravity=random_range(0.1,0.3)
	o.u=choose(29,36)
	o.v=choose(101,108)
	o.b=irandom(3)
	o.image_xscale=3
	o.image_yscale=3
    if (water) {
        o.speed=random(2)
        o.gravity=0
        o.friction=0.01
        o.water=1
    }
}

if (!del) if (c<4) {
    with(owner)
	owner.me=id
    o=fire_projectile(me.x,me.y)
	o=owner.o
	o.gib=1
	o.bullet=0
	o.bow=0
	o.bloddrop=0
    o.type=c
    o.owner=owner
	o.speed=random_range(2,4)
	o.direction=random_range(45,135)
	o.gravity=0.4
	o.fade=0
	o.a=1
	o.image_xscale=3
	o.image_yscale=3
	o.bow=0
    if (water) {
        o.speed=random(3)
        o.gravity=0.1
        o.friction=0.01
    }
    
    with (o) {
        if (type=3) {
            w=16 h=16
            u=142 v=35
        } else {
            w=8 h=8
            u=113+9*type v=35
        }
    }
}

spriteswitch(1)

c+=1 if (c=20) instance_destroy()
} 
else if (event="draw"){
if (!del) spriteswitch(0)
}

#define enterpipe
push=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}

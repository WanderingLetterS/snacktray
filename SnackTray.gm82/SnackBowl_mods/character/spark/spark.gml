





did you know you can write here






#define description
Mod made by Christian32307, CyanideJam, DaOrangeBoi, Ethgaming101, Hakumuda, -S-, Scarf, and WildCard78

#define spritelist
stand,wait,wait2,lookup,pose,crouch,knock,dead,walk,run,brake,spring,jump,bonk,ball,spindash,spincharge,superspin,push,hang,fire,fireair,slam,dash,climbing,flagslide,outtaprep,outtafall,emeraldget,piping,pipingup,sidepiping,doorenter,doorexit

#define soundlist
release,skid,spin,spindash,superspindash,shockering,vshot,dash,imouttahere,powerdown

#define movelist
Spark
#
[a]+[dir]->[a]: Shock Dash (air)
[b]: Volt Shot
[c]: Light Speed Dash
#
Collect the Chaos Emeralds 
to access new abilities!

#define rosterorder
0

#define customhud
dontdrawdefaulthud=true
draw_snack_hud()

#define timeattack
//allow Spark's speed and spindash upgrade
oldemeralds=2
global.emeralds=2


#define match

name=global.charname[global.option[p2]]



//moddir+"character\"+global.charname[char]+"\"+"player.txt"
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



replacesheet(p2,name+"3",directory+name+"-ice.png",0,0,1)
replacesheet(p2,name+"6",directory+name+"-clover.png",0,0,1)
replacesheet(p2,name+"7",directory+name+"-feather.png",0,0,1)

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
dontdrawdefaulthud=true
mask_set(12,12)
overwritecam=0

					  //spark's techical channel
global.channel[1024]=0 //any index of the array can techically be used, up to 32000
					  //i wouldn't recommend going above 1500 (so an additional 501 charm controlled channels), because this stuff does take up memory

my_item="?mushroom"
oldemeralds=global.emeralds

//custom skin strings
maxouttahere=unreal(playerskindat(p2,name+" time until outta here"),9999)
maxwait2=unreal(playerskindat(p2,name+" time until wait2"),9999)				
spindustframes=unreal(playerskindat(p2,name+" spindash dust frames"),6)-1 //subtract 1 for Silly
spindustspeed=unreal(playerskindat(p2,name+" spindash dust speed"),1)

lightning_color_basic=deciphercolor(playerskindat(p2,name+" lightning color basic"))
lightning_color_big=deciphercolor(playerskindat(p2,name+" lightning color big"))
lightning_color_fire=deciphercolor(playerskindat(p2,name+" lightning color fire"))
lightning_color_ice=deciphercolor(playerskindat(p2,name+" lightning color ice"))
lightning_color_mini=deciphercolor(playerskindat(p2,name+" lightning color mini"))
lightning_color_super=deciphercolor(playerskindat(p2,name+" lightning color super"))

sheets[3]=skindat("tex_"+name+"3"+string(p2))
//Thunderflower acts as a super monitor and just uses the extra sheet, so no need for an extra sheet...
//Water flower is a powerdown because it dampens Spark's powers...
//So, from the Bouquet, we only have the Ice flower and Clover flower left.
//the Ice Flower is something Spark already uses by default.
//So... Fuck it, the Feather's back.
sheets[6]=skindat("tex_"+name+"6"+string(p2)) //Clover becomes size 6.
sheets[7]=skindat("tex_"+name+"7"+string(p2))  //And now feather is the new size 7... lmao

trail_x=ds_list_create()
trail_y=ds_list_create()
trail_steps=30 //might make changeable? idk

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
insta=0


#define itemget
if (type="jumprefresh") {
	insted=0
	mc=0
}

if (type="tflower") { //Super Monitor type beat
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		
		if (!super && !transform) { //kaboom
			///gosuper()
			var i,m;
			transform=1
			
			for (i=0;i<7;i+=1) m[i]=i
			for (i=6;i>0;i-=1) {
				j=irandom(i)
				t=m[i]
				m[i]=m[j]
				m[j]=t
			}

			//for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]} //Since we're using the power of the thnder flower, the emeralds aren't used.
			superpower=6000
			piped=1
			super=1
			fall=1
			hsp=0 vsp=0 
			boost=0
			upper=0
			insta=0
			set_sprite("transform")
			frame=0
			frspd=0
			size=4
		}	
	}   
}


if (type="mushroom") {
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("")
		if (skidding) {soundstop(name+"skid") skidding=0}
		
		if (size=0) grow=1
		oldsize=size
		size=max(size,1)
	
		itemget=1
	}   
}

//lmao
if (type="wflower") {
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		//playgrowsfx("")
		if (skidding) {soundstop(name+"skid") skidding=0}
		
		if (size=2) {grow=1 playsfx(name+"powerdown")}
		oldsize=size
		size=1 
		
		itemget=1
	}   
}

if ( type="cflower" ) { //Clover Flower
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("6") 
		if (skidding) {soundstop(name+"skid") skidding=0}		
		if (!super && size!=6) grow=1
		oldsize=size
		size=6
		itemget=1
	}                
}

if ( type="iflower" ) { //Be warned, this actually grants the feather.
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("7") 
		if (skidding) {soundstop(name+"skid") skidding=0}		
		if (!super && size!=7) grow=1
		oldsize=size
		size=7
		itemget=1
	}                
}

if ( type="bfeather" || type="extra") { //Be warned, this actually grants ice.
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
		coll=other.id
		if (p2!=other.p2) {
			itemc+=1
			doscore_p(1000,1)
		}
		playgrowsfx("3")
		if (skidding) {soundstop(name+"skid") skidding=0}		
		if (!super && size!=3) grow=1
		oldsize=size
		size=3
		itemget=1
	}                
}else 
com_item()

if (type="star") {
	if (!piped && !hurt && !(global.mplay>1 && flash)) {
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
	global.lifes+=1
	deaths=max(0,deaths-1)
	if (super) superpower=6000
	else energy=maxe
	itemget=1	
	
}
if (type="shield") {
    if (!piped && !hurt && !(global.mplay>1 && flash)) {
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
		 if (insta && insta<14 &&!star) hurtplayer("enemy")
        itemget=1
    }   
}
if (type="coin") {
		sound("itemcoin")
		if (other.fresh) global.scor[p2]+=100
		global.coins[p2]+=1
		coint+=1
		hit=1
		lightspeedtimer=0
	    itemget=1	
		
		///spawnmemory()
		if lightdashing with instance_create(x,y,memory) {
			imlightdasher=1
			owner=other.id
			
			sprite=other.sprite
			frame=other.frame
			size=other.size
			name=other.name
			p2=other.p2
			xsc=other.xsc
			ysc=other.ysc
			super=other.super
			dir=other.dir
			depth=other.depth+2
			sid=other.sid
			charm_init()
			
		}	
		
}

if (type="ring") {
		sound("itemcoin")
		if (other.fresh) global.scor[p2]+=100
		global.rings[p2]+=1
		coint+=1
		hit=1
		itemget=1
}

#define effectsbehind

/*
if trailing {
	ds_list_insert(trail_x,0,x)
	ds_list_insert(trail_y,0,y+4)
}


//remove old points
if ds_list_size(trail_x)>=trail_steps || !trailing {
	ds_list_delete(trail_x,ds_list_size(trail_x)-1)
	ds_list_delete(trail_y,ds_list_size(trail_y)-1)
}

	draw_set_blend_mode(bm_add)
	draw_primitive_begin(pr_trianglestrip)

		//list size
		l_size = ds_list_size(trail_x)
		
		//for loop turned repeat loop
		i=0
		repeat(l_size) {
			
			
			//right now
			x1=ds_list_find_value(trail_x,i)
			y1=ds_list_find_value(trail_y,i)
			
			//next position
			x2=ds_list_find_value(trail_x,min(i+1,l_size-1))
			y2=ds_list_find_value(trail_y,min(i+1,l_size-1))
			
			//line thickness (make changeable?)
			rr=8-((i/l_size)*8)
			
			//direction
			dd=point_direction(x1,y1,x2,y2)
			
			//opacity
			aa=1-((i/l_size))
			
			//color  (change from lightning color?)
			cc=ltng_color
			
			//draw first vertice
			draw_vertex_color(x1 + lengthdir_x(rr,dd+90), 
							  y1 + lengthdir_y(rr,dd+90), 
							  cc,aa)
			
			//draw second if not the first or last point
			if i!=0 || i!=l_size-1
			draw_vertex_color(x1 + lengthdir_x(rr,dd-90), 
							  y1 + lengthdir_y(rr,dd-90), 
							  cc,aa)
			i+=1
		}

draw_primitive_end()
draw_set_blend_mode(bm_normal)
*/

if em_messagego {
	rect(view_xview[view_current]-1,view_yview[0]-1,global.w+2,view_hview[0]+2,0,0.5) 
}

//defined by player.txt
if (size=0 || size==5) {lightning_color=lightning_color_basic}
else if (size=1) {lightning_color=lightning_color_big}
else if (size=2) {lightning_color=lightning_color_fire}
else if (size=3) {lightning_color=lightning_color_ice}
else if (size=4) {lightning_color=lightning_color_super}

//convert used hidden blocks into normal ones
with invisibox {if untouched=0 {instance_change(itembox,0)}}  
 
//Lightning effects that track things
//mostly visual aside from a few instances
//(compressed)
 
if !piped {
draw_set_color(lightning_color)
draw_set_blend_mode(bm_add) 
 
//see hidden blocks 
if (global.emeralds>=3) {ltng_near=instance_nearest(x,y,invisibox) if (!instance_exists(ltng_near)) {ltng_near=noone} x1=x y1=y x2=ltng_near.xstart+8 y2=ltng_near.ystart +8 ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }}

if ( (hsp*xsc>2.5 || hsp*xsc<-2.5 || vsp>2.5 || vsp<-2.5) || (boost) ) coolvfx=1 else coolvfx=0 //vfx
if (size && coolvfx && ceil(myrand(8))=2) {x1=x y1=y x2=myfxhelper.x y2=myfxhelper.y ltng_xmin=1 ltng_xmax=15 ltng_ymin=1 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2)  with myfxhelper {other.ltng_i=point_direction(other.x1,other.y1,other.x2,other.y2)} dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }

if (size && ceil(myrand(8))=2) {ltng_near=instance_nearest(myfxhelper.x,myfxhelper.y,enemy) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=max(x,floor(myrand(9))) ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=32 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }}



//i know what it looks like but every attempt i've made to split this into a script to run has returned with an immense amount of slowdown


ltng_near=instance_nearest(x,y,starman) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=128 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,lifemush) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=128 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,redcoin) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,itemring) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,redring) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,starshard) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,token) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,keyitem) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,keyitem) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,minusbowser) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,montyhole) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
ltng_near=instance_nearest(x,y,lakitu) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=86 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }



if (lightdashing) {ltng_near=instance_nearest(x,y,coin) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }}
if (hurt) {ltng_near=instance_nearest(x,y,enemy) if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=9 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }}
if (cpu_partner && cpu_return) {ltng_near=cpu_myleader if !instance_exists(ltng_near) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=lightning_color ltng_count=9 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=256 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }}

if ltng_near=-4 {ltng_near=noone}

draw_set_blend_mode(bm_normal)
draw_set_color($FFFFFF) 
}

#define effectsfront

if (charge>0) {ck=0 ccc+=charge/160 if (ccc>1) {ck=1 ckk=!ckk ccc=0}}

if (charge>0 && ck) draw_sprite_ext(spr_lightbulb,0,x-16,y-16,2,2,0,$ffffff,1)

//draw_skintext(floor(x)-string_length(string(hsp))*4,floor(y)-32,"light dash target:"+string(near))




//hidden block indicators
if (global.emeralds>=3) {
	if (!instance_exists(ind_near) || ind_near=-4 ) {ind_near=noone}
	ind_l=point_distance(x,y,ind_near.xstart+8,ind_near.ystart+8)  if (ind_l==0) break 
	ind_near=instance_nearest(x,y,invisibox)
	
	
	if (ind_l<=64 && ind_l>=0 && ind_near!=-4) {
		draw_set_blend_mode(bm_add)
		draw_sprite_part_ext(sheet,0,198+floor(global.bgscroll mod 16/4)*17,93,16,16,floor(ind_near.xstart)-16,floor(ind_near.ystart),1,1,$ffffff,1) //left
		draw_sprite_part_ext(sheet,0,198+floor(global.bgscroll mod 16/4)*17,93,16,16,floor(ind_near.xstart)+32,floor(ind_near.ystart),-1,1,$ffffff,1) //right
		draw_set_blend_mode(0)
	}
	
}


//emerald message hook
switch (global.emeralds) {
	case 0: em_str="Nothing." break;
	
	case 1: em_str="Coins now increase your ##max speed!" break;
	case 2: em_str="Your spindash ##is now stronger!" break;
	case 3: em_str="You can now find nearby ##hidden blocks!" break;
	case 4: em_str="Volt Shot now homes in## on enemies!" break;
	case 5: em_str="temp emerald 5" break;
	case 6: em_str="temp emerald 6" break;
	case 7: em_str=playerskinstr(p2,"name"+string(p2))+" can now go Super!## Press "+replacebuttonnames("[up]+"+"[c]")+" to transform!" break;
	
	default: em_str="weird emerald count" break;
}


if (em_messagego) {
	//depth+=1
	//rect(view_xview[view_current]-1,view_yview[0]-1,global.w+2,view_hview[0]+2,0,0.5) 
	//depth-=1

	move_lock=1
	flash=0
	visible=1
	hsp=0
	vsp=0
	frspd=0
	trailing=0
	boost=0
	//frame=global.emeralds-1
	
	em_timer+=1

	em_h=64 
	em_x=view_xview[view_current]+64 
	em_y=floor(player.y-64-16) 
	em_w=view_wview[view_current]-128 
	draw_set_color(0) 
	draw_rectangle(em_x,em_y,em_x+em_w,em_y+em_h,0) 
	draw_set_color($ffffff) 
	draw_rectangle(em_x,em_y,em_x+em_w,em_y+em_h-1,1) 
	global.halign=1
	draw_systext(em_x+em_w/2,em_y+8,"New ability unlocked!##-")
	draw_systext(em_x+em_w/2,em_y+em_h/2,em_str)
	global.halign=0
	
	//mini emerald
	//draw_sprite_part_ext(sheets[6],0,104,58,8,8,x-11,y-3,1,1,$ffffff,1)  
}

	if (em_timer>=360 || (em_timer>=60 && akey)) {
		em_done=1 
		em_messagego=0 
		em_timer=0 
		move_lock=0 
		flash=60 
		spec_funny=0
		spec_silly=0
		oldemeralds=global.emeralds
	}
	
//reapply palette
if usepalette scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)

if (spindash) { //spindust
	draw_sprite_part_ext(sheetshields,0,469+27*(floor(spindust)),188,26,20,round(x-27*xsc),round(y-5)+dy,xsc,1,$ffffff,alpha)

}
shader_reset()

#define grabflagpole

if super {
	///stopsuper()
	var i,m;
	super=0
	for (i=0;i<7;i+=1) m[i]=i
	for (i=6;i>0;i-=1) {
		j=irandom(i)
		t=m[i]
		m[i]=m[j]
		m[j]=t
	}
	cantsuper=30
	//stagemusic(id,p2)
	throwsparks(x,y)
	for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]}
		playsfx(name+"release")
		//global.coins[p2]+=floor(superpower/60)
		piped=1
		alarm[5]=30
	fly=0
	fall=1
	size=1
}

grabflagpole=1 
hsp=0
vsp=0
trailing=0
boost=0

#define endofstage

if hsp<0.5 right=1
if hsp>=0.5 akey=1

if (vsp<-0.2 && !finishdone) {
	throwsparks(x+hsp,y+vsp)
		vspeed-=14
		hspeed=hsp
		piped=1
		used=1
		trailing=1
		playsfx(name+"release")
		finishdone=1
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
	

	coll=instance_place(x,y,enemy)
	if (coll) {                    
		global.coll=owner.id
		if coll.object_index=lavabubble{
		coll.vsp=2
		} else 
		enemyexplode(coll,2)
		owner.vsp=-owner.vsp
	}

	coll=instance_place(x,y,player)
	if (coll) {
		if (coll.id!=owner) if (!invincible(coll)) {    
			if (!flag.passed[owner.p2] && !flag.passed[coll.p2] && !coll.flash && !coll.piped) { coll.hittype=hittype
				with (coll) hurtplayer(hittype)
			}
			instance_create(x,y,kickpart)
		}
	}
} else {y=-1000}




#define projectile

//defined by player.txt
if (owner.size=0) {lightning_color=lightning_color_basic}
else if (owner.size=1) {lightning_color=lightning_color_big}
else if (owner.size=2) {lightning_color=lightning_color_fire}
else if (owner.size=3) {lightning_color=lightning_color_ice}
else if (owner.size=4) {lightning_color=lightning_color_super}


if (event="create"){
	type=owner.proj_type
	visible=1
	frame_sub=0
	frame=0
	event=type+"_create"
}
if (event="step"){

	event=type+"_step"
}
if (event="draw"){
	event=type+"_draw"
	
}


if (event="Vshot_create") {
	image_xscale=8
	image_yscale=4

	frame_sub=0
	frame=0
	brickc=0
	seqcount=2

	timer0=3
	timer1=128
	visible=1
} 

if (event="SpindashBoom_create") {
	ignoreoncount=1
	alpha=1
}

if (event="Vshot_step") {

	if (!sfxdone ) {
		hspeed=xsc*0.1+owner.hsp*(xsc=sign(owner.hsp))
		//speed=median(2,speed,5)
		playsfx("sparkvshot")
		sfxdone=1
	}

 
	near=instance_nearest(x,y,enemy)
	dir=point_direction(x,y,near.x, near.bbox_top)
	dist=point_distance(x,y,near.x,near.bbox_top)

	if global.bgscroll mod 12 = 1 {with owner { proj_type="Particle" i=fire_projectile(other.x,other.y) i.hspeed=-other.hspeed/8 i.vspeed=random_range(-0.5,0.5) i.particle=1 i.frame=choose(0,1,2,3)}}

	owner.closestvshot=id

	if ((dist<=64 && dist>=0) && global.emeralds>3) {
		hspeed+=lengthdir_x(1,dir) hspeed=min(hspeed,3)
		vspeed+=lengthdir_y(1,dir) vspeed=min(vspeed,3)
	} else {hspeed=hspeed+0.1*xsc}

	timer0-=1 if (timer0=0) visible=1
	timer1-=1 if (timer1=0) instance_destroy()
	calcmoving()

	frame_sub=!frame_sub
	if frame_sub frame+=1
	if (frame>=3) frame=0

	if (!inview()) instance_destroy()
	xsc=sign(hspeed)

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
		if (coll.object_index!=beetle) {
			yes=1
			if (coll.object_index=shell) if (coll.type="beetle") yes=0
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
			if (coll.name="mecha" && coll.lookup && coll.xsc=sign(hspeed)) {instance_create(x,y,kickpart) instance_destroy() exit}
			event_inherited()
			}
			instance_create(x,y,kickpart) instance_destroy()
		}
	}


} else if (event="Trail_step")  {
	ignoreoncount=1
	image_xscale=2
	image_yscale=2
	hspeed=0
	vspeed=0
	gravity=0
	depth=3
	framesub+=1
	if framesub>4 if frame!=3 {frame+=1 framesub=0} else instance_destroy()
} else if (event="Particle_step")  {
	ignoreoncount=1
	image_xscale=1
	image_yscale=1
	gravity=0
	depth=3
	framesub+=1
	timer+=1
	
	frame=wrap_val(frame,0,3)
	if framesub>3 if timer<60 {frame+=1 framesub=0} else instance_destroy()
	
	
} else if (event="SpindashBoom_step")  {
	ignoreoncount=1
	image_xscale=2
	image_yscale=2
	hspeed=0
	vspeed=0
	gravity=0
	depth=3
	framesub+=2
	if framesub>4 if frame!=3 {frame+=1 framesub=0} else instance_destroy()
}


if (event="Trail_draw") {
	draw_set_blend_mode(bm_add)
	off_x=0
	if owner.size==2 off_x=360
	if owner.size==3 off_x=492
	
	draw_sprite_part_ext(owner.sheetshields,0,off_x+209+floor(frame)*33,42,32,32,floor(x)-16,floor(y)-12,1,1,$ffffff,1) 
	//draw_sprite_part_ext(sheet,0,225+floor(frame)*33,8,32,32,floor(x)-16,floor(y)-12,1,1,merge_color(owner.lightning_color,$ffffff,0.4),1)  
	draw_set_blend_mode(0)
}else if (event="Particle_draw") {
	draw_set_blend_mode(bm_add)
	off_x=0
	if owner.size==2 off_x=360
	if owner.size==3 off_x=492
	
	if frame=4 frame=0 /*DUDE*/ draw_sprite_part_ext(owner.sheetshields,0,off_x+277+floor(frame)*7,160,6,6,floor(x),floor(y),1,1,$ffffff,1) 
	//draw_sprite_part_ext(sheet,0,225+floor(frame)*33,8,32,32,floor(x)-16,floor(y)-12,1,1,merge_color(owner.lightning_color,$ffffff,0.4),1)  
	draw_set_blend_mode(0)
} else if (event="SpindashBoom_draw") {
	draw_set_blend_mode(bm_add)
	off_x=0
	if owner.size==2 off_x=360
	if owner.size==3 off_x=492
	if owner.usepalette scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[owner.p2*100],global.pal_1[owner.p2]+1,global.pal_2[owner.p2]+1,global.pal_3[owner.p2]+1,global.pal_4[owner.p2]+1,owner.size,alpha,owner.totpal+1)
	draw_sprite_part_ext(owner.sheetshields,0,off_x+209+floor(frame)*31,113,30,46,floor(x)-16*xsc,floor(y)-12,xsc,1,$FFFFFF,1)
	shader_reset()
	draw_set_blend_mode(0)
} else if (event="Vshot_draw") {
	off_x=0
	if owner.size==2 off_x=360
	if owner.size==3 off_x=492
	
	
	
	draw_sprite_part_ext(owner.sheetshields,0,off_x+209+25*frame,75,24,16,round(x-12*xsc),round(y-8),xsc,1,$ffffff,1)
	
	
	
		
	if (global.emeralds>=4) {
	
	
		ltng_near=instance_nearest(x,y,enemy)
		if !instance_exists(ltng_near) {ltng_near=noone}
	
		//Lightning Effects 
		//the code is duplicated in other places because this isn't really a script i can call	
		
		x1=x	
		y1=y

		x2=ltng_near.x
		y2=ltng_near.y

		ltng_xmin=5
		ltng_xmax=15
		ltng_ymin=3
		ltng_ymax=20
		ltng_color=owner.lightning_color
		ltng_count=3

		draw_set_blend_mode(bm_add)
		draw_set_color(ltng_color)

		// find distance between points (used for loop)
		ltng_l=point_distance(x1,y1,x2,y2)
		if (ltng_l==0) break

		//range
		if (ltng_l<=64 && ltng_l>=0) {

		// main direction
		ltng_i=point_direction(x1,y1,x2,y2)
		dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i)

		// side direction
		ltng_i+=90
		sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i)

		// first point coordinates
		px = x1; py = y1
		c = 0
		ltng_i = random_range(ltng_xmin, ltng_xmax)
		alpha = draw_get_alpha()
		repeat (5000) { // edit for line segment limit
			ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin)
				* lengthdir_y(random(1), ltng_i / ltng_l * 180)) // middle width
				// current point coordinates
			if (ltng_i < ltng_l) {
				cx = x1 + dx * ltng_i + sx * ltng_r
				cy = y1 + dy * ltng_i + sy * ltng_r
			} else { cx = x2; cy = y2 } // end point
			draw_set_alpha(alpha * 0.3)
			draw_line_width(px, py, cx, cy, 3.7)
			draw_set_alpha(alpha * 0.7)
			draw_line_width(px, py, cx, cy, 1.3)
			// death
			if (ltng_i >= ltng_l) break
			// update previous position
			px = cx; py = cy
			
			c += 1 //counter
			ltng_i += random_range(ltng_xmin, ltng_xmax)
		}
		draw_set_alpha(alpha)


		}
		draw_set_color($FFFFFF) 
		draw_set_blend_mode(0)
		}
		
		draw_set_blend_mode(bm_add)
		draw_set_color(ltng_color)
		
		ltng_near=instance_nearest(x,y,player) if (!instance_exists(ltng_near) || ltng_near!=owner) {ltng_near=noone} x1=x y1=y x2=ltng_near.x y2=ltng_near.y ltng_xmin=5 ltng_xmax=15 ltng_ymin=3 ltng_ymax=20 ltng_color=owner.lightning_color ltng_count=3 ltng_l=point_distance(x1,y1,x2,y2) if (ltng_l==0) break if (ltng_l<=64 && ltng_l>=0 && ltng_near!=-4) { ltng_i=point_direction(x1,y1,x2,y2) dx=lengthdir_x(1,ltng_i); dy=lengthdir_y(1,ltng_i) ltng_i+=90 sx=lengthdir_x(1,ltng_i); sy=lengthdir_y(1,ltng_i) px = x1; py = y1 c = 0 ltng_i = random_range(ltng_xmin, ltng_xmax) alpha = draw_get_alpha() repeat (5000) { ltng_r = choose(-1, +1) * (ltng_ymin + (ltng_ymax - ltng_ymin) * lengthdir_y(random(1), ltng_i / ltng_l * 180)) if (ltng_i < ltng_l) { cx = x1 + dx * ltng_i + sx * ltng_r cy = y1 + dy * ltng_i + sy * ltng_r } else { cx = x2; cy = y2 } draw_set_alpha(alpha * 0.3) draw_line_width(px, py, cx, cy, 3.7) draw_set_alpha(alpha * 0.7) draw_line_width(px, py, cx, cy, 1.3) if (ltng_i >= ltng_l) break px = cx; py = cy c += 1 ltng_i += random_range(ltng_xmin, ltng_xmax) } draw_set_alpha(alpha) }
		
		draw_set_color($FFFFFF) 
		draw_set_blend_mode(0)
		
			//reapply palette
		//if owner.usepalette scr_applyPaletteSegmented(global.shaderPaletteSwap,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size)
			//Why do we do that? Removing this just in case this might cause weird issues with the dust later.
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
//if (icedblocked) {sprite="knock"} //temp
if (em_messagego) {
	if (global.emeralds>0 && global.emeralds<8) {
		sprite="emeraldget"
		frame=global.emeralds-2
		} else {sprite="pose"}
	}
else if (outtajumped && outtadoneprepanim) {sprite="outtafall"}
else if (outtajumping && !outtajumped && !outtadoneprepanim) {sprite="outtaprep"}
else if (transform) {sprite="transform"}
else if (grabflagpole) {sprite="flagslide"}
else if (hurt) {sprite="knock"}

else if (spindash) {if (spinchargetimer) {sprite="spincharge"} else sprite="spindash"}
else if (crouch) {sprite="crouch"}
else if (lightdashing || fall=10) sprite="dash"
else if (jump) {
	if (onvine) 
{
sprite="climbing" frspd=sign(left+right+up+down)
}	
	//else if (shockerable) sprite="shockdash"
    else if (sprung) {sprite="spring" if (vsp>=0) {sprung=0 fall=1 fallspr="walk"}}
    else if (bonk) sprite="bonk"
	else if (slam) sprite="slam"
    else {if (fall) {sprite=fallspr if (fall=6) {sprite="knock"}} else if (fired) sprite="fireair" else sprite="jump" frspd=fallspd}
} else {										//divided by wf to be unaffected by water
    if (spin) {if superspintimer && !fall {sprite="superspin" frspd=frspd/wf} else {sprite="ball" frspd=0.5+abs(hsp/3)}}
    else if (fired) {sprite="fire"}
    else if (push!=0) {sprite="push" frspd=1+abs(hsp/3)}
    else if (hsp=0) {
        if (hang) {sprite="hang"}
        else if (pose) sprite="pose"
        else if (lookup) {sprite="lookup"}
		else if (waittime2>maxwait2) {sprite="wait2"}
        else if (waittime>maxwait) {sprite="wait"}
		
        else {sprite="stand"}
    } else {
        if (braking) sprite="brake"
        else if (abs(hsp)>maxspd*0.9 && !water && !finish) {sprite="run" frspd=abs(hsp/3)}
        else {sprite="walk" frspd=0.2+abs(hsp/4)}
    }
}

#define controls
if !end_done com_inputstack()

tempbrick=0

//situations in which it should skip controls entirely
if (hurt || piped || move_lock) {
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
if (spindash || (crouch && !jump) || vinegrab || grabflagpole || iamcurrentlyleavingthisfacility) h=0

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
        if (!jump && !spin && !crouch) {
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

if !skidding playsfx(name+"skid")  skidding=1
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
                if (!firedash) xsc=h
else collwin=instance_place(x+hsp,0,goalblock)
if collwin {hsp=0 fallsprite="dash" collwin.owner=id with collwin{ event_user(4)}}
            }
        }
    }
}

if (push!=h) push=0

com_di()

//code for specifically the a button
if ((abut || jumpbufferdo) && (!springin)) {
    if (!jump||fall=69||grabflagpole) { //jump
        if (hsp==0 && crouch && push==0 && (size && size!=5) &&!fall!=69) {
		if (spindash) {
				if !spinchargetimer spinchargetimer=20
				frame=0
				//spindust=0
			}
            playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
            spindash=min(4,spindash+1)
            tempbrick=1
        } else {
            jumpsnd=playsfx(name+"jump")
			onvine=0
            vsp=-5.2-0.2*super
			grabflagpole=0
			latchedtoflagpole=0
			
            if (water) vsp=-sqrt(sqr(vsp)*wf+2)

            //change jump angle in steep slopes
            vd=point_direction(0,0,hsp,vsp)+point_direction(0,0,1,slobal/1.5)
            vm=point_distance(0,0,hsp,vsp)
            hsp=lengthdir_x(vm,vd)
            vsp=lengthdir_y(vm,vd)

            jump=1
            fall=0
            braking=0
            spin=0
            canstopjump=1
            if (mymoving) hsp+=avgmovingh
            crouch=0
            if (spin && !star) seqcount=0
            fallspd=min(1,0.5+abs(hsp)/5)
        }
    } else { //air jumps

//W.I.P.
       
     if (!insted && fall=0 && shockerable!=40 && !down)  {
                shockerable=1
                insted=1
				slam=0
                throwsparks(x,y)
                playsfx(name+"shockering")

            } //else playsfx(name+"release")
			
			
	 if	(down && fall=0 && !shockerable && !used) {
	    throwsparks(x+hsp,y+vsp)
		vsp+=7
		used=1
		slam=1
		trailing=1
		playsfx(name+"release")
        }

        jumpbuffer=4*!jumpbufferdo
		}
		
		if (shockerable>10) {
		 if (right!=left) {
            //hsp=max(3-(up || down),abs(median(-4,hsp+(right-left)*(3-(up || down)),4)))*(right-left)
			hsp=lengthdir_x(25,point_direction(0,0,right-left,down-up))
            if (up) vsp=median(-2,vsp-3,-6)
            else if (down) vsp=max(2,vsp+2)
            else vsp=vsp/2-1
        } else {
            if (down) vsp=max(3,vsp+3)
            else vsp=median(-4,vsp-4,-5)
            //hsp=max(3,hsp)*xsc
			
        }
		shockerable=0
		used=1
		boost=1
		sprite_angle=0
		
		soundstop(name+"shockering")
		playsfx(name+"dash")
		
        throwsparks(x,y) //effect
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

//shock dash physics code
if (shockerable) {
   if (!jump){shockerable=0}
   else {shockerable=min(40,shockerable+1)}

   if (shockerable>0) {
                //boost=1
                braking=0
                sprung=0
				d=point_direction(0,0,right-left,down-up)
				if (!right && !left && !down && !up){shockfreeze=1} //shockfreeze means moving without di here
				else {shockfreeze=0}
				if (!shockfreeze) {
                hsp+=lengthdir_x(1,d)
                vsp+=lengthdir_y(0.8,d)
                if up vsp=median(-3.2,vsp,2)
				if down vsp=median(-2,vsp,4)
				}
                trailing=1
				dir=point_direction(x,y,xp,yp)-(180*(xsc=1))
				//sprite_angle=dir
           }

   if (shockerable=0 || shockerable=40) {
               soundstop(name+"shockering")
			   if shockerable=40 sprite_angle=0
               shockerable=0
			   shockfreeze=0
			   trailing=0
              // boost=0
}

}

//code for specifically the b button
if (bbut) {
    if (spindash || (hsp=0 && crouch && push=0 && (size && size!=5))) {
			if (spindash) {
				if !spinchargetimer spinchargetimer=20
				frame=0
				//spindust=0
			}
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    } else {
        /*if (size && !count_projectiles() && !crouch && !spin) {
		    vshot=fire_projectile(x+8*xsc,y+2) 
			vshot.Proj_one=1
            fired=16
			}*/
        }

    }

if (bkey) {

	if (!count_projectiles() && !crouch && !spin && !shockerable) {
		if (size && size<2 && bbut && !fired) {
				proj_type="Vshot"
				vshot=fire_projectile(x+8*xsc,y+2) 
				vshot.Proj_one=1
				fired=16
		}
				if size>1 && size!=5 {
				if (fired=0) {
				   charge=min(120,charge+1)
				   if (charge=10) {/*sound 1*/}
				   if (charge=119) {/*sound stop 1*/ /*sound 2*/}
			   }
		}
	}
} else {
	if (charge>0) {
			/*sound stop 1*/
			if (charge<119) {/*sound 2*/ fired=20  proj_type="Vshot" vshot=fire_projectile(x+8*xsc,y+2) vshot.Proj_one=1}
			else {/*sound stop3*/ /*firesound*/ fired=60 /*with (instance_create(x+xsc*8,y,sonicfire)) {sprite_index=spr_firesonicfire image_speed=0.2 hspeed=5*other.xsc image_xscale=-other.xsc owner=other.id other.myfire=id}*/}
			charge=0
		}
}


if (cbut) {
    if (spindash || (crouch && down && (size && size!=5))) {
			if (spindash) {
				if !spinchargetimer spinchargetimer=20
				frame=0
				//spindust=0
			}
        playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
        spindash=min(4,spindash+1)
        tempbrick=1
    }
	else { 
			if (global.emeralds>=7 && up && jump && (size && size!=5))	{
				if (!super && !transform) {
					///gosuper()
					var i,m;
					transform=1
					
					for (i=0;i<7;i+=1) m[i]=i
					for (i=6;i>0;i-=1) {
						j=irandom(i)
						t=m[i]
						m[i]=m[j]
						m[j]=t
					}

					for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]}
					superpower=6000
					piped=1
					super=1
					fall=1
					hsp=0 vsp=0 
					boost=0
					upper=0
					insta=0
					set_sprite("transform")
					frame=0
					frspd=0
					size=4
				} else {
					///stopsuper()
					var i,m;
					super=0
					for (i=0;i<7;i+=1) m[i]=i
					for (i=6;i>0;i-=1) {
						j=irandom(i)
						t=m[i]
						m[i]=m[j]
						m[j]=t
					}
					cantsuper=30
					//stagemusic(id,p2)
					throwsparks(x,y)
					for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]}
						playsfx(name+"release")
						//global.coins[p2]+=floor(superpower/60)
						piped=1
						alarm[5]=30
					fly=0
					fall=1
					size=1
				}
			}
		
		//ends lightdashing if nothing is found
		if lightspeedtimer <=10 {
			if (instance_exists(coin) && dist <=32 && dist >=0) {
				lightdashing=1
			} else {              //you are not dashing
				lightdashing=0
			}
		}
		
		
		//sends a signal to spark's techincal channel
		//if ()
	}


		
		
	
}


if (ckey) {
	
	
	
	}

spinchargetimer=(max(0,spinchargetimer-1))

if (spindash) {
	spindust+=0.5*spindustspeed
	spindust=wrap_val(spindust,0,spindustframes)
} else spindust=0

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
        if (collision(0,-16) && size) spin=1
        crouch=0
    }
    mask_reset()
}
if (!grabflagpole && (spin || spindash || crouch || size=0 || fall=5 || lightdashing)) mask_set(12,12)
else if (jump && !grabflagpole && (!fall || fly || fall=10)) mask_set(12,15)
else mask_set(12,24)


#define movement

if (trailing) {proj_type="Trail" i=fire_projectile(x,y) i.trail=1}
if (piped || (size<2 || size=5) || !bkey) charge=0

if (piped || outtajumped) exit


//speed limits
if (!jump) if (loose || spin || crouch) {
    braking=0
    frick=0.06
    if (spin) frick=0.005
    hsp=max(0,abs(hsp)-frick)*sign(hsp)
}

//speed cap rubberband formula		        						//yikes
maxspd=(3.4 + !!size*0.2 + spin*2 + boost*0.8 + 0.0125*min(coint,100)*(global.emeralds>0))*wf

if (abs(hsp)>maxspd+0.01) hsp=(abs(hsp)*2+maxspd)/3*sign(hsp)

vsp=min(7+downpiped,vsp)

//movement
calcmoving()

//dont uncomment the yground or easyground stuff because its required for the cool new slope system to work  - moster  	

if (!dead && !grabflagpole) {
	if fall!=69
		player_horstep()
		player_nslopforce()
    //yground=easyground()
	//if (yground!=verybignumber) yground-=14
    if (jump) {
        //gravity
        hang=0
        if fall!=69 || !shockerable {
           vsp+=0.15*wf-(size=5 && vsp>-0.35 && !water)*0.075
        }
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
}

if (!shockerable && !lightdashing) sprite_angle=0

if (osld<180 && osld>0 && !instance_place(x-16,y+4,ground)) dy=3
else if (osld>180 && osld<320 && !instance_place(x-16,y+4,ground)) dy=3

    if (!jump) {
		//if (yground!=verybignumber) {y=yground while collision(0,0) && !collision(0,-8) {y-=1 }}
		osld=sld
		sld=point_direction(0,0,1,slobal)
		if (!jump && abs(hsp)>=maxspd+1 && spin) {
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
				//if (spin || spindash) fall=5
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

com_finishmove()

#define actions

//funny


/****************************************************/ 																																																																																						if (finish && retainer.princess) {  //trust
/****************************************************/ 																																																																																							if !end_go {end_silly=egg(100) end_go=1}
/*****+++============+++++++=======++++**+++=++++****/ 																																																																																							if end_go && end_silly{ if sprite!="stand" && !end_done retainer.hide-=1
/****++==-------------=====---------=++*++==--=++****/ 																																																																																								if (retainer.princess=1 && !end_funny && sprite="stand") {end_funny=90}
/****++=-::::::::::::-------:::::::--==++=--:--==+++*/ 																																																																																								if end_funny end_funny-=1
/****+++==---::::-----------::::::::---=---:::---===*/ 																																																																																								if (end_funny<=0 && !end_done && sprite="stand") {
/*******+++=--::---=====----::::::::::::::::::::::::*/ 																																																																																									knockplayer() 
/*********++=-:---=======--:::::::::::::::::::::----*/ 																																																																																									piped=0 
/*********++==--=========--::........:::::...::-====*/ 																																																																																									oldsize=size 
/*****++++++============--:. .::-=--::.::--==+++****/  																																																																																									move_lock=1 
/*****+++++==============--:. :-=*#*+=:.:-=*###******/ 																																																																																									end_done=1
/*++++++=================--:. :=*#@%*=- :=*#@@%##****/ 																																																																																									playerskinstr(p2,"savetext1"+ss,"What?") playerskinstr(p2,"savetext2"+ss,"")
/*=====---------------===--:. :=*#@%*=- :=*#@@%##****/ 																																																																																									playerskinstr(p2,"savetext3"+ss,"Where are you going?") playerskinstr(p2,"savetext4"+ss,"")
/*-----:::::::::::::---==--:. :=*#@%*=- :=*#@@%##****/ 																																																																																									playerskinstr(p2,"savetext5"+ss,"") playerskinstr(p2,"savetext6"+ss,"")
/*****++++==--:::::::::::::::......::--------=+*#%%%*/ 																																																																																								}
/*--------:::::::::::---=--:. :-+*%#+=-.:=+#%%%#####*/ 																																																																																								if end_done {
/*=========--::::::::::--:::. .:--===--:-==+**###%%%*/ 																																																																																									retainer.frame=0
/*********+==-::::::::::::... ......::----===+*#%@@@*/ 																																																																																									posed=0 pose=0
/****++==---:::::::::::----------------------==+++++*/ 																																																																																									if sprite="pose" sprite="stand"
/****+==-:::::::::::----====-------------===========*/ 																																																																																									if !jump && !flash && !activateouttahere && !outtajumping && retainer.hide>=114 {activateouttahere=1}
/****+++============+++++++==-----------==+++++++===*/ 																																																																																									if y>view_yview[0]+224+32 {hspeed=0 speed=0 gravity=0 vspeed=0 x=xprevious y=yprevious}
/******+++++++++***######**+=-----------=++*##***+++*/ 																																																																																									}
/****************###%%%%%#**+===========++*#####*****/ 																																																																																							}
/******************####%%###****************##*******/ 																																																																																						}
/********************###%%%%%%%%%%%%%%%%###**********/ 																																																																																						
/********************###%%%%%%%%%%%%%%%%###**********/																																																																										


//have a chance to pull up the emerald message no matter what, if the amount of emeralds is 0
if (instance_exists(bollgate) && global.emeralds=0 && !spec_funny) {
	spec_funny=1
	spec_silly=egg(10)
}
if spec_silly && !piped && !em_messagego {em_messagego=1}

if (!cpu_partner || global.gamemode!="timeattack"){
	if oldemeralds!=global.emeralds && !em_done && !piped {em_messagego=1}
	if oldemeralds=global.emeralds em_done=0
	oldemeralds=global.emeralds
}

if (activateouttahere=1) {
	overwritecam=1
	playsfx(name+"imouttahere")
	outtatimer=120 //delay from saying phrase to actually jumping
	iamcurrentlyleavingthisfacility=1
	outtajumping=1
	activateouttahere=0
	set_sprite("outtaprep")
	}

if (outtatimer=0 && iamcurrentlyleavingthisfacility) {
		if (!outtajumped) {
				jumpsnd=playsfx(name+"jump")
				
				vspeed=-4.2 //vspeed=-12.2
				hspeed=1.1*xsc
				gravity=0.12
		
				if (water) vsp=-sqrt(sqr(vsp)*wf+2)

				grabflagpole=0
				latched=0
				//change jump angle in steep slopes
				vd=point_direction(0,0,hspeed,vspeed)+point_direction(0,0,1,slobal/2)
				vm=point_distance(0,0,hspeed,vspeed)
				hspeed=lengthdir_x(vm,vd)
				vspeed=lengthdir_y(vm,vd)

				sprite_angle=0
				jump=1
				fall=0
				braking=0
				spin=0
				if (mymoving) hsp+=avgmovingh
				crouch=0
				if (spin && !star) seqcount=0
				//fallspd=min(1,0.5+abs(hsp)/5)
				
				outtajumped=1
				outtadoneprepanim=1
				set_sprite("outtafall")
				move_lock=1
			}
		}

if (outtatimer>=1) {outtatimer-=1}

if (outtadoneprepanim){
if (!outtadone) {outtadeathtimer=100 outtadone=1}
outtadeathtimer-=1

if (outtadeathtimer<=0 && shouldfinish) {y-=verybignumber shouldfinish=0}

if (outtadeathtimer<=0 && !dead &&!outtadone2 && !shouldfinish) {
//idk
outtadone2=1

}

}

//manage light speed afterimages
with memory if imlightdasher && owner=other.id {
	timer+=1
	if timer>=30 instance_destroy()
}

com_warping()
com_actions()

weight=0.4+0.4*!!size
bartype=0

//boost conditions
if (star || super) {
boost=1
}

boosting=boost //i wanna use MY variable

//semi-accurate 1.9 style boost trail
//good enough i'd say
if (boosting) {
        if (hurt) {boosting=0 energy=0}
        if global.bgscroll mod 3 = 1 with (instance_create(x,y,afterimage)) {
            event_user(0)
			k=8-(frame8*8) mod 8 
			thisoneismine=1
        }    
    }
with (afterimage) {if owner=other.id {visible=!k} if !thisoneismine instance_destroy()}

//for the random electric fx
//doesn't run on create so that it can be respawned
if (!instance_exists(myfxhelper) || myfxhelper=0 ||myfxhelper=noone) {
	myfxhelper=instance_create(x,y,compiler_dummy)
	
	myfxhelper.owner=id
	myfxhelper.visible=0
	myfxhelper.sprite_index=spr_lightbulb
	myfxhelper.image_index=0
	myfxhelper.image_speed=0
	}


//FX helper that creates the other point of the electricity behind him

with (myfxhelper) {
	if global.debug {visible=1}
	x=min(x,owner.x+32) x=max(x,owner.x-32) 
	y=min(y,owner.y+8) y=max(y,owner.y-8) 
	x+=floor(myrand(myrand(8))) x-=floor(myrand(myrand(8)))  
	y+=floor(myrand(myrand(4))) y-=floor(myrand(myrand(4)))  
}

// VULNERABILITY AND PLAYER COLLISION

//Intangibility
is_intangible=0
with (flag) if (passed[other.p2]) other.is_intangible=1
if (transform || finish || piped=1 || activateouttahere) is_intangible=1

//Power levels
power_lv=0
is_coinexplosive=0
if (spindash || spin || (jump && (!fall || fall=5))) power_lv=1
if (lightdashing) power_lv=3
if (firedash || shockerable) power_lv=4
if (star || insta) power_lv=5
if (super) power_lv+=1
if (firedash) is_coinexplosive=1

//break_crackedground=(shockerable || spindash || (spin && size && abs(hsp)>3))


//Special interactions
pvp_spin=spin //rolling clash
//pvp_avoid=1 //I don't like social interactions
pvp_stomper=0 //make sure to set for 0 for the mario bros when pounding
pvp_ignore=instashieldin //For when you wanna hit the others but not yourself
pvp_knockaway=0 //I won't hurt you, just go away


//based on the item draw-on from giana
with monitor {
	if string(instance_nearest(x,y,player).name)="spark" && (contents="feather" || contents="ice")
		{
			if sparkdrawon=0 {
				
			}
			sparkdrawon=1
			is_beingdrawnonbycharm=1
			
		
		} else {if sparkdrawon {} sparkdrawon=0 is_beingdrawnonbycharm=0}
}

with monamie {
	if string(instance_nearest(x,y,player).name)="spark" && (contents="feather" || contents="ice")&& owner=other.id
		{
			if sparkdrawon=0 {
				
			}
			sparkdrawon=1
			is_beingdrawnonbycharm=1
			
		
		} else {if sparkdrawon {} sparkdrawon=0 is_beingdrawnonbycharm=0}
	}

//character interactions
//todo

dir=0

near=instance_nearest(x,y,coin)         //find coins and calculate distance
dist=point_distance(player.x,player.y,near.x,near.y)

if (lightdashing) {
lightspeedtimer+=1
  if (dist <=32 && dist >=0 && near!=-4) {                        //get dashing
      lightspeedcriteria=1
      boost=1  
	  trailing=1
	  jump=1
	  fall=10
	  
	  
	  hsp=0
	  vsp=0
	  dir=point_direction(x,y,near.x, near.y) 
	  xdist=lengthdir_x(2,dir)
      ydist=lengthdir_y(1.5,dir)
	  xsc=sign(xdist)
	  x+=lengthdir_x(2,dir)*5*wf
      y+=lengthdir_y(1.5,dir)*4*wf
	
	//sprite_angle=dir+(180*(xsc=1))
	
	/*   //experimental
	if sign(xdist)!=0 xsc=sign(xdist)
	  x+=lengthdir_x(2,dir)*4 hsp=lengthdir_x(2,dir)*4
      y+=lengthdir_y(1.5,dir)*3 vsp=0
	  */
	  
	 //vsp=5*sign(ydist)
	  //hsp=7*xsc
	  //hsp+=lengthdir_x(2,dir)     //old method that made weird curved motions
      //vsp+=lengthdir_y(1.5,dir)
	  

}
hsp=(x-xprevious)
vsp=(y-yprevious)


if (instance_place(x,y+4,phaser) || instance_place(x,y+4,collider)) y=y-4 //(hopefully) fix clipping 
}


if (lightspeedtimer) {
if (lightspeedtimer>=16) {lightdashing=0 lightspeedtimer=0 trailing=0}
}

//sprite_angle=approach_val(sprite_angle,0,1)

//whoputshitinyourpip
if (piped) exit


if (star && jump) {trailing=1}
if (slam && vsp<0)

if (super && size!=4) {size=4}
if (size=4 && !super) {size=1}

//waiting animation
if maxwait{
if (sprite="stand")
{waittime+=1}
else if sprite!="wait" waittime=0 
}

if maxwait2{
if (sprite="wait")
{waittime2+=1}
else if sprite!="wait2" waittime2=0 
}

if (sprite="wait2") {outtatime+=1} else {outtatime=0}

if outtatime>maxouttahere {aftermaxouttahere=1}

if aftermaxouttahere {
	if (sprite="wait2" && !activateouttahere) {
	activateouttahere=1 waittime=0 sprite="stand"}
	else if (sprite!="wait2") aftermaxouttahere=0
}

//Item replacement.
with item { if alarm[0]=-1 if  object_index=feather || (global.IceFlowerLoaded && object_index==global.iflower_object)
if global.mplay<=1 || string(instance_nearest(x,y,player).name)="spark"
	{
		if sparkdrawon=0 {
			instance_create(x,y,smoke)

		}
		if fall && !drop {
			drop=1 
			vspeed=0 
		}
		
		hspeed=0;
		hsp=0;
		vsp=0;
		visible=0
		sparkdrawon=1
		is_beingdrawnonbycharm=1
		
	} else {if sparkdrawon {instance_create(x,y,smoke)}sparkdrawon=0 is_beingdrawnonbycharm=0 visible=1}
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
        if !skidding playsfx(name+"skid")
skidding=1
    } else if (skidding) {soundstop(name+"skid") skidding=0}
}

//w ter
if (underwater()) {
    if (!water) {
        if (abs(vsp)>2) water_splash(1)
        vsp=min(1,vsp/2)
    }
    if !iamcurrentlyleavingthisfacility water=1 wf=0.45
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
		proj_type="psmok"
        i=fire_projectile(x,y+10) i.depth=depth+2
    }
    if (vsp<-5-2*!sprung) {
        proj_type="psmok"
        i=fire_projectile(x,y+8) i.hspeed=0 i.vspeed=-1
    }
    if (vsp>7) {
        speedwagon+=1
        if (speedwagon>60) {
			proj_type="psmok"
			i=fire_projectile(x,y+8) i.hspeed=0 i.vspeed=1
		
		
		}
    } else speedwagon=0
	if spin && !jump { proj_type="Particle" i=fire_projectile(x-12*xsc,y+12) i.hspeed=sign(-hsp)/2 i.vspeed=-0.5 i.particle=1 i.frame=choose(0,1,2,3)}
}

maxe=0
if (insta) insta+=1
if (boost) {
    if (hurt && !super) boost=0
    if (point_distance(0,0,hsp,vsp)<3.5) boost=0
}

//spindash/spin
global.coll=id
if (spindash || spin) {
    coll=instance_position(x-10*sign(hsp),y+22,hittable)
    coll2=instance_position(x,y+22,hittable)
    
    if (spindash) coll=coll2
    else if (coll2) if (coll2.object_index!=brick || coll2.object_index!=bigbrick) coll=coll2
    if (coll) if (coll.hit) coll=0
    if (coll=spinblacklist) coll=0
    if (!coll)
        with (hittable)
            if (id!=other.spinblacklist && (object_index!=brick || other.spindash || coll2.object_index!=bigbrick) && !hit)
                if (instance_place(x,y-4,other.id)) other.coll=id
    
    if (coll) if (!coll.goinup || tempbrick) {
        i=coll.object_index
        hitblock(coll,id,0,1,0)
        if (i=brick || i=bigbrick) {spinblacklist=coll if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf}}
        else if (i=moncoin && !coll.broke) {if (spindash) {jump=1 spindash=0 crouch=0 vsp=-2*wf} with (coll) event_user(6)}
    }
    
    if (spindash) {
        spindash=max(1,spindash-0.025)
        if (!crouch) {
            if (spindash>3) boost=1
            spin=1
			if global.emeralds>=2 hsp=xsc*(5.5+(maxspd*(0.125/2)))*(0.75+0.375*median(0,spindash-1,2)/2) 
            else hsp=xsc*4.5*(0.75+0.25*median(0,spindash,2)/2)
            spindash=0
            
                soundstop(name+"spindash")
				if global.emeralds>=2 {
					proj_type="SpindashBoom"
					i=fire_projectile(x,y) 
					i.spindashboom=1
					superspintimer=10
					playsfx(name+"superspindash")
					playsfx(name+"release")
				} else {playsfx(name+"release")}
       
            
        }
        if (hsp!=0) spindash=0
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
                crouch=down
            }
            mask_reset()
        }   
    }
} else spinblacklist=noone

if superspintimer>0 superspintimer-=1

 //atheism
//jesus=(boost && vsp<4 && !water)  

com_endactions()


#define enemycoll
   
slam=0   

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
        enemydie(coll) proj_type="Trail" i=fire_projectile(x,y) i.trail=1               
        exit
    }
	
    
    if (spindash || inst || firedash) {if (diggity=32) exit   enemyexplode(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1 exit}
    
    if (type=piranha || coll.damage_player_on_contact) {
        hurtplayer("enemy")
        exit
    }
    
    
     
if (spin) {
        if (type=shell) {if (coll.type!="beetle") { enemydie(coll) i=fire_projectile(x,y)i.trail=1 exit}}
else if (type=koopa|| object_is_ancestor(type,koopa)) { with enemyflip(coll) {y-=3 vspeed=-3 intangible_timer=30} exit }
        else if (type=beetle ) {hsp=0 jump=1 jumpspd=0.5 spin=0 enemystomp(coll)  exit}
        else if (type=spinyegg) {hurtplayer("enemy") exit}
        else {enemydie(coll) proj_type="Trail" i=fire_projectile(x,y) i.trail=1  exit}
    }

 
    if (type=spiny) {
        if (!fall && vsp<0||dash) { enemyexplode(coll)}
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
        if (jump && (!calcfall || !water) && vsp>0) {if (calcfall) enemystomp(coll,5) else {enemyexplode(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1 }}
        else hurtplayer("enemy") exit
    }
    
    if (type=cheepred || type=cheepwhite) {
        if (jump && !calcfall) {enemyexplode(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1  exit}
        else {hurtplayer("enemy") exit}
    }
    
    if (jump) {
        if (type=koopa || type=beetle || type=rexbig || object_is_ancestor(type,koopa)) {
            if (vsp<0) {
                if (calcfall) hurtplayer("enemy")
                else {enemyexplode(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1 } exit
            }
        } else {
            if (!calcfall) {enemyexplode(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1  exit}
            if (vsp<0) {hurtplayer("enemy") exit}
        }
        
        if (type=goomba && seqcount=1 && !scorelok4) {seqcount=0 scorelok4=1}    
        if ((type=koopa || type=redkoopa) && seqcount=1) scorelok1=1    
        if (type=hopkoopa || type=redhover) seqcount=max(seqcount,1)
        if (type=hammerbro) seqcount=max(5,seqcount)
        if (fall=12) fall=5{                        
        enemystomp(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1 exit}      
    } else if (coll.vspeed<0 && coll.y>y+8) {jump=1 fall=1 vsp=-0.5 enemystomp(coll) proj_type="Trail" i=fire_projectile(x,y)i.trail=1  exit}
    
    hurtplayer("enemy")   
}    


#define hurt
pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}

energy=0
braking=0
sprung=0
grow=0
gk=0
fk=0
oldsize=size
jumpbuffer=0
hyperspeed=0
star=0  

if (((!size || size=5) || ohgoditslava) && !shielded) {
   if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
   if (global.gamemode="battle") dropcoins(0)
   die()
} else {
    climb=0 
    rise=0
    sprung=0
    fall=0
    braking=0
    boost=0
    hyperspeed=0
	trailing=0
	shockerable=0
	shockering=0
	slam=0
	
	outtatimer=0
	iamcurrentlyleavingthisfacility=0
	outtajumped=0
	activateouttahere=0

    playsfx(name+"damage")

    starhit=0
    
	jump=1 hurt=1+starhit if (!starhit) if (shielded) {shielded=0} else {if (size=3 || size=4) {size=1} else size-=1} hsp=xsc*-2*wf vsp=-3*wf
    
}


//Block hitting

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
	hititembox() //With Mighty's method we dont need to have an entire ass custom thing.
}


#define hitwall
//hit blocks sideways
if ((spin && abs(hsp)>0.5) || (super && fall=10)) {
    global.coll=id
    with (hittable) if (instance_place(x-other.hitside,y,other.id)) {
        if global.coll.firedash go=sign(global.coll.vsp) else go=-1
        insted=1
        event_user(0)
        if (object_index=moncoin) event_user(6)
        insted=0
    }
    coll=collision(hitside,0)
    if (firedash && jump) {canpipejump=1 com_piping() fall=5 vsp=0} else canpipejump=0
}

if (shockerable || spin || (jump && boost)) {
	
with (bigbrick) if (instance_place(x-other.hitside,y,other.id)) {
if (other.shockerable || other.spin) go=sign(global.coll.vsp) else go=-1
        insted=1
sound("itemblockbreak")
        instance_destroy();
            i=instance_create(x+4,y+12,part) with(i){hspeed=-1 vspeed=-1+2*go}
            i=instance_create(x+12,y+12,part) with(i){hspeed=1 vspeed=-1+2*go}
            i=instance_create(x+4,y+4,part) with(i){hspeed=-1 vspeed=-3+2*go}
            i=instance_create(x+12,y+4,part) with(i){hspeed=1 vspeed=-3+2*go}
insted=0
    }
}
if (coll=noone) exit

if (hurt) {hurt=0 fall=6 flash=1 fk=0}

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
shockerable=0
trailing=0
used=0
slam=0
soundstop(name+'shockering')



if (downpiped) {
	proj_type="psmok"
	
	i=fire_projectile(x-8,y+4) i.hspeed=-2 i.vspeed=-1
	i=fire_projectile(x-8,y+4) i.hspeed=2 i.vspeed=-1 
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

//if global.mplay>1 alphadecay=1

name=owner.name
p2=owner.p2
owner=owner.id
size=owner.size
xsc=owner.xsc
ysc=owner.ysc
water=owner.water

frn=unreal(playerskindat(p2,string(name)+" dead frames")) //IM KILLING SOMEONE

frspd=owner.frspd
hspeed=-0.25*xsc //reference to sonic 3 & knuckles: hard bosses edition
vspeed=-3.5 gravity=0.1

} 
else if (event="step"){
alarmmp=max(0,alarmmp-1)
alarm1=max(0,alarm1-1)

if alphadecay &&!alarmmp alpha-=0.1

if alarm1=0 instance_destroy()

} else if (event="draw"){
//no more spriteswitch *vineboom*
}


#define enterpipe
if (type="side") {
	if (spin||crouch) {
		set_sprite("ball")
		frspd=min(1,0.1+abs(hsp/4))
		if (abs(hspeed)>=(maxspd) && !underwater()) {fastpipe=1 playsfx(name+"spin")}
	}
	if (boost) {fastpipe=1}
}
if (type="up") {
	set_sprite("fly")	
}
if (type="down") {
if vsp>=5 fastpipe=1
}

if (skidding) {soundstop("sparkskid") skidding=0}
braking=0
insta=0
crouch=0
push=0     
dash=0


#define exitpipe
if (type="door") {}
if (type="side") {}
if (type="up") {}
if (type="down") {}


#define customchange
//lol

#define unlock
var strmhandle;

//yeah i coded this inside a level and then pasted it here. not my problem
if global.loadedSparkExtra=0 {
	//strmhandle=FMODSoundAdd(global.cache+"media\cloudcones.xm.AutoSave.20230317.170711.xm",2) ds_map_add(globalmanager.mushandles,"_crash2" ,strmhandle) FMODSoundSetGroup(strmhandle,1) 

	global.Code1='instance_create(0,0,introctrl) global.quietyou=1 introctrl.sparking=1 instance_destroy()'
	global.Code2='introslide1.y=floor(introctrl.y-8) introslide2.y=floor(introctrl.y-8) with introslide1 if !(introctrl.triangel || introslide1.sprite_index=spr_garf) visible=0 with introslide2 visible=0 with intro_fallingobject instance_destroy() with introborder instance_destroy() with introslide instance_destroy() with BETA instance_destroy() with intromode7 instance_destroy()'
	global.Code3='if introctrl.clicc && timer<190 timer=190 timer+=1 if timer=250 {introctrl.gravity=0.1 introtape.gravity=0.1} with introctrl if (y>ystart+28) {y=ystart+28 if (vspeed<0.5) {gravity=0 vspeed=0} else vspeed*=-0.6} with introtape {if (lock) if (y>ystart+22) {y=ystart+22 if (vspeed<0.5) {gravity=0 vspeed=0} else vspeed*=-0.6}}'
	global.Code4='if !done {global.sparkgraphic1=sprite_add(global.workdir+"mods\"+"character\"+"spark"+"\extras\funny.png",1,1,0,0,0) y=y-84 x=x-8 done=1} if introctrl.clicc && timer<190 timer=190 timer+=1 if timer=320 {gravity=0.2} if timer=341 {gravity=-0.2} if timer=374 {gravity=0 vspeed=0} draw_sprite_part(global.sparkgraphic1,0,0,0,160,65,x,y) depth=-1'
	global.Code5='if !done {global.sparkgraphic2=sprite_add(global.workdir+"mods\"+"character\"+"spark"+"\extras\untitled.gif",1,0,0,128,380) done=1} if (introctrl.triangel || introslide1.sprite_index=spr_garf) x=xstart+48 introslide1.x=xstart+24-(ysc*200) if introctrl.clicc && timer<190 timer=190 timer+=1 if timer>=290 {ysc=approach_val(ysc,0.20,0.0025)}draw_sprite_ext(global.sparkgraphic2,0,x-8,y,0.5,ysc,0,$ffffff,1) depth=4'
	global.Code6='if !done { tex1=sprite_get_texture(tex_clouds,0) xx=random(32) yy=random(32) x2=random(32768) x3=random(32768) s=1 surf=-1 done=1 } surf=sureface("mode7",800,448) if (sureface_set_target("mode7")) {xx-=0.002 yy-=0.004 zz-=0.1 if (xx<0) xx+=1/s if (yy<0) yy+=1/s x2=(x2+0.016) mod 1 x3=(x3+1) mod 256 col1=$404000 col2=$aaaa00 texture_set_interpolation(0) d3d_set_projection_ortho(0,0,400,224,0) draw_sprite_stretched(tex_sky,2,0,0,401,225) d3d_transform_add_rotation_z(zz) d3d_transform_add_translation(200,96,0) d3d_transform_set_identity() texture_set_repeat(1) d3d_set_projection_ext(0,0,0,0,-10,3,0,0,-1,105,400/224,1,1000) draw_set_blend_mode(bm_add) d3d_primitive_begin_texture(pr_trianglestrip,tex1) d3d_vertex_texture_color(-70,-40,-5,xx*s,-yy*s,$644000,0) d3d_vertex_texture_color(70,-40,-5,(xx+lengthdir_x(2.5,30))*s,-(yy+lengthdir_y(2.5,30))*s,$644000,0) d3d_vertex_texture_color(-70,-5,-5,(xx+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,300))*s,$644000,1) d3d_vertex_texture_color(70,-5,-5,(xx+lengthdir_x(2.5,30)+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,30)+lengthdir_y(2.5,300))*s,$644000,1) d3d_primitive_end() draw_set_blend_mode(0) texture_set_interpolation(0) d3d_set_projection_ortho(0,0,400,224,0) draw_set_blend_mode(bm_add) draw_set_blend_mode(0) surface_reset_target() }'
	global.Code7='with code if (sureface_exists("mode7")) with other draw_surface_stretched(other.surf,0,0,400,224) depth=9'
	
	global.NewDisclaimersCode='
	if fade {
		image_alpha += 0.05
	}
	if (!lok) {
		if (advance() || anykey()) {
			if (!clicc) {
				egged=(egg(10) || keyboard_check(ord("S")))
				if egged {instance_create(x,y,warpfader) sound("systemgo")} else segafadeto(titlescreen,"systemgo") 
				clicc=1
				lok=1	    
			}
		}
	} 
	
	with (warpfader) {if (reverse) instance_destroy()}
	
	if lok && egged && !instance_exists(warpfader) {
		visible=0
		
		
		
		if !created_stuff {
			with instance_create(0,0,code) {text=global.Code1 run="always" event_user(0)}
			with instance_create(0,0,code) {text=global.Code2 run="always" event_user(0)}
			with instance_create(0,0,code) {text=global.Code3 run="always" event_user(0)}
			with instance_create(128,16,code) {text=global.Code4 run="draw" event_user(0)}
			with instance_create(208,144,code) {text=global.Code5 run="draw" event_user(0)}
			with instance_create(0,0,code) {text=global.Code6 run="always" event_user(0)}
			with instance_create(0,0,code) {text=global.Code7 run="draw" event_user(0)}
			created_stuff=1
		}
		
	}
	'
	
	
	object_clearevent(DISCLAIMERSCREEN,ev_step,0)
	object_setevent(DISCLAIMERSCREEN,ev_step,0,global.NewDisclaimersCode)
	
	//object_clearevent(introctrl,ev_room_end,0)
	//object_setevent(introctrl,ev_room_end,0,'if sparking { if global.sparkgraphic1!=0 sprite_delete(global.sparkgraphic1) if global.sparkgraphic2!=0 sprite_delete(global.sparkgraphic2)} sureface_free("boll") sureface_free("boll2") if (classicm) { FMODAllStop() FMODSoundFree(classicm) } if (yeans) { FMODAllStop() FMODSoundFree(yeans)}')
	
	global.loadedSparkExtra=1
}

unlocktext="You unlocked ##Spark!" unlocktip="Shouldn't be locked. Run unlockchar() to fix it!"
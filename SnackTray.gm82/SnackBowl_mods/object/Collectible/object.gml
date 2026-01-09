switch(global.cobjectentrypoint){

	case "create":
	
		
	
		if !sprite_exists(global.custom_sprite_collectibles) ||global.custom_sprite_collectibles==0{
			global.custom_sprite_collectibles=sprite_add(globalmanager.moddir+"object\"+mytype+"\collectibles.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_collectibles
		mask_index=spr_16
		realtype=unreal(data_1,0)
		/*
			0- Purp Coin
			1- Green Coin
			2- That fuck ass triangle we dont even see in game
			
			3- Note
			
			4- Letter B
			5- Letter O
			6- Letter W
			7- Letter L
		*/
		/*
			"type" refers to the base functionality.
			
			0- Coins   (they dont fucking do anything)			
			1- Note    (force you to play animation and hover over you when collected)			
			2- Letter  (they use a slightly different hud drawing system okay)
		*/
		off_y=realtype
		frmax=4
		switch(realtype){
			case 0: type=0  hud_x=79 hud_y=0 hud_side=0 break;
			case 1: type=0  hud_x=73 hud_y=17 hud_side=0 break;
			case 2: type=0  frmax=8 hud_x=67 hud_y=34 hud_side=0 break;
			case 3: type=1  hud_x=148 hud_y=0 hud_side=2 break;
			case 4: type=2  hud_x=-40 hud_y=17 hud_side=1 break;
			case 5: type=2  hud_x=-20 hud_y=17 hud_side=1 break;
			case 6: type=2  hud_x=0 hud_y=17 hud_side=1 break;
			case 7: type=2  hud_x=23 hud_y=17 hud_side=1 break;
		
		}
		
		if global.lemontest || global.visualstagecount==1{
			global.collectiblecollected[realtype,0]=0
			global.collectiblecollected[realtype,1]=0
			global.collectiblecollected[realtype,2]=0
			global.collectiblecollected[realtype,3]=0
		
		}
		
	break;
	case "step":
			
		if collected==2 && global.custom_collectible_hud_drawn[realtype,0]==0{ instance_destroy()} //don't stay here for longer than necessary
	
		global.custom_collectible_hud_drawn[realtype,0]=0
		global.custom_collectible_hud_drawn[realtype,1]=0
		global.custom_collectible_hud_drawn[realtype,2]=0
		global.custom_collectible_hud_drawn[realtype,3]=0
		if alarm0==1 {
			collected=2
			exit //don't do anything if your collected==2, this means that although you will never despawn, you are *kinda* needed to actually draw the hud, so...
		}
		
		
		if alarm0 alarm0-=1
		if !collected{
			if frmax=4
			frame=global.itemframe
			else if frmax=8 {frame=global.frame88}
			coll=instance_place(x,y,player)
			if coll{
				collected=1
				alarm0=20+80*(type==1)
				frame=0
				owner=coll
				global.collectiblecollected[realtype,owner.p2]+=1 break;
				
				
				
			}
		} else {
			if type!=1
			frame+=0.20
			else {frame=round((global.itemframe/4)*frmax)
				x=owner.x-8
				y=owner.bbox_top-16-16
				if alarm0>2 {owner.piped=1 owner.sprite="pose" with owner set_sprite("pose")} else owner.piped=0
			
			}
		
		}
	
		
	break;
	case "draw":
		if collected==2 exit
		
		if !sprite_exists(sheet) ||sheet==0{
			global.custom_sprite_collectibles=sprite_add(globalmanager.moddir+"object\"+data[0]+"\collectibles.png",0,1,0,0,0)
		
			sheet=global.custom_sprite_collectibles
		}
		
		
		if !collected || type==1
		draw_sprite_part_ext(sheet,0,190+16*round(frame),7+28*off_y,16,16,x,y,1,1,c_white,1)
		else
		draw_sprite_part_ext(sheet,0,65+25*round(frame),7+28*off_y,24,24,x,y,1,1,c_white,1)
		

	break;
	case "draw_hud":
		if !global.custom_collectible_hud_drawn[realtype,view_current]{
			d3d_transform_stack_push()
			d3d_transform_add_translation(hoffx,hoffy,0)
		
		
		
			global.custom_collectible_hud_drawn[realtype,view_current]=1
			if type==2 w=27 else w=56
			
			if hud_side==0
				draw_sprite_part_ext(sheet,0,8,7+28*off_y,w,27,hud_x,hud_y,1,1,c_white,1)
			else if hud_side==1
				draw_sprite_part_ext(sheet,0,8,7+28*off_y,w,27,view_wview[view_current]/2 +hud_x,hud_y,1,1,c_white,1)
			else if hud_side==2
				draw_sprite_part_ext(sheet,0,8,7+28*off_y,w,27,view_wview[view_current] -hud_x,hud_y,1,1,c_white,1)
			
			if type==2 {
				if global.collectiblecollected[realtype,view_current]>0{
					if hud_side==0
						draw_sprite_part_ext(sheet,0,8+w+1,7+28*off_y,w,27,hud_x,hud_y,1,1,c_white,1)
					else if hud_side==1
						draw_sprite_part_ext(sheet,0,8+w+1,7+28*off_y,w,27,view_wview[view_current]/2 +hud_x,hud_y,1,1,c_white,1)
					else if hud_side==2
						draw_sprite_part_ext(sheet,0,8+w+1,7+28*off_y,w,27,view_wview[view_current] -hud_x,hud_y,1,1,c_white,1)
				}
			} else {
			
					if hud_side==2{
						//draw text "reversed"
						draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 1)),view_wview[view_current]-hud_x+20 ,hud_y+5)
						if num>9 draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 2)),view_wview[view_current]-hud_x+28,hud_y+6)
						if num>99 draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 3)),view_wview[view_current]-hud_x+32,hud_y+7)
					} else {
						//draw text normally

						num=global.collectiblecollected[realtype,view_current]
						
						draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 1)),hud_x+22,hud_y+6)
						if num>9 draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 2)),hud_x+32,hud_y+5)
						if num>99 draw_sprite(spr_mainuitextsmall,real(string_char_at(string(num), 3)),hud_x+40,hud_y+4)
					}
			
			}


			
			
			d3d_transform_stack_pop()
		}
	break;
	
	case "deloaded":
		if !sprite_exists(global.custom_sprite_collectibles) ||global.custom_sprite_collectibles==0{
			//no need to deload anything.	
		}else {
			sprite_delete(global.custom_sprite_collectibles) global.custom_sprite_collectibles=0
		}
	
	break;
	
	
	
	
	case "lemon_display":
		
		if !sprite_exists(global.custom_sprite_collectibles) ||global.custom_sprite_collectibles==0{
			global.custom_sprite_collectibles=sprite_add(globalmanager.moddir+"object\"+data[0]+"\collectibles.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_collectibles


		realtype=unreal(data[1],0)
		
		off_y=realtype	
		
		draw_sprite_part_ext(sheet,0,190,7+28*off_y,16,16,x*16,y*16,1,1,c_white,1)

	break;
	
	
	
	
	case "editobjmenu":
		
		if global.cobjectlemontype>1 {global.cobjectlemonreturnvalue=  "----"}
		else if (global.cobjectlemontype=1) {
            i=show_contextmenu("Collectible Type:|-|Purple Coin|Green Coin|Triangle|Note|Letter B|Letter O|Letter W|Letter L",0)
            if (!i) global.cobjectlemonreturnvalue=  global.cobjectlemondefault
            else global.cobjectlemonreturnvalue=  string(i-1)
		
		
		}
	
	break;
	case "editobjdataname":
		i=global.cobjectlemondefault
		
		if global.cobjectlemontype>1 {global.cobjectlemonreturnvalue= "[NO DATA]"}
		else {
			if i=="0" global.cobjectlemonreturnvalue= "Purple Coin";
			if i=="1" global.cobjectlemonreturnvalue=  "Green Coin";
			if i=="2" global.cobjectlemonreturnvalue=  "Triangle";
			if i=="3" global.cobjectlemonreturnvalue=  "Note";
			if i=="4" global.cobjectlemonreturnvalue=  "Letter B";
			if i=="5" global.cobjectlemonreturnvalue=  "Letter O";
			if i=="6" global.cobjectlemonreturnvalue=  "Letter W";
			if i=="7" global.cobjectlemonreturnvalue=  "Letter L";
		
		
		}
		
	break;


}
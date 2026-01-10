switch(global.cobjectentrypoint){

	case "create":
	
		
	
		if !sprite_exists(global.custom_sprite_enemyalt) ||global.custom_sprite_enemyalt==0{
			global.custom_sprite_enemyalt=sprite_add(globalmanager.moddir+"object\"+mytype+"\object.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_enemyalt
		mask_index=spr_16
		realtype=unreal(data_1,0)

		off_y=realtype
		frmax[0]=6
		frmax[1]=12
		frmax[2]=8
		frmax[3]=8
		frmax[4]=1
		frmax[5]=4
		frmax[6]=6
		frmax[7]=8
	
	break;
	case "step":
		truframefansriseup+=0.25	

		
		switch (realtype){
			case 0: if stomped ypos=1 else if die ypos=2  break;
			case 1: ypos=3 if dying ypos=7 break;
			case 2: if hsp=0 ypos=4 else waking ypos=5 else dying ypos=7 else ypos=6  break;
		
		}
		
	break;
	case "draw":
		frame=round(truframefansriseup) mod frmax[ypos]
		
		if !sprite_exists(sheet) ||sheet==0{
			global.custom_sprite_enemyalt=sprite_add(globalmanager.moddir+"object\"+data[0]+"\object.png",0,1,0,0,0)
		
			sheet=global.custom_sprite_enemyalt
		}
		

		draw_sprite_part_ext(sheet,0,8+16*round(frame),7+40*off_y,39,39,x-20,y-23,1,1,c_white,1)

		

	break;
	case "draw_hud":
		exit
	break;
	
	case "deloaded":
		if !sprite_exists(global.custom_sprite_enemyalt) ||global.custom_sprite_enemyalt==0{
			//no need to deload anything.	
		}else {
			sprite_delete(global.custom_sprite_enemyalt) global.custom_sprite_enemyalt=0
		}
	
	break;
	
	
	
	
	case "lemon_display":
		
		if !sprite_exists(global.custom_sprite_enemyalt) ||global.custom_sprite_enemyalt==0{
			global.custom_sprite_enemyalt=sprite_add(globalmanager.moddir+"object\"+data[0]+"\object.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_enemyalt


		realtype=unreal(data[1],0)
		
		off_y=realtype	
		
		draw_sprite_part_ext(sheet,0,190,7+28*off_y,16,16,x*16,y*16,1,1,c_white,1)

	break;
	
	
	
	
	case "editobjmenu":
		
		if global.cobjectlemontype>1 {global.cobjectlemonreturnvalue=  "----"}
		else if (global.cobjectlemontype=1) {
            i=show_contextmenu("Collectible Type:|-|Golden Goomba|Pink Koopa|Pink Shell",0)
            if (!i) global.cobjectlemonreturnvalue=  global.cobjectlemondefault
            else global.cobjectlemonreturnvalue=  string(i-1)
		
		
		}
	
	break;
	case "editobjdataname":
		i=global.cobjectlemondefault
		
		if global.cobjectlemontype>1 {global.cobjectlemonreturnvalue= "[NO DATA]"}
		else {
			if i=="0" global.cobjectlemonreturnvalue= "Golden Goomba";
			if i=="1" global.cobjectlemonreturnvalue=  "Pink Koopa";
			if i=="2" global.cobjectlemonreturnvalue=  "Pink Shell";
		
		}
		
	break;


}
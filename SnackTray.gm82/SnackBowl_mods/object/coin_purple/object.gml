switch(global.cobjectentrypoint){

	case "create":
		x+=17 //Center the npc around the graphic so turnign around works.
		y+=2
		depth=2
		frame=0
		if !sprite_exists(global.custom_sprite_npc_S) ||global.custom_sprite_npc_S==0{
			global.custom_sprite_npc_S=sprite_add(globalmanager.moddir+"object\"+mytype+"\snacktraydude.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_npc_S
		xsc=1
		diag=0
		maxdiag=0

		text[0]="Heya."

	break;
	case "step":

		p=nearestplayer()
		frame=0
		if abs(p.x-x)<32 {
			frame=1+ (floor(frameflipper))
			if talking {
				frameflipper+=0.1
				if frameflipper>=2 frameflipper=0
			} 
			{
				if p.up {
					if talking=1 diag+=1 
					
					talking=2
					
					if diag>maxdiag talking=0 //only talk once
					//if diag>maxdiag diag=0 //loop text
				}
			}
			xsc=sign(p.x-x)

			
		}else if talking {
			frameflipper=0
			talking=0
		}
		if !p.up && talking==2 talking=1


	break;
	case "draw":

		draw_sprite_part_ext(sheet,0,8+34*frame,7,33,46,x-17*xsc,y,xsc,1,c_white,1)

		if talking{
			global.halign=1
			draw_omitext(x-17,y-8,text[diag])
			global.halign=0

		}

	break;
	
	
	case "lemon_display":
		xsc=1
		ysc=1
		if !sprite_exists(global.custom_sprite_npc_S) ||global.custom_sprite_npc_S==0{
			global.custom_sprite_npc_S=sprite_add(globalmanager.moddir+"object\"+data[0]+"\snacktraydude.png",0,1,0,0,0)
		}
		sheet=global.custom_sprite_npc_S


		draw_sprite_part_ext(sheet,0,8+34*frame,7,33,46,((x+1)*16)-17*xsc,y*16+2,xsc,1,c_white,1)

	break;
	case "deloaded":
		if !sprite_exists(global.custom_sprite_npc_S) ||global.custom_sprite_npc_S==0{
			//no need to deload anything.	
		}else {
			sprite_delete(global.custom_sprite_npc_S) global.custom_sprite_npc_S=0
		}
	
	break;

}
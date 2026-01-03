switch(global.cobjectentrypoint){

	case "create":


	break;
	case "step":



	break;
	case "draw":
		time+=1 
		d3d_set_lighting(1) 
		d3d_light_define_ambient($aa0000) 
		d3d_light_define_direction(0,-1,1,-1,$bbdd)  
		d3d_light_define_direction(2,1,-1,1,$ff) 
		d3d_light_define_point(1,90+72,90-72,72,100,$dddddd) 
		d3d_light_enable(0,1)    
		d3d_light_enable(1,1)    
		d3d_light_enable(2,1)    
		d3d_set_culling(1)    
		d3d_transform_add_rotation_y(time)
		d3d_transform_add_rotation_x(time*1.3)
		d3d_transform_add_rotation_z(time*0.7)
		d3d_transform_add_scaling(0.5,0.5,0.5) 
		d3d_transform_add_translation(x,y,0) 
		d3d_model_draw(global.boll,0,0,0,-1) 
		d3d_transform_set_identity() 
		d3d_set_lighting(0)   
		d3d_set_culling(0)
		

	break;
	
	
	case "lemon_display":
		time+=1 
		d3d_set_lighting(1) 
		d3d_light_define_ambient($aa0000) 
		d3d_light_define_direction(0,-1,1,-1,$bbdd)  
		d3d_light_define_direction(2,1,-1,1,$ff) 
		d3d_light_define_point(1,90+72,90-72,72,100,$dddddd) 
		d3d_light_enable(0,1)    
		d3d_light_enable(1,1)    
		d3d_light_enable(2,1)    
		d3d_set_culling(1)    
		
		d3d_transform_add_rotation_y(0)    
		d3d_transform_add_rotation_x(0)    
		d3d_transform_add_rotation_z(image_angle) 
		
		d3d_transform_add_scaling(0.5,0.5,0.5) 
		with drawregion{
		d3d_transform_add_translation((width/2)/editzoom.level-viewx,(height/2)/editzoom.level-viewy,0)
		d3d_transform_add_scaling(editzoom.level,editzoom.level,1)
		}
		d3d_model_draw(global.boll,x*32-500,y*32-272,0,-1) 
		d3d_transform_set_identity() 
		with drawregion{
		d3d_transform_add_translation((width/2)/editzoom.level-viewx,(height/2)/editzoom.level-viewy,0)
		d3d_transform_add_scaling(editzoom.level,editzoom.level,1)
		}
		d3d_set_lighting(0)   
		d3d_set_culling(0)

	break;
	case "deloaded":
		//no need to deload anything.	
		
	break;

}
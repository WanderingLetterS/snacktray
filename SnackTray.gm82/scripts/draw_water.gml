var vx,bw,p,t,name,water,water,dy,curr,i;

curr=argument[1]

ky=gamemanager.players[curr].region.ky
water=gamemanager.water[curr]+4
if water<0 water=0

if ((water-global.screenheight)<view_yview[curr] && !(instance_exists(moranboll))){//dont draw water if it isnt necessary



    for (i=0;i<=water_maxslot;i+=1) {
        spr=water_sprite[i]
        if argument[0]==water_foreground[i]
        if (spr){

            x_view=max(view_xview[curr])
            {
                //Horizontal Parallaxing, based on our view's position, we parallax.
                if water_intentedwidth[i]!=0{
                     
                    parx_view=(x_view/(gamemanager.righthand[curr]-global.screenwidth))*(water_intentedwidth[i]-global.defaultscreenwidth)
                }else parx_view=x_view
                draw_x=x_view+(parx_view-gamemanager.origin[curr])*-(water_par_x[i]/100)
                
                draw_x+= ((gamemanager.righthand[curr]-water_width[i])-gamemanager.origin[curr])*(water_regionedge_x[i]/100)
                
                draw_x+=water_offset_x[i]*WackyMultiplier
                
                if water_clamp_x[i] {
                    draw_x= median( 
                        (x_view-gamemanager.origin[curr])-(water_width[i]-global.screenwidth),
                        draw_x,
                        (x_view-gamemanager.origin[curr])+(water_width[i]-global.screenwidth)
                    )
                
                }
                
                if water_scroll_x[i]!=0 {
                    draw_x+=(global.bgscroll*-water_scroll_x[i]/100) mod water_width[i]
                }
                
                if !water_noloop_x[i]{
                    while draw_x<(x_view-water_width[i]) draw_x+=water_width[i]
                
                }
                               
            } 
            
            //We want the water bg's vertical parallax point to be water-global.screenheight, so all variables relative to 0 have to change to represent this.
            //water= ky-water  y_view=y_view-water
            y_view=max(water,view_yview[curr] )-water
            {
                if water_intentedheight[i]!=0{
                    pary_view=(y_view/((ky-water/2)-global.screenheight))*(water_intentedheight[i]-global.screenheight)

                }else pary_view=y_view


                //Vertical Parallaxing, based on our view's position, we parallax.
                draw_y=y_view+(pary_view)*-(water_par_y[i]/100)

                draw_y+= (((ky-(water/2))-water_height[i]))*(water_regionedge_y[i]/100)

                draw_y+=water_offset_y[i]
                
                if water_clamp_y[i] {
                    draw_y= median( 
                        y_view-(water_height[i]-global.screenheight),
                        draw_y,
                        y_view+(water_height[i]-global.screenheight)
                    )
                    
                }
                
                if water_scroll_y[i]!=0 {
                    draw_y+=(global.bgscroll*-water_scroll_y[i]/100) mod water_height[i]
                }      
                
                          
            } 
        
            
           

            bm=water_bm[i]
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            
            vrepeats=max((ceil(global.screenheight/water_height[i])+1 )*(water_noloop_y[i]==0),1) 
            repeats= max((ceil(global.screenwidth/water_width[i]) +1)*(water_noloop_x[i]==0),1)
            used_draw_x=draw_x
            repeat (vrepeats){ 
                repeat (repeats) {
                    if (water<y_view)
                    draw_sprite(spr,0,used_draw_x,draw_y)
                    else draw_sprite(spr,0,used_draw_x,draw_y+(water-y_view))
                    used_draw_x+=water_width[i]
                }
                draw_y+=water_height[i]
                used_draw_x=draw_x
                
            }
            
            if (bm) draw_set_blend_mode(0)
        }
    }   
}
/*
    if (instance_exists(moranboll)) {bgname="specialsky" dy=0}
    else bgname=gamemanager.players[curr].region.typebg+"trans"
        maxslot=skindat("ms_"+bgname)
    for (i=0;i<=maxslot;i+=1) {
        name=bgname+string(i)
        spr=skindat("tex_"+name)
        if (spr) if (skindat("fg_"+name)=argument[0]) {
            bw=skindat("texw_"+name)
            bh=skindat("texh_"+name)
            ani=skindat("af_"+name)
            a3d=skindat("3d_"+name)
            of=skindat("of_"+name)
            if settings("removeassets") && i>2 i=maxslot
            fh=bh/ani
            xvm=max(gamemanager.origin[curr],view_xview[curr])
            vx=floor(
                xvm-modulo(
                    (xvm-offmoran-gamemanager.origin[curr])*skindat("px_"+name)+global.bgscroll*skindat("sc_"+name),
                    0,
                    bw
                )
            )
            p=-bw

            if (instance_exists(moranboll)) {
                ky=240
            } else {
                ky=gamemanager.ky[curr]
            }
            vertf=global.screenheight-((animbob mod max(1,ani)+1)*fh)+(1-(dy+global.screenheight)/(water+16))*max(0,fh-global.screenheight)-of
            bm=skindat("bm_"+name)
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            if !(lowdetail && bm)
            repeat (ceil(global.screenwidth/bw)+3) {
                draw_sprite(spr,0,vx+p,water-of)
                p+=bw
            }
            if (bm) draw_set_blend_mode(0)
        }
    }
    */

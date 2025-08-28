var vx,bw,p,t,name,horizon,horizon,dy,curr,i;

curr=argument[1]

ky=gamemanager.players[curr].region.ky
horizon=gamemanager.horizon[curr]
if horizon<0 horizon=0

if ((horizon-global.screenheight)<view_yview[curr] && !(instance_exists(moranboll))){//dont draw below if it isnt necessary

    bgname=gamemanager.players[curr].region.typebg+"below"

    for (i=0;i<=below_maxslot;i+=1) {
        name=bgname+string(i)
        spr=below_sprite[i]
        if argument[0]==below_foreground[i]
        if (spr){

            x_view=max(view_xview[curr])
            {
                //Horizontal Parallaxing, based on our view's position, we parallax.
                if below_intentedwidth[i]!=0{
                     
                    parx_view=(x_view/(gamemanager.righthand[curr]-global.screenwidth))*(below_intentedwidth[i]-global.defaultscreenwidth)
                }else parx_view=x_view
                draw_x=x_view+(parx_view-gamemanager.origin[curr])*-(below_par_x[i]/100)
                
                draw_x+= ((gamemanager.righthand[curr]-below_width[i])-gamemanager.origin[curr])*(below_regionedge_x[i]/100)
                
                draw_x+=below_offset_x[i]*WackyMultiplier
                
                if below_clamp_x[i] {
                    draw_x= median( 
                        (x_view-gamemanager.origin[curr])-(below_width[i]-global.screenwidth),
                        draw_x,
                        (x_view-gamemanager.origin[curr])+(below_width[i]-global.screenwidth)
                    )
                
                }
                
                if below_scroll_x[i]!=0 {
                    draw_x+=(global.bgscroll*-below_scroll_x[i]/100) mod below_width[i]
                }
                
                if !below_noloop_x[i]{
                    while draw_x<(x_view-below_width[i]) draw_x+=below_width[i]
                
                }
                               
            } 
            
            //We want the below bg's vertical parallax point to be horizon-global.screenheight, so all variables relative to 0 have to change to represent this.
            //horizon= ky-horizon  y_view=y_view-horizon
            y_view=max(horizon,view_yview[curr] )-horizon
            {
                if below_intentedheight[i]!=0{
                    pary_view=(y_view/((ky-horizon/2)-global.screenheight))*(below_intentedheight[i]-global.screenheight)

                }else pary_view=y_view


                //Vertical Parallaxing, based on our view's position, we parallax.
                draw_y=y_view+(pary_view)*-(below_par_y[i]/100)

                draw_y+= (((ky-(horizon/2))-below_height[i]))*(below_regionedge_y[i]/100)

                draw_y+=below_offset_y[i]
                
                if below_clamp_y[i] {
                    draw_y= median( 
                        y_view-(below_height[i]-global.screenheight),
                        draw_y,
                        y_view+(below_height[i]-global.screenheight)
                    )
                    
                }
                
                if below_scroll_y[i]!=0 {
                    draw_y+=(global.bgscroll*-below_scroll_y[i]/100) mod below_height[i]
                }      
                
                          
            } 
        
            
           

            bm=below_bm[i]
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            
            vrepeats=max((ceil(global.screenheight/below_height[i])+1 )*(below_noloop_y[i]==0),1) 
            repeats= max((ceil(global.screenwidth/below_width[i]) +1)*(below_noloop_x[i]==0),1)
            used_draw_x=draw_x
            repeat (vrepeats){ 
                repeat (repeats) {
                    if (horizon<y_view)
                    draw_sprite(spr,0,used_draw_x,draw_y)
                    else draw_sprite(spr,0,used_draw_x,draw_y+(horizon-y_view))
                    used_draw_x+=below_width[i]
                }
                draw_y+=below_height[i]
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
            vertf=global.screenheight-((animbob mod max(1,ani)+1)*fh)+(1-(dy+global.screenheight)/(horizon+16))*max(0,fh-global.screenheight)-of
            bm=skindat("bm_"+name)
            if (bm=1) draw_set_blend_mode(bm_add)
            if (bm=2) draw_set_blend_mode(bm_subtract)
            if !(lowdetail && bm)
            repeat (ceil(global.screenwidth/bw)+3) {
                draw_sprite(spr,0,vx+p,horizon-of)
                p+=bw
            }
            if (bm) draw_set_blend_mode(0)
        }
    }
    */

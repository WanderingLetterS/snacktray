#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
offsets[3]=0
animbob=0
animcarl=0
animkevin=0
global.removebackgrounddrawing=0
oxc=0
offmoran=0

lowdetail=(settings("detail"))

instance_create(0,0,fgmanager)
instance_create(0,0,fgassetmanager)

sb[0]=-1 sb[1]=-1 sb[2]=-1 sb[3]=-1
sf[0]=-1 sf[1]=-1 sf[2]=-1 sf[3]=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animcarl+=1/max(1,skindat("bgspd"))
animbob=floor(animcarl)
animkevin=!animkevin
global.bgscroll+=!gamemanager.pause
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if global.removebackgrounddrawing=1 exit
if (lowdetail && !animkevin) {
    for (i=0;i<global.mplay;i+=1) {
        sb[i]=sureface("background"+string(i),global.screenwidth,global.screenheight)
        if (sureface_set_target("background"+string(i))) {
            //RENDERMARKER
            //draw_clear_alpha(0,0)
            drawlayeredbackground(0,i)
            surface_reset_target()
        }
        sf[i]=sureface("foreground"+string(i),global.screenwidth,global.screenheight)
        if (sureface_set_target("foreground"+string(i))) {
            draw_clear_alpha(0,0)
            drawlayeredbackground(1,i)
            surface_reset_target()
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///foreground layers
if (instance_exists(moranboll)) exit

if removebackgrounddrawing  exit

if (lowdetail) {
    if (sureface_exists("foreground"+string(view_current))) if surface_exists(sf[view_current]) draw_surface(sf[view_current],view_xview[view_current],view_yview[view_current])
} else {
    drawlayeredbackground(1,view_current)
}

drawassets(1)

waterbiome[view_current]=getbiomeid(gamemanager.typebg[view_current])

//water surface
if (gamemanager.water[view_current]<gamemanager.ky[view_current]) for (p=(view_xview[view_current] div 32)*32;p<view_xview[view_current]+global.screenwidth;p+=32)
    draw_background_part(global.master[waterbiome[view_current]],88+32*(global.frame88 mod 4),312+8*(global.frame88 div 4),32,8,p,gamemanager.water[view_current])
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///background layers

if (gamemanager.pause || instance_exists(moranboll)) exit

if global.removebackgrounddrawing exit


if lastregion[view_current]!=gamemanager.players[view_current].region || forcemeareload{
    lastregion[view_current]=gamemanager.players[view_current].region
    //Load it all up baby.
    bgname=gamemanager.players[view_current].region.typebg+"sky"
    sky_maxslot=skindat("ms_"+bgname)
    for (i=0;i<=sky_maxslot;i+=1) {
        name=bgname+string(i)
        sky_sprite[i]=skindat("tex_"+name)
        sky_width[i]=skindat("texw_"+name)
        sky_height[i]=skindat("texh_"+name)
        sky_par_x[i]=skindat("Parallax_X_"+name)
        sky_par_y[i]=skindat("Parallax_Y_"+name)
        sky_noloop_x[i]=skindat("Noloop_X_"+name)
        sky_noloop_y[i]=skindat("Noloop_Y_"+name)
        sky_clamp_x[i]=skindat("Clamp_X_"+name)
        sky_clamp_y[i]=skindat("Clamp_Y_"+name)
        sky_offset_x[i]=skindat("Offset_X_"+name)
        sky_offset_y[i]=skindat("Offset_Y_"+name)
        sky_regionedge_x[i]=skindat("Regionedge_X_"+name)
        sky_regionedge_y[i]=skindat("Regionedge_Y_"+name)
        sky_scroll_x[i]=skindat("Scroll_X_"+name)
        sky_scroll_y[i]=skindat("Scroll_Y_"+name)
        sky_transparent[i]=skindat("Transparent_"+name)
        sky_intentedwidth[i]=skindat("Intended_Width_"+name)
        sky_intentedheight[i]=skindat("Intended_Height_"+name)
        sky_bm[i]=skindat("bm_"+name)
        sky_foreground[i]=skindat("Foreground_"+name)

        //truesky_width[i]=sky_width[i] sky_width[i]=sky_width[i]/sky_animated_x[i]

    }
    bgname=gamemanager.players[view_current].region.typebg+"water"
    water_maxslot=skindat("ms_"+bgname)
    for (i=0;i<=water_maxslot;i+=1) {
        name=bgname+string(i)
        water_sprite[i]=skindat("tex_"+name)
        water_width[i]=skindat("texw_"+name)
        water_height[i]=skindat("texh_"+name)
        water_par_x[i]=skindat("Parallax_X_"+name)
        water_par_y[i]=skindat("Parallax_Y_"+name)
        water_noloop_x[i]=skindat("Noloop_X_"+name)
        water_noloop_y[i]=skindat("Noloop_Y_"+name)
        water_clamp_x[i]=skindat("Clamp_X_"+name)
        water_clamp_y[i]=skindat("Clamp_Y_"+name)
        water_offset_x[i]=skindat("Offset_X_"+name)
        water_offset_y[i]=skindat("Offset_Y_"+name)
        water_regionedge_x[i]=skindat("Regionedge_X_"+name)
        water_regionedge_y[i]=skindat("Regionedge_Y_"+name)
        water_scroll_x[i]=skindat("Scroll_X_"+name)
        water_scroll_y[i]=skindat("Scroll_Y_"+name)
        water_transparent[i]=skindat("Transparent_"+name)
        water_intentedwidth[i]=skindat("Intended_Width_"+name)
        water_intentedheight[i]=skindat("Intended_Height_"+name)
        water_bm[i]=skindat("bm_"+name)
        water_foreground[i]=skindat("Foreground_"+name)

        //truesky_width[i]=sky_width[i] sky_width[i]=sky_width[i]/sky_animated_x[i]

    }
    bgname=gamemanager.players[view_current].region.typebg+"below"
    below_maxslot=skindat("ms_"+bgname)
    for (i=0;i<=below_maxslot;i+=1) {
        name=bgname+string(i)
        below_sprite[i]=skindat("tex_"+name)
        below_width[i]=skindat("texw_"+name)
        below_height[i]=skindat("texh_"+name)
        below_par_x[i]=skindat("Parallax_X_"+name)
        below_par_y[i]=skindat("Parallax_Y_"+name)
        below_noloop_x[i]=skindat("Noloop_X_"+name)
        below_noloop_y[i]=skindat("Noloop_Y_"+name)
        below_clamp_x[i]=skindat("Clamp_X_"+name)
        below_clamp_y[i]=skindat("Clamp_Y_"+name)
        below_offset_x[i]=skindat("Offset_X_"+name)
        below_offset_y[i]=skindat("Offset_Y_"+name)
        below_regionedge_x[i]=skindat("Regionedge_X_"+name)
        below_regionedge_y[i]=skindat("Regionedge_Y_"+name)
        below_scroll_x[i]=skindat("Scroll_X_"+name)
        below_scroll_y[i]=skindat("Scroll_Y_"+name)
        below_transparent[i]=skindat("Transparent_"+name)
        below_intentedwidth[i]=skindat("Intended_Width_"+name)
        below_intentedheight[i]=skindat("Intended_Height_"+name)
        below_bm[i]=skindat("bm_"+name)
        below_foreground[i]=skindat("Foreground_"+name)

        //truesky_width[i]=sky_width[i] sky_width[i]=sky_width[i]/sky_animated_x[i]

    }
    forcemeareload=0
}

if (lowdetail) {
    if (sureface_exists("background"+string(view_current))) if surface_exists(sb[view_current]) draw_surface(sb[view_current],view_xview[view_current],view_yview[view_current])
} else if settings("removeassets"){
} else {
    drawlayeredbackground(0,view_current)
}

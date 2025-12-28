//automatically handles over_sprite drawing for 2.0 sheet format

var k,over_frs,over_frl,c;
//if sometehing fucks up readd over_frx and over_fry to here or some shit
if (argument[0]) {//animate
    k=16+128*over_sid
    if (over_sprite!=over_oldspr || size!=likesizebutold)
    over_frn=global.animdat[p2,k+1+size] //over_frame number //thats hardcoded size values GEEEET OOOOUT
    over_frs=(frspd*animf*global.animdat[p2,k+MAXIMUMSIZESARGH+7])/max(1,global.animdat[p2,k+MAXIMUMSIZESARGH+11+floor(over_frame)]) //(game speed * percent * over_sprite speed) / over_frame time
    over_frl=global.animdat[p2,k+MAXIMUMSIZESARGH+8]-1 //loop point

    over_fox=global.animdat[p2,k+MAXIMUMSIZESARGH+9]
    over_foy=global.animdat[p2,k+MAXIMUMSIZESARGH+10]

    if (water && !cantslowanim) over_frs*=wf
    if (piped!=2) over_frame+=over_frs
    if (over_frame<0) over_frame+=over_frn
    if (over_frame>=over_frn) {over_frame=over_frame-over_frn if (over_frl<over_frn) over_frame+=over_frl}

    if (over_sprite!=over_oldspr) && (prevent_over_spr_reset) {
        over_frame=over_frl
        prevent_over_spr_reset=0
    }

    over_frame=modulo(precise(over_frame),0,over_frn)
    likesizebutold=size
} else {//draw
    c=blend
    if !blend c=$ffffff
    usedskin_offsety=skin_offsety
    drawsize=global.reroutedsizes[p2,size]
    over_frx=floor(over_frame)+global.animationstartX[p2,over_sid+over_ypos]
    over_fry=global.animationstartY[p2,over_sid+over_ypos]
    splitpadding=global.spritelistpadding[p2,over_sid+over_ypos]
    drawsheetsize=drawsize
    if global.singlesheet[p2]{
        splitpadding+=global.singlesheetsplitwidth[p2,drawsize]
        usedskin_offsety+=global.singlesheetsplitheight[p2,drawsize]
        //Make sure we only draw sheet 0
        drawsheetsize=0
    }

    i=0
   /*if (shadow) {
        draw_set_blend_mode_ext(10,1) rect(x-sprcx[drawsize],y-sprcy[drawsize],sprw[drawsize],sprh[drawsize],$ffffff,1) draw_set_blend_mode(0)
        charm_run("effectsbehind")
        if (over_sprite_angle!=0) draw_sprite_general(sheets[size],0,8+over_frx*sprw[drawsize],128+over_fry*sprh[drawsize],sprw[drawsize]-1,sprh[drawsize]-1,round(x+lengthdir_x(-sprcx[drawsize]*xsc,over_sprite_angle)+lengthdir_x((dy-sprcy[drawsize])*ysc,over_sprite_angle-90)),round(y+lengthdir_y(-sprcx[drawsize]*xsc,over_sprite_angle)+lengthdir_y((dy-sprcy[drawsize])*ysc,over_sprite_angle-90)),xsc,ysc,over_sprite_angle,$40ff40,$40ff40,$40ff40,$40ff40,alpha)
        else draw_sprite_part_ext(sheets[size],0,8+over_frx*sprw[drawsize],128+over_fry*sprh[drawsize],sprw[drawsize]-1,sprh[drawsize]-1,round(x-sprcx[drawsize]*xsc),round(y+(dy-sprcy[drawsize])*ysc),xsc,ysc,$40ff40,alpha)
        draw_set_blend_mode_ext(10,1) rect(x-sprcx[drawsize],y-sprcy[drawsize],sprw[drawsize],sprh[drawsize],$ffffff,1) draw_set_blend_mode(0)
        d3d_set_fog(1,$a00000,0,0)
    } else  */

    if object_index!=afterimage
    if usepalette {if over_allpal1{
    scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)


    } else scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)
    }
    divisio=1 multiplicio=0
    if (size==0 && shortsmallform!=0) {divisio=1/shortsmallform  if !global.singlesheet[p2] multiplicio=-1}
    else if (size==5 && !minisheet) {divisio=1.75 /*like sonic boll 1.9*/ /*no its not thats not even a 9*/ multiplicio=5 }

    if (over_sprite_angle!=0) draw_sprite_general(
    //  over_sprite, subimage
        sheets[max(drawsheetsize-multiplicio,0)],0, //deepest apologies -moster //that doesnt even multiply what -also moster
    //  left, top
        8+over_frx*sprw[drawsize]+margin+splitpadding,usedskin_offsety+over_fry*sprh[drawsize]+margin,
    //  width, height
        sprw[drawsize]-1-margin*2,sprh[drawsize]-1-margin*2,
    //  left top corner of the quad, accounting for rotation
        round(x)+lengthdir_x((margin+over_fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc,over_sprite_angle)+lengthdir_x((margin+over_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,over_sprite_angle-90)+over_xoffset*(xsc/divisio)*pxsc*mxsc,
        round(y)+lengthdir_y((margin+over_fox-sprcx[drawsize])*(xsc/divisio)*pysc*mysc,over_sprite_angle)+lengthdir_y((margin+over_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,over_sprite_angle-90)+over_yoffset*(ysc/divisio)*pysc*mysc,
    //  scale and rotation
        (xsc/divisio)*pxsc*mxsc,(ysc-((size==5 && !minisheet)/2))*pysc*mysc,over_sprite_angle,
    //  blending
        c,c,c,c,alpha*(1-0.75*shadow)
    )
    else draw_sprite_part_ext(
        sheets[max(drawsheetsize-multiplicio,0)],0,
        8+over_frx*sprw[drawsize]+splitpadding,usedskin_offsety+over_fry*sprh[drawsize],
        sprw[drawsize]-1,sprh[drawsize]-1,
        round(x+(over_fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc+over_xoffset*(xsc/divisio)*pxsc*mxsc), //XSC =direction PXSC = Pipe Squishing MXSC=Modifiable XSC
        round(y+(over_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*pysc*mysc+14+over_yoffset*(ysc/divisio)*pysc*mysc),
        (xsc/divisio)*pxsc*mxsc,(ysc/divisio)*pysc*mysc,
        c,alpha*(1-0.75*shadow)
    )
    draw_left=8+over_frx*sprw[drawsize]+splitpadding
    draw_top=usedskin_offsety+over_fry*sprh[drawsize]
}

//automatically handles under_sprite drawing for 2.0 sheet format

var k,under_frs,under_frl,c;
//if sometehing fucks up readd under_frx and under_fry to here or some shit
if (argument[0]) {//animate
    k=16+128*under_sid
    if (under_sprite!=under_oldspr || size!=likesizebutold)
    under_frn=global.animdat[p2,k+1+size] //under_frame number //thats hardcoded size values GEEEET OOOOUT
    under_frs=(frspd*animf*global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_SPEED])/max(1,global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_FRAMETIMES+floor(under_frame)]) //(game speed * percent * under_sprite speed) / under_frame time
    under_frl=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_LOOP]-1 //loop point

    under_fox=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_OFFX]
    under_foy=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_OFFY]

    if (water && !cantslowanim) under_frs*=wf
    if (piped!=2) under_frame+=under_frs
    if (under_frame<0) under_frame+=under_frn
    if (under_frame>=under_frn) {under_frame=under_frame-under_frn if (under_frl<under_frn) under_frame+=under_frl}

    if (under_sprite!=under_oldspr) && (prevent_under_spr_reset) {
        under_frame=under_frl
        prevent_under_spr_reset=0
    }
    if global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXWIDTH]{
        under_trusprw=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXWIDTH]

    } else under_trusprw=sprw[size]
    if global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXHEIGHT]{
        under_trusprh=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXHEIGHT]

    } else under_trusprh=sprh[size]
    under_frame=modulo(precise(under_frame),0,under_frn)
    likesizebutold=size
} else {//draw
    c=blend
    if !blend c=$ffffff
    usedskin_offsety=skin_offsety
    drawsize=global.reroutedsizes[p2,size]
    under_frx=floor(under_frame)
    under_fry=0
    splitpadding=0
    drawsheetsize=drawsize
    if global.singlesheet[p2]{
        splitpadding+=global.singlesheetsplitwidth[p2,drawsize]
        usedskin_offsety+=global.singlesheetsplitheight[p2,drawsize]
        //Make sure we only draw sheet 0
        drawsheetsize=0
    }

    i=0

    if object_index!=afterimage
    if usepalette {if under_allpal1{
    scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)


    } else scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)
    }
    divisio=1 multiplicio=0
    if (size==0 && shortsmallform!=0) {divisio=1/shortsmallform  if !global.singlesheet[p2] multiplicio=-1}
    else if (size==5 && !minisheet) {divisio=1.75 /*like sonic boll 1.9*/ /*no its not thats not even a 9*/ multiplicio=5 }

    if (under_sprite_angle!=0) draw_sprite_general(
    //  under_sprite, subimage
        sheets[max(drawsheetsize-multiplicio,0)],0, //deepest apologies -moster //that doesnt even multiply what -also moster
    //  left, top
        8+under_frx*under_trusprw+global.animationstartX[p2,sid]+margin+splitpadding,
        global.animationstartY[p2,sid]+usedskin_offsety+under_fry*under_trusprh+margin,
    //  width, height
        under_trusprw-1-margin*2,under_trusprh-1-margin*2,
    //  left top corner of the quad, accounting for rotation
        round(x)+lengthdir_x((margin+under_fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc,under_sprite_angle)+lengthdir_x((margin+under_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,under_sprite_angle-90)+under_xoffset*(xsc/divisio)*pxsc*mxsc,
        round(y)+lengthdir_y((margin+under_fox-sprcx[drawsize])*(xsc/divisio)*pysc*mysc,under_sprite_angle)+lengthdir_y((margin+under_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,under_sprite_angle-90)+under_yoffset*(ysc/divisio)*pysc*mysc,
    //  scale and rotation
        (xsc/divisio)*pxsc*mxsc,(ysc-((size==5 && !minisheet)/2))*pysc*mysc,under_sprite_angle,
    //  blending
        c,c,c,c,alpha*(1-0.75*shadow)
    )
    else draw_sprite_part_ext(
        sheets[max(drawsheetsize-multiplicio,0)],0,
        global.animationstartX[p2,sid]+8+under_frx*under_trusprw+splitpadding,
        global.animationstartY[p2,sid]+usedskin_offsety+under_fry*under_trusprh,
        under_trusprw-1,under_trusprh-1,
        round(x+(under_fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc+under_xoffset*(xsc/divisio)*pxsc*mxsc), //XSC =direction PXSC = Pipe Squishing MXSC=Modifiable XSC
        round(y+(under_foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*pysc*mysc+14+under_yoffset*(ysc/divisio)*pysc*mysc),
        (xsc/divisio)*pxsc*mxsc,(ysc/divisio)*pysc*mysc,
        c,alpha*(1-0.75*shadow)
    )
}

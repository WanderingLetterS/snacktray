//automatically handles sprite drawing for 2.0 sheet format

var k,frs,frl,c;
//if sometehing fucks up readd frx and fry to here or some shit
if (argument[0]) {//animate
    k=16+128*sid
    if (sprite!=oldspr || size!=likesizebutold)
    frn=global.animdat[p2,k+1+size] //frame number //thats hardcoded size values GEEEET OOOOUT
    frs=(frspd*animf*global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_SPEED])/max(1,global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_FRAMETIMES+floor(frame)]) //(game speed * percent * sprite speed) / frame time
    frl=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_LOOP]-1 //loop point

    fox=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_OFFX]
    foy=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_OFFY]

    if (water && !cantslowanim) frs*=wf
    if (piped!=2) frame+=frs
    if (frame<0) frame+=frn
    if (frame>=frn) {frame=frame-frn if (frl<frn) frame+=frl}

    if (sprite!=oldspr) && (prevent_spr_reset) {
        frame=frl
        prevent_spr_reset=0
    }
    if global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXWIDTH]{
        trusprw=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXWIDTH]

    } else trusprw=sprw[size]
    if global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXHEIGHT]{
        trusprh=global.animdat[p2,k+MAXIMUMSIZESARGH+DAT_BOXHEIGHT]

    } else trusprh=sprh[size]
    frame=modulo(precise(frame),0,frn)
    likesizebutold=size
} else {//draw
    //under sprite.
        if use_under_sprite{
            if under_sprite!=""
            ssw_undercore(0)
        }



    c=blend
    if !blend c=$ffffff
    usedskin_offsety=skin_offsety
    drawsize=global.reroutedsizes[p2,size]
    frx=floor(frame)
    //global.animationstartX[p2,sid+ypos]

    fry=0
    //global.animationstartY[p2,sid+ypos]
    splitpadding=0
    //global.spritelistpadding[p2,sid+ypos]
    drawsheetsize=drawsize
    if global.singlesheet[p2]{
        splitpadding+=global.singlesheetsplitwidth[p2,drawsize]
        usedskin_offsety+=global.singlesheetsplitheight[p2,drawsize]
        //Make sure we only draw sheet 0
        drawsheetsize=0
    }

    i=0


    charm_run("effectsbehind")
    if object_index!=afterimage
    if usepalette {if allpal1{
    scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,global.pal_1[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)


    } else scr_applyPaletteSegmentedAlpha(global.shaderPaletteSwapAlpha,global.palettesprites[p2*100],global.pal_1[p2]+1,global.pal_2[p2]+1,global.pal_3[p2]+1,global.pal_4[p2]+1,size,alpha*(1-0.75*shadow),totpal+1)
    }
    divisio=1 multiplicio=0
    if (size==0 && shortsmallform!=0) {divisio=1/shortsmallform  if !global.singlesheet[p2] multiplicio=-1}
    else if (size==5 && !minisheet) {divisio=1.75 /*like sonic boll 1.9*/ /*no its not thats not even a 9*/ multiplicio=5 }



    if (sprite_angle!=0) draw_sprite_general(
    //  sprite, subimage
        sheets[max(drawsheetsize-multiplicio,0)],0, //deepest apologies -moster //that doesnt even multiply what -also moster
    //  left, top
        +8+frx*trusprw+global.animationstartX[p2,sid]+margin+splitpadding,
        usedskin_offsety+global.animationstartY[p2,sid]+fry*trusprh+margin,
    //  width, height
        trusprw-1-margin*2,trusprh-1-margin*2,
    //  left top corner of the quad, accounting for rotation
        round(x)+lengthdir_x((margin+fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc,sprite_angle)+lengthdir_x((margin+foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,sprite_angle-90),
        round(y)+lengthdir_y((margin+fox-sprcx[drawsize])*(xsc/divisio)*pysc*mysc,sprite_angle)+lengthdir_y((margin+foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*mysc+14,sprite_angle-90),
    //  scale and rotation
        (xsc/divisio)*pxsc*mxsc,(ysc-((size==5 && !minisheet)/2))*pysc,sprite_angle,
    //  blending
        c,c,c,c,alpha*(1-0.75*shadow)
    )
    else draw_sprite_part_ext(
        sheets[max(drawsheetsize-multiplicio,0)],0,
        8+frx*trusprw+global.animationstartX[p2,sid]+splitpadding,
        usedskin_offsety+global.animationstartY[p2,sid]+fry*trusprh,
        trusprw-1,trusprh-1,
        round(x+(fox-sprcx[drawsize])*(xsc/divisio)*pxsc*mxsc), //XSC =direction PXSC = Pipe Squishing MXSC=Modifiable XSC
        round(y+(foy+dy-(14+sprcy[drawsize]))*(ysc/divisio)*pysc*mysc+14),
        (xsc/divisio)*pxsc*mxsc,(ysc/divisio)*pysc*mysc,
        c,alpha*(1-0.75*shadow)
    )


    draw_left=8+frx*trusprw+splitpadding+global.animationstartX[p2,sid]
    draw_top=usedskin_offsety+fry*trusprh+global.animationstartY[p2,sid]

    if usepalette shader_reset();

    if use_over_sprite{
            if over_sprite!=""
            ssw_overcore(0)
        }

    //if (shadow) d3d_set_fog(0,0,0,0)
    charm_run("effectsfront")

}


draw_sprite_ext(spr,frame,x*16+off+off2x,y*16+off+off2y,1,1,0,c_white,draw_get_alpha())

switch(obj) {

    case (customobject):{
        if !variable_global_get("cobject_code_"+string(data[0])) {
            if !file_exists(globalmanager.moddir+"object\"+string(data[0])+"\object.gml") {break}
            else {
                variable_global_set("cobject_code_"+string(data[0]),code_compile(file_text_read_all(globalmanager.moddir+"object\"+string(data[0])+"\object.gml")))
                my_code=variable_global_get("cobject_code_"+string(data[0]))
            }
        } else {
            my_code=variable_global_get("cobject_code_"+string(data[0]))

        }
        global.cobjectentrypoint="lemon_display"

        code_execute(my_code)




    } break

    case (tyler):
    case (objectstyler):
    case (terraintyler):
    case (decortyler): {
        for (i=0;i<ur;i+=1) for (j=0;j<vr;j+=1) {
            if (flip=0) draw_background_part_ext(sheet,l,t,w,h,u+i*w,v+j*h,1,1,col,0.5)
            if (flip=1) draw_background_part_ext(sheet,l,t,w,h,u+(i+1)*w,v+j*h,-1,1,col,0.5)
            if (flip=2) draw_background_part_ext(sheet,l,t,w,h,u+i*w,v+(j+1)*h,1,-1,col,0.5)
            if (flip=3) draw_background_part_ext(sheet,l,t,w,h,u+(i+1)*w,v+(j+1)*h,-1,-1,col,0.5)
        }
    } break

    case (itemlaunch): {
        draw_sprite(spr_itemspawner,11,(x*16)+8,(y*16)+8) break;
    }

    case (spawncancel): if (point) {
        draw_set_color($ff)
        draw_arrow(x*16,y*16+8,point.x*16+16,point.y*16+8,8)
        draw_set_color($ffffff)
    } break

    case (textblock): {
        global.halign=align
        draw_skintext(x*16,y*16,data[0],col)
        global.halign=0
    } break

    case (pipeblock):
    case (sidepipe):
    case (downpipe):
    case (theothersidepipe):
    case (door):
    case (warpbox): {
        if (point) {
            draw_set_color($ff)
            draw_arrow(x*16+8,y*16+8,point.x*16+8,point.y*16+8,8)
            draw_set_color($ffffff)
        }
        if (point2) {
            draw_set_color($ff00)
            draw_arrow(x*16+8,y*16+8,point2.x*16+8,point2.y*16+8,8)
            draw_set_color($ffffff)
        }
    } break

    case (axe): if (point) {
        draw_set_color($ff)
        draw_arrow(x*16+8,y*16+8,point.x*16+8,point.y*16+8,8)
        draw_set_color($ffffff)
    } break

    case (activate_region): {
        rect(x*16+off+off2x,y*16+off+off2y,real(data[1])*16,real(data[2])*16,c_navy,0.5) //Not finding out if every object gets "col" Lol
    } break

    case (fbarblock): {
        if (fire) {
            if (clock) {for (i=0;i<6+6*long;i+=1) draw_sprite(spr_firebar,0,x*16+8+6*i,y*16+8-6*i)}
            else {for (i=0;i<6+6*long;i+=1) draw_sprite(spr_firebar,0,x*16+8-6*i,y*16+8-6*i)}
        }
    } break
    case (platform): {
        if (sub) {
            draw_circle(x*16+8,(y-height)*16+16,8,1)
            draw_circle(sub.x*16-8,(y-height)*16+16,8,1)
            draw_line(x*16,(y-height)*16+16,x*16,y*16)
            draw_line(sub.x*16,(y-height)*16+16,sub.x*16,sub.y*16)
            draw_line(x*16+8,(y-height)*16+8,sub.x*16-8,(y-height)*16+8)
        }
    } break
    case (axewall): if (point) {
        draw_set_color($ff)
        d=point_direction(x,y,point.x,point.y)
        draw_arrow(x*16+8,y*16+8,x*16+8+lengthdir_x(32,d),y*16+8+lengthdir_y(32,d),8)
        draw_set_color($ffffff)
    } break
    case (mark): if frame==0{ draw_omitext(x*16,y*16+4,data[0])} break
    case (anchor): { draw_omitext(x*16,y*16+4,data[0])} break

    case (retainer): {
        if (data[0]="") draw_sprite_part(skindat("tex_princess0"),0,8,8,112,112,x*16-32,y*16-88+skindat("prin"))
    } break
    case (ireader): {
        draw_sprite(spr_ireader,1,srcx*16,srcy*16)
        draw_set_color($ff) if (selected) draw_set_color($ffffff)
        draw_arrow(x*16+8,y*16+8,srcx*16+8,srcy*16+8,8)
        draw_set_color($ffffff)
    } break

    case (obj=gobble): {
        draw_sprite(spr_ireader,1,srcx*16,srcy*16)
        draw_sprite(spr_ireader,1,srcx2*16,srcy2*16)
        draw_set_color($ff) if (selected) draw_set_color($ffffff)
        draw_arrow(x*16+8,y*16+8,srcx*16+8,srcy*16+8,8)
        draw_arrow(x*16+8,y*16+8,srcx2*16+8,srcy2*16+8,8)
        draw_set_color($ffffff)
    } break

    case (fakesemiplat): {
        rect(x*16,y*16,real(data[1])*16,real(data[2])*16,col,0.5)
    } break

    case (lightbulb): {
        rect((x*16)-((real(data[2])*16)/2)+8,(y*16)-((real(data[3])*16)/2)+8,real(data[2])*16,real(data[3])*16,$00c3f4,0.5)
    } break

    case (detector): {
        rect(x*16+5,y*16,6,real(data[3])*8,col,0.5)
    } break

    case (gate): {
        rect(x*16+5,y*16,6,real(data[2])*16,col,0.5)
    } break

    case (sidegate): {
        rect(x*16,y*16+5,real(data[2])*16,6,col,0.5)
        draw_sprite(spr_sidegate,0,(x*16)+(real(data[2])-1)*16,y*16)
    } break
}

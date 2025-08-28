if (spindash) { //spindust
    spindust+=0.5
    spindust=wrap_val(spindust,0,7)
    draw_sprite_part_ext(sheets[6],0,sprite_get_width(sheets[6])-222+27*(floor(spindust)),159,26,20,round(x-27*xsc),round(y-5)+dy,xsc,1,$ffffff,alpha)
}else spindust=0

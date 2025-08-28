if (global.debug || keyboard_check(vk_f12)) {
    p=players[view_current]
    draw_systext(x+4,y+196,"f: "+string_format(global.pfps,3,1)+"#s: "+string(global.spd)+"#c: "+string(instance_count))

    if (room=game) {
        draw_systext(x+24,y+32,"frm: "+string(global.pos))

        draw_set_color($ff00ff)
        draw_set_alpha(0.5)
        draw_line(x,p.y,x+400,p.y)
        draw_line(p.x,y,p.x,y+224)
        draw_set_alpha(1)
        draw_set_color($ffffff)
    }

    //surface debugger
    for (i=0;i<16;i+=1) if (surface_exists(i)) {
        rect(view_xview[0]+i*24,view_yview[0],24,16,$ff00ff,1)
        if (within(mouse_x/global.s,mouse_y/global.s,i*24,0,24,16)) {
            rect(view_xview[0]+i*24,view_yview[0],128,128,$ff00ff,1)
            draw_surface_stretched(i,view_xview[0]+i*24,view_yview[0],128,128)
            draw_systext(view_xview[0]+8,view_yview[0]+8,"surface "+string(i)+"#"+string(surface_get_width(i))+" x "+string(surface_get_height(i)))
            break
        } else draw_surface_stretched(i,view_xview[0]+i*24,view_yview[0],24,16)
    }
} else if (global.spd=999) draw_systext(x+24,y+48,"fast: "+string_format(global.pfps,3,1))

if (global.debug && keyboard_check(vk_f8)) {
    draw_line_color(view_xview[0],view_yview[0]+224-60,view_xview[0]+400,view_yview[0]+224-60,$ff0000,$ff0000)
    for (i=0;i<400;i+=1) draw_line(view_xview[0]+i,view_yview[0]+224,view_xview[0]+i,view_yview[0]+224-round(globalmanager.graph[i]))
}

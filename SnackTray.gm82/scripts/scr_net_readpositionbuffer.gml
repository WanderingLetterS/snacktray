///Make sure this is called inside the player/otherpc objects!!

    if object_index!=obj_otherpc my_id=global.my_id

    if global.readingid==my_id{
        if object_index!=obj_otherpc {
        netx=buffer_read_float(global.netbuffer)
        nety=buffer_read_float(global.netbuffer)
        } else{
        x=buffer_read_float(global.netbuffer)
        y=buffer_read_float(global.netbuffer)
        }
        netroom=buffer_read_i8(global.netbuffer)

        if netroom==game
        scr_net_readdrawbuffer()


        if netroom!=room visible=0
        else visible=1

        //z=buffer_read_float(global.netbuffer)
        //angle=buffer_read_i16(global.netbuffer)
        return 1
    }
    return 0

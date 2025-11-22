



surface_width=buffer_read_i32(global.netbuffer)
surface_height=buffer_read_i32(global.netbuffer)
buffer_surfacesize=buffer_read_i32(global.netbuffer)

if !buffer_exists(global.anotherbufferimsorry)
global.anotherbufferimsorry=buffer_create()
else buffer_clear(global.anotherbufferimsorry)


positionofthebuffering=buffer_get_pos(global.netbuffer)


depth=1


buffer_copy_part(global.anotherbufferimsorry,global.netbuffer,positionofthebuffering,buffer_surfacesize)


buffer_thedatainquestion=buffer_read_data(global.netbuffer,buffer_surfacesize)

if !(!obj_networkcontroller.net_host && my_id==global.my_id) && room==game{
//If i'm not the host, and like, this is my own data... I dont actually want to create a surface here.


buffer_set_surface(
    global.anotherbufferimsorry,
    sureface("onlineplayer_"+string(my_id),surface_width,surface_height)


)

}

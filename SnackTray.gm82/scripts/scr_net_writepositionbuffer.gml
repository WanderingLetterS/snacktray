if object_index!=obj_otherpc my_id=global.my_id

buffer_write_i8(global.netbuffer,my_id)
buffer_write_float2(global.netbuffer,x,y)
buffer_write_i8(global.netbuffer,room)

if object_index==player{
buffer_write_i32(global.netbuffer,(sprw[drawsize]-1)*2)
buffer_write_i32(global.netbuffer,(sprh[drawsize]-1)*2)

buffer_write_i32(global.netbuffer,buffer_get_size(global.netbufferplayer))
buffer_copy(global.netbuffer,global.netbufferplayer)
buffer_clear(global.netbufferplayer)


}else if object_index==obj_otherpc{
    buffer_write_i32(global.netbuffer,surface_get_width(sureface_get("onlineplayer_"+string(my_id))))
    buffer_write_i32(global.netbuffer,surface_get_height(sureface_get("onlineplayer_"+string(my_id))))
    buffer_write_i32(global.netbuffer,buffer_surfacesize)
    buffer_write_data(global.netbuffer,buffer_thedatainquestion)




}

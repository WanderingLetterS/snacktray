///scr_net_hostsendbuffer(global.netbuffer)
var i;

i=0
repeat (global.netplayertotal){

    socket_write_data(global.hostsockets[i],argument[0])
    socket_send(global.hostsockets[i])
    i+=1

}

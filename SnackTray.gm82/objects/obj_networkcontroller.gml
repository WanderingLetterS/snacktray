#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.netbuffer=buffer_create()
global.netsocket=socket_create()
global.netlisten=listener_create()

sureface("playersurf",12,12)

heyhey=""


net_started=false
net_host=false
global.netplayertotal=0
global.drawplayershare=1

global.netbufferplayer=buffer_create()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///host shit
var j;
if net_started && net_host{
    global.my_id=0
    if listener_pending(global.netlisten){
        global.netplayertotal+=1
        with instance_create(0,0,obj_otherpc){
                my_id=global.netplayertotal
                my_socket=socket_create()
                global.hostsockets[global.netplayertotal-1]=my_socket
                global.socketidtoobject[global.netplayertotal-1]=id
                listener_accept(global.netlisten,my_socket)

            }




    }else {




        //I try and recieve.  << probably important to make sure i dont just up an dignore someone's attempts at moving.
        
        j=0
        
        repeat(global.netplayertotal){
            if socket_receive(global.hostsockets[j]){

                buffer_clear(global.netbuffer)
                socket_read_data(global.hostsockets[j],global.netbuffer,socket_get_receiving_size(global.hostsockets[j]))
                
                switch (buffer_read_i8(global.netbuffer)){
                    case NET_YOUREIN://Okay im resending
                        buffer_clear(global.netbuffer)
                        if global.drawplayershare 
                        buffer_write_i8(global.netbuffer,NET_YOUREININTENSIVE)
                        else buffer_write_i8(global.netbuffer,NET_YOUREIN)
                        buffer_write_i8(global.netbuffer,global.netplayertotal)
                        scr_net_hostsendbuffer(global.netbuffer)          
                          
                    
                    break;
                    case NET_POSITION: //Updating positions...
                        repeat(global.netplayertotal+1){
                            found=0
                            global.readingid=buffer_read_i8(global.netbuffer)
                            //Due to any given reason, a player can sned another's coordiantes by accident. Let's uh, let's not let them do that!!!!
                            if global.readingid=(j+1)
                            with global.socketidtoobject[j] {
                                scr_net_readpositionbuffer()
                            }
                        }


                    break

                    case NET_PLAYERDRAW: //Updating surface
                        if room==game
                        repeat(global.netplayertotal+1){
                            found=0
                            global.readingid=buffer_read_i8(global.netbuffer)
                            //Due to any given reason, a player can sned another's coordiantes by accident. Let's uh, let's not let them do that!!!!
                            if global.readingid=(j+1)
                            with global.socketidtoobject[j] {
                                scr_net_readdrawbuffer()
                            }
                        }


                    break
                }
            }

            j+=1

        }



    //My turn to send!!!!!
    buffer_clear(global.netbuffer)
    buffer_write_i8(global.netbuffer,NET_POSITION)
    if room!=game{
    with genericcursor if p2==0 scr_net_writepositionbuffer()
    }else with player scr_net_writepositionbuffer()
    with obj_otherpc scr_net_writepositionbuffer()



    scr_net_hostsendbuffer(global.netbuffer)

    }



}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///client shit
var check;
if net_started && !net_host{

    //THIS IS ME WHEN I RECIEVE DATA
    if socket_receive(global.netsocket){
        buffer_clear(global.netbuffer)
        socket_read_data(global.netsocket,global.netbuffer,socket_get_receiving_size(global.netsocket))
        FUCKYOU=buffer_read_i8(global.netbuffer)

        switch (FUCKYOU){
            //case 0:{
            //    game_end()
            //
            //
            //break;}
            case NET_YOUREININTENSIVE:
                global.drawplayershare=1

            case NET_YOUREIN://I'm in!
                global.netplayertotal=buffer_read_i8(global.netbuffer) 
            
                
                if global.my_id==0 global.my_id=global.netplayertotal
                
                i=0
                
                
                repeat(global.netplayertotal) {
                        
                    if i== global.my_id i+=1
                    check=0
                    with obj_otherpc {
                        if my_id==other.i check=1
                    }
                
                    if !check
                    with instance_create(0,0,obj_otherpc){
                        my_id=other.i
                        
                    }
                    i+=1
                }
               
            break
            case NET_POSITION://Read and set positions.
               
                //
                repeat(global.netplayertotal+1){
                     found=0
                    global.readingid=buffer_read_i8(global.netbuffer)
    
    
                    with obj_otherpc {
                            if other.found==0
                            other.found=scr_net_readpositionbuffer()
                        }
                    if !found{
                        if room!=game{
                        with genericcursor other.found=scr_net_readpositionbuffer()
                        }else with player other.found=scr_net_readpositionbuffer()
                    
                    }
                    //if !found show_message("Object corresponding to sent position: " + string(global.readingid)+  " not found.")
                    
                }
            break

        }
    }
    

    //THIS IS ME WHEN I SEND MY OWN DATA DUDE
    
    buffer_clear(global.netbuffer)

    if global.netplayertotal==0 {
         buffer_write_i8(global.netbuffer,NET_YOUREIN)


     }
    else{
        buffer_write_i8(global.netbuffer,NET_POSITION)
        if room!=game{
            with genericcursor if p2==0 scr_net_writepositionbuffer()
            }else with player scr_net_writepositionbuffer()

    }
    
    socket_write_data(global.netsocket,global.netbuffer)

    socket_send(global.netsocket)


     buffer_clear(global.netbuffer)

   


}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///GOD.
//global.drawplayershare=0
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Client electing to fucking leave.

if net_started{
    buffer_clear(global.netbuffer)


    buffer_write_i8(global.netbuffer,NET_IMLEAVING)
    buffer_write_i8(global.netbuffer,obj_player.my_id) //imma do you a solid, at least.

    socket_write_data(global.netsocket,global.netbuffer)

    socket_send(global.netsocket)


    buffer_clear(global.netbuffer)

    socket_destroy(global.netsocket)
    buffer_destroy(global.netbuffer)

}

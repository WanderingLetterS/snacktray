//this script adapts rooms for the current number of players

getwindowsize()

rm=room_first
do {
    if (rm!=lemon && !(rm=speciale && !instance_exists(moranboll)))
        room_set_view(rm,0,1,0,0,global.screenwidth,global.screenheight,0,0,global.screenwidth*s,global.screenheight*s,0,0,0,0,noone)
    if (rm=scoring || rm=game || rm=change) {
        room_set_view(rm,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        room_set_view(rm,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        room_set_view(rm,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

        if (global.mplay=2 && global.gamemode!="sscreencoop") {
            room_set_view(rm,0,1,0,0,global.screenwidth,global.screenheight,0,0,global.screenwidth,global.screenheigh,0,0,0,0,noone)
            room_set_view(rm,1,1,0,0,global.screenwidth,global.screenheight,0,global.screenheight,global.screenwidth,global.screenheight,0,0,0,0,noone)
        }
        if (global.mplay=3  && global.gamemode!="sscreencoop") {
            room_set_view(rm,1,1,0,0,global.screenwidth,global.screenheight,global.screenwidth,0,global.screenwidth,global.screenheight,0,0,0,0,noone)
            room_set_view(rm,2,1,0,0,global.screenwidth,global.screenheight,global.screenwidth,global.screenheight,global.screenwidth,global.screenheight,0,0,0,0,noone)
        }
        if (global.mplay=4  && global.gamemode!="sscreencoop") {
            room_set_view(rm,0,1,0,0,global.screenwidth,global.screenheight,0,0,global.screenwidth/2,global.screenheight/2,0,0,0,0,noone)
            room_set_view(rm,1,1,0,0,global.screenwidth,global.screenheight,global.screenwidth/2,0,global.screenwidth/2,global.screenheight/2,0,0,0,0,noone)
            room_set_view(rm,2,1,0,0,global.screenwidth,global.screenheight,0,global.screenheight/2,global.screenwidth/2,global.screenheight/2,0,0,0,0,noone)
            room_set_view(rm,3,1,0,0,global.screenwidth,global.screenheight,global.screenwidth/2,global.screenheight/2,global.screenwidth/2,global.screenheight/2,0,0,0,0,noone)
        }
    }

    rm=room_next(rm)
} until (rm=-1)

room_set_view(credroll,0,1,0,0,global.screenwidth,global.screenheight,0,0,global.screenwidth*s,global.screenheight*s,0,0,0,0,noone)
room_set_view(lemon,0,1,0,0,rw,rh,0,0,rw,rh,0,0,0,0,noone)
if (!instance_exists(moranboll)) room_set_view(speciale,0,1,0,0,rw,rh,0,0,rw,rh,0,0,0,0,noone)

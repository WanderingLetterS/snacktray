mychance=irandom_range(1,7)
if mychance >= 4 && mychance <= 7 && !global.globalmanagerdiedlmfao {
    stats("level selects found",stats("level selects found")+1)

    d3d_set_projection_ortho(0,0,400,224,0)
    d3d_transform_add_translation(-1*(400/window_get_region_width()),-1*(224/window_get_region_height()),0)

    rect(0,0,401,225,c_black,1)

    screen_refresh() //i'm not sure how much of the io stuff down here is needed but before i added it the game became unplayable on the congrats screen
    sleep(120)
    FMODAllStop()
    mus_volume(1)
    sleep(440)
    d3d_transform_set_identity()
    io_handle()
    room_goto(bundleroster)
    io_clear()
    exit
}

FMODAllStop()
FMODSoundPlay(FMODSoundAdd(global.cache+"media\cloudcones.xm",2),0)
global.crashing=1
error(lang("error fatal"))
game_end()
global.kill=1

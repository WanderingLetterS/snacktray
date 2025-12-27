///error(message)
//This pauses the game and shows an error message

if (!instance_exists(globalmanager) || global.kill) exit
if keyboard_check(vk_f2) exit
if keyboard_check(vk_f12) {show_message(argument[0]) exit}
stats("errors seen",stats("errors seen")+1)

if (room=lemon || global.debug) {show_message(wordwrap(argument[0],50)) exit}
t=""
if global.crashing t="crash "

global.halign=0
mus_pause(1)

d3d_set_projection_ortho(0,0,global.screenwidth+1,global.screenheight+1,0)
//d3d_transform_add_translation(-1*(global.screenwidth/window_get_region_width()),-1*(global.screenheight/window_get_region_height()),0)

var errcolor;
errcolor = $ff0000
if (global.greenmode) {
    errcolor = $00ff00
}

if gamemanager.pause{
    rect(0,0,global.screenwidth+1,global.screenheight+1/4,errcolor,0.5)
    draw_systext(0,0,wordwrap(argument[0],58))

}else {
    //show_message(argument[0])
    game_pause()
    rect(0,0,global.screenwidth+1,global.screenheight+1,errcolor,0.5)
    draw_systext(16,16,wordwrap(argument[0],46))


    screen_refresh()
    //sleep(100)
    draw_systext(16,192,wordwrap(lang("error "+t+"press"),46))
    d3d_transform_set_identity()
    screen_refresh()
    io_clear()
    do {
        //sleep(50)
        io_handle()
    } until (keyboard_check(vk_anykey) || global.kill)
    if (keyboard_check(vk_escape)) {system_end() exit}
    if (keyboard_check(vk_f9)) system_screenshot(1)
    if (keyboard_check(vk_f10)) room_goto(lemon)
    io_clear()
    mus_pause(0)
    game_unpause()
}

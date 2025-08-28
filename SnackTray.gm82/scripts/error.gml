///error(message)
//This pauses the game and shows an error message

if (!instance_exists(globalmanager) || global.kill) exit

stats("errors seen",stats("errors seen")+1)

if (room=lemon || global.debug) {show_message(wordwrap(argument[0],50)) exit}
t=""
if global.crashing t="crash "

global.halign=0
mus_pause(1)

d3d_set_projection_ortho(0,0,400,224,0)
d3d_transform_add_translation(-1*(400/window_get_region_width()),-1*(224/window_get_region_height()),0)

var errcolor;
errcolor = $ff0000
if (global.greenmode) {
    errcolor = $00ff00
}

rect(0,0,401,225,errcolor,0.5)
draw_systext(16,16,wordwrap(argument[0],46))
screen_refresh()
sleep(500)
draw_systext(16,192,wordwrap(lang("error "+t+"press"),46))
d3d_transform_set_identity()
screen_refresh()
io_clear()
do {
    sleep(50)
    io_handle()
} until (keyboard_check(vk_anykey) || global.kill)
if (keyboard_check(vk_escape)) {system_end() exit}
if (keyboard_check(vk_f9)) system_screenshot(1)
if (keyboard_check(vk_f10)) room_goto(lemon)
io_clear()
mus_pause(0)

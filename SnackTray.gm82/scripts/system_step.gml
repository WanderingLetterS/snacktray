global.ignorejoy=0

//fix for background game process on error during room change
if (global.kill) {game_end() exit}

//crash if boot room after gamestart
if (room=boot) {if (started) system_crash()} else started=1

mus_update()
debug_update()
input_update()

//replace spr_unknown if it is deleted
if !sprite_exists(spr_unknown) sprite_assign(spr_unknown,spr_unknown_bak)

//closing animation
if (fadekill) {
    volkill=max(0,volkill*0.9)
    mus_volume(volkill)
    FMODMasterSetVolume(volkill)
    if (volkill<=0.025) system_end()

    getwindowsize()

    fadekillbob=!fadekillbob
    if (fadekillbob) {
        window_set_region_scale(1,1)
        window_set_region_size(rw*s,ceil(rh*s*sqr(volkill)),1)
        window_center()
    } else {
        draw_clear(merge_color(0,$ffffff,1-volkill))
        window_set_color(merge_color(0,$ffffff,1-volkill))
        screen_refresh()
    }
    exit
}

if (input_esc() && !instance_exists(console)) menu_cancel()
if (keyboard_check_pressed(vk_tab)) if (!instance_exists(console)) {
    if (instance_exists(gamemanager)) {
        if (!gamemanager.pause) instance_create(0,0,console)
    } else instance_create(0,0,console)
}

if (global.fuzzy) {
    FMODInstanceSetPitch(globalmanager.handle,(4+2*(sin(global.bgscroll/100)*sin(global.bgscroll/63)*sin(global.bgscroll/14)*sin(global.bgscroll/13)))/6)
    room_speed=max((round(40+20*(sin(global.bgscroll/100)*sin(global.bgscroll/63)*sin(global.bgscroll/14)*sin(global.bgscroll/13)))) / 60 * global.spd, 5)
    if (!irandom(64)) window_set_position(window_get_x()+irandom_range(-10,10),window_get_y()+irandom_range(-10,10))
}

//wacko gm8 close button detection
//look at global game settings/other
//notice the Esc checkboxes :)
if (keyboard_check(vk_escape)) {if (!esc && !keyboard_check_pressed(vk_escape)) menu_closebutton() esc=1} else esc=0

if (keyboard_check_pressed(vk_f1)) ping(roomtip())
if (keyboard_check_pressed(vk_f9)) screenshot=1
if (keyboard_check_pressed(vk_f12)) global.hidereplayui=!global.hidereplayui

if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    settings("fullscreen",!settings("fullscreen"))
    windowhandler()
    io_clear()
} else if (keyboard_check_pressed(vk_f11)) {
    if (room=lemon) {
        editwindowsize()
    } else if (room=speciale) {
        settings("fullscreen",!settings("fullscreen"))
        windowhandler()
        io_clear()
    } else {
        if (settings("fullscreen")) {settings("fullscreen",0) settings("zoom",1)}
        else if (settings("zoom")=1) settings("zoom",2)
        else if (settings("zoom")=2) settings("zoom",3)
        else settings("fullscreen",1)
        windowhandler()
    }
}

if (settings("checkres")) {
    if (global.s!=settings("mems")) windowhandler()
    settings("checkres",0)
}

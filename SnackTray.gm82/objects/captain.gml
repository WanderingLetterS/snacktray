#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
comeon='boll-team.itch.io/boll-deluxe' // "green link" uh yeah hes been like that since the nes
falcon=0 // whether to move on to the title screen
punch=0 // alpha
kick=0 // object timer (controls skipping the screen)
yes=1 // whether to fade in or out
showmeyamoves=0 // fade-out timer
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (falcon) {
    visible=0
    initskin()
    mus_init(1)
    input_init()
    global.douglas=1
    room_goto_next()
    falcon=0
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=boot) {
    if (((keyboard_check_pressed(vk_anykey) && keyvalid(keyboard_key) || mouse_check_button_pressed(mb_any)) || keyboard_check_pressed(vk_escape)) && kick>23) falcon=1
    kick+=1
    if (yes) punch=min(1,punch+0.02)
    else punch=max(0,punch-0.02)

    if (punch=1) {
        showmeyamoves+=1
        if (showmeyamoves=90) {
            showmeyamoves=0
            yes=0
        }
    }
    if (punch=0) {
        yes=1
        falcon=1
    }
    draw_sprite_ext(spr_gm82splash,0,x,112,1,1,0,$ffffff,punch)
    global.halign=1
    global.valign=1
    draw_systext(x,216,comeon,$a300,punch)
    global.halign=0
    global.valign=0
}

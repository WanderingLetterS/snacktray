with (globalmanager) {
    if (global.lemontest && room=game) {segafadeto(lemon,"systemreturn") exit}
    if (errorstate) {system_end() exit}
    if (room=lemon||room=worldlemon) {if (!drawregion.unchanged) if (!show_question("You have unsaved changes!##Discard?")) exit}

    savemovie()
    fadekill=1
    volkill=1
    if (window_get_fullscreen()) window_set_visible(0)
    else window_set_showborder(0)
    room_speed=60
}

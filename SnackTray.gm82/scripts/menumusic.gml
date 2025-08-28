if (room=lemon) {
    if !(settings("nolemonmusic")) {
        if (settings("lemonmusic")!="") mus_play("editor",1)
        else mus_play("_editor",1)
    }
} else {
    if (settings("menumusic")!="") mus_play("options",1)
    else mus_play("_options",1)
}

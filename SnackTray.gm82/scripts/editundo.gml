with (editmanager) {
    if (undocount=0) {FMODSoundPlay(winding) exit}
    global.lemonjustundone=1

    io_clear()
    game_load(global.tempdir+"undo"+string(undocount-1)+".gms")
}

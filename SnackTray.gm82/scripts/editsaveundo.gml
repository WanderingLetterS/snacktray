with (editmanager) {
    //with(drawregion) {
    //    UPDATE_THE_DEITIES=1 event_user(7)
    //}
    game_save(global.tempdir+"undo"+string(undocount)+".gms")
    //we increase the counter after saving so that they chain load correctly
    undocount+=1
}

///mus_stop()
//stops all music

with (globalmanager) {
    if (handle!=-1) FMODInstanceStop(handle)
    handle=-1
}

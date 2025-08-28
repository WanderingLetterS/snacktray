///system_end()
//close the game safely

window_set_fullscreen(0)
window_set_visible(0)
discord_free_app()
discord_free_dll()
global.kill=1
saveopt()

file_delete(global.tasfile)
file_delete(global.tmpfile)

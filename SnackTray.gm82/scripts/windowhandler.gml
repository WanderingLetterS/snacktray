///windowhandler()
//updates window size and location
var changed;

getwindowsize()

if (abs((rw/rh)-(dw/dh))<0.15) {window_set_region_scale(0,1) global.fool=settings("fullscreen")}
else {window_set_region_scale(-1,1) global.fool=0}

window_set_fullscreen(settings("fullscreen"))

roomviewshandler()

viewhandler(s)

global.w=rw
global.h=rh
global.s=s

globalmanager.alarm[1]=1
gamemanager.crash_detect=0
game_save(global.tmpfile)
viewhandler(1) // Fixes the window resizing strangely upon room start
//fix so that the window only flickers once when you load a state
if (settings("checkres")) savetas()
game_load(global.tmpfile)

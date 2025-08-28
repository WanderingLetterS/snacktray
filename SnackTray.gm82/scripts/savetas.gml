var mem,mem2;

with (globalmanager) {
    viewhandler(s)
    alarm[1]=1
}
with player {if global.wanna resetbuf=1}
global.bufpos=getpos(0,global.keylog)
playmusic=2
mem=global.music
mem2=borda
borda=0
global.music=""
gamemanager.crash_detect=0
game_save(global.tasfile)
with (globalmanager) {  //viewhandler(s) causes the screen to resize strangely on this frame, so pretend that the screen is 1x here.
    viewhandler(1)
}
global.music=mem
borda=mem2
playmusic=0

///checkend()
//checks if the movie ended, and stops.

if (global.playback && global.pos>global.length) {
    mus_stop()
    stop=1
    discardmovie()
    return 1
}
return 0

for (i=0;i<global.mplay;i+=1) {
    stats("highscore",          max(stats("highscore"),global.scores[0,i]))
    stats("total score",        stats("total score")        +global.scores[0,i])
    stats("enemies defeated",   stats("enemies defeated")   +global.scores[1,i])
    stats("blocks broken",      stats("blocks broken")      +global.scores[2,i])
    stats("items collected",    stats("items collected")    +global.scores[6,i])
    stats("frags given",        stats("frags given")        +global.scores[7,i])
    stats("total deaths",       stats("total deaths")       +global.scores[8,i])
}

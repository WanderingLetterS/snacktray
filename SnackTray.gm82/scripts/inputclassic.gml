//stores player points for final score after classic

with (gamemanager) {
    global.scores[0,0]=global.scor[0]
    global.scores[1,0]+=players[0].enemyc
    global.scores[2,0]+=players[0].blockc
    global.scores[3,0]=0
    global.scores[4,0]+=players[0].coinc*100
    global.scores[5,0]+=players[0].timeend
    global.scores[6,0]+=players[0].itemc
    global.scores[7,0]=0
    global.scores[8,0]+=players[0].deaths

    if (players[0].name="kid") global.scores[8,0]=settings("kiddeath")

    global.size[0]=players[0].size
    global.shielded[0]=players[0].shielded
}

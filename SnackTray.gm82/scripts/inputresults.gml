//stores player points for results screen

var i;
for (i=0;i<global.mplay;i+=1) {
    global.scores[0,i]=global.scor[i] global.scor[i]=0
    global.scores[1,i]=players[i].enemyc
    global.scores[2,i]=players[i].blockc
    global.scores[3,i]=players[i].coinc*100+global.coins[i] global.coins[i]=0
    global.scores[4,i]=players[i].coint
    global.scores[5,i]=players[i].timeend
    global.scores[6,i]=players[i].itemc
    global.scores[7,i]=players[i].frags
    global.scores[8,i]=players[i].deaths
}

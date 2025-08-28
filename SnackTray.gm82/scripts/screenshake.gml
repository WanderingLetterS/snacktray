///screenshake(x,amount)
//falloff mode is linear with r=200

with (gamemanager) for (i=0;i<global.mplay;i+=1) {
    shake[i]=ceil(argument[1]*(max(0,200-abs(players[i].x-argument[0]))/200))
}

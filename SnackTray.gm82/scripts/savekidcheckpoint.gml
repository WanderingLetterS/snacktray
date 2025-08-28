//remove volatile properties before saving a state so that
//when the kid respawns at a checkpoint it looks right

with (scoreeffect) y-=verybignumber
with (stareffect) y-=verybignumber
player.flash=1
mem1=player.star player.star=0
mem2=player.alarm[2] player.alarm[2]=0
mem3=player.alarm[3] player.alarm[3]=0

with (gamemanager) savetas()

with (scoreeffect) y+=verybignumber
with (stareffect) y+=verybignumber
player.star=mem1
player.alarm[2]=mem2
player.alarm[3]=mem3

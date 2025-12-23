if (gamemanager.timedead) exit
with (axe) if (o) exit

x=safex
y=safey
while (place_meeting(x,y,collider)) y-=16
while (place_meeting(x,y,grateblock)) y-=16
y+=1

player_stop()

size=0

if (carryid) {with (carryid) instance_destroy() carryid=noone carry=0}

visible=1
flash=1
piped=0

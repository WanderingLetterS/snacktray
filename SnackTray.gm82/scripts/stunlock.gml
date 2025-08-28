///stunlock(player1,player2)
//stunlock both parties involved in a pvp collision

if (argument[0].flash || argument[1].flash || argument[0].piped || argument[1].piped) exit
argument[0].piped=2
argument[1].piped=2

throwsparks(mean(argument[0].x,argument[1].x),mean(argument[0].y,argument[1].y))

argument[0].alarm[5]=16
argument[1].alarm[5]=16

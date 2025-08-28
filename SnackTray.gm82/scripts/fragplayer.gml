///fragplayer(offender)
//frags self, giving frag to offender

if (argument[0].flash || flash || global.gamemode="coop" || global.gamemode="sscreencoop") exit
if (argument[0]!=id) fragcredit=argument[0]
hurtplayer("pvp")

if (other.object_index=player) screenshake(x,4)

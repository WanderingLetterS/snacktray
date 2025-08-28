///doscore_p()
///doscore_p(points)
///doscore_p(points,powerup)
//if points arent specified, it advances the stomp chain bonus
//if powerup isnt specified, it assumes that that player is not getting the points off a powerup
//if powerup is specified, it does not allow the player to get a 1up off a regular powerup

var v;
if (unfresh) {unfresh=0 exit}
if (argument_count) v=argument[0]
else {v=scoresequence(seqcount) seqcount+=1}

global.scor[p2]+=v
if (v=0 && !argument[1]) {
   if settings("cog inflives") {itemc+=1 if (star) seqcount=1 sound("itemcoin") if (name="kid") bow=1 else global.scor[p2]+=10000 i= instance_create(coll.x,coll.y,scoreeffect) i.value=11 i.p2=p2 exit}
   else {itemc+=1 if (star) seqcount=1 sound("item1up") if (name="kid") bow=1 else global.lifes+=1 i= instance_create(coll.x,coll.y,scoreeffect) i.value=10 i.p2=p2 exit}
}
var d;
if (v=100) d=0
if (v=200) d=1
if (v=400) d=2
if (v=500) d=3
if (v=800) d=4
if (v=1000) d=5
if (v=2000) d=6
if (v=4000) d=7
if (v=5000) d=8
if (v=8000) d=9
i=instance_create(coll.x,coll.y,scoreeffect)
i.value=d
i.p2=p2

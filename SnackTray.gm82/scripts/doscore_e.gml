///doscore_e(points,source)
//gives owner points
//used on reflected enemies and projectiles like shells and shit

global.scor[owner.p2]+=argument[0]

if (min(10,seqcount)=10) {
   if !settings("cog inflives") {owner.itemc+=1 sound("item1up") if (owner.name="kid") owner.bow=1 else global.lifes+=1 i= instance_create(coll.x,coll.y,scoreeffect) i.value=10 i.p2=owner.p2 exit}
   else {owner.itemc+=1 sound("itemcoin") if (owner.name="kid") owner.bow=1 else global.scor[p2]+=10000 i= instance_create(coll.x,coll.y,scoreeffect) i.value=11 i.p2=owner.p2 exit}
}
var d;
if (argument[0]=100) d=0
if (argument[0]=200) d=1
if (argument[0]=400) d=2
if (argument[0]=500) d=3
if (argument[0]=800) d=4
if (argument[0]=1000) d=5
if (argument[0]=2000) d=6
if (argument[0]=4000) d=7
if (argument[0]=5000) d=8
if (argument[0]=8000) d=9
i=instance_create(argument[1].x,argument[1].y,scoreeffect)
i.value=d
i.p2=owner.p2

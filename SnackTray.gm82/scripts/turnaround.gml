///turnaround()
//every now and then I get a little bit lonely
//And you're never coming round

with (bulletbill) y+=verybignumber
with (piranha) y+=verybignumber
with (cheepfly) y+=verybignumber
with (lakitu) y+=verybignumber
coll=instance_place(x+hspeed,y,enemy)
if (coll) if (!coll.carry) {
    if (coll.object_index=shell) {if (!coll.kicked) hspeed=abs(hspeed)*esign(x-coll.x,-esign(coll.hspeed,1))}
    else if (coll.object_index!=piranha) && (coll.object_index!=wigglerbod) && (object_index!=wigglerbod) && (coll.wigglehead!=id){
        hspeed=abs(hspeed)*esign(x-coll.x,-esign(coll.hspeed,1))
        coll.hspeed=abs(coll.hspeed)*esign(coll.x-x,-esign(coll.hspeed,1))
        if object_index=wigglerhead
        {
        turnx=x
        bodturn=0
        }
    }
}

if (object_index=wigglerbod && x=wigglehead.turnx)
{
if wigglehead.bodturn < 3
wigglehead.bodturn+=1
else
{
wigglehead.turnx=-1
wigglehead.bodturn=0
wigglehead.broremoveshit=1
}
x-=hspeed
hspeed=abs(hspeed)*esign(x-wigglehead.turnx,-esign(hspeed,1))
}
jump=!grounded
coll=collision(hspeed,-1)
 if (coll) if !player_climbstep(coll/*,hspeed*/)  {
    x-=hspeed
    if (x<coll.bbox_left && bbox_right>coll.bbox_left) x-=bbox_right-coll.bbox_left
    if (x>coll.bbox_right && bbox_left<coll.bbox_right) x-=bbox_left-coll.bbox_right
    hspeed=abs(hspeed)*esign(x-mean(coll.bbox_left,coll.bbox_right),-esign(hspeed,1))
}

with (bulletbill) y-=verybignumber
with (piranha) y-=verybignumber
with (cheepfly) y-=verybignumber
with (lakitu) y-=verybignumber

///collision(x,y)
//finds a collision with the current mask

var maskr,o,yp;



if (teleport>8) return noone
if (disallow) {disallow.y-=verybignumber}
with (pswitch) {p=y if (carry) y-=verybignumber}
if (object_index=player) {


    with (phaser) {
        if ((object_index=nslopls||object_index=nsloprs||object_index=nslopl2s||object_index=nslopr2s) && vsp>0)
        {
            y-=verybignumber
        }
    }


}
yp=y
y=-verybignumber



o=instance_place(x+argument[0],yp+argument[1],collider)


y=yp

with (phaser) if object_index!=gearplatform y=ystart

if (disallow) disallow.y+=verybignumber



return o

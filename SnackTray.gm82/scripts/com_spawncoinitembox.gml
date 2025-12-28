///com_spawncoinitembox(itembox coin count variable)
var cc;
cc=argument[0]

if (picked) {
    with (instance_position(x+8,y+8+16*go,brick)) {insted=1 owner=other.owner event_user(0)}
    if (go=1) if (instance_position(x+8,y+24,collider)) {
        go=-1
        with (instance_position(x+8,y-8,brick)) {insted=1 owner=other.owner event_user(0)}
    }
    i=cc
    if (done || picked=2) i=1
    cc-=i
    picked=0
    repeat (i) with (instance_create(x+8+offset,y+8+16*go,itemdrop)) {
        hspeed=myrand(2)-1
        vspeed=(2+myrand(2))*other.go
        drop=0
        type="coinup"
    }
} else {
    with (instance_create(x+8+offset,y+8+16*go,coinup)) {vspeed=-1.5+2*other.go p2=other.owner.p2}
    {
        global.coins[owner.p2]+=1
                owner.coint+=1
        global.scor[owner.p2]+=100
    }
    cc-=1
}
if (done || cc=0) {
    owner.blockc+=1
    hit=1
}
if (alarm[1]=-1) alarm[1]=256
tpos=0

return cc

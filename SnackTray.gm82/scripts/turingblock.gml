var i,l,ll,coll,ox,oy,o;

l[0]=hittable
l[1]=stone
l[2]=textblock
l[3]=anchor
l[4]=item
l[5]=spike
l[6]=tyler
l[7]=barrier
l[8]=automator
l[9]=platwrap
l[10]=enemy
l[11]=code
ll=12

if (mode=0) {//global
    with (turing) if (id!=other.id && mode=0 && !insted) {insted=1 go=other.go owner=other.owner event_user(0) insted=0}
}

if (mode=1) {//activator
    with (instance_position(x+dstx+8,y+dsty+8,hittable)) {
        insted=1
        go=other.go
        event_user(0)
        insted=0
    }
    with (instance_position(x+dstx+8,y+dsty+8,code)) {
        event_user(1)
    }
    with (instance_position(x+dstx+8,y+dsty+8,axe)) {
        event_user(1)
    }
}

if (mode=2) {//teleporter
    for (i=0;i<ll;i+=1) with (l[i]) with (other) if (instance_place(x+srcx,y+srcy,other.id)) with (other) {
        ox=other.dstx-other.srcx
        oy=other.dsty-other.srcy
        if (abs(ox)<=16 && abs(oy)<=16) {
            o=instance_create(x,y,blockmover)
            o.hsp=ox/16 o.vsp=oy/16 o.sprite_index=sprite_index o.mask_index=mask_index o.k=id
        } else {
            instance_create(mean(bbox_left,bbox_right),mean(bbox_top,bbox_bottom),smoke)
            x+=ox xstart+=ox
            y+=oy ystart+=oy
            instance_create(mean(bbox_left,bbox_right),mean(bbox_top,bbox_bottom),smoke)
            if (object_index=tyler) event_user(4)
        }
        if (object_is_ancestor(object_index,hittable)) {insted=1 go=-1 event_user(0) insted=0}
        if (object_index=code) event_user(1)
    }
}

coll=1
if (mode=3 || !mode3flag) {//conditional propagation from inverter and detector
    for (i=0;i<ll;i+=1) if (position_meeting(x+srcx+8,y+srcy+8,l[i])) {
        coll=0
        break
    }
}
mode3flag=0

if (coll) with (instance_position(x+8,y+8+16*go,turing)) {
    insted=1
    go=other.go
    owner=other.owner
    event_user(0)
    insted=0
}

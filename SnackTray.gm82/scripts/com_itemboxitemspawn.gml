///com_itemboxitemspawn(owner,mush,go,mycontent,picked)
var owner,mush,go,mycontent,picked;
owner=argument[0]
mush=argument[1]
go=argument[2]
mycontent=argument[3]
picked=argument[4]

nevermush=0
if owner.mushroom_unsupported {nevermush=1 mush=0}

if (mycontent="thunderitem" || (mycontent="item" && alwaysthunder )) {
    if (mush) {mycontent="mushroom"}
    else {
        if owner.tflower_unsupported {
            if owner.fflower_unsupported{
                if nevermush{
                    mycontent="shield"
                } mycontent="mushroom"
            } else mycontent="fflower"
        }else  mycontent="tflower"
    }
}
if (mycontent="wateritem" || (mycontent="itemfeather" && alwayswater )) {
    if (mush) {mycontent="mushroom"}
    else{
        if owner.wflower_unsupported {
            if owner.feather_unsupported{
                if nevermush{
                    mycontent="shield"
                } else mycontent="mushroom"
            } else mycontent="feather"
        }else  mycontent="wflower"
    }
}

if (mycontent="iceitem" || (mycontent="item" && alwaysice )) {
    if (mush) {mycontent="mushroom"}
    else {
        if owner.iflower_unsupported {
            if owner.fflower_unsupported{
                if nevermush{
                    mycontent="shield"
                } else mycontent="mushroom"
            } else mycontent="fflower"
        }else  mycontent="iflower"
    }
}
if (mycontent="cloveritem" || (mycontent="itemfeather" && alwaysclover )) {
    if (mush) {mycontent="mushroom"}
    else {
        if owner.cflower_unsupported {
            if owner.feather_unsupported{
                if nevermush{
                    mycontent="shield"
                } else mycontent="mushroom"
            } else mycontent="feather"
        }else  mycontent="cflower"
    }

}



if (mycontent="item") {
    if (mush) {mycontent="mushroom"}
    else {
        if owner.fflower_unsupported{
            if nevermush{
                mycontent="shield"
            } else mycontent="mushroom"
        } else mycontent="fflower"
    }
}
if (mycontent="itemfeather") {
    if (mush) {mycontent="mushroom"}
    else {
        if owner.feather_unsupported{
            if nevermush{
                mycontent="shield"
            } else mycontent="mushroom"
        } else mycontent="feather"
    }
}
if (mycontent="questionmush") {
    if (mush) mycontent="mushroom"
    else if !owner.questionmush_supported {
            if owner.fflower_unsupported{
                if nevermush{
                     mycontent="shield"
                } else mycontent="mushroom"
            } else  mycontent="fflower"
        }else  mycontent="questionmush"


}

/*

if (mycontent="mini") {
    with (instance_create(x+8+offset,y+8+4*go,mushmini)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (mycontent="shard") {
    with (instance_create(x+8+offset,y+8+4*go,starshard)) vspeed=3.5*other.go
}
if (mycontent="shield") {
    with (instance_create(x+8+offset,y+8+4*go,shield)) vspeed=3.5*other.go
}
if (mycontent="life") {
    with (instance_create(x+8+offset,y+8+4*go,lifemush)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (mycontent="key") {
    with (instance_create(x+8+offset,y+8+4*go,keyitem)) {iid=id vspeed=0.25*other.go alarm[0]=48}
}
if (mycontent="spring") {
    with (instance_create(x+offset,y+4*go,spring)) {
        vspeed=0.25*other.go
        bbb=1
        if (!other.go) aaa=1
        c=0
        alarm[0]=48
        owner=other.owner
    }
}
if (mycontent="spreng") {
    with (instance_create(x+offset,y+4*go,spreng)) {
        vspeed=0.25*other.go
        c=0
        alarm[0]=48
        owner=other.owner
    }
}
if (mycontent="poison") {
    with (instance_create(x+8+offset,y+8+4*go,mushpoison)) {iid=id vspeed=0.25*other.go alarm[0]=48 owner=other.owner}
}*/
/*if (mycontent="vine") {
    with (instance_create(x+offset,y+4*go,sprong)) {
        vspeed=0.25*other.go alarm[0]=48
        target=other.target
        bbb=1
        if (!other.go) aaa=1
        c=0
    }
}*/



iid=(instance_create(x+8,y+8,pipeitem))
with iid {
    hspeed=0
    vspeed=0.25*go
    powner=other.id
    content=mycontent
    com_contenttoobject()


    if content=shield vspeed=1*go //woah.
    if content=sprong
    target=other.target // sprong


    if (enem) xsc=esign(-hspeed,esign(x-nearestplayer().x,1)) else xsc=esign(-hspeed,esign(nearestplayer().x-x,-1))
    if (content=spring || content=spreng|| content=sprong|| content=stone) {x-=8 y-=8}
    if enem y-=8

}

if (picked && iid) {
    if !iid.enem{
        i=instance_create(x+8+offset,y+8,gravitymanager)
        i.vsp=go*4-1
        i.carry=iid
        i.phase=4
        i.drop=1
        iid.c=0
        iid.drop=0
        iid.speed=0
        iid.aaa=0
        iid.bbb=0
        iid.mygrav=i
        iid.alarm[0]=16
    } else iid.alarm[0]=1
}

if (itemget==1) {
    exit
}

if (type="jumprefresh") {
    insted=0
    mc=0
    itemget=1
}

if ((!piped && !hurt && !(global.mplay>1 && flash)) || monitem) {
    if !mushroom_unsupported
    if (type="mushroom") {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        playgrowsfx("")

        if (skidding) {
            soundstop(name+"skid")
            skidding=0
        }

        if (size=0 || size=5) {
            grow=1
            oldsize=size
            size=1
        }

        itemget=1
    }

    if !fflower_unsupported
    if (type="fflower") {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        playgrowsfx("2")

        if (skidding) {
            soundstop(name+"skid")
            skidding=0
        }

        if (!super && size!=2) grow=1
        oldsize=size
        size=2
        itemget=1
    }

    if !feather_unsupported
    if (type="bfeather") {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        playgrowsfx("3")

        if (skidding) {
            soundstop(name+"skid")
            skidding=0
        }

        if (!super && size!=3) grow=1
        oldsize=size
        size=3
        itemget=1
    }

    if !mini_unsupported
    if (type="mini") {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        playgrowsfx("4")

        if (skidding) {
            soundstop(name+"skid")
            skidding=0
        }

        if (!super && size!=5) grow=1
        oldsize=size
        size=5
        itemget=1
    }

    if (type="star") {
        coll=other.id
        doscore_p(1000)
        sound("itemstar")
        itemc+=1

        if (!super) {
            star=1
            alarm[2]+=other.fuel+2
            alarm[3]=-1
            kek=0
            with (player) {
                if (super) other.kek=1
            }
            if (!kek) {
                mus_play("starman",1,p2)
                global.music="starman"
            }
        }
        if (playerskindat(slot,"growsfx5"+string(p2))) playsfx("growsfx5")
        else playgrowsfx("5")
        itemget=1
    }

    if (type="shield") {
        coll=other.id
        if (p2!=other.p2) {
            itemc+=1
            doscore_p(1000,1)
        }
        sound("itemshield")
        shielded=1
        itemget=1
    }

    if (type="poison") {
        coll=other.id
        if !invincible() hurtplayer("enemy")
        if (insta && insta<14 &&!star) hurtplayer("enemy")
        itemget=1
    }

}
if !tflower_unsupported
if (type="tflower" || type="sflower") {
    coll=other.id
    if (p2!=other.p2) {
        itemc+=1
        doscore_p(1000,1)
    }
    playgrowsfx("6")

    if (skidding) {
        soundstop(name+"skid")
        skidding=0
    }

    if (!super && size!=6) grow=1
    oldsize=size
    size=6
    itemget=1
}
if !wflower_unsupported
if (type="wflower" || type="bflower") {
    coll=other.id
    if (p2!=other.p2) {
        itemc+=1
        doscore_p(1000,1)
    }
    playgrowsfx("7")

    if (skidding) {
        soundstop(name+"skid")
        skidding=0
    }

    if (!super && size!=7) grow=1
    oldsize=size
    size=7
    itemget=1
}
if questionmush_supported
if (type="?mushroom" ) {
    coll=other.id
    if (p2!=other.p2) {
        itemc+=1
        doscore_p(1000,1)
    }
    playgrowsfx("4")

    if (skidding) {
        soundstop(name+"skid")
        skidding=0
    }

    if (!super && size!=4) grow=1
    oldsize=size
    size=4
    itemget=1
}
if !iflower_unsupported
if (type="iflower") {
coll=other.id
if (p2!=other.p2) {
itemc+=1
doscore_p(1000,1)
}
playgrowsfx("8")

if (skidding) {
soundstop(name+"skid")
skidding=0
}

if (!super && size!=8) grow=1
oldsize=size
size=8
itemget=1
}
if !cflower_unsupported
if (type="cflower") {
coll=other.id
if (p2!=other.p2) {
itemc+=1
doscore_p(1000,1)
}
playgrowsfx("9")

if (skidding) {
soundstop(name+"skid")
skidding=0
}

if (!super && size!=9) grow=1
oldsize=size
size=9
itemget=1
}

if (type="1up") {
    sound("item1up")
    itemc+=1
    global.lifes+=1
    deaths=max(0,deaths-1)
    if (super) superpower=6000
    else energy=maxe
    itemget=1
}

if (type="coin") {
    sound("itemcoin")
    if (other.fresh) global.scor[p2]+=100
    global.coins[p2]+=1
    coint+=1
    hit=1
    itemget=1
}
if (type="ring") {
    sound("itemring")
    if (other.fresh) global.scor[p2]+=100
    global.rings[p2]+=1
    hit=1
    itemget=1
}

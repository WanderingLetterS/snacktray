//update carried object for players who can carry shit

if (carry && carryid) {
    if (!instance_exists(carryid)) {carry=0 carryid=noone}
    else {
        with (gravitymanager) if (carry=other.carryid) instance_destroy()
        if (spinjump) carryid.x=round(x+10*xsc*cos(spinball/4*pi))
        else carryid.x=round(x+carryoffsetx*xsc)
        carryid.y=round(y+carryoffsety)
        with (carryid) event_user(2)
    }
} else carryf=0

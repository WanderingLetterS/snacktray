var i,m;

if (transform) exit
    transform=1

    for (i=0;i<7;i+=1) m[i]=i
    for (i=6;i>0;i-=1) {
        j=irandom(i)
        t=m[i]
        m[i]=m[j]
        m[j]=t
    }

    for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]}
    if argument0=1 playsupermusic=1 else playsupermusic=0
    superpower=6000
    piped=1
    super=1
    fall=1
    hsp=0 vsp=0
    pound=0 boost=0
    glide=0 climb=0
    if (tired) {stopsfx(inst) inst=playsfx("tailsfly",1)}
    fly=0 tired=0
    upper=0
    insta=0
    set_sprite("transform")
    frame=0
    frspd=0

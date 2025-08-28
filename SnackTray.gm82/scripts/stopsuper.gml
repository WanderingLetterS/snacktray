//argument indicates unintentional
var i,m;

if (super && (!transform || argument[0])) {
    super=0

    for (i=0;i<7;i+=1) m[i]=i
    for (i=6;i>0;i-=1) {
        j=irandom(i)
        t=m[i]
        m[i]=m[j]
        m[j]=t
    }
    cantsuper=30
    stagemusic(id,p2)
    throwsparks(x,y)
    for (i=0;i<7;i+=1) with (shoot(x,y,ermelnads_tronsform)) {color=m[i]}
    if (!argument[1]) {
        playsfx(name+"release")
        global.coins[p2]+=floor(superpower/60)
        piped=1
        alarm[5]=30
    }
    fly=0
    fall=1
}

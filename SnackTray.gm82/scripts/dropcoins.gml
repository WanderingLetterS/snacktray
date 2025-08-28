///dropcoins(aggressively,allofthem)
//drop half of own coins

var nc,integer,fract,i;

if (global.coins[p2]>0) {
    if !argument[1]{ //drop half
        nc=ceil(global.coins[p2]/2)
        integer=floor(nc/10)*10
        fract=nc-integer
        global.coins[p2]-=nc
    } else {
        integer=global.coins[p2] global.coins[p2]=0
    }


    for (i=0;i<integer;i+=1) with (instance_create(x,y,itemdrop)) {
        heavened=other.heavened
        p2=other.p2
        type="coinup"
        fresh=0
        speed=4+floor(i/10)/2
        direction=54+(i mod 10)*8
        if (argument[0]) speed+=2
    }
    for (i=0;i<fract;i+=1) with (instance_create(x,y,itemdrop)) {
        heavened=other.heavened
        p2=other.p2
        type="coinup"
        fresh=0
        speed=4+floor(integer/10)/2
        direction=90-(fract-1)*4+i*8
        if (argument[0]) speed+=2
    }
}

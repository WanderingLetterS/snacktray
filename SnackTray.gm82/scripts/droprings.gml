///droprings()
//drop all the mengs

var nc,integer,fract,i;

if (global.rings[p2]>0) {
    integer=global.rings[p2]
    if integer>32 integer=32
    global.rings[p2]=0



    for (i=0;i<integer;i+=1) with (instance_create(x,y,itemdrop)) {
        heavened=other.heavened
        p2=other.p2
        type="ringup"
        fresh=0
        dissapear=185+myrand(75)
        if i>10 coinfalloff=1
        speed=4+myrand(2)
        direction=54+myrand(2)*8
        if myrand(1){
        hspeed*=-1
        }
   }
}

var i,sid,spr;

spr=string(argument[0])

sid=0
for (i=0;i<global.animdat[p2,0];i+=1) {
    if (string(global.animdat[p2,16+128*i])==spr) {sid=i break}
}

//logic taken from ssw_core
return global.animdat[p2,16+128*sid+1+size]

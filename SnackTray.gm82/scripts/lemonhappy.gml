var i,sum,this;

sum=0
this=instance_number(objcontainer)+instance_number(watercontainer)+instance_number(semicontainer)+instance_number(backcontainer)
for (i=0;i<8;i+=1) {
    if (drawregion.region=i) sum+=this
    else sum+=drawregion.count[i]
}

if (sum>=16384) return 0
return (this<8192)

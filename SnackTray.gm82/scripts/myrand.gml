///myrand(range)
//deterministic pseudorandom using two lfsr machines
var l1,l2;

global.rand+=10
l1=global.rand>>1
l2=l1

l1=(l1&~256)|((l1&1)^((l1&16)>>4))<<8 //9-lfsr
l2=(l2&~16 )|((l2&1)^((l2&4 )>>2))<<4 //5-lfsr

global.rand=(l1*l2) mod 65536
return (global.rand/65536)*argument[0]

ceil(myrand(4))

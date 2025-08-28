var bals,balm,vol;

vol=0.7
if (global.vaporpass[0]) vol=1

bals=min(1,settings("volbalance"))
balm=min(1,settings("musbalance"))

FMODGroupSetVolume(1,balm*vol*0.7)
FMODGroupSetVolume(2,bals*vol)

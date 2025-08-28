///com_startspindash()
if (spindash) spinchargetimer=20
playsfx(name+"spindash",0,1+(median(0,spindash-1,3)/3)*skindat("pitchdash"+string(p2)))
spindash=min(4,spindash+1)
tempbrick=1

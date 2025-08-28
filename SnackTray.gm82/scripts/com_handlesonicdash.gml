if (abs(hsp+hyperspeed+gm8exspd)>=(maxspd*0.9) && !finish) {
    energy+=1/32
} else if (energy) { energy=max(0,energy-1/32) if (energy=0) {boost=0 }}
if abs(hsp+hyperspeed+gm8exspd)<1 && !jump {energy=0 boost=0}

if (dashtimer) dashtimer-=1

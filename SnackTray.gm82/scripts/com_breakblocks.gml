if object_index==iceblock {alarm[1]=1 exit}

if (!insted) {owner.vsp=1.5}
owner.blockc+=1
upwardthrust()
global.scor[owner.p2]+=10
sound("itemblockbreak")
hit=1
if (skindat("bricd")) {
    i=instance_create(x,y,bricd)
    i.biome=biome
    i.depth=depth
}
if (string(stoned)="1") with (instance_create(x,y+8,stone)) phase=1
i=instance_create(x+4,y+12+(16*biggie),part) i.type=(6*biggie) i.hspeed=-1 i.vspeed=-1+2*go i.spriteobj=object_index
i=instance_create(x+12+(16*biggie),y+12+(16*biggie),part) i.type=(6*biggie) i.hspeed=1 i.vspeed=-1+2*go i.spriteobj=object_index
i=instance_create(x+4,y+4,part) i.type=(6*biggie) i.hspeed=-1 i.vspeed=-3+2*go i.spriteobj=object_index
i=instance_create(x+12+(16*biggie),y+4,part) i.type=(6*biggie) i.hspeed=1 i.vspeed=-3+2*go i.spriteobj=object_index

with (turing) event_user(4)

instance_destroy()

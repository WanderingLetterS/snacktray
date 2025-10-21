fall=0
if !uncurled
vsp=-1

sprung=0
sproinged=0
bouncetrick=0
tricking=0
if !uncurled{
    proj_type="pstar"
    i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=2
    i=fire_projectile(x,y) i.hspeed=2 i.vspeed=2
    i=fire_projectile(x,y) i.hspeed=-2 i.vspeed=-2
    i=fire_projectile(x,y) i.hspeed=2 i.vspeed=-2
}
uncurled=0

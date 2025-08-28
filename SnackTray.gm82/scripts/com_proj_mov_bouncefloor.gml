///com_proj_mov_bouncefloor() Returns true if hit the floor. Returns 2 if hit lava!

coll=instance_place(x,y,collider)
if (coll) {
    if (coll.object_index=lavablock) {y-=vspeed vspeed=-2.75  return 2}
    if (y<coll.y+4 && !instance_place(x,y-8,collider)) {y-=vspeed vspeed=-2.75 return 1}
    if coll.object_index=phaser return 1
}return 0

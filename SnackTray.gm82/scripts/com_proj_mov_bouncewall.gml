///  Returns true if hit the wall. Returns 2 if hit lava!

coll=instance_place(x,y,collider)
if (coll) {
    if (coll.object_index=lavablock) {x-=hspeed hspeed*=-1  return 2}
    if !(y<coll.y+4 && !instance_place(x,y-8,collider)) {x-=hspeed hspeed*=-1 return 1} //Same code Mario's fireballs used iirc so i sure hope it works.
    if coll.object_index=phaser return 1  
}
return 0

var enemyspr_index,i;


if string(enemyspr_index)==string(sprite) exit

enemyspr_index=string(sprite)

eid=-1
if !enemy2
for (i=0;i<global.enemysprites;i+=1) {
    if (global.enemysprite[i,0]=enemyspr_index) {
        eid=i
        if (eid+1!=emem) {
            emem=eid+1
            frame=0
            frn=global.enemysprite[i,1]
            frs=global.enemysprite[i,2]
            frl=global.enemysprite[i,3]
        }
        break
    }
}
if enemy2
for (i=0;i<global.enemysprites2;i+=1) {
    if (global.enemysprite2[i,0]=enemyspr_index) {
        eid=i
        if (eid+1!=emem) {
            emem=eid+1
            frame=0
            frn=global.enemysprite2[i,1]
            frs=global.enemysprite2[i,2]
            frl=global.enemysprite2[i,3]
        }
        break
    }
}

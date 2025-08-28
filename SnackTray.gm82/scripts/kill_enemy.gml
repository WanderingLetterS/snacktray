///kill_enemy(enemy id, damage type)

if (argument[0]) {
    global.coll=noone
    if (object_index=player || object_index=cork ||object_index=stone ||object_index=objectdummy) global.coll=id
    if (owner) if (owner.object_index=player) global.coll=owner


    with (argument[0]) {
        if (argument[1]="stomp") enemystomp(id)
        if (argument[1]="kill") enemydie(id)
        if (argument[1]="explode") enemyexplode(id)
    }
}

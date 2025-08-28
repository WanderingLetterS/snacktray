with (instance_create(argument[0],argument[1],projectile)) {
    owner=other.id
    p2=owner.p2
    orig=owner
    xsc=esign(owner.hspeed,owner.xsc)
    sheet=owner.sheets[owner.size]
    event="create"
    event_user(p2)
    return id
}

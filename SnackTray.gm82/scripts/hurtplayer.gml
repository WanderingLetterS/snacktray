///hurtplayer(damage type)
//generic "hurt" sequence for players or death, if no powerup.

var starhit;

harmtype=string(argument[0])
if ((invincible() && (hurt || flash)) || intangible()) return 0
if harmtype!="" if is_invincible(harmtype) return 0

if (other!=noone && other!=0) {
    if ((other.object_index==projectile || other.object_index==damager || other.object_index==player) && object_index==player && (global.gamemode=="coop" || global.gamemode=="sscreencoop")) return 0
}

if harmtype="lava" ohgoditslava=1

if harmtype="crush" {
    if (global.mplay>1 || global.debug || global.lemontest) alarm[7]=120
    die()
    return 1
}

if (harmtype="pvp" && !super && !shielded) {
    if (star) {starhit=1 star=0 with (instance_create(x,y,itemdrop)) {p2=other.p2 fuel=max(60,other.alarm[2]) hspeed=0 vspeed=min(-5,-other.vsp) type="star"} alarm[2]=2}
    else if (size=1) {i=instance_create(x,y,itemdrop) {if (lock) {i.vspeed-=2} i.heavened=heavened i.p2=p2 i.type="mushroom"}}
    else if (size=2) {i=instance_create(x,y,itemdrop) {if (lock) {i.vspeed-=2} i.heavened=heavened i.p2=p2 i.type="fflower"}}
    else if (size=3) {i=instance_create(x,y,itemdrop) {if (lock) {i.vspeed-=2} i.heavened=heavened i.p2=p2 i.type="bfeather"}}
    else if (size!=0 && size!=5) charm_run("pvpitemdrop") //its so awesome im like "lets make custom powerups easier" and then i make custom itemdrops useless and the powerup dummy not work for like 3 updates
    else {dropcoins(0) fragcredit.frags+=1}
}

if (harmtype="spike") {sound("itemspikedamage")}

charm_run("hurt")
ohgoditslava=0
jump=1

if (object_is_ancestor(coll.object_index,enemy)) { //enemy turn towards player on contact
  if (coll.object_index=goomba ||
    coll.object_index=koopa ||
    coll.object_index=hopkoopa ||
    coll.object_index=redkoopa ||
    coll.object_index=redhover ||
    coll.object_index=beetle ||
    coll.object_index=rexbig ||
    coll.object_index=rexsmall ||
    coll.object_index=montymole ||
    coll.object_index=spiny) with (coll) {xsc=esign(other.x-x,1) hspeed=abs(hspeed)*xsc}
}

if (harmtype="gut") stopsuper()
return 1

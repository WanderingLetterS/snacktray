//give a star shard

if (!hit && !intangible(argument[0]) && !instance_exists(bollgate)) {
    instance_create(x,y,glitter)
    if (global.mplay>1) {
        with (instance_create(other.x,other.y-16,scoreeffect)) value=10
        return give_item(other.id,"1up")
    }
    else if (global.gamemode=="timeattack") {
        instance_create(x,y,glitter)
        return sound("itemtoken")
    }
    else if (lemongrab.compat == "1.9.1" || lemongrab.compat == "1.9.2" || lemongrab.compat == "1.9.3") {
        if ((global.shards && lemongrab.compat!="1.9.1") || global.shards>=2) {
            sound("item1up")
            with (instance_create(other.x,other.y-16,scoreeffect)) value=10
            give_item(other.id,"1up")
        } else {
            sound("itemshard")
            global.shards+=1
            doscore_p(1000,1)
        }
        instance_create(other.x,other.y,glitter)
        return 1
    }
    with (argument[0]) {
        player_stop()
        if super stopsuper()
        doscore_p(1000,1)
        hit=1
        instance_create(x,y,bollgate)
    }
    spendblock()
    return 1
}
return 0

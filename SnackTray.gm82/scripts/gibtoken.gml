//give a token
if (!hit && !argument[0].diggity) {
    with (argument[0]) {
        sound("itemtoken")
        switch (other.type) {
            case 1: {
                global.tokens+=1
                other.tokencolore=$ffc962
                break;
                }
            case 2: {
                if !global.lemontest
                    settings_savefile("token " + other.name + " " + chr(187) + other.pack,1)
                other.tokencolore=$74f9eb
                break;
            }
            default: {
                gamemanager.tokens+=1
                other.tokencolore=$ffffff
                break;
            }
        }

        if global.lemontest other.name+="#${c=$808080}[NOT SAVED]"
        with (other) {
            with (instance_create(x,y-((type == 2 && global.lemontest) * 8),scoreeffect)) {
                if other.type=0 tokend=gamemanager.tokens
                else if other.type=1 tokend=global.tokens
                else name=other.name
                col=other.tokencolore
            }
        }
        global.scor[p2]+=1000
        hit=1
        instance_create(other.x,other.y,glitter)
    }
    return 1
}
return 0

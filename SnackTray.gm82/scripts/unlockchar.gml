if (settings("lock "+argument[0])) { //muahaha
    with (instance_create(0,0,unlockmsg)) {
        name=argument[0]
        p2=-1
        for (i=0;i<global.characters;i+=1) if (name=global.charname[i]) p2=i
        string_execute(global.unlockdata[p2])
        if string(global.unlockdata[p2])=="0" || string(global.unlockdata[p2])=="" {unlocktext="No unlock text##exists for this character."}
        str=unlocktext
    }
    settings("lock "+argument[0],0)
}

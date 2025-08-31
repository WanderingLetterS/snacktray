///initskin()
//initialize skin control structures

with (globalmanager) {
    skinmap=ds_map_create()

    playerskinmap[0]=ds_map_create()
    playerskinmap[1]=ds_map_create()
    playerskinmap[2]=ds_map_create()
    playerskinmap[3]=ds_map_create()
    playerskinmap[4]=ds_map_create()
    playerskinmap[5]=ds_map_create()
    playerskinmap[6]=ds_map_create()
    playerskinmap[7]=ds_map_create()
    playerskinmap[8]=ds_map_create()
    playerskinmap[9]=ds_map_create()
    playerskinmap[10]=ds_map_create()
    playerskinmap[11]=ds_map_create()

    skindir=global.workdir+"SnackBowl_skins\"
    moddir=global.workdir+"SnackBowl_mods\"

    directory_create(skindir)
    directory_create(moddir)

    global.worldskin=0
    global.worldskin2=0
    global.musicskin=0
    global.levelskin=0

    global.characters=0

    global.asset[0,0]=0

    i=0
    global.biome[i]="Ground" i+=1
    global.biome[i]="Underground" i+=1
    global.biome[i]="Underwater" i+=1
    global.biome[i]="Castle" i+=1
    global.biome[i]="Bonus" i+=1
    global.biome[i]="Sky" i+=1
    global.biome[i]="Beach" i+=1
    global.biome[i]="Forest" i+=1
    global.biome[i]="Desert" i+=1
    global.biome[i]="GhostHouse" i+=1
    global.biome[i]="Airship" i+=1
    global.biome[i]="Volcano" i+=1
    global.biome[i]="Snow" i+=1
    global.biome[i]="Autumn" i+=1
    global.biome[i]="Factory" i+=1
    global.biome[i]="Clockwork" i+=1
    global.biome[i]="Abstract" i+=1
    global.biome[i]="Tutorial" i+=1
    global.biomes=i
    global.biome[69]="Default"

    for (i=0;i<=global.biomes+1;i+=1) {
        global.master[i]=background_create_color(1,1,0)
        global.masterterrain[i]=background_create_color(1,1,0)
        global.masterobjects[i]=background_create_color(1,1,0)
        global.masterdecor[i]=background_create_color(1,1,0)
        global.minimapsheet[i]=background_create_color(1,1,0)
        for (j=0;j<96;j+=1) global.effectsprite[i,j]=-1
    }
    list=
        "goomba,goombasmash,goombadead,"+
        "goombrat,goombratsmash,goombratdead,"+
        "paratroopa,koopa,shell,shellwake,shellspin,shelldead,"+
        "redparatroopa,redkoopa,redshell,redshellwake,redshellspin,redshelldead,"+
        "beetle,beetleshell,beetleshellwake,beetleshellspin,beetleshelldead,"+
        "spinyegg,spiny,spinyshell,spinyshellwake,spinyshellspin,spinyshelldead,"+
        "lakitu,lakituaim,lakitudead,lakitucloud,"+
        "piranha,piranhadie,"+
        "redpiranha,redpiranhadie,"+
        "cheep,cheepdead,"+
        "greencheep,greencheepdead,"+
        "cheepfly,cheepflydead,"+
        "blooper,blooperdead,"+
        "bullet,bulletdead,"+
        "hammerbro,hammerbrojump,hammerbroaim,hammerbrodead,"+
        "lavabubble,lavabubbledown,"+
        "paragoomba,"+
        "paragoombrat,"+
        "samba,"

    global.enemysprites=string_count(",",list)
    for (i=0;i<global.enemysprites;i+=1) {
        p=string_pos(",",list)
        global.enemysprite[i,0]=string_copy(list,1,p-1)
        list=string_delete(list,1,p)
    }

        list2=
        "drybones,drybonesdead,dryres,"+
        "thwomp,thwompangry,thwompdown,thwompangryside,thwompside,"+
        "bthwomp,bthwompangry,bthwompdown,bthwompangryside,bthwompside,"+
        "firebro,firebrojump,firebroaim,firebrodead,"+
        "boomerangbro,boomerangbrojump,boomerangbroaim,boomerangbrodead,"+
        "boo,booscared,"+
        "crabmeat,crabmeatshoot,"+
        "newtrontrans,newtronshoot,newtrongo,"+
        "rex,rexsmall,rexsmash,rexdead,rexsmalldead,"+
        "montydigup,montydig,hole,montypop,montymole,montydead,"+
        "yelparatroopa,yelkoopa,yelshell,yelshellwake,yelshellspin,yelshelldead,"+
        "bluparatroopa,blukoopa,blushellwinged,blushell,blushellwake,blushellspin,blushelldead,"+
        "urchin,"+
        "chopper,"+
        "bob-omb,bob-omblit,bob-ombfuse,"+
        "bombshellkoopa,bombshell,bombshelldead,"+
        "buzzbombfly,buzzbombhover,"+ //please change these anim names i dont know the name of them -neko
        "firepiranhaup,firepiranhaupshoot,firepiranhadown,firepiranhadownshoot,"+
        "bullseyebullet,bullseyebulletdead,"+
        "fishbones,fishbonesattack,fishbonesdead,"+
        "spike,spikeballthrow,spikedead,"+
        "wigglerhead,wigglerbod,wigglerheaddead,wigglerboddead,wigglerheadangery,wigglerbodangery,wigglerheadangerydead,wigglerbodangerydead,"+
        "pokey,pokeybody,"+
        "greenorbinaut,"+
        "blueorbinaut,"+
        "redorbinaut,"+
        "bumperorbinaut,"+
        "bombstand,bombwalk,bombignite,"+
        "thwimp,"


    global.enemysprites2=string_count(",",list2)
    for (i=0;i<global.enemysprites2;i+=1) {
        p=string_pos(",",list2)
        global.enemysprite2[i,0]=string_copy(list2,1,p-1)
        list2=string_delete(list2,1,p)
    }

    indexskins()

    skinstr("bundlename","")
    skinstr("bundledesc","")
    skindat("settings starting lives",5)
    skindat("maxspecial",1)
}

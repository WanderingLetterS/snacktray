///replaceworld(path)
//apply world skin


wskin=argument[0]
loadspec=0
if (argument_count >= 2) loadspec=argument[1]
// kelloggs was here



//Default sheets, loaded first to avoid having to constnatly load them back in for each biome that doesnt have them
//major load time improvements in situations like enemy+enemy2+objects+boss.
if file_exists(wskin+"tiles.png")  background_replace(global.master[global.biomes+1],wskin+"tiles.png",1,0)
if file_exists(wskin+"terrain.png")  {
    background_replace(global.masterterrain[global.biomes+1],wskin+"terrain.png",1,0)
    //Terrain type
    bgth=background_get_height(global.masterterrain[global.biomes+1])
    //To reduce on time, we only check the height of the sheet, instead of both width and height.
    switch (bgth){
        case 64:  global.terrainsheettype[global.biomes+1]=1 break; //1x1 minisheet.
        case 112: global.terrainsheettype[global.biomes+1]=2  break; //2x2 minisheet.
        case 160: global.terrainsheettype[global.biomes+1]=3  break; //3x3 minisheet.
        case 208: global.terrainsheettype[global.biomes+1]=4  break; //4x4 minisheet.
        default: global.terrainsheettype[global.biomes+1]=0
    }
}

if file_exists(wskin+"objects.png")  background_replace(global.masterobjects[global.biomes+1],wskin+"objects.png",1,0)
if file_exists(wskin+"decor.png")  background_replace(global.masterdecor[global.biomes+1],wskin+"decor.png",1,0)


if file_exists(wskin+"enemy.png")  replacesheet("","enemy"+string(global.biomes+1),wskin+"enemy.png",330,1824,1)
global.enemysheet[global.biomes+1]=skindat("tex_enemy"+string(global.biomes+1))
if file_exists(wskin+"enemy2.png")  replacesheet("","enemy2"+string(global.biomes+1),wskin+"enemy2.png",330,1824,1)
global.enemysheet2[global.biomes+1]=skindat("tex_enemy2"+string(global.biomes+1))
if file_exists(wskin+"boss.png")  replacesheet("","boss"+string(global.biomes+1),wskin+"boss.png",500,500,1)
global.bosssheet[global.biomes+1]=skindat("tex_boss"+string(global.biomes+1))
if file_exists(wskin+"effects.png")  replacesheet("","effects"+string(global.biomes+1),wskin+"effects.png",215,315,1)
global.effectssheet[global.biomes+1]=skindat("tex_effects"+string(global.biomes+1))




for (i=0;i<global.biomes;i+=1) {
    if (loadspec != -1) {
        if (loadspec && !(loadspec & (1 << i))) // skip if loadspec says this biome isn't needed
            continue
    }
    
    //avoid continuously loading the default sheet
    fn=wskin+"biomes\"+global.biome[i]+"\tiles.png"
    if (file_exists(fn)) {background_replace(global.master[i],fn,1,0) }
    else {global.master[i]= global.master[global.biomes+1]   }

    fn=wskin+"biomes\"+global.biome[i]+"\terrain.png"
    if (file_exists(fn)) {
        background_replace(global.masterterrain[i],fn,1,0)
        //Terrain type
        bgth=background_get_height(global.masterterrain[i])
        //To reduce on time, we only check the height of the sheet, instead of both width and height.
        switch (bgth){
            case 64:  global.terrainsheettype[i]=1 break; //1x1 minisheet.
            case 112: global.terrainsheettype[i]=2  break; //2x2 minisheet.
            case 160: global.terrainsheettype[i]=3  break; //3x3 minisheet.
            case 208: global.terrainsheettype[i]=4  break; //4x4 minisheet.
            default: global.terrainsheettype[i]=0
        }
    }
    else {
        global.masterterrain[i]= global.masterterrain[global.biomes+1]
        global.terrainsheettype[i]=global.terrainsheettype[global.biomes+1]
    }



    fn=wskin+"biomes\"+global.biome[i]+"\objects.png"
    if (file_exists(fn)) background_replace(global.masterobjects[i],fn,1,0)
    else global.masterobjects[i]= global.masterobjects[global.biomes+1]


    fn=wskin+"biomes\"+global.biome[i]+"\decor.png"
    if (file_exists(fn)) background_replace(global.masterdecor[i],fn,1,0)
    else global.masterdecor[i]= global.masterdecor[global.biomes+1]



    skindat("tex_master"+string(i),global.master[i])
    skindat("tex_master"+string(i)+"_filename",fn)
    skindat("tex_master"+string(i)+"_transp",1)

    replaceanimbg(global.biome[i],wskin+"biomes\","sky")
    replaceanimbg(global.biome[i],wskin+"biomes\","below")
    replaceanimbg(global.biome[i],wskin+"biomes\","trans")
    replaceanimbg(global.biome[i],wskin+"biomes\","water")

    if file_exists(wskin+"biomes\"+global.biome[i]+"\enemy.png") {
        replacesheet("","enemy"+string(i),wskin+"biomes\"+global.biome[i]+"\enemy.png",330,1824,1)
        global.enemysheet[i]=skindat("tex_enemy"+string(i))
    } else global.enemysheet[i]=global.enemysheet[global.biomes+1]

    if file_exists(wskin+"biomes\"+global.biome[i]+"\enemy2.png") {
        replacesheet("","enemy2"+string(i),wskin+"biomes\"+global.biome[i]+"\enemy2.png",330,1824,1)
        global.enemysheet2[i]=skindat("tex_enemy2"+string(i))
    } else global.enemysheet2[i]=global.enemysheet2[global.biomes+1]

    if file_exists(wskin+"biomes\"+global.biome[i]+"\boss.png") {
        replacesheet("","boss"+string(i),wskin+"biomes\"+global.biome[i]+"\boss.png",500,500,1)
        global.bosssheet[i]=skindat("tex_boss"+string(i))
    } else global.bosssheet[i]=global.bosssheet[global.biomes+1]

    if file_exists(wskin+"biomes\"+global.biome[i]+"\effects.png") {
        replacesheet("","effects"+string(i),wskin+"biomes\"+global.biome[i]+"\effects.png",215,315,1)
        global.effectssheet[i]=skindat("tex_effects"+string(i))
    } else global.effectssheet[i]=global.effectssheet[global.biomes+1]
}

replaceanimbg("special",wskin,"sky")

replacehud(global.wbase)
replacefont(wskin)

replacesheet("","gameover",wskin+"gameover.png",0,0,0)
replacesheet("","change",wskin+"change.png",0,0,0)
//replacesheet("","hud-classic",wskin+"hud-classic.png",0,0,1)
//replacesheet("","hud-battle",wskin+"hud-battle.png",0,0,1)
//replacesheet("","hud-timeattack",wskin+"hud-timeattack.png",0,0,1)
//replacesheet("","hud-coop",wskin+"hud-coop.png",0,0,1)
//replacesheet("","hud-sscreencoop",wskin+"hud-coop.png",0,0,1)
//replacesheet("","retainer",wskin+"retainer.png",279,178,1)
replacesheet("","pause",wskin+"pause.png",0,0,1)


for (i=1;i<=7;i+=1) {
    if (!replacesheet("","specialstage"+string(i),wskin+"special\specialstage-"+string(i)+".png",256,128,1)) {
        i-=1
        break
    }
}
skindat("specialsheets",i+1)
if (i=0) {
    replacesheet("","specialstage1",wskin+"specialstage.png",256,128,1)
}

skindat("anims"         ,funnytruefalse(skindat("settings snes animations"      )))
skindat("chkrng"        ,funnytruefalse(skindat("settings checkpoint ring"      )))
skindat("bricd"         ,funnytruefalse(skindat("settings bricks explode"       )))
skindat("toadjump"      ,funnytruefalse(skindat("settings retainer jump"        )))    
skindat("signpost"      ,funnytruefalse(skindat("settings sonic signpost"       )))
skindat("itemflip"      ,funnytruefalse(skindat("settings items turn around"    )))
skindat("groundstag"    ,funnytruefalse(skindat("settings stagger ground"       )))               
skindat("gameoverfade"  ,funnytruefalse(skindat("settings game over fade"       )))
skindat("grasslayer"    ,funnytruefalse(skindat("settings layered grass"        )))
skindat("mariotime"     ,funnytruefalse(skindat("settings mario timer"          )))
skindat("left"          ,funnytruefalse(skindat("settings go left"              )))
skindat("brickvar"      ,funnytruefalse(skindat("settings brick variations"     )))
skindat("cardtext"      ,funnytruefalse(skindat("settings level card text"      )))
skindat("pitchkick"     ,funnytruefalse(skindat("settings pitch kick sound"     )))
skindat("nofade"        ,funnytruefalse(skindat("settings disable fades"        )))
skindat("classflag"     ,funnytruefalse(skindat("settings classic flag"         )))
skindat("chopbar"       ,funnytruefalse(skindat("settings choppy firebars"      )))
skindat("liqsync"       ,funnytruefalse(skindat("settings sync liquid animation")))
skindat("skipchange"    ,funnytruefalse(skindat("settings skip level card"      )))    

skindat("uppercase"     ,funnytruefalse(skindat("lang uppercase text"           )))

skinstr("langthanks"    ,skindat("lang thank you"   ))
skinstr("langbut"       ,skindat("lang but"         ))
    
if (settings("mirror")) skindat("left",!skindat("left"))
    
skindat("itspd",median(1,round(unreal(skindat("settings item anim speed"),8)),64))
skindat("bgspd",median(1,round(unreal(skindat("settings bg anim speed"),8)),256))
    
skindat("hurrytime",median(1,round(unreal(skindat("music hurry timer"),30)),100))                                                                                                              
skindat("deathmusic",funnytruefalse(skindat("music music continues after death")))
skindat("nofast",!funnytruefalse(skindat("music fast music")))  
skindat("bossmusic",funnytruefalse(skindat("music boss music"))) 
skindat("autofast",power(root12of2,median(0,unreal(skindat("music automatic fast music semitones"),0),12)))
    
skindat("voffset",median(-64,unreal(skindat("settings vertical offset"),8),64))

skindat("walpha",median(0.1,unreal(skindat("settings water alpha"),1),1))
    
skindat("walkin",funnytruefalse(skindat("settings walk into castle")))
    
skindat("ealign",unreal(skindat("settings hud energy alignment"),1))
skindat("hudlayer",unreal(skindat("settings hud layer"),1))

global.enemyoffx=unreal(skindat("enemy center x"),0)
global.enemyoffy=unreal(skindat("enemy center y"),0)
global.enemywidth=unreal(skindat("enemy box width"),32)
global.enemyheight=unreal(skindat("enemy box height"),32)

for (i=0;i<global.enemysprites;i+=1) {
    global.enemysprite[i,1]=median(1,unreal(skindat("enemy "+global.enemysprite[i,0]+" frames"),1),32)
    global.enemysprite[i,2]=median(0,unreal(skindat("enemy "+global.enemysprite[i,0]+" speed"),0.125),1)
    global.enemysprite[i,3]=median(1,unreal(skindat("enemy "+global.enemysprite[i,0]+" loop"),1),global.enemysprite[i,1])-1
}


global.enemyoffx2=unreal(skindat("enemy2 center x"),0)
global.enemyoffy2=unreal(skindat("enemy2 center y"),0)
global.enemywidth2=unreal(skindat("enemy2 box width"),32)
global.enemyheight2=unreal(skindat("enemy2 box height"),32)

for (i=0;i<global.enemysprites2;i+=1) {
    global.enemysprite2[i,1]=median(1,unreal(skindat("enemy2 "+global.enemysprite2[i,0]+" frames"),1),32)
    global.enemysprite2[i,2]=median(0,unreal(skindat("enemy2 "+global.enemysprite2[i,0]+" speed"),0.125),1)
    global.enemysprite2[i,3]=median(1,unreal(skindat("enemy2 "+global.enemysprite2[i,0]+" loop"),1),global.enemysprite2[i,1])-1
}

replacesound("systempause",wskin+"sfx\systempause.wav")
replacesound("systemtimecount",wskin+"sfx\systemtimecount.wav")
replacesound("systemfaderoom",wskin+"sfx\systemfaderoom.wav")
replacesound("systemregister",wskin+"sfx\systemregister.wav")

replacesound("item1up",wskin+"sfx\item1up.wav")
replacesound("itemappear",wskin+"sfx\itemappear.wav")        
replacesound("itemblockbreak",wskin+"sfx\itemblockbreak.wav")
replacesound("itembridgebreak",wskin+"sfx\itembridgebreak.wav")
replacesound("itemblockbump",wskin+"sfx\itemblockbump.wav")  
replacesound("itemcoin",wskin+"sfx\itemcoin.wav")  
replacesound("itemring",wskin+"sfx\itemring.wav")
replacesound("itemcoinping",wskin+"sfx\itemcoinping.wav")
replacesound("itemcoinred",wskin+"sfx\itemcoinred.wav")
replacesound("itemcoinredall",wskin+"sfx\itemcoinredall.wav")
replacesound("itemshard",wskin+"sfx\itemshard.wav")
replacesound("itemredring",wskin+"sfx\itemredring.wav")
replacesound("itemfirework",wskin+"sfx\itemfirework.wav")
replacesound("itemflagpole",wskin+"sfx\itemflagpole.wav")
replacesound("itemflagpole2p",wskin+"sfx\itemflagpole2p.wav")
replacesound("itemgoalblock",wskin+"sfx\itemgoalblock.wav")
replacesound("itemsignpost",wskin+"sfx\itemsignpost.wav")
replacesound("itemsignpostland",wskin+"sfx\itemsignpostland.wav")
replacesound("itemsignpostfall",wskin+"sfx\itemsignpostfall.wav")
replacesound("itempipe",wskin+"sfx\itempipe.wav")
replacesound("itempipeexit",wskin+"sfx\itempipeexit.wav")
replacesound("itempowerup",wskin+"sfx\itempowerup.wav")
replacesound("itempowerup2",wskin+"sfx\itempowerup2.wav")
replacesound("itempowerup3",wskin+"sfx\itempowerup3.wav")
replacesound("itempowerup4",wskin+"sfx\itempowerup4.wav")
replacesound("itempowerup5",wskin+"sfx\itempowerup5.wav")
replacesound("itemminimush",wskin+"sfx\itemminimush.wav")
replacesound("itemstar",wskin+"sfx\itemstar.wav")
replacesound("itemspring",wskin+"sfx\itemspring.wav")
replacesound("itemsprong",wskin+"sfx\itemsprong.wav")  
replacesound("itemclock",wskin+"sfx\itemclock.wav") 
replacesound("itemrespawn",wskin+"sfx\itemrespawn.wav")
replacesound("itemcheck",wskin+"sfx\itemcheck.wav")
replacesound("itemspecial",wskin+"sfx\itemspecial.wav")
replacesound("itemsplash",wskin+"sfx\itemsplash.wav")
replacesound("itemspike",wskin+"sfx\itemspike.wav")
replacesound("itemspikedamage",wskin+"sfx\itemspikedamage.wav")
replacesound("itemaxe",wskin+"sfx\itemaxe.wav")
replacesound("itemretainer",wskin+"sfx\itemretainer.wav")
replacesound("itemdoor",wskin+"sfx\itemdoor.wav")
replacesound("itemdoorclose",wskin+"sfx\itemdoorclose.wav")
replacesound('itemmonitor',wskin+'sfx\itemmonitor.wav')
replacesound("itemtoken",wskin+"sfx\itemtoken.wav")
replacesound("itemonoffswitch",wskin+"sfx\itemonoffswitch.wav")
replacesound("itempswitch",wskin+"sfx\itempswitch.wav")
replacesound("itemmessage",wskin+"sfx\itemmessage.wav")
replacesound("itemjumprefresh",wskin+"sfx\itemjumprefresh.wav")
replacesound("itemshield",wskin+"sfx\itemshield.wav")
replacesound("itemkey",wskin+"sfx\itemkey.wav")
replacesound("itemswitch",wskin+"sfx\itemswitch.wav")
replacesound("itemgateopen",wskin+"sfx\itemgateopen.wav")
replacesound("itemgateclose",wskin+"sfx\itemgateclose.wav")
replacesound("itembutton",wskin+"sfx\itembutton.wav")
replacesound("itembeepblockblink",wskin+"sfx\itembeepblockblink.wav")
replacesound("itembeepblockchange",wskin+"sfx\itembeepblockchange.wav")
replacesound("itemcratebreak",wskin+"sfx\itemcratebreak.wav")
replacesound("itemgearplatform",wskin+"sfx\itemgearplatform.wav")
replacesound("itemwarpboxenter",wskin+"sfx\itemwarpboxenter.wav")
replacesound("itemwarpboxexit",wskin+"sfx\itemwarpboxexit.wav")

replacesound("specialfall",wskin+"sfx\specialfall.wav")   
replacesound("specialbump",wskin+"sfx\specialbump.wav") 
replacesound("specialcoin",wskin+"sfx\specialcoin.wav")
replacesound("specialnoise",wskin+"sfx\specialnoise.wav")
replacesound("specialtele",wskin+"sfx\specialtele.wav")
replacesound("specialpiston",wskin+"sfx\specialpiston.wav")
replacesound("specialpiston2",wskin+"sfx\specialpiston2.wav")
replacesound("specialbounce",wskin+"sfx\specialbounce.wav")
replacesound("specialbumper",wskin+"sfx\specialbumper.wav")    
replacesound("specialbutton",wskin+"sfx\specialbutton.wav")
replacesound("specialclock",wskin+"sfx\specialclock.wav")   
replacesound("specialspring",wskin+"sfx\specialspring.wav")
replacesound("specialwin",wskin+"sfx\specialwin.wav")
replacesound("specialgem",wskin+"sfx\specialgem.wav")

replacesound("enemycannon",wskin+"sfx\enemycannon.wav")
replacesound("enemycannonfast",wskin+"sfx\enemycannonfast.wav")
replacesound("enemycastlefire",wskin+"sfx\enemycastlefire.wav")
replacesound("enemyhurt",wskin+"sfx\enemyhurt.wav")
replacesound("enemykick",wskin+"sfx\enemykick.wav")
replacesound("enemykill",wskin+"sfx\enemykill.wav")
replacesound("enemystomp",wskin+"sfx\enemystomp.wav")
replacesound("enemyfire",wskin+"sfx\enemyfire.wav")
replacesound("enemybowserdown",wskin+"sfx\enemybowserdown.wav")  
replacesound("enemybowserhurt",wskin+"sfx\enemybowserhurt.wav") 
replacesound("enemyhammerthrow",wskin+"sfx\enemyhammerthrow.wav")
replacesound("enemyspinythrow",wskin+"sfx\enemyspinythrow.wav")
replacesound("enemybigexplode",wskin+"sfx\enemybigexplode.wav")
replacesound("enemybombfuse",wskin+"sfx\enemybombfuse.wav")
replacesound("enemybombfuseshort",wskin+"sfx\enemybombfuseshort.wav")
replacesound("enemybombwarn",wskin+"sfx\enemybombwarn.wav")
replacesound("enemyexplode",wskin+"sfx\enemyexplode.wav")
replacesound("enemythwomp",wskin+"sfx\enemythwomp.wav")
replacesound("enemybones",wskin+"sfx\enemybones.wav")
replacesound("enemycrusher",wskin+"sfx\enemycrusher.wav")
replacesound("enemyfirepiranhashoot",wskin+"sfx\enemyfirepiranhashoot.wav")

replacesound("finalbowserdie",wskin+"sfx\finalbowserdie.wav")  
replacesound("finalbowserfall",wskin+"sfx\finalbowserfall.wav")  

replacesound("powblockhit",wskin+"sfx\powblockhit.wav")
replacesound("smallbumper",wskin+"sfx\smallbumper.wav")
replacesound("bigbumper",wskin+"sfx\bigbumper.wav")

replacesound("playerwaterrun",wskin+"sfx\playerwaterrun.wav")

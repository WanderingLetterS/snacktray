///applylevelskin(directory,loadspec)
//applies level skins
var wskin, successes, i, fn, loadspec;
wskin = argument[0]+"\"
loadspec=0
if (argument_count >= 2) loadspec=argument[1]
// kelloggs was here

for (i=0;i<global.biomes;i+=1) {
    if (loadspec && !(loadspec & (1 << i))) // skip if loadspec says this biome isn't needed
        continue
    if (directory_exists(wskin+global.biome[i])) {
            
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
        successes+=1
    } else {show_debug_message("I HAAAATE IT!!##Couldn't find "+global.biome[i]+"##Directory = "+wskin+global.biome[i])}
}

if !successes {
    applyworldskin(global.wskins[1+global.worldskin,0],loadspec)
    updatemusic()
    show_message("Failed to load level skin.")
    return 0
}   

if string(global.exception)!="0" global.exception = global.currentlevel
else global.exception=global.lemonlskin
global.exceptdir = wskin

replaceanimbg("special",wskin,"sky")
    
replacefont(wskin)

for (i=1;i<=7;i+=1) if (!replacesheet("","specialstage"+string(i),wskin+"special\specialstage-"+string(i)+".png",256,128,1)) {i-=1 break}
skindat("specialsheets",i+1)
if (i=0) replacesheet("","specialstage1",wskin+"specialstage.png",256,128,1)

//if (directory_exists(wskin+"assets")) {
    //replaceasset(wskin,global.lskins[global.levelskin+1,0])
//}

with globalmanager {
    for (i=0;i<=musc;i+=1) {
        replacemusic(mload[i], wskin+"music\")
    }
}

return 1

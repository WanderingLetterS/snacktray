///applyworldskin(directory,[spec])
//applies a world skin
var path;
loadspec=0 // Load specific biomes
// kelloggs was here

if (argument_count >= 2)
    loadspec=argument[1]

path=argument[0]

//make sure base is applied before changing skins
if (path!=global.wbase && global.worldskin!=0) applyworldskin(global.wbase,loadspec)

with (globalmanager) {
    if (global.bundled || path=global.wbase) skin=path
    else skin=skindir+path

    skinstr("lang credits","")
    replaceinfo(skin+"world.txt")
    if (path=global.wbase) skinstr("name","Default")
    else skinstr("name",string_replace(string_lower(path),"world\",""))
    skinstr("credits world",skinstr("lang credits"))
    for (i=0;i<=musc;i+=1) skindat("music loop "+mload[i],0)
    replaceworld(skin,loadspec)

    //if (global.levelskin && !global.worldskin) replaceasset(skin,skindir+global.lskins[global.levelskin+1,0])
    //else replaceasset(skin)
    return 1
}
return 0

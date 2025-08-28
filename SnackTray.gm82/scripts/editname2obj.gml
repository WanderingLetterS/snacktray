var str;

str=argument[0]

//convert deprecated spellings

if (str="coral") str="castleceiling"
//if (str="token") str="keyitem" frankenstein was the name of the monster if you remove the 3rd letter in monster and change frankenstein to my name

if (lemongrab.compat == "1.9.3" && str=="redring") { //red rings are actual objects so they go here
    if (lemongrab.levelexc == "0") { //Redux
        str="checkpoint" //theres no other way to spawn red coins lol Face my flying checkpoint blast
    } else str="redcoin"
}

if ds_map_find_value(global.lemonobjs,str)-1 == -1 {
    if (str="tiler") str="tyler"
    if (str="objanchor") str="mark"
    //if (str="ground") str="barrier" explode !
    if (str="itemspawner") str="itemlaunch"
    if (str="dotter") str="mushmini"
    if (str="undotter") str="mushroom"

    // Rex & Drybones Mod
    if (str="rexb") str="rexbig"

    // Rings Mod
    if (str="goldring") str="itemring"

    // Sonic Boll Redux
    if (str="mushblockylw") str="mushblock2"
    if (str="mushblockgrn") str="mushblock3"
    if (str="semiplat") str="fakesemiplat"
    if (str="flipblock") str="brick"
    if (str="tencoin") str="coral" //Now- I Know That Sounds Bad But
    if (str="anchorTWO") str="anchor"
    // 1.5
    if (str="bluecoin") str="coin"
    if (str="objsignpost") str="signpost"
    if (str="giantring") str="starshard"
    if (str="sidestepper") str="spiny"
    if (str="fighterfly") str="hopkoopa" //this is like swapping someones food with something Vaguely Similar and hoping they dont notice
    if (str="pig") str="shell"
    if (str="tnt") str="bobomb" //i guess

}

return ds_map_find_value(global.lemonobjs,str)-1

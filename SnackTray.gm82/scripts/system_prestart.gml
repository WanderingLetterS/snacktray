readme_modding()

sureface_init()

skin_messagebox()
set_caption(gametitle)

//runner version check
if (!version_check()) {
    show_message("This game requires GameMaker 8.1.141 Standard or newer (8.2 is recommended).##You cannot use GameMaker 8.1 Lite or older versions like 8.1.91.##If you're having trouble, hit the official discord and ask for help. You can find a link to it on the main menu.")
    game_end()
    global.kill=1
    exit
}

missing=findfiles("sbfmd.dll","sb39d.dll","sbsnd.dll","sbjoy.dll","sbsdl.dll","sbpow.dll","sbfoc.dll")
if (missing!="") {
    show_message("The following files cannot be found:##"+missing+"##Please reinstall the game.")
    game_end()
    global.kill=1
    return 0
}

//game is go
return 1

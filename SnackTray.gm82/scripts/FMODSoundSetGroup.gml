//priority - 1 //Assured to me played. Use for menu and game critical sounds/music)
//effects - 2 //Will be bumped if concurent instance count is reached and priority soun needs to play
//ambientmusic - 3 //Will be cut by abouve group of count is maxed (background music usually)
//ambient effects -4 //will be cut by any above. rain sound, river sounds

return external_call(global.dll_FMODSoundSetGroup,argument[0],argument[1])

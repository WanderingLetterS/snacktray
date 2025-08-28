//returns a soundid
//returns 0 on error

if (!file_exists(argument[0])) return 0
return external_call(global.dll_FMODSoundAdd,argument[0],0,argument[1])

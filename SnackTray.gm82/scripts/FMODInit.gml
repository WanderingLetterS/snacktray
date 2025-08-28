var dll;

dll="sbsnd.dll"

global.dll_FMODfree=external_define(dll,"FMODfree",dll_stdcall,ty_real,0)

global.dll_FMODUpdate=external_define(dll,"FMODUpdate",dll_stdcall,ty_real,0)
global.dll_FMODAllStop=external_define(dll,"FMODAllStop",dll_stdcall,ty_real,0)
global.dll_FMODSoundFree=external_define(dll,"FMODSoundFree",dll_stdcall,ty_real,1,ty_real)

global.dll_FMODSoundAdd=external_define(dll,"FMODSoundAdd",dll_stdcall,ty_real,3,ty_string,ty_real,ty_real)
global.dll_FMODSoundGetLength=external_define(dll,"FMODSoundGetLength",dll_stdcall,ty_real,1,ty_real)
global.dll_FMODSoundSetLoopPoints=external_define(dll,"FMODSoundSetLoopPoints",dll_stdcall,ty_real,3,ty_real,ty_real,ty_real)
global.dll_FMODSoundPlay=external_define(dll,"FMODSoundPlay",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_FMODSoundLoop=external_define(dll,"FMODSoundLoop",dll_stdcall,ty_real,2,ty_real,ty_real)

global.dll_FMODSoundSetGroup=external_define(dll,"FMODSoundSetGroup",dll_cdecl,ty_real,2,ty_real,ty_real)
global.dll_FMODGroupSetVolume=external_define(dll,"FMODGroupSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real)
global.dll_FMODGroupSetPitch=external_define(dll,"FMODGroupSetPitch",dll_cdecl,ty_real,2,ty_real, ty_real)

global.dll_FMODGroupAddEffect=external_define(dll,"FMODGroupAddEffect",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_FMODEffectSetParamValue=external_define(dll,"FMODEffectSetParamValue",dll_stdcall,ty_real,3,ty_real,ty_real,ty_real)
global.dll_FMODEffectFree=external_define(dll,"FMODEffectFree",dll_stdcall,ty_real,1,ty_real);

global.dll_FMODInstanceSetVolume=external_define(dll,"FMODInstanceSetVolume",dll_cdecl,ty_real,2,ty_real,ty_real)
global.dll_FMODInstanceGetPosition=external_define(dll,"FMODInstanceGetPosition",dll_stdcall,ty_real,1,ty_real)
global.dll_FMODInstanceSetPosition=external_define(dll,"FMODInstanceSetPosition",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_FMODInstanceSetPitch=external_define(dll,"FMODInstanceSetPitch",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_FMODInstanceIsPlaying=external_define(dll,"FMODInstanceIsPlaying",dll_stdcall,ty_real,1,ty_real)
global.dll_FMODInstanceSetPaused=external_define(dll,"FMODInstanceSetPaused",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_FMODInstanceStop=external_define(dll,"FMODInstanceStop",dll_stdcall,ty_real,1,ty_real)

external_call(external_define(dll,"FMODinit",dll_stdcall,ty_real,2,ty_real,ty_real),32,0)

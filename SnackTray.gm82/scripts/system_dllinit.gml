global.winhandle=window_handle()

//discord
if settings('discord') {
discord_init_dll() discord_init_app("984471357758783498")
discord_update_presence("","Starting game","boll-icon","") }

global.dll_disablesave=external_define("sbpow.dll","disable_screensaver",dll_cdecl,ty_real,0)
global.dll_enablesave=external_define("sbpow.dll","enable_screensaver",dll_cdecl,ty_real,0)
global.powersave=1

external_call(external_define("sbhrt.dll","Initialize",dll_cdecl,ty_real,0))
global.dll_deltaTime=external_define("sbhrt.dll","DeltaTime",dll_cdecl,ty_real,0)

global.dll_foc=external_define("sbfoc.dll","getfocus",dll_stdcall,ty_real,0)
global.focus=1
alarm[2]=15

global.dll_dragaccept=external_define("sbdrg.dll","AcceptFiles",dll_stdcall,ty_real,2,ty_real,ty_real)
global.dll_dragnum=external_define("sbdrg.dll","CheckDraggedNum",dll_stdcall,ty_real,1,ty_real)
global.dll_dragname=external_define("sbdrg.dll","CheckDraggedFname",dll_stdcall,ty_string,2,ty_real,ty_real)
global.dll_dragclear=external_define("sbdrg.dll","ClearLastDrop",dll_stdcall,ty_real,0)

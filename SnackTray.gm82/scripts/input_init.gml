///input_init()
//call once; inits joystick systems

var dll;

dll="sbjoy.dll"

with (globalmanager) {
    input_discard()
    joyFind=      external_define(dll,"joy_find",dll_cdecl,ty_real,0)
    joyUpdate=    external_define(dll,"joy_update",dll_cdecl,ty_real,0)
    joyName=      external_define(dll,"joy_name",dll_cdecl,ty_string,1,ty_real)
    joyAxis=      external_define(dll,"joy_axis",dll_cdecl,ty_real,2,ty_real,ty_real)
    joyButton=    external_define(dll,"joy_button",dll_cdecl,ty_real,2,ty_real,ty_real)
    joyHat=       external_define(dll,"joy_hat",dll_cdecl,ty_real,2,ty_real,ty_real)
    external_call(external_define(dll,"joy_init",dll_cdecl,ty_real,0))
    joy_detect()
}

global.inputwait=0

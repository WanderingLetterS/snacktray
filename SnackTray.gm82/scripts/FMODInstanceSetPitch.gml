//export double FMODInstanceSetPitch(double instance, double pitch)

//Set the instance pitch. 0 to 10, 1 is default
//some sounds can have negative pitch, reversed/rewinding effect if not streamed

//See Also FMODInstanceGetPitch/Frequency

if (global.vapor) return external_call(global.dll_FMODInstanceSetPitch,argument[0],argument[1]*0.74915)
return external_call(global.dll_FMODInstanceSetPitch,argument[0],argument[1])

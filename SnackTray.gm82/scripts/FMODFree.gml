//export double FMODfree(void)

//You should free all you sounds before calling this function
//(unless you are quiting the game), In which case it does not matter.
return external_call(global.dll_FMODfree);

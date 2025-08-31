///levelpackunlock(key) Unlocks everything using the key and the levelpack.txt

if variable_global_exists("levelpack_"+argument[0]){
    if variable_global_array_get("levelpack_"+argument[0],0)>0{
        for (j=1;j< variable_global_array_get("levelpack_"+argument[0],0) ;j+=1){
            settings("save_"+string(global.saveslot)+" locklevel_"+variable_global_array_get("levelpack_"+argument[0],j),false)
        }
        return 1
    }
}
return 0

///charm_lock(setting,name)
//lock a charm based on if a setting is true or not.
//returns 0 if the charm is unlocked, and 1 if the charm is locked.
settings("lock "+argument1,!settings(argument0))
return settings("lock "+argument1)

///script_run(index, arg1, arg2..)
//script system for use in charms (run)

var obj,scr;

obj=object_find(string_copy(argument[0],1,string_pos(",",argument[0])-1))
scr=string_copy(argument[0],string_pos(",",argument[0])+1,2)
string_execute("scr = ev_user"+scr)


return event_perform_object(obj,ev_other,scr)

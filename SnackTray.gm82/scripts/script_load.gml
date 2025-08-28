///script_load(file) (returns script index)
//script system for use in charms (load)
var fn,f,str,scr,ret;

for (f=open_text(fn);!file_text_eof(f);read_text(f,2)) {
    str+=read_text(f,0)
} close_text(f)

if (global.scriptobj == verybignumber) { //this will waste an object if you somehow create 999999999 objects but at that point you have other problems
    global.scriptobj = object_add()
    global.scriptobj.scripts=0
}
else if (global.scriptobj.scripts>15) {
    global.scriptobj = object_add()
    global.scriptobj.scripts=0
}

string_execute("scr = ev_user"+string(global.scriptobj.scripts))
object_setevent(global.scriptobj,ev_other,scr,string_replace(str,"argument","yarrgument")) //my awesome way to make arguments work in objects

ret = string(global.scriptobj)+","+string((global.scripts) mod 16)
global.scripts += 1
global.scriptobj.scripts += 1

return ret;

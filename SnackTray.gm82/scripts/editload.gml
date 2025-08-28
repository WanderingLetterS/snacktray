///editload([filename])
//level editor load command
var fn;

if (argument_count) fn=argument[0]
else {
    if (!drawregion.unchanged) if (!show_question("You have unsaved changes!##Discard?")) exit
    fn=get_open_filename("Lemon Files|*.lemon|Legacy Lemon Files|*.lemon.png","")
}

if (!file_exists(fn)) exit

if string_pos(".lemon.png",string_lower(fn)) global.lemon_compat=1

//extension sanity
if global.lemon_compat {if (string_pos(".lemon.png",string_lower(fn))!=string_length(fn)-9) exit}

else if (string_pos(".lemon",string_lower(fn))!=string_length(fn)-5) exit

if (fn!=editmanager.autosave && fn!="test") {
    global.lemonfilename=fn
}


lemonloader(fn)
editloadregion(0)

global.lemon_compat=0

fn=filename_fixname(global.lemonfilename)

hotbar.str="Loaded file "+fn
hotbar.alpha2=8
if !(settings("nolemonsound")) sound("lemonlevelload")

global.levelfname=string_copy(fn,1,string_pos(".lemon",string_lower(fn))-1)
global.bundled=editmanager.bundled
updatebundle()

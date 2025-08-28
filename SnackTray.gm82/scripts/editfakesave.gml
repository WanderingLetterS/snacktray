///editsave([filename])
//level editor save command
var fn;

fn=""
if (argument_count) {
    fn=argument[0]
    if (fn=editmanager.autosave) autosaving=1
} else {
    if !(settings("nolemonsound")) sound("lemoncontext")
    f=show_contextmenu("Save|Save as...|Save with custom thumbnail",-1)
    if !(settings("nolemonsound")) sound("lemonselectitem")
    if (f=-1) exit
    if (f=0) fn=global.lemonfilename
    if (f=1) global.lemoncusthumb=""
    if (f=2) global.lemoncusthumb=get_open_filename("PNG Image|*.png","")
}
if (fn="") {
    fn=get_save_filename("Lemon Files|*.lemon|Legacy Lemon Files|*.lemon.png","Untitled")
    if (fn="") exit
    if string_pos(".lemon.png",fn) global.lemon_compat=1
    if global.lemon_compat fn=filename_change_ext(string_replace_all(fn,".lemon.png",""),".lemon.png")
    else fn=filename_change_ext(string_replace_all(fn,".lemon",""),".lemon")

    if (file_exists(fn)) {
        if (!show_question("File already exists:##"+fn+"##Overwrite?")) exit
    }
    global.lemonfilename=fn
    if (directory_exists(filename_dir(fn)+"\baseasset")) replaceasset(globalmanager.wskin,filename_dir(fn)+"\")
    else replaceasset(globalmanager.wskin)
    drawregion.update=1
}

//lemonsaver(fn)

global.lemon_compat=0

if (autosaving) {
    if (editmanager.fake_autosave && random(100) <= 10) {
        sound("lemonautosave")
        hotbar.str="Task failed successfully!"
    }else{
        sound("systemcodeblockfail")
        hotbar.str="Autosave error!"
    }
    hotbar.alpha2=8
} else {
    sound("systemcodeblockfail")
    ping("Warning! Error saving.##Please save somewhere else!")
    hotbar.alpha2=0
}

if (settings("edit autosave")) {
    if (autosaving) autosaving=0
    else {
        if (file_exists(editmanager.autosave)) file_delete(editmanager.autosave)
        editmanager.alarm[0]=3600
    }
}

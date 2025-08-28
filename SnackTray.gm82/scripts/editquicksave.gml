var p,optvar;
p = -1
optvar = "Quicksave now|Turn off"

with (editmanager) {
    if !(settings("nolemonsound")) sound("lemoncontext")
    if (global.gamemaker || global.debug) {optvar = optvar + "|Simulate quicksave fail"}
    p = show_contextmenu(optvar,-1)
    if !(settings("nolemonsound")) sound("lemonselectitem")

    if (p=0) {
        with(drawregion) {
            myarray_i=1
            savema=selected_array[0]
            repeat (savema) {
                with (selected_array[myarray_i]) {selected=0 event_user(0)}
                myarray_i+=1
                selected_array[0]-=1
            }

            selected_array[0]=0

            UPDATE_THE_DEITIES=1 event_user(7)
        }
        alarm[0]=2
        settings("edit autosave",1)
    }
    if (p=1) {
        if !(settings("nolemonsound")) sound("lemoncontext")
        if (show_question("This will also delete the current quicksave file.##Are you sure you want to disable quicksave?")) {
            if (file_exists(autosave)) file_delete(autosave)
            alarm[0]=-1
            settings("edit autosave",0)
            with (quickloadbutton) {flash=0 quick=0}
        }
        if !(settings("nolemonsound")) sound("selectitem")
    }
    if (p=2) {
        with(drawregion) {
            myarray_i=1
            savema=selected_array[0]
            repeat (savema) {
                with (selected_array[myarray_i]) {selected=0 event_user(0)}
                myarray_i+=1
                selected_array[0]-=1
            }

            selected_array[0]=0

            UPDATE_THE_DEITIES=1 event_user(7)
        }
        fake_autosave=1
        alarm[0]=2
        settings("edit autosave",1)
    }
}

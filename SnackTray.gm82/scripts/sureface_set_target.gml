var mem,err,s,name;

name=argument[0]

mem=error_occurred
err=error_last

s=sureface_get(name)

if (s=-1) {
    show_debug_message("sureface: error setting target to nonexisting surface "+qt+name+qt)
    return 0
}

error_occurred=0
surface_set_target(s)
error_last=err
if (error_occurred) {
    error_occurred=mem
    show_debug_message("sureface: error setting target to surface "+qt+name+qt)
    return 0
}

error_occurred=mem
return 1

if !variable_global_get("cobject_code_"+string(data[0])) {
    if !file_exists(globalmanager.moddir+"object\"+string(data[0])+"\object.gml") {break}
    else {
        variable_global_set("cobject_code_"+string(data[0]),code_compile(file_text_read_all(globalmanager.moddir+"object\"+string(data[0])+"\object.gml")))
        my_code=variable_global_get("cobject_code_"+string(data[0]))
    }
} else {
    my_code=variable_global_get("cobject_code_"+string(data[0]))

}
global.cobjectentrypoint=argument[0]
global.cobjectlemontype=argument[1]
global.cobjectlemondefault=argument[2]


return code_execute(my_code)

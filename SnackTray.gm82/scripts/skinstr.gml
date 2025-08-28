///skinstr(key)
///skinstr(key,value)
//skin string registry. passing a value writes to it.
//contains string error checking.

var res;

if (argument_count=1) {
    res=skindat(argument[0])
    if (!is_string(res)) {if (global.gamemaker) ping(lang("error skin string")+argument[0]) return ""}
    return res
} else {
    skindat(argument[0],string(argument[1]))
}

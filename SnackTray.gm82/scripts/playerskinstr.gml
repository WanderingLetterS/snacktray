///playerskinstr(slot,key)
///playerskinstr(slot,key,value)
//skin string registry. passing a value writes to it.
//contains string error checking.

var res;

if (argument_count=2) {
    res=playerskindat(argument[0],argument[1])
    if (!is_string(res)) {if (global.gamemaker) ping(lang("error skin string")+argument[1]) return ""}
    return res
} else {
    playerskindat(argument[0],argument[1],string(argument[2]))
}

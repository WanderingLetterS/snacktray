///format(val,digits)
//pads with zeroes for desired number of digits

if (argument[0]<0) return ""
return string_replace_all(string_format(argument[0],argument[1],0)," ","0")

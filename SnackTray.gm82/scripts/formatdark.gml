///format2(val,digits)
//pads with dark zeroes for desired number of digits

if (argument[0]<0) return ""
return string_replace_all(string_format(argument[0],argument[1],0)," ",chr(7))

///paddington(string,n)
//returns string padded to n characters
var l;

l=string_length(argument[0])
if (l<argument[1]) return argument[0]+string_repeat(" ",argument[1]-l)
return string_copy(argument[0],1,argument[1])

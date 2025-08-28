///marquee(str,len,pos)
//returns a spinning marquee of the str with length len, modulo to pos
var str,len,pos, l,p,b;

str=argument[0]
len=argument[1]
pos=argument[2]

l=string_length(argument[0])

if (l<=len) return str

str+=" - "
l+=3

p=(pos mod l)+1
b=min(l+1,p+len)-p

return string_copy(str,p,b)+string_copy(str,1,len-b)

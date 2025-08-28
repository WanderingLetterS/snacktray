///replacekeyword(str,key1,word1,key2,word2...)
//simple word substitution for language

var str,i;

str=argument[0]

for (i=1;i<argument_count;i+=2)
    str=string_replace(str,"%"+argument[i]+"%",argument[i+1])

return str

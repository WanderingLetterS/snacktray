var str,len;

str=argument[0]
len=string_length(str)

if (string_char_at(str,len)=="\")
    return filename_name(string_delete(str,len,1))

return filename_name(str)

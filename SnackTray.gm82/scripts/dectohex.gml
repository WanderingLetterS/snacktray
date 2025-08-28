var n,r;

n=argument[0]
r=""
while (n) {
    r=string_char_at("0123456789ABCDEF",n mod 16+1)+r
    n=n div 16
}

return r

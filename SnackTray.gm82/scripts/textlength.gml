///textlength(string)
//gets the true length of a string that ignores text tags
var msg, length, tagarr;
msg=argument0

{ //generate array of tag characters
    var ch, k, tagged, tagged2;

    k=1
    repeat (string_length(msg)) {
        ch=string_char_at(msg,k)

        if (ch="$") if (string_char_at(msg,k+1)="{") tagged=1 else if (string_char_at(msg,k+1)="|") tagged2=1
        tagarr[k]=!!(tagged + tagged2)
        if ch="}" tagged=0 if ch="|" tagged2=0
        k+=1
    }
}

length=0
j=0;
repeat (string_length(msg)) {
    if !tagarr[j+1] length+=1
    j+=1
    if j >= string_length(msg) break;
}
return length

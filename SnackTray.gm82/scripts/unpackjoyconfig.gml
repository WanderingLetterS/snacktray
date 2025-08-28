var str,i;

joyid=argument[0]
joyname=joy_get(joyid,3,0)
joyset=1

str=settings("joymaps "+joyname)
for (i=0;i<12;i+=1) {
    p=string_pos("|",str)
    cut=string_copy(str,1,p-1)
    str=string_delete(str,1,p)

    joymap[i]=cut

    if (string_pos("axis",cut)) {
        joykey[i,0]=0
        joykey[i,1]=real(string_digits(cut))
        joykey[i,2]=!!string_pos("+",cut)-!!string_pos("-",cut)
    }
    if (string_pos("button",cut)) {
        joykey[i,0]=1
        joykey[i,1]=real(string_digits(cut))
        joykey[i,2]=1-!!string_pos("-",cut)
    }
    if (string_pos("hat",cut)) {
        joykey[i,0]=2
        joykey[i,1]=0
        joykey[i,2]=real(string_digits(cut))
    }
}

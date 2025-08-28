var ret,check;

while !checkloop{
    checkloop = 1
    ret = irandom(global.characters-1)
    check = global.charname[ret]

    //Check for locked, disabled, or broken charms and stop the search.
    if settings("lock " + check)=1 checkloop=0
    if settings(check + "disabled")=1 checkloop=0
    if settings(check + "broken")=1 checkloop=0
}
return ret

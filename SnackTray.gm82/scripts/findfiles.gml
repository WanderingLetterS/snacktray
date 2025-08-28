var i,missing;

missing=""
for (i=0;i<argument_count;i+=1) {
    if (!file_exists(argument[i])) {
        if (missing!="") missing+=", "
        missing+=argument[i]
    }
}
return missing

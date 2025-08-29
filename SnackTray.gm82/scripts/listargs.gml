objlist[length,3]=argument_count
objlist[length,21]=1

for (j=0;j<12;j+=1) {
    if (j<argument_count) objlist[length,j+5]=argument[j]
    else objlist[length,j+5]=""
}

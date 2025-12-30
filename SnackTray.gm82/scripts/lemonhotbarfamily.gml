var k,l,famobj,saveobj;

saveobj=hotbar.obj[hotbar.cur]

currentfamily = lemongrab.objlist[saveobj,4]

l=0
for (k=0;k<=lemongrab.length;k+=1) { //find all objects in family
    if (lemongrab.objlist[k,4] == currentfamily ) {famobj[l]=editobjfind(lemongrab.objlist[k,0]) l+=1}
}
hotbar.famsize[hotbar.cur]=l+1
for (k=1;k<=l;k+=1) { //apply family objects to slot
    hotbar.famobj[hotbar.cur,k] = famobj[(k - 1) mod l]
}


for (k=1;k<=l;k+=1) { //find the family slot that the cursor should be on
    if saveobj=hotbar.famobj[hotbar.curfam,k] {
        hotbar.curfam[hotbar.cur]=k
        hotbar.obj[hotbar.cur]=hotbar.famobj[hotbar.cur,hotbar.curfam[hotbar.cur]]
        hotbar.picked[hotbar.cur,hotbar.curfam]=false
        exit
    }
}

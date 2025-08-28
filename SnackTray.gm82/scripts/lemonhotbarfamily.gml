var k,l,famobj,saveobj;

saveobj=hotbar.obj[1]
for (k=0;k<10;k+=1) famobj[k]=0 //Alright, I- I know that *sounds* bad--

currentfamily = lemongrab.objlist[saveobj,4]

l=0
for (k=0;k<=lemongrab.length;k+=1) { //find all objects in family
    if (lemongrab.objlist[k,4] == currentfamily) {famobj[l]=editobjfind(lemongrab.objlist[k,0]) l+=1}
}

//TECHNICALLY A BUGFIX: fixed applying family data to 10 slots so that slot "10" can be used for picking data

for (k=1;k<10;k+=1) { //apply family objects to slot
    hotbar.obj[k] = famobj[(k - 1) mod l]
}

for (k=1;k<10;k+=1) { //find the slot that the cursor should be on
    if saveobj=hotbar.obj[k] {
        hotbar.cur=k
        exit
    }
}

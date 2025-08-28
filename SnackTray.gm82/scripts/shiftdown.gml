///shiftdown(slot)
//removes a player box, sorting them to close the hole it leaves behind

var i,boxes,coordx,coordy;

with (rosterbox) {boxes[p2]=id coordx[p2]=x coordy[p2]=y}

for (i=argument[0];i<(3+(global.moreplayersitis*4));i+=1) {
    global.input[i]=global.input[i+1]
    global.option[i]=global.option[i+1]
    global.playerskin[i]=global.playerskin[i+1]
    boxes[i+1].p2-=1
    if (global.option[i]!=-1) applyplayerskin(global.pskins[1+global.playerskin[i],global.option[i]],i,"less",global.option[i])
}

with (rostercursor) if (mybox=boxes[argument[0]]) mybox=-1
boxes[argument[0]].ready=0
boxes[argument[0]].p2=(3+(global.moreplayersitis*4))

with (rosterbox) {x=coordx[p2] y=coordy[p2]}

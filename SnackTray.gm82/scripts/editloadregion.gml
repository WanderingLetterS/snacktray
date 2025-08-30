var test;

with (objcontainer) if (selected) event_user(0)

with (regionbutton) if (n=drawregion.region) empty=0

test=1
with (lemongrab.gods[drawregion.region]) test=0
with (lemongrab.waters[drawregion.region]) test=0
with (lemongrab.semis[drawregion.region]) test=0
with (lemongrab.backs[drawregion.region]) test=0
if (test) with (regionbutton) if (n=drawregion.region) empty=1

instance_deactivate_object(objcontainer)
instance_activate_object(lemongrab.gods[argument[0]])

instance_deactivate_object(watercontainer)
instance_activate_object(lemongrab.waters[argument[0]])

instance_deactivate_object(semicontainer)
instance_activate_object(lemongrab.semis[argument[0]])

instance_deactivate_object(backcontainer)
instance_activate_object(lemongrab.backs[argument[0]])

with (editzoom) {
    zoom=4
    if (lemongrab.w[argument[0]]>50 || lemongrab.h[argument[0]]>24) zoom=3
    if (lemongrab.w[argument[0]]>100 || lemongrab.h[argument[0]]>48) zoom=2
    if (lemongrab.w[argument[0]]>200 || lemongrab.h[argument[0]]>96) zoom=1
    if (lemongrab.w[argument[0]]>400 || lemongrab.h[argument[0]]>192) zoom=0
    event_user(0) xd=xdgo
    level=levelgo
}

with (drawregion) {
    region=argument[0]
    deity=lemongrab.gods[region]
    viewx=lemongrab.w[region]*8
    viewy=lemongrab.h[region]*9
    UPDATE_THE_DEITIES=1
    event_user(7)

}

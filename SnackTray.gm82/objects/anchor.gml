#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
name=""
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bim="0" || bim="-1" /*holdover from earlier implementation that im too lazy to change so take this horrible thing instead*/) getregion(x)
else biome=unreal(bim,1)-1

if (string(offset)!="" && string(offset)!="0") {
    p=string_pos(",",offset)
    if (p!=0) {
        x+=unreal(string_copy(offset,1,p-1),0)
        y+=unreal(string_delete(offset,1,p),0)
    }
}

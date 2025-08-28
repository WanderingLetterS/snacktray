var k,heorng;
if argument[0].intangible_timer exit
type=argument[0].object_index

if (type=beetle|| object_is_ancestor(type,koopa) || type=koopa) {
    with (argument[0]) {
        //WE'RE GONNA FLIP 'EM
        sound("enemykick")
        owner=other.owner
        doscore_e(800,id)
        if object_index!=bombshellkoopa
        heorng=instance_create(x,y,shell)
        else heorng=instance_create(x,y,bombshell)
        with (heorng) {owner=other.owner phase=owner}
        if (object_index=redkoopa) heorng.type="red"
        if (object_index=blukoopa) {heorng.type="blu" heorng.enemy2=1}
        if (object_index=yelkoopa) {heorng.type="yel" heorng.enemy2=1}
        if (object_index=redhover) {heorng.type="red"}
        if (object_index=yelhover) {heorng.type="yel" heorng.enemy2=1}
        if (object_index=bluhover) {heorng.type="blu" heorng.enemy2=1}
        if (object_index=beetle) heorng.type="beetle"
        if (object_index=spiny) heorng.type="spiny"
        heorng.ysc=-1
        other.heorng=heorng
        instance_destroy()
    }
    return heorng
} else return 0

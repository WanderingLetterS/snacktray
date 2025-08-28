if (argument[2]!=1) {
    with (instance_create(argument[0]-8,argument[1]-4,smoke)) {vspeed=-1 hspeed=-2 friction=0.1}
    with (instance_create(argument[0]-8,argument[1]+4,smoke)) {vspeed=1 hspeed=-2 friction=0.1}
}

if (argument[2]!=-1) {
    with (instance_create(argument[0]+8,argument[1]-4,smoke)) {vspeed=-1 hspeed=2 friction=0.1}
    with (instance_create(argument[0]+8,argument[1]+4,smoke)) {vspeed=1 hspeed=2 friction=0.1}
}

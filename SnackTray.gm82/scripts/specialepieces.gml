var dx,dy;

dx=argument[0]*32+16
dy=argument[1]*32+16

if (argument[2]!="x" && argument[2]!="/" && argument[2]!="\" && argument[2]!="`" && argument[2]!="´") {
    instance_create(dx,dy,bollfloor)
}

switch (argument[2]) {
    case "S": x=dx y=dy break
    case "#": instance_create(dx,dy,bollwall) break
    case "O": instance_create(dx,dy,bollwallcircle) break
    case "/": instance_create(dx,dy,bolldiagbr) break
    case "\": instance_create(dx,dy,bolldiagbl) break
    case "`": instance_create(dx,dy,bolldiagtr) break
    case "´": instance_create(dx,dy,bolldiagtl) break

    case "T": instance_create(dx,dy,bollpiston) break
    case "!": instance_create(dx,dy,bollbutton) break
    case "B": instance_create(dx,dy,bollblockon) break
    case "b": instance_create(dx,dy,bollblockoff) break

    case "%": instance_create(dx,dy,bollspring) break
    case "@": instance_create(dx,dy,bollbumper) break
    case "t": instance_create(dx,dy,bolltimer) break

    case "F": instance_create(dx,dy,bollgem) break
    case "1": case "2": case "3": with (instance_create(dx,dy,bollcheck)) n=unreal(argument[2],1) break

    case ".": instance_create(dx,dy,bollcoin) break
    case ":": instance_create(dx-8,dy-8,bollcoin) instance_create(dx+8,dy-8,bollcoin) instance_create(dx-8,dy+8,bollcoin) instance_create(dx+8,dy+8,bollcoin) break

}

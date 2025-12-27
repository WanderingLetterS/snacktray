///com_contenttoobject() replaces content value with object, adds sprite, and determines if the content is an enemy or object for drawing purposes.
enem=0
object=0
if !is_string(content) show_message("wtf")

switch content {
    case "goomba": content=goomba sprite="goomba" enem=1 break
    case "goombrat": content=goombrat sprite="goombrat" enem=1 break
    case "paragoomba": content=paragoomba sprite="paragoomba" enem=1 break
    case "paragoombrat": content=paragoombrat sprite="paragoombrat" enem=1 break
    case "koopa": content=koopa sprite="koopa" enem=1 break
    case "rkoopa": content=redkoopa sprite="redkoopa" enem=1 break
    case "paratroopa": content=hopkoopa sprite="paratroopa" enem=1 break
    case "rparatroopa": content=redhover sprite="redparatroopa" enem=1 break
    case "yparatroopa": content=yelhover sprite="yelparatroopa" enem=1 enemy2=1break
    case "bparatroopa": content=bluhover sprite="bluparatroopa" enem=1 enemy2=1break
    case "bkoopa": content=blukoopa sprite="blukoopa" enem=1 enemy2=1break
    case "ykoopa": content=yelkoopa sprite="yelkoopa" enem=1 enemy2=1break

    case "gshell":

    case "shell": content=shell sprite="shell" enem=1 break

    case "rshell": content=shell sprite="redshell" type="red" enem=1 break
    case "yshell": content=shell sprite="yelshell" type="yel" enem=1 enemy2=1 break
    case "bshell": content=shell sprite="blushell"  type="blu" enem=1 enemy2=1 break

    case "beetle": content=beetle sprite="beetle" enem=1 break
    case "spiny": content=spiny sprite="spiny" enem=1 break
    case "blooper": content=blooper sprite="blooper" enem=1 break
    case "bobomb": content=bobomb sprite="bob-omb" enem=1 enemy2=1 break
    case "litbobomb": content=litbobomb sprite="bob-ombfuse" enem=1 enemy2=1 break
    case "podoboo": instance_create(x,y+4,podoboo) instance_destroy() break
    case "chopper": instance_create(x,y+4,chopper) instance_destroy() break
    case "mushroom": content=mushroom sprite="mushroom" break
    case "life": case "1up": content=lifemush sprite="lifemush" break
    case "shield":  content=shield sprite="shield" break
    case "star": content=starman sprite="star" break
    case "item": case "fflower": case "flower": content=flower sprite="fflower" break
    case "mini": content=mushmini sprite="mini" break
    case "itemfeather": case "bfeather": case "feather": content=feather sprite="bfeather" break
    case "thunderitem": case "tflower": content=tflower sprite="tflower" break
    case "wateritem": case "wflower": content=wflower sprite="wflower" break
    case "cloveritem": case "cflower": content=cflower sprite="cflower" break
    case "iceitem": case "iflower": content=iflower sprite="iflower" break
    case "questionitem": case "questionmush": content=questionmush sprite="?mushroom" break
    case "poison": content=mushpoison sprite="mushpoison" break
    case "spring": content=spring sprite="spring" object=1 break
    case "spreng": content=spreng sprite="spreng" object=1 break
    case "vine": content=sprong sprite="sprong" object=1 break
    case "stone": content=stone sprite="stone" object=1 break
    case "cork": content=cork sprite="cork" object=1 break
    case "key": content=keyitem sprite="key"  break
    case "card": content=carditem sprite="card" break

    default: //if behaviour is not specified, then check randomly to see if you find something.
    check=object_find(content)
    if check!=0 && check!=noone && check>0 {sprite=content content=check}
    else{
    content=coin sprite="coin"} break
}

///ssw_monitor(name)
//This handles sprite switching for the item monitors

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr88, xsc,ysc,w,h,sheet,itemfound;
frox=8 froy=16 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1
sheet=global.masterobjects[biome]
if (object_index=monamie) fr=3
else fr=global.frame8 mod 2
if dead fr=2
my_item=string(argument[0])
itemfound=false
if instance_exists(player){
    itemfound=true
    with instance_nearest(x,y,player){

    if other.lastplayer!=other.lastplayer
    other.lastplayer=id
        if ((other.my_item=="?mush" && !default_questionmush) || (custom_items)){
            itemfound=true
            switch (other.my_item){
                case "?mushroom": {frx=0 fry=0  break}

                case "?mush": { frx=2 fry=0 break}

                case "fire":  {frx=0 fry=1  break}
                case "feather": {frx=1 fry=1 break}
                case "ice":  {frx=2 fry=1 break}

                case "thunder":  {frx=0 fry=2 break}
                case "water":  {frx=1 fry=2 break}
                case "clover":  {frx=2 fry=2 break}

                case "mush":    {frx=0 fry=3 break}
                case "mini":    { frx=1 fry=3 break}
                case "1up": {  frx=2 fry=3 break}

                default: itemfound=false; break;
            }
        }    else itemfound=false
    }
    if itemfound{

        showicon=0
        if fr==1 showicon=1
        if fr>0 fr-=1
        if fr!=3 draw_sprite_part_ext(instance_nearest(x,y,player).sheetshields,0,fr*21+sprite_get_width(instance_nearest(x,y,player).sheetshields)-71,179,w*20,h*24,floor(x+7-frox*xsc),floor(12+y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
        if (showicon||fr==3) draw_sprite_part_ext(instance_nearest(x,y,player).sheetshields,0,frx*21+sprite_get_width(instance_nearest(x,y,player).sheetshields)-71,179+fry*25,w*20,h*24,floor(x+7-frox*xsc),floor(12+y-froy*ysc)+dy,xsc,ysc,$ffffff,1)


    exit
    }
}



switch (argument[0]) {

    case "random": {
        frx=2
        fry=0
    break}
    case "time": {
        frx=3
        fry=0
    break}
    case "10coin": {
        frx=4
        fry=0
    break}
    case "superring": {
        frx=5
        fry=0
    break}
    case "powersneakers": {
        frx=6
        fry=0
    break}


    case "mush": {
        frx=0
        fry=1
    break}
    case "fire": {
        frx=1
        fry=1
    break}
    case "feather": {
        frx=2
        fry=1
    break}
    case "ice": {
        frx=3
        fry=1
    break}
    case "thunder": {
        frx=4
        fry=1
    break}
    case "water": {
        frx=5
        fry=1
    break}
    case "clover": {
        frx=6
        fry=1
    break}
    case "?mush": {
        frx=7
        fry=1
    break}

    case "mini": { //toilet paper monitor../.
        frx=0
        fry=2
    break}
    case "star": {
        frx=1
        fry=2
    break}
    case "1up": {
        frx=2
        fry=2
    break}
    case "poison": {
        frx=3
        fry=2
    break}
    case "shield": {
        frx=4
        fry=2
    break}
    case "fireshield": {
        frx=5
        fry=2
    break}
    case "elecshield": {
        frx=6
        fry=2
    break}
    case "watershield": {
        frx=7
        fry=2
    break}



    case "custom": {
        frx=7
        fry=0
    break}

    default:
    case "":{
        frx=7
        fry=0
    break}

}
showicon=0
if fr==1 showicon=1
if fr>0 fr-=1

if fr!=3
draw_background_part_ext(sheet,280+fr*20,344,w*20,h*24,floor(x+7-frox*xsc),floor(12+y-froy*ysc)+dy,xsc,ysc,$ffffff,1)

if (showicon||fr==3)
draw_background_part_ext(sheet,280+frx*20,344+fry*24,w*20,h*24,floor(x+7-frox*xsc),floor(12+y-froy*ysc)+dy,xsc,ysc,$ffffff,1)

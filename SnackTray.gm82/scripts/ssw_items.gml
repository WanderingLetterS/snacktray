///ssw_items(name)
//This handles sprite switching for the items of the game

if (!inview()) exit

var frox,froy, frx,fry, ifr,fr,ffr4,fr88, xsc,ysc,w,h,sheet, itemfound;

fr=global.frame
ifr=global.itemframe
ffr4=global.fastframe4
fr88=global.frame88


my_item=argument[0]
//A new option for skins has been added that lets the character skin over the items.
//Oh yeah and the ?Mush has an option to NOT do it.

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1

itemfound=false
if instance_exists(player){
    itemfound=false
    with instance_nearest(x,y,player){
        if !dead{
            if other.lastplayer!=other.lastplayer
                other.lastplayer=id
            if ((argument[0]=="?mushroom" && !default_questionmush) || (custom_items)){
                itemfound=true
                switch (argument[0]){
                    case "?mushroom": {if custom_mushrooms_idle other.hspeed=0  frx=fr fry=0 frox=8 froy=8 break}

                    case "mushroom": { if custom_mushrooms_idle other.hspeed=0  frx=fr fry=1 frox=8 froy=8 break}

                    case "fflower":  {frx=ifr fry=2 frox=8 froy=8 break}
                    case "bfeather": {frx=other.featherfr fry=3 frox=8 froy=8 break}
                    case "iflower":  {frx=ifr fry=4 frox=8 froy=8 break}

                    case "tflower":  {frx=ifr fry=5 frox=8 froy=8 break}
                    case "wflower":  {frx=ifr fry=6 frox=8 froy=8 break}
                    case "cflower":  {frx=ifr fry=7 frox=8 froy=8 break}

                    case "mini":    {if custom_mushrooms_idle other.hspeed=0 frx=fr fry=8 frox=8 froy=8 break}
                    case "lifemush": { if custom_mushrooms_idle other.hspeed=0  frx=fr fry=9 frox=8 froy=8 break}

                    default: itemfound=false; break;
                }
            }    else itemfound=false
        }
    }
    if itemfound{
        draw_sprite_part_ext(instance_nearest(x,y,player).sheetshields,0,frx*17+sprite_get_width(instance_nearest(x,y,player).sheetshields)-76,fry*17+9,w*16,h*16,floor(x-frox*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
        exit
    }

}

sheet=global.masterobjects[biome]
switch (argument[0]) {
    //Left to right, up to down
    case "mushroom": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr fry=0 frox=8 froy=8 break}
    case "mini":    {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr+4 fry=0 frox=8 froy=8 break}
    case "coin": { frox=8 froy=8 frx=8+ifr fry=0 break}

    case "fflower":  {frx=ifr fry=1 frox=8 froy=8 break}
    case "tflower":  {frx=ifr+4 fry=1 frox=8 froy=8 break}
    case "coinup": case "coindrop": {frox=8 froy=8 frx=8+(fr88 mod 4) fry=1 break}

    case "bfeather":  {frx=featherfr fry=2 frox=8 froy=8 break}
    case "wflower":  {frx=ifr+4 fry=2 frox=8 froy=8 break}
    case "redcoin": {frox=8 froy=8 frx=8+ifr fry=2 break}

    case "iflower":  {frx=ifr fry=3 frox=8 froy=8 break}
    case "cflower":  {frx=ifr+4 fry=3 frox=8 froy=8 break}
    case "bluecoin": { frox=8 froy=8 frx=8+ifr fry=3 break}

    case "shield":    {frx=ifr fry=4 frox=8 froy=8 break}
    case "fireshield":    {frx=ifr+4 fry=4 frox=8 froy=8 break}
    case "ring": {frox=8 froy=8 frx=8+ifr fry=4 break}

    case "bublshield":    {frx=ifr fry=5 frox=8 froy=8 break}
    case "elecshield":    {frx=ifr+4 fry=5 frox=8 froy=8 break}
    case "ringup": case "ringdrop": {frox=8 froy=8 frx=8+ifr fry=5 break}

    case "lifemush": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr fry=6 frox=8 froy=8 break}
    case "star":     {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=ifr+4 fry=6 frox=8 froy=8 break}
    case "redring": {frox=8 froy=8 frx=8+ifr fry=6 break}

    case "mushpoison": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr fry=7 frox=8 froy=8 break}
    case "mushrotten": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr+4 fry=7 frox=8 froy=8 break}
    case "grayring": {frox=8 froy=8 frx=8+ifr fry=7 break}

    case "key": {frx=fr fry=8 frox=8 froy=8 break}    case "keyfollow": {frx=0 fry=8 frox=8 froy=9-round(abs(cos(posbob))*bob) break}
    case "card": {frx=4+fr fry=8 frox=8 froy=9 break}    case "cardforshow": {frx=4 fry=8 frox=8 froy=8 xsc=0.5 ysc=0.5 break}    case "cardfollow": {frx=4+fr fry=8 frox=8 froy=9 break}
    case "purplering": {frox=8 froy=8 frx=8+ifr fry=8 break}

    case "?mushroom": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=fr fry=9 frox=8 froy=8 break}
    case "sneakers": { frox=8 froy=8 frx=4+ifr fry=9 break}
    case "token":    {frx=ifr+8 fry=9  frox=8 froy=8 break}

    case "shard":    {frx=fr88 fry=10 frox=8 froy=8 break}

    case "jumprefresh": {frx=8+(ifr*(3/4)) if spent frx=11 fry=10 frox=8 froy=8 break}

}

draw_background_part_ext(sheet,frx*16+280,fry*16+152,w*16,h*16,floor(x-frox*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)

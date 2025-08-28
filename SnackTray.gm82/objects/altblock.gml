#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
//numbers are organized like numpad
c9=position_meeting(x+24,y-8,altblock) || position_meeting(x+24,y-8,slopeground) || position_meeting(x+24,y-8,slopel1) || position_meeting(x+24,y-8,slopel2) || position_meeting(x+24,y-8,nslopl) || position_meeting(x+24,y-8,nslopl2)  || x=region.x-16
c6=position_meeting(x+24,y+8,altblock) || position_meeting(x+24,y+8,slopeground) || position_meeting(x+24,y+8,slopel1) || position_meeting(x+24,y+8,slopel2) || position_meeting(x+24,y+8,nslopl) || position_meeting(x+24,y+8,nslopl2) || x=region.x-16
c7=position_meeting(x-8,y-8,altblock) || position_meeting(x-8,y-8,slopeground) || position_meeting(x-8,y-8,sloper1) || position_meeting(x-8,y-8,sloper2) || position_meeting(x-8,y-8,nslopr) || position_meeting(x-8,y-8,nslopr2) || x=region.lefthand
c4=position_meeting(x-8,y+8,altblock) || position_meeting(x-8,y+8,slopeground) || position_meeting(x-8,y+8,uslopeground) || position_meeting(x-8,y+8,sloper1) || position_meeting(x-8,y+8,sloper2) || position_meeting(x-8,y+8,usloper1) || position_meeting(x-8,y+8,usloper2) || x=region.lefthand
c1=position_meeting(x-8,y+24,altblock) || position_meeting(x-8,y+24,slopeground) || position_meeting(x-8,y+24,uslopeground) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,altblock) || position_meeting(x+24,y+21,slopeground) || position_meeting(x+24,y+21,uslopeground) || position_meeting(x+24,y+24,altblock) || x=region.x-16 || y=region.ky-16
c8=position_meeting(x+8,y-8,altblock) || position_meeting(x+8,y-8,slopeground)
c2=position_meeting(x+8,y+24,altblock) || position_meeting(x+24,y-8,uslopeground) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bx,by,sheet;

bx=x mod 32
by=y mod 32
if !dontrender{
    sheet=global.masterterrain[biome]
    terraintile=1


    if global.terrainsheettype[biome]==1{ //minimum
        tile_bake(sheet,8,40,16,16,x,y,999998)
        with instance_create(x,y,ground) {myFavouriteTile=other.myFavouriteTile}
instance_destroy()
    exit
    } else if global.terrainsheettype[biome]==2{ //small
        if (!c8)tile_bake(sheet,8,72,16,16,x,y,999998)
        else tile_bake(sheet,8,88,16,16,x,y,999998)
        with instance_create(x,y,ground) {myFavouriteTile=other.myFavouriteTile}
instance_destroy()
    exit
    } else if global.terrainsheettype[biome]==3{ //medium/3x3
        if !c8{ //Top part
            if !c4{tile_bake(sheet,8,104,16,16,x,y,999998)   } //left
            else if !c6{tile_bake(sheet,24,104,16,16,x,y,999998) } //right
            else { tile_bake(sheet,40,104,16,16,x,y,999998)} //middle
        } else if !c2{ //Bottom part
            if !c4{tile_bake(sheet,8,136,16,16,x,y,999998)   } //left
            else if !c6{tile_bake(sheet,24,136,16,16,x,y,999998) } //right
            else { tile_bake(sheet,40,136,16,16,x,y,999998)} //middle
        } else { //Middle
            if !c4{tile_bake(sheet,8,120,16,16,x,y,999998)   } //left
            else if !c6{tile_bake(sheet,24,120,16,16,x,y,999998) } //right
            else { tile_bake(sheet,40,120,16,16,x,y,999998)} //middle
        }
        with instance_create(x,y,ground) {myFavouriteTile=other.myFavouriteTile}
instance_destroy()
    exit
    }







    //It's like calculators/numpad 1 is bottomleft 2 is bottommid 3 is bottomright....
    if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile_bake(sheet,32+bx,32+by+528,16,16,x,y,999998)}
    else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile_bake(sheet,88,88+528,32,32,x-8,y-8,999998)}
    else if (!c8 && !c2) {
        if (!c4) {/*platform left*/ tile_bake(sheet,8,88+528,24,32,x-8,y-8,999998)}
        else if (!c6) {/*platform right*/ tile_bake(sheet,64,88+528,24,32,x,y-8,999998)}
        else {/*platform middle*/ tile_bake(sheet,32+bx,88+528,16,32,x,y-8,999998)}
    } else if (!c4 && !c6) {
        if (!c8) {/*pole top*/ tile_bake(sheet,88,8+528,32,24,x-8,y-8,999998)}
        else if (!c2) {/*pole bottom*/ tile_bake(sheet,88,64+528,32,24,x-8,y,999998)}
        else {/*pole middle*/ tile_bake(sheet,88,32+by+528,32,16,x-8,y,999998)}
    } else {
        if (!c4) {
            if (!c8) {
                if (!c3) {
                    /*slim corner top left*/tile_bake(sheet,72,120+528,24,24,x-8,y-8,999998)
                } else
                {/*corner top left*/ tile_bake(sheet,8,8+528,24,24,x-8,y-8,999998)}
            } else if (!c2) {
                if (!c9) {/*slim corner bottom left*/tile_bake(sheet,72,144+528,24,24,x-8,y,999998)}
                else {/*corner bottom left*/ tile_bake(sheet,8,64+528,24,24,x-8,y,999998)}
            } else {//!4 & 8 & 2 & 6
                if (!c9 && c3 ) {tile_bake(sheet,120,80+528,24,16,x-8,y,999998)}
                else if (!c3 && c9) {tile_bake(sheet,120,64+528,24,16,x-8,y,999998)}
                else if (!c3 && !c9) {tile_bake(sheet,184,144+528,24,16,x-8,y,999998)}
                 else {/*left wall*/ tile_bake(sheet,8,32+by+528,24,16,x-8,y,999998)}
            }
        } else if (!c6) {
            if (!c8) {
                if (!c1) {/*slimcorner top right*/ tile_bake(sheet,96,120+528,24,24,x,y-8,999998)}
                 else {/*corner top right*/ tile_bake(sheet,64,8+528,24,24,x,y-8,999998)}
            } else if (!c2) {
                if (!c7) {/*slimcorner bottom right*/ tile_bake(sheet,96,144+528,24,24,x,y,999998)}
                 else {/*corner bottom right*/ tile_bake(sheet,64,64+528,24,24,x,y,999998)}
            } else {
                if (!c1 && c7 ) {tile_bake(sheet,144,64+528,24,16,x,y,999998)}
                else if (!c7 && c1) {tile_bake(sheet,144,80+528,24,16,x,y,999998)}
                else if (!c7 && !c1) {tile_bake(sheet,208,144+528,24,16,x,y,999998)}
                else {/*right wall*/ tile_bake(sheet,64,32+by+528,24,16,x,y,999998)}
            }
        } else { // 6 && 4
            if (!c8) {// !8 && 6 && 4
                if (c1 && !c3) {tile_bake(sheet,128,8+528,16,24,x,y-8,999998)}
                else if (c3 && !c1 ){tile_bake(sheet,144,8+528,16,24,x,y-8,999998) }
                else if(!c3 && !c1) {tile_bake(sheet,192,104+528,16,24,x,y-8,999998)}
                else {/*floor*/ tile_bake(sheet,32+bx,8+528,16,24,x,y-8,999998)}
            } else if (!c2) { //8
                if (c7 && !c9) {tile_bake(sheet,128,32+528,16,24,x,y,999998)}
                else if(!c7 && c9){tile_bake(sheet,144,32+528,16,24,x,y,999998) }
                else if(!c7 && !c9) {tile_bake(sheet,208,112+528,16,24,x,y,999998)}
                else {/*ceiling*/ tile_bake(sheet,32+bx,64+528,16,24,x,y,999998)}
            } else { // 8 & 2 & 6 & 4
                if (c7+c9+c1+c3!=3) {
                    if (c7+c9+c1+c3!=2){
                        if (c7+c9+c1+c3!=1){
                            tile_bake(sheet,144,128+528,16,16,x,y,999998)
                        }
                        else if (!c7 && !c9 && !c1){tile_bake(sheet,176,64+528,16,16,x,y,999998)}
                        else if (!c7 && !c3 && !c1){tile_bake(sheet,176,80+528,16,16,x,y,999998)}
                        else if (!c7 && !c9 && !c3){tile_bake(sheet,192,64+528,16,16,x,y,999998)}
                        else if (!c9 && !c3 && !c1){tile_bake(sheet,192,80+528,16,16,x,y,999998)}
                    }
                    else if (!c7 && !c9)/*everyone except these two*/{tile_bake(sheet,144,144+528,16,16,x,y,999998)}
                    else if (!c7 && !c1){tile_bake(sheet,160,128+528,16,16,x,y,999998)}
                    else if (!c7 && !c3){tile_bake(sheet,32,144+528,16,16,x,y,999998)}
                    else if (!c9 && !c1){tile_bake(sheet,48,144+528,16,16,x,y,999998)}
                    else if (!c9 && !c3){tile_bake(sheet,128,128+528,16,16,x,y,999998)}
                    else if (!c1 && !c3){tile_bake(sheet,144,112+528,16,16,x,y,999998)}
                }
                else if (!c7) {/*inner corner top left*/ tile_bake(sheet,192,32+528,16,16,x,y,999998)}
                else if (!c9) {/*inner corner top right*/ tile_bake(sheet,176,32+528,16,16,x,y,999998)}
                else if (!c1) {/*inner corner bottom left*/ tile_bake(sheet,192,16+528,16,16,x,y,999998)}
                else if (!c3) {/*inner corner bottom right*/ tile_bake(sheet,176,16+528,16,16,x,y,999998)}
            }




        }

    }
    terraintile=0
}

instance_create(x,y,ground)
instance_destroy()

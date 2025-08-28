///playercol(type)
//player color table

switch (argument[0]) {
    case 0: return $ffffff
    case 1: return $aaaaaa              //keyboard

    case JOY:   return $ff              //joy 1
    case JOY+1: return $c000            //joy 2
    case JOY+2: return $ff6020          //joy 3
    case JOY+3: return $b3ff            //joy 4
    case JOY+4: return $ffff00          //joy 5
    case JOY+5: return $dc00ff          //joy 6
    case JOY+6: return $006aff          //joy 7
    case JOY+7: return $ff0088          //joy 8
}

return $ffffff

///exceptiontoname(exception, biome, type) [Valid biomes: day, pipe/pipeintro, under, water]
//Returns a modern biome from Sonic Boll 1.9's "Biome + Exception" system.

//Supported mods: Sonic Boll Redux v1.4.2 + v1.5, The Mo' Themes Mod

var exc, bim, type;

exc  = string_replace(argument[0],"\","")
bim  = argument[1]
type = argument[2]

if (bim == "pipeintro") bim = "pipe"

if exc="" return exceptiondefault(bim,type)

switch (exc) {
    case "athletic": {
        if (bim == "day" || bim == "pipe") {
            if (type == 1) return "Underwater"
            if (type == 0) return "Ground"
                           return "Beach"
        }
        return exceptiondefault(bim, type)
    }
    case "night":
    case "autumn": {
        if (bim == "day" || bim == "pipe") {
            return "Autumn"
        } else if (bim == "under") {
            if (type == 1) {biomemod=1 return "Autumn"}
        } else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Autumn"}
        }
        return exceptiondefault(bim, type)
    }
    case "airship": {
        if (bim == "under") biomemod = 1
        else if (bim == "water") biomemod = 3
        return "Airship"
    }
    case "ghost": {
        if (bim == "day") biomemod = 1
        else if (bim == "water") biomemod = 3
        else if (bim == "under") return exceptiondefault(bim, type)
        return "GhostHouse"
    }
    case "desert": {
        if (bim == "day" || bim == "pipe") {
            return "Desert"
        } else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Desert"}
        }
        return exceptiondefault(bim, type)
    }
    case "beach": {
        if (bim == "day" || bim == "pipe") {
            return "Beach"
        } else if (bim == "under") {
            if (type == 1) {biomemod=1 return "Beach"}
        } else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Beach"}
        }
        return exceptiondefault(bim, type)
    }
    case "snow": {
        if (bim == "day" || bim == "pipe") {
            return "Snow"
        } else if (bim == "under") {
            if (type == 1) {biomemod=1 return "Snow"}
        } else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Snow"}
        }
        return exceptiondefault(bim, type)
    }
    case "forest": {
        if (bim == "day" || bim == "pipe") {
            return "Forest"
        } else if (bim == "under") {
            if (type == 1) {biomemod=1 return "Forest"}
        } else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Forest"}
        }
        return exceptiondefault(bim, type)
    }
    case "volcano": //youtube clickbait thumbnail "THE SAME EXCEPTION?
    case "finale":  {
        if (bim == "under") {
            if (type == 1) biomemod = 1
        } else if (bim == "water") {
            if (type == 1) biomemod=2
            if (!type) return "Castle"
        }
        return "Volcano"
    }
    case "city": {
        if (bim == "under") {
            if (type==1) {biomemod = 1 return "Factory"}
        } else if (bim == "water") {
            if (type==2) {biomemod = 2}
        }
        return "Autumn"
    }
    case "warp":
    case "alternate": {
        return "Abstract"
    }
    case "tutorial": {
        return "Tutorial"
    }
    
    //And this... is to go Even Further Beyond!
    
    case "greenhill":
    case "emeraldhill": { //I don't even remember if Emerald Hill was a biome but im assuming its Green Hill But Sonic 2
        if (bim == "under") {bim = "day" if (type == 1) biomemod = 1}
        return exceptiondefault(bim, type)
    }
    case "marble": {
        if (bim == "day") return "Underground"
        return exceptiondefault(bim, type)
    }
    case "springyard":
    case "clockwork": {
        if (bim == "under") {if (type == 1) biomemod = 1 return "Clockwork"}
        else if (bim == "water") {if (type == 1) {biomemod = 2 return "Clockwork"} return "Underwater"}
        else return "Clockwork"
    }
    case "labyrinth": {
        if (bim == "under" && type == 1) biomemod = 1
        return "Underwater"
    }
    case "starlight": {
        if (bim == "day" || bim == "pipe") {
            if (type == 1) return "Autumn"
        } else if (bim == "under") {
            if (type == 1) {biomemod=1 return "Autumn"}
        }else if (bim == "water") {
            if (type == 1) {biomemod=2 return "Autumn"}
        }
        return exceptiondefault(bim, type)
    }
    case "scrapbrain":
    case "factory":  {
        if (bim == "day" || bim == "pipe") {
            if (type == 1) return "Factory"
        } else if (bim == "under") {
            if (type == 1) biomemod=1
        return "Factory"
        }else if (bim == "water") {
            if (type == 1) biomemod=3
            return "Factory"
        }
    }
    
    case "castlesewer": {
        if (bim == "day" || bim == "pipe" || bim == "under") if (type == 1 && bim == "under") biomemod=1 return "Castle"
        if (bim == "water") {if (type == 1) biomemod=2 return "Castle"}
    }    
    
    case "sewer": 
    case "pipes": {
        if (bim == "day" || bim == "pipe") bim = "under"
        return exceptiondefault(bim, type)   
    }
    
    
}
error(lang("error exception1")+exc+" (Biome: "+bim+")"+lang("error exception2"))

return exceptiondefault(bim, type)

///convert193biome(biome, type) [0 = obj, 1 = bg, 2 = mus]
//Converts 1.9.3's biome names to their 2.1.5 counterparts, using exceptions if needed.

switch (argument[0]) {
    case "day": 
    case "pipe": 
    case 'pipeintro':
    case "under": 
    case "water": return exceptiontoname(lemongrab.levelexc, argument[0], argument[1])
    
    case "castle": return "Castle"
    case "bonus": return "Sky"
    case "underbonus":
    case "secret":  
    case "Secret": return "Bonus" //Sonic Boll Redux
    case "special": return "Special"
    
    //1.5
    case "City": 
    case "Athletic": 
    case "Alternate":
    case "Pipes": 
    case "Warp": return exceptiontoname(string_lower(argument[0]), "day", argument[1])
}

return argument[0]

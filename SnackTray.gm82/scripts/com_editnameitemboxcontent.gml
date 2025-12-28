i=argument[0]

switch(i){

    case "item": return "Contains: Fire Flower"
    case "itemfeather": return "Contains: Feather"
    case "coins": return "Contains: Multicoins"
    case "life": return "Contains: 1-Up"
    case "poison": return "Contains: Poison Mushroom"
    case "mini": return "Contains: Mini Mushroom"
    case "vine": return "Contains: Green Spring"
    case "star": return "Contains: Starman"
    case "key": return "Contains: Key"
    case "shield": return "Contains: Shield"
    case "spring": return "Contains: Spring"
    case "spreng": return "Contains: Side Spring"
    case "shard": return "Contains: Star Shard"
    case "pswitch": return "Contains: P Switch"
    case "shard": return "Contains: Shard"
    case "none": return "Contains: Nothing"


    case "questionitem": return "Contains: Question Mushroom"
    case "wateritem": return "Contains: Water Flower"
    case "thunderitem": return "Contains: Thunder Flower"
    case "iceitem": return "Contains: Ice Flower"
    case "cloveritem": return "Contains: Clover Flower"
    case "card": return "Contains: Card"
    case "gshell": return "Contains: Green Shell"
    case "rshell": return "Contains: Red Shell"
    case "yshell": return "Contains: Yellow Shell"
    case "bshell": return "Contains: Blue Shell"
    case "stone": return "Contains: Stone"
    case "cork": return "Contains: Cork"

    case "": return "Contains: Coin"
    case "[unset]": return "Contains: Coin"

    default: return "Contains: "+i



}

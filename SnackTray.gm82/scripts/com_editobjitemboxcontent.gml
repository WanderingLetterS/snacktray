///(has_enemies,default)
var i,j;
questionstring="Box contents:|-|Nothing|Single Coin|Multiple Coins|Fire Flower|Feather|Mini Mushroom|Question Msuhroom|Water Flower|Thunder Flower|Ice Flower|Clover Flower|1-Up|Shield|Starman|Poison Mushroom|Key|Card|Spring|Sideways Spring|Green Spring|Shard|P-Switch|Shell|Red Shell|Yellow Shell|Blue Shell|Stone|Cork"

if argument[0]==true {

    questionstring+="|Goomba|Goombrat|Paragoomba|Paragoombrat|Koopa|paratroopa|Red Koopa|Red paratroopa|Yellow Koopa|Yellow paratroopa|Blue Koopa|Blue paratroopa"

    questionstring+="|Dry Bones|Bombshell Koopa|Bomb Shell|Piranha|Strong Piranha|Fire Piranha|Buzzy Beetle|Lava Bubble|Blooper|Lakitu|Spiny|Spingy Egg"

    questionstring+="|Hammer Bro|Fire Bro|Boomerang Bro|Monty Mole|Rex|Bob-omb|Lit Bob-omb|Crabmeat"
}
i=show_contextmenu(questionstring,0)


if (!i) return argument[1]

j=1
if (i=j) return "none" j+=1
if (i=j) return "" j+=1
if (i=j) return "coins" j+=1
if (i=j) return "item" j+=1
if (i=j) return "itemfeather" j+=1
if (i=j) return "questionitem" j+=1
if (i=j) return "mini" j+=1
if (i=j) return "wateritem" j+=1
if (i=j) return "thunderitem" j+=1
if (i=j) return "iceitem" j+=1
if (i=j) return "cloveritem" j+=1
if (i=j) return "life" j+=1
if (i=j) return "shield" j+=1
if (i=j) return "star" j+=1
if (i=j) return "poison" j+=1
if (i=j) return "key" j+=1
if (i=j) return "card" j+=1
if (i=j) return "spring" j+=1
if (i=j) return "spreng" j+=1
if (i=j) return "vine" j+=1
if (i=j) return "shard" j+=1
if (i=j) return "pswitch" j+=1
if (i=j) return "gshell" j+=1
if (i=j) return "rshell" j+=1
if (i=j) return "yshell" j+=1
if (i=j) return "bshell" j+=1
if (i=j) return "stone" j+=1
if (i=j) return "cork" j+=1

//enemies.

if (i=j) return "goomba" j+=1
if (i=j) return "goombrat" j+=1
if (i=j) return "paragoomba" j+=1
if (i=j) return "paragoombrat" j+=1
if (i=j) return "koopa" j+=1
if (i=j) return "paratroopa" j+=1
if (i=j) return "rkoopa" j+=1
if (i=j) return "rparatroopa" j+=1
if (i=j) return "ykoopa" j+=1
if (i=j) return "yparatroopa" j+=1
if (i=j) return "bkoopa" j+=1
if (i=j) return "bparatroopa" j+=1
if (i=j) return "drybones" j+=1
if (i=j) return "bombshellkoopa" j+=1
if (i=j) return "bombshell" j+=1
if (i=j) return "piranha" j+=1
if (i=j) return "redpiranha" j+=1
if (i=j) return "firepiranha" j+=1
if (i=j) return "beetle" j+=1
if (i=j) return "lavabubble" j+=1
if (i=j) return "blooper" j+=1
if (i=j) return "lakitu" j+=1
if (i=j) return "spiny" j+=1
if (i=j) return "spinyegg" j+=1
if (i=j) return "hammerbro" j+=1
if (i=j) return "firebro" j+=1
if (i=j) return "boomerangbro" j+=1
if (i=j) return "montymole" j+=1
if (i=j) return "rexbig" j+=1
if (i=j) return "bobomb" j+=1
if (i=j) return "litbobomb" j+=1
if (i=j) return "crabmeat" j+=1

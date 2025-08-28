///exceptiondefault(biome, type)
//Returns standard conversion for 1.9 biomes not included in an exception.
var bim, type;
bim  = argument[0]
type = argument[1]

if (bim == "under") {if (type == 1) biomemod=1 return "Underground"}
if (bim == "water") {if (type == 1) biomemod=2 return "Underwater"}
return "Ground"

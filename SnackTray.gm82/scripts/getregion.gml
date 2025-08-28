///getregion(x)

region=lemongrab

//failsafe
with (regionmarker) other.region=id

with (regionmarker) if (argument[0]=median(lefthand-32,argument[0],x+32)) other.region=id

biome=region.biome

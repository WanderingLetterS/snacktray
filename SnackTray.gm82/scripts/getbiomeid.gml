var i,s;

s=string(argument[0])

for (i=0;i<global.biomes;i+=1) if (global.biome[i]=s) return i

return -1

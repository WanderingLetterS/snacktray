var count;

count=0
with (projectile) if (orig=other.id && !ignoreoncount) count+=1
return count

///remove_invincible(type)
var i,j;

for (i=1;i<=list_invincible[0];i+=1) {
    if (list_invincible[i]=argument[0]) for (j=i;j<list_invincible[0];j+=1) {
        list_invincible[j]=list_invincible[j+1]
    }
}

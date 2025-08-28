///inch(val,goto,step)
//approximate val towards goto by step

if (argument[0]<argument[1]) return min(argument[1],argument[0]+argument[2])
return max(argument[1],argument[0]-argument[2])

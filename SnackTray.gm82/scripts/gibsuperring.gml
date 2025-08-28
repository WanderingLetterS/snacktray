///gibsuperring(object)
//Gives other 10 rings. Used for monitors.

repeat (10) give_item(argument[0],"ring")
stats("rings collected",stats("rings collected")+10)

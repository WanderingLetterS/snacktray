///funnytruefalse(string)
//returns a boolean based on human language

//WHO THE FUCK MADE THIS WHY WOULD YOU MAKE IT SO MUCH HARDER TO READ CODE,,, -CUBIE

var str;

str=string_lower(argument[0])

switch (str) {
    case "yeah": case "yup": case "yes": case "true": case "mhm": case "1": return 1
    case "nope": case "nop": case "no": case "false": case "nah": case "0": return 0
}

if (string_char_at(str,1)="n") return 0
if (string_pos("y",str)) return 1
return unreal(str,0)

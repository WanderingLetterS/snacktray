///modulo(value,lower,upper):value
//keeps a value within supplied range warping in both ways (lower incl, upper excl)
var o,d,w;

o=argument[1]
d=argument[0]-o
w=argument[2]-o

if (w=0) return o
return d-floor(d/w)*w+o

//returns whether today is easter
var C,G,H,I,J,L,month,day;

C=floor(current_year/100)
G=current_year mod 19
H=(C-floor(C/4)-floor((8*C+13)/25)+19*G+15) mod 30
I=H-floor(H/28)*(1-floor(29/(H+1))*floor((21-G)/11))
J=(current_year+floor(current_year/4)+I+2-C+floor(C/4)) mod 7
L=I-J
month=3+floor((L+40)/44)
day=L+28-31*floor(month/4)

return (day=current_day && month=current_month)

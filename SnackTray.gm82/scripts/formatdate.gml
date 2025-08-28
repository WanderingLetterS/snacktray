///formatdate(date)
//formats a date for menu use

var t; t=argument[0]
return format(date_get_day(t),2)+"/"+format(date_get_month(t),2)+"/"+format(date_get_year(t) mod 100,2)+" "+format(date_get_hour(t),2)+":"+format(date_get_minute(t),2)

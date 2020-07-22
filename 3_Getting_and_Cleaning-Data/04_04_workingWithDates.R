d1 = date()
d1
class(d1)

d2 = Sys.Date()
d2
class(d2)

class(d1) == class(d2)

# Formating dates
format(d2, "%a %b %d")

# Creating dates
x = c('1ene1960', '2ene1960', '31mar1960', '30jul1960'); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1] -z[2])

weekdays(d2)
months(d2)
julian(d2)

# Lubridate
install.packages('lubridate')
library(lubridate)

ymd('20140108')
mdy('08/04/2013')
dmy('03-04-2013')

# Dealing with times
ymd_hms('2011-08-03 10:15:03')
ymd_hms('2011-08-03 10:15:03',tz="Pacific/Auckland")
?Sys.timezone







# Getting the data from the web
if (!file.exists("./data")) {
   dir.create("./data")
}
# Getting data
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurant.csv", method="curl")
restData <- read.csv("./data/restaurant.csv")

fileUrl1 <- "http://data.un.org/_Docs/SYB/CSV/SYB62_230_201904_GDP%20and%20GDP%20Per%20Capita.csv?accessType=DOWNLOAD"
download.file(fileUrl1, destfile = './data/gdp_per_capita.csv')
GDPPC <- read.csv('./data/gdp_per_capita.csv')
GDPPC
summary(GDPPC)

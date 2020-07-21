# Getting the data from the web
if (!file.exists("./data")) {
   dir.create("./data")
}
# Getting data
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurant.csv", method="curl")
restData <- read.csv("./data/restaurant.csv")

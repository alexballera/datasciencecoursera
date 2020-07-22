# Getting the data from the web
if (!file.exists("./data")) {
    dir.create("./data")
}

# 1
# Getting data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./3_Getting_and_Cleaning-Data/quizzes/03_ACS.csv", method="curl")

install.packages("data.table")
library("data.table")
communities <- data.table::fread("./3_Getting_and_Cleaning-Data/quizzes/03_ACS.csv")
varNamesSplit <- strsplit(names(communities), "wgtp")
varNamesSplit[[123]]

# 2
# Getting data
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./3_Getting_and_Cleaning-Data/quizzes/03_GDPrank.csv", method="curl")

GDPrank <- data.table::fread('./3_Getting_and_Cleaning-Data/quizzes/03_GDPrank.csv'
                             , skip=5
                             , nrows=190
                             , select = c(1, 2, 4, 5)
                             , col.names=c("CountryCode", "Rank", "Country", "GDP")
)
GDPrank[, mean(as.integer(gsub(pattern = ',', replacement = '', x = GDP )))]

# 3
grep("^United",GDPrank[, Country])

# 4
eduDT <- data.table::fread('./3_Getting_and_Cleaning-Data/quizzes/03_GDPrank.csv')

mergedDT <- merge(GDPrank, eduDT, by = 'CountryCode')

mergedDT[grepl(pattern = "Fiscal year end: June 30;", mergedDT[, `Special Notes`]), .N]

# 5
install.packages("quantmod")
library("quantmod")
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn) 
timeDT <- data.table::data.table(timeCol = sampleTimes)

# How many values were collected in 2012? 
timeDT[(timeCol >= "2012-01-01") & (timeCol) < "2013-01-01", .N ]

# How many values were collected on Mondays in 2012?
timeDT[((timeCol >= "2012-01-01") & (timeCol < "2013-01-01")) & (weekdays(timeCol) == "Monday"), .N ]





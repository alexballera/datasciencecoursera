## Q1
## How many housing units in this survey were worth more than $1,000,000?

# fread url requires curl package on mac 
# install.packages("curl")

library(data.table)
housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

# VAL attribute says how much property is worth, .N is the number of rows
# VAL == 24 means more than $1,000,000

housing[VAL == 24, .N]

## Q2
## Download the Excel spreadsheet on Natural Gas Aquisition Program here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
## dat
## What is the value of:
## sum(dat$Zip*dat$Ext,na.rm=T)

fileUrl = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

install.packages("XML")
library("XML")
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
rootNode <- XML::xmlRoot(doc)

## Q4
## How many restaurants have zipcode 21231?

zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]

## Q5
DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

# Answer (fastest):
system.time(DT[,mean(pwgtp15),by=SEX])

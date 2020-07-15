# Getting the data from the web
if (!file.exists("./data")) {
    dir.create("./data")
}
# Getting data
## Q1
fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL1, destfile="./data/microdataACS.csv", method = "curl")
ACS <- read.csv("./data/microdataACS.csv")

agricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6

# Look at a bit of the data
head(which(agricultureLogical), 3)

## Q2
install.packages('jpeg')
library(jpeg)

# Download the file
fileURL2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(fileURL2, destfile='./data/jeff.jpg', mode='wb' )

# Read the image
picture <- jpeg::readJPEG('./data/jeff.jpg', native=TRUE)

# Get Sample Quantiles corressponding to given prob
quantile(picture, probs = c(0.3, 0.8) )

## Q3
install.packages("data.table")
library("data.table")

# Download data and read FGDP data into data.table
fileURL3 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
FGDP <- data.table::fread(fileURL3, skip=4, nrows = 190, select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total"))

# Download data and read FGDP data into data.table
fileURL4 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
FEDSTATS_Country <- data.table::fread(fileURL4)

mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')

# How many of the IDs match?
nrow(mergedDT)

# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?
mergedDT[order(-Rank)][13,.(Economy)]

## Q4
# "High income: OECD" 
mergedDT[`Income Group` == "High income: OECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

# Answer:
#
#         Income Group     Rank
# 1: High income: OECD 32.96667

# "High income: nonOECD"
mergedDT[`Income Group` == "High income: nonOECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

## Q5
install.packages('dplyr')
library('dplyr')

breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]



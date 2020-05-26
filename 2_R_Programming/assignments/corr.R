corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    source("complete.R")
    complete <- complete(directory)
    casesAboveThreshold <- complete[complete$nobs > threshold,1]
    files <- list.files(path = directory, full.names = TRUE)
    correlations <- rep(NA,length(casesAboveThreshold))
    for (i in casesAboveThreshold) {
        dat <- (read.csv(files[i]))
        complete <- complete.cases(dat)
        validSulfateData <- dat[complete, 2]
        validNitrateData <- dat[complete, 3]
        correlations[i] <- cor(x = validSulfateData, y = validNitrateData)
        #print(head(dat[complete,]))
        #print(validSulfateData)
        #print(validNitrateData)
    }
    correlations <- correlations[complete.cases(correlations)]
}
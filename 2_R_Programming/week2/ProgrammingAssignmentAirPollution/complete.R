complete <- function(directory, id = 1:332) {
    
    files <- list.files(path = directory, full.names = TRUE)
    dat <- data.frame()
    complete <- data.frame()
    nobs <- data.frame();
    
    for (i in id) { 
        dat <- (read.csv(files[i], header=TRUE))
        nobs <- sum(complete.cases(dat))
        complete <- rbind(complete, data.frame(i, nobs))
    }
    complete
}
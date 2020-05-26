pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    files <- list.files(path = directory, full.names = TRUE)
    dat <- data.frame()
    
    for (i in id) {
        dat <- rbind(dat, read.csv(files[i]))
    }
    
    sulf <- dat$sulfate
    sulf <- sulf[!is.na(sulf)] ## Remove missing values
    
    nit <- dat$nitrate
    nit <- nit[!is.na(nit)] ## Remove missing values
    
    if (pollutant == 'sulfate') {
        mean(sulf)
    } else if (pollutant == 'nitrate') {
        mean(nit)
    }
    
    ## pollutantmean('./', pollutant = 'sulfate', id = 1:332)
}
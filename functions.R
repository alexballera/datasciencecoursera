add2 <- function(x,y) {
  x + y
}
columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}